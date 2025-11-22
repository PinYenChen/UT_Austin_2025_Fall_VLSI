`define CYCLE_TIME 5.8

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
output signed reg [15:0] in_xp_real, in_xp_img;

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
integer pat_num, pat_toa;
integer latency;
integer total_latency = 0;
integer i;


reg signed [15:0] xp_real_reg[0:255], xp_img_real[0:255];

initial begin
	SEED = 5;
    // Open input and output files
    f_in  = $fopen("../00_TESTBED/input.txt", "r");
    // f_in  = $fopen("../00_TESTBED/input_v2.txt", "r");
    if (f_in == 0) begin
        $display("Failed to open input.txt");
        $finish;
    end
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
        $display("\033[0;34mPASS SET NO.%4d,\033[m \033[0;32m     Execution Cycle: %3d\033[m", pat_num, latency_set);
    end
	display_pass;
	$finish;
end

task cal_gold_task; begin
	//deal with the input

	
end 
endtask

task check_ans_task; begin
    
    out_counter = 0;
    while(out_valid !== 1'b0) begin
        if(out_xp_real !== golden_out_xp_real[out_counter]) begin
            $display("***************************************************************************");
            $display("                         Your answer is incorrect!                         ");
            $display("                         failed at cycle = %4d                         ", out_counter);
            $display("     Your answer = %4d", out_xp_real, "     Golden answer = %4d", golden_out_xp_real[out_counter]);
            $display("***************************************************************************");
            $finish;
        end
        else if(out_xp_img !== golden_out_xp_img[out_counter]) begin
            $display("***************************************************************************");
            $display("                         Your answer is incorrect!                         ");
            $display("                         failed at cycle = %4d                         ", out_counter);
            $display("     Your answer = %4d", out_xp_img, "     Golden answer = %4d", golden_out_xp_img[out_counter]);
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
endmodule
