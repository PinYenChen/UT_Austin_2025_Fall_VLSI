`define CYCLE_TIME 20

module PATTERN(
    // Output signals
    clk,
	rst_n,
	in_valid,
    in_xp_real, 
    in_xp_img,
    // Input signals
    out_valid, 
	out_yp_real,
    out_yp_img
);
// ========================================
// Input & Output
// ========================================
output reg clk, rst_n, in_valid;
output reg signed [15:0] in_xp_real, in_xp_img;

input out_valid;
input signed [15:0] out_yp_real, out_yp_img;

//================================================================
// clock
//================================================================
real CYCLE = `CYCLE_TIME;
always #(CYCLE/2.0) clk = ~clk;

//================================================================
// integer
//================================================================
integer pat_num, pat_tot;
integer latency;
integer total_latency = 0;
integer i;

reg[9:0] out_counter;
reg signed [15:0] xp_real_reg[0:255], xp_img_reg[0:255];
reg signed [15:0] golden_out_yp_img[0:255], golden_out_yp_real[0:255];

initial begin
    // Initialize signals
    reset_task;
    pat_tot = 10000;
    for (i = 0 ; i < 256; i = i+1) begin
        xp_real_reg[i] = 0;
        xp_img_reg[i] = 0;
    end
    input_task;
    for(pat_num = 0; pat_num < pat_tot; pat_num = pat_num + 1) begin
        in_valid = 1;
        for (i = 0 ; i < 256 ; i = i + 1 ) begin
            in_xp_real = xp_real_reg[i];
            in_xp_img = xp_img_reg[i];
        end
        @(negedge clk);
        in_valid = 0;
        in_xp_real = 'bx;
        in_xp_img = 'bx;
        latency = 0;
        wait_out_valid_task;
        cal_gold_task;
        check_ans_task;
        $display("\033[0;34mPASS SET NO.%4d,\033[m \033[0;32m     Execution Cycle: %3d\033[m", pat_num, latency);
    end
	display_pass;
	$finish;
end

task cal_gold_task;
    integer N;
    real    PI;
    real    scale;

    // input real 形式
    real xr [0:255];
    real xi [0:255];

    // DFT 暫存
    integer n, k;
    real    sumr, sumi;
    real    angle, c, s;

    // Q1.15 轉換暫存
    integer tmp_r, tmp_i;

begin
    // ---------- 初始化常數 ----------
    N     = 256;
    PI    = 3.141592653589793;
    // 如果硬體有做 8 層 /2 的 scaling → 等效 /256
    scale = 1.0 / 256.0;
    // 若硬體沒做 scaling，這裡改成 1.0 即可：
    // scale = 1.0;

    // ================================================
    // 1) 把 Q1.15 input 轉成 real (-1.0 ~ 1.0)
    //    這裡用你的 in_xp_real / in_xp_img
    // ================================================
    for (n = 0; n < N; n = n + 1) begin
        xr[n] = $itor(in_xp_real[n]) / 32768.0;  // 2^15
        xi[n] = $itor(in_xp_img[n])  / 32768.0;
    end

    // ================================================
    // 2) 用 DFT 公式算 256 點 FFT
    //    Y[k] = Σ x[n] * exp(-j*2πkn/N)
    // ================================================
    for (k = 0; k < N; k = k + 1) begin
        sumr = 0.0;
        sumi = 0.0;

        for (n = 0; n < N; n = n + 1) begin
            angle = -2.0 * PI * $itor(k) * $itor(n) / $itor(N);
            c     = $cos(angle);
            s     = $sin(angle);

            // (xr + j*xi) * (c + j*s)
            sumr = sumr + (xr[n]*c - xi[n]*s);
            sumi = sumi + (xr[n]*s + xi[n]*c);
        end

        // 硬體如果有總體 /256，就在這裡 scale
        sumr = sumr * scale;
        sumi = sumi * scale;

        // ============================================
        // 3) real -> Q1.15，直接寫到 golden 陣列
        // ============================================
        tmp_r = $rtoi(sumr * 32768.0);  // * 2^15
        tmp_i = $rtoi(sumi * 32768.0);

        // saturation 到 Q1.15 範圍
        if (tmp_r >  32767) tmp_r =  32767;
        if (tmp_r < -32768) tmp_r = -32768;
        if (tmp_i >  32767) tmp_i =  32767;
        if (tmp_i < -32768) tmp_i = -32768;

        golden_out_yp_real[k] = tmp_r[15:0];
        golden_out_yp_img[k]  = tmp_i[15:0];
    end
end
endtask



task check_ans_task; begin
    
    out_counter = 0;
    while(out_valid !== 1'b0) begin
        if(out_yp_real !== golden_out_yp_real[out_counter]) begin
            $display("***************************************************************************");
            $display("                         Your answer is incorrect!                         ");
            $display("                         failed at cycle = %4d                         ", out_counter);
            $display("     Your answer = %4d", out_yp_real, "     Golden answer = %4d", golden_out_yp_real[out_counter]);
            $display("***************************************************************************");
            $finish;
        end
        else if(out_yp_img !== golden_out_yp_img[out_counter]) begin
            $display("***************************************************************************");
            $display("                         Your answer is incorrect!                         ");
            $display("                         failed at cycle = %4d                         ", out_counter);
            $display("     Your answer = %4d", out_yp_img, "     Golden answer = %4d", golden_out_yp_img[out_counter]);
            $display("***************************************************************************");
            $finish;
        end

        @(negedge clk);
        out_counter = out_counter + 1;
    end
    if (out_counter != 256) begin
        $display("***************************************************************************");
        $display("            Your out_valid should be pulled up for 256 cycles!             ");
        $display("     Your answer = %4d", out_counter, "     Golden answer = 256");
        $display("***************************************************************************");
        $finish;
    end
end
endtask

task wait_out_valid_task; begin
    latency =0;
    while (out_valid === 0) begin
        latency = latency + 1;
        if (latency == (1000*CYCLE)) begin // max latency = 1000
            $display("                    OVER 1000 LATENCY                   ");
            repeat (2) @(negedge clk);
            $finish;
        end
        @(negedge clk);
    end
    total_latency = total_latency + latency;
end 
endtask

task input_task; begin
    for (i = 0 ; i < 256 ; i = i + 1) begin
        xp_real_reg[i] = $urandom_range(-32768, 32767);
        xp_img_reg[i] = $urandom_range(-32768, 32767);
    end
end
endtask

task reset_task;begin
    rst_n = 1'b1;
    in_valid = 1'b0;
	in_xp_real = 16'bx;
    in_xp_img = 16'bx;
    total_latency = 0;
    force clk = 0;
    // Apply reset
    #CYCLE; rst_n = 1'b0; 
    #CYCLE; rst_n = 1'b1;
	#(100-CYCLE); 

	//@(negedge clk);   
    // Check initial conditions
    if (out_valid !== 1'b0 || out_yp_img !== 16'b00000000 || out_yp_real !== 16'b0000) begin
        $display("                    RESET TASK FAIL                   ");
        repeat (2) #CYCLE;
        $finish;
    end
    #CYCLE; 
	release clk;
	
end
endtask

task display_pass; begin
	$display("\033[0;32m \033[5m    //   ) )     // | |     //   ) )     //   ) )\033[m");
    $display("\033[0;32m \033[5m   //___/ /     //__| |    ((           ((\033[m");
    $display("\033[0;32m \033[5m  / ____ /     / ___  |      \\           \\\033[m");
    $display("\033[0;32m \033[5m //           //    | |        ) )          ) )\033[m");
    $display("\033[0;32m \033[5m//           //     | | ((___ / /    ((___ / /\033[m");
	$display("**************************************************");
	$display("                  Congratulations!                ");
	$display("              execution cycles = %7d", total_latency);
	$display("              clock period = %4fns", CYCLE);
	$display("**************************************************");
end endtask

FFT_256 fft_256(
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid),
    .x_real(in_xp_real),
    .x_img(in_xp_img),
    .y_real(out_yp_real),
    .y_img(out_yp_img),
    .out_valid(out_valid)
);
endmodule
