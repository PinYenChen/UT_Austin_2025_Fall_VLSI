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
integer CYCLE;
initial begin 
    CYCLE = `CYCLE_TIME;
    clk = 0 ;
end
always #(`CYCLE_TIME/2.0) clk = ~clk;
//================================================================
// integer
//================================================================
integer pat_num, pat_tot;
integer latency;
integer total_latency = 0;
integer i, f_in, m;
integer a;

reg[9:0] out_counter;
reg signed [15:0] xp_real_reg[0:255], xp_img_reg[0:255];
reg signed [15:0] golden_out_yp_img[0:255], golden_out_yp_real[0:255];

reg signed [15:0] in_real, in_img;

reg signed [15:0] w_real[0:255];
reg signed [15:0] w_img [0:255];

initial begin
    w_real[0] = 16'h7fff; // 1.0000
    w_img[0] = 16'h0000; // -0.0000
    w_real[1] = 16'h7ff6; // 0.9997
    w_img[1] = 16'hfcdc; // -0.0245
    w_real[2] = 16'h7fd9; // 0.9988
    w_img[2] = 16'hf9b8; // -0.0491
    w_real[3] = 16'h7fa7; // 0.9973
    w_img[3] = 16'hf695; // -0.0736
    w_real[4] = 16'h7f62; // 0.9952
    w_img[4] = 16'hf374; // -0.0980
    w_real[5] = 16'h7f0a; // 0.9925
    w_img[5] = 16'hf055; // -0.1224
    w_real[6] = 16'h7e9d; // 0.9892
    w_img[6] = 16'hed38; // -0.1467
    w_real[7] = 16'h7e1e; // 0.9853
    w_img[7] = 16'hea1e; // -0.1710
    w_real[8] = 16'h7d8a; // 0.9808
    w_img[8] = 16'he707; // -0.1951
    w_real[9] = 16'h7ce4; // 0.9757
    w_img[9] = 16'he3f4; // -0.2191
    w_real[10] = 16'h7c2a; // 0.9700
    w_img[10] = 16'he0e6; // -0.2430
    w_real[11] = 16'h7b5d; // 0.9638
    w_img[11] = 16'hdddc; // -0.2667
    w_real[12] = 16'h7a7d; // 0.9569
    w_img[12] = 16'hdad8; // -0.2903
    w_real[13] = 16'h798a; // 0.9495
    w_img[13] = 16'hd7d9; // -0.3137
    w_real[14] = 16'h7885; // 0.9415
    w_img[14] = 16'hd4e1; // -0.3369
    w_real[15] = 16'h776c; // 0.9330
    w_img[15] = 16'hd1ef; // -0.3599
    w_real[16] = 16'h7642; // 0.9239
    w_img[16] = 16'hcf04; // -0.3827
    w_real[17] = 16'h7505; // 0.9142
    w_img[17] = 16'hcc21; // -0.4052
    w_real[18] = 16'h73b6; // 0.9040
    w_img[18] = 16'hc946; // -0.4276
    w_real[19] = 16'h7255; // 0.8932
    w_img[19] = 16'hc673; // -0.4496
    w_real[20] = 16'h70e3; // 0.8819
    w_img[20] = 16'hc3a9; // -0.4714
    w_real[21] = 16'h6f5f; // 0.8701
    w_img[21] = 16'hc0e9; // -0.4929
    w_real[22] = 16'h6dca; // 0.8577
    w_img[22] = 16'hbe32; // -0.5141
    w_real[23] = 16'h6c24; // 0.8449
    w_img[23] = 16'hbb85; // -0.5350
    w_real[24] = 16'h6a6e; // 0.8315
    w_img[24] = 16'hb8e3; // -0.5556
    w_real[25] = 16'h68a7; // 0.8176
    w_img[25] = 16'hb64c; // -0.5758
    w_real[26] = 16'h66d0; // 0.8032
    w_img[26] = 16'hb3c0; // -0.5957
    w_real[27] = 16'h64e9; // 0.7883
    w_img[27] = 16'hb140; // -0.6152
    w_real[28] = 16'h62f2; // 0.7730
    w_img[28] = 16'haecc; // -0.6344
    w_real[29] = 16'h60ec; // 0.7572
    w_img[29] = 16'hac65; // -0.6532
    w_real[30] = 16'h5ed7; // 0.7410
    w_img[30] = 16'haa0a; // -0.6716
    w_real[31] = 16'h5cb4; // 0.7242
    w_img[31] = 16'ha7bd; // -0.6895
    w_real[32] = 16'h5a82; // 0.7071
    w_img[32] = 16'ha57e; // -0.7071
    w_real[33] = 16'h5843; // 0.6895
    w_img[33] = 16'ha34c; // -0.7242
    w_real[34] = 16'h55f6; // 0.6716
    w_img[34] = 16'ha129; // -0.7410
    w_real[35] = 16'h539b; // 0.6532
    w_img[35] = 16'h9f14; // -0.7572
    w_real[36] = 16'h5134; // 0.6344
    w_img[36] = 16'h9d0e; // -0.7730
    w_real[37] = 16'h4ec0; // 0.6152
    w_img[37] = 16'h9b17; // -0.7883
    w_real[38] = 16'h4c40; // 0.5957
    w_img[38] = 16'h9930; // -0.8032
    w_real[39] = 16'h49b4; // 0.5758
    w_img[39] = 16'h9759; // -0.8176
    w_real[40] = 16'h471d; // 0.5556
    w_img[40] = 16'h9592; // -0.8315
    w_real[41] = 16'h447b; // 0.5350
    w_img[41] = 16'h93dc; // -0.8449
    w_real[42] = 16'h41ce; // 0.5141
    w_img[42] = 16'h9236; // -0.8577
    w_real[43] = 16'h3f17; // 0.4929
    w_img[43] = 16'h90a1; // -0.8701
    w_real[44] = 16'h3c57; // 0.4714
    w_img[44] = 16'h8f1d; // -0.8819
    w_real[45] = 16'h398d; // 0.4496
    w_img[45] = 16'h8dab; // -0.8932
    w_real[46] = 16'h36ba; // 0.4276
    w_img[46] = 16'h8c4a; // -0.9040
    w_real[47] = 16'h33df; // 0.4052
    w_img[47] = 16'h8afb; // -0.9142
    w_real[48] = 16'h30fc; // 0.3827
    w_img[48] = 16'h89be; // -0.9239
    w_real[49] = 16'h2e11; // 0.3599
    w_img[49] = 16'h8894; // -0.9330
    w_real[50] = 16'h2b1f; // 0.3369
    w_img[50] = 16'h877b; // -0.9415
    w_real[51] = 16'h2827; // 0.3137
    w_img[51] = 16'h8676; // -0.9495
    w_real[52] = 16'h2528; // 0.2903
    w_img[52] = 16'h8583; // -0.9569
    w_real[53] = 16'h2224; // 0.2667
    w_img[53] = 16'h84a3; // -0.9638
    w_real[54] = 16'h1f1a; // 0.2430
    w_img[54] = 16'h83d6; // -0.9700
    w_real[55] = 16'h1c0c; // 0.2191
    w_img[55] = 16'h831c; // -0.9757
    w_real[56] = 16'h18f9; // 0.1951
    w_img[56] = 16'h8276; // -0.9808
    w_real[57] = 16'h15e2; // 0.1710
    w_img[57] = 16'h81e2; // -0.9853
    w_real[58] = 16'h12c8; // 0.1467
    w_img[58] = 16'h8163; // -0.9892
    w_real[59] = 16'h0fab; // 0.1224
    w_img[59] = 16'h80f6; // -0.9925
    w_real[60] = 16'h0c8c; // 0.0980
    w_img[60] = 16'h809e; // -0.9952
    w_real[61] = 16'h096b; // 0.0736
    w_img[61] = 16'h8059; // -0.9973
    w_real[62] = 16'h0648; // 0.0491
    w_img[62] = 16'h8027; // -0.9988
    w_real[63] = 16'h0324; // 0.0245
    w_img[63] = 16'h800a; // -0.9997
    w_real[64] = 16'h0000; // 0.0000
    w_img[64] = 16'h8000; // -1.0000
    w_real[65] = 16'hfcdc; // -0.0245
    w_img[65] = 16'h800a; // -0.9997
    w_real[66] = 16'hf9b8; // -0.0491
    w_img[66] = 16'h8027; // -0.9988
    w_real[67] = 16'hf695; // -0.0736
    w_img[67] = 16'h8059; // -0.9973
    w_real[68] = 16'hf374; // -0.0980
    w_img[68] = 16'h809e; // -0.9952
    w_real[69] = 16'hf055; // -0.1224
    w_img[69] = 16'h80f6; // -0.9925
    w_real[70] = 16'hed38; // -0.1467
    w_img[70] = 16'h8163; // -0.9892
    w_real[71] = 16'hea1e; // -0.1710
    w_img[71] = 16'h81e2; // -0.9853
    w_real[72] = 16'he707; // -0.1951
    w_img[72] = 16'h8276; // -0.9808
    w_real[73] = 16'he3f4; // -0.2191
    w_img[73] = 16'h831c; // -0.9757
    w_real[74] = 16'he0e6; // -0.2430
    w_img[74] = 16'h83d6; // -0.9700
    w_real[75] = 16'hdddc; // -0.2667
    w_img[75] = 16'h84a3; // -0.9638
    w_real[76] = 16'hdad8; // -0.2903
    w_img[76] = 16'h8583; // -0.9569
    w_real[77] = 16'hd7d9; // -0.3137
    w_img[77] = 16'h8676; // -0.9495
    w_real[78] = 16'hd4e1; // -0.3369
    w_img[78] = 16'h877b; // -0.9415
    w_real[79] = 16'hd1ef; // -0.3599
    w_img[79] = 16'h8894; // -0.9330
    w_real[80] = 16'hcf04; // -0.3827
    w_img[80] = 16'h89be; // -0.9239
    w_real[81] = 16'hcc21; // -0.4052
    w_img[81] = 16'h8afb; // -0.9142
    w_real[82] = 16'hc946; // -0.4276
    w_img[82] = 16'h8c4a; // -0.9040
    w_real[83] = 16'hc673; // -0.4496
    w_img[83] = 16'h8dab; // -0.8932
    w_real[84] = 16'hc3a9; // -0.4714
    w_img[84] = 16'h8f1d; // -0.8819
    w_real[85] = 16'hc0e9; // -0.4929
    w_img[85] = 16'h90a1; // -0.8701
    w_real[86] = 16'hbe32; // -0.5141
    w_img[86] = 16'h9236; // -0.8577
    w_real[87] = 16'hbb85; // -0.5350
    w_img[87] = 16'h93dc; // -0.8449
    w_real[88] = 16'hb8e3; // -0.5556
    w_img[88] = 16'h9592; // -0.8315
    w_real[89] = 16'hb64c; // -0.5758
    w_img[89] = 16'h9759; // -0.8176
    w_real[90] = 16'hb3c0; // -0.5957
    w_img[90] = 16'h9930; // -0.8032
    w_real[91] = 16'hb140; // -0.6152
    w_img[91] = 16'h9b17; // -0.7883
    w_real[92] = 16'haecc; // -0.6344
    w_img[92] = 16'h9d0e; // -0.7730
    w_real[93] = 16'hac65; // -0.6532
    w_img[93] = 16'h9f14; // -0.7572
    w_real[94] = 16'haa0a; // -0.6716
    w_img[94] = 16'ha129; // -0.7410
    w_real[95] = 16'ha7bd; // -0.6895
    w_img[95] = 16'ha34c; // -0.7242
    w_real[96] = 16'ha57e; // -0.7071
    w_img[96] = 16'ha57e; // -0.7071
    w_real[97] = 16'ha34c; // -0.7242
    w_img[97] = 16'ha7bd; // -0.6895
    w_real[98] = 16'ha129; // -0.7410
    w_img[98] = 16'haa0a; // -0.6716
    w_real[99] = 16'h9f14; // -0.7572
    w_img[99] = 16'hac65; // -0.6532
    w_real[100] = 16'h9d0e; // -0.7730
    w_img[100] = 16'haecc; // -0.6344
    w_real[101] = 16'h9b17; // -0.7883
    w_img[101] = 16'hb140; // -0.6152
    w_real[102] = 16'h9930; // -0.8032
    w_img[102] = 16'hb3c0; // -0.5957
    w_real[103] = 16'h9759; // -0.8176
    w_img[103] = 16'hb64c; // -0.5758
    w_real[104] = 16'h9592; // -0.8315
    w_img[104] = 16'hb8e3; // -0.5556
    w_real[105] = 16'h93dc; // -0.8449
    w_img[105] = 16'hbb85; // -0.5350
    w_real[106] = 16'h9236; // -0.8577
    w_img[106] = 16'hbe32; // -0.5141
    w_real[107] = 16'h90a1; // -0.8701
    w_img[107] = 16'hc0e9; // -0.4929
    w_real[108] = 16'h8f1d; // -0.8819
    w_img[108] = 16'hc3a9; // -0.4714
    w_real[109] = 16'h8dab; // -0.8932
    w_img[109] = 16'hc673; // -0.4496
    w_real[110] = 16'h8c4a; // -0.9040
    w_img[110] = 16'hc946; // -0.4276
    w_real[111] = 16'h8afb; // -0.9142
    w_img[111] = 16'hcc21; // -0.4052
    w_real[112] = 16'h89be; // -0.9239
    w_img[112] = 16'hcf04; // -0.3827
    w_real[113] = 16'h8894; // -0.9330
    w_img[113] = 16'hd1ef; // -0.3599
    w_real[114] = 16'h877b; // -0.9415
    w_img[114] = 16'hd4e1; // -0.3369
    w_real[115] = 16'h8676; // -0.9495
    w_img[115] = 16'hd7d9; // -0.3137
    w_real[116] = 16'h8583; // -0.9569
    w_img[116] = 16'hdad8; // -0.2903
    w_real[117] = 16'h84a3; // -0.9638
    w_img[117] = 16'hdddc; // -0.2667
    w_real[118] = 16'h83d6; // -0.9700
    w_img[118] = 16'he0e6; // -0.2430
    w_real[119] = 16'h831c; // -0.9757
    w_img[119] = 16'he3f4; // -0.2191
    w_real[120] = 16'h8276; // -0.9808
    w_img[120] = 16'he707; // -0.1951
    w_real[121] = 16'h81e2; // -0.9853
    w_img[121] = 16'hea1e; // -0.1710
    w_real[122] = 16'h8163; // -0.9892
    w_img[122] = 16'hed38; // -0.1467
    w_real[123] = 16'h80f6; // -0.9925
    w_img[123] = 16'hf055; // -0.1224
    w_real[124] = 16'h809e; // -0.9952
    w_img[124] = 16'hf374; // -0.0980
    w_real[125] = 16'h8059; // -0.9973
    w_img[125] = 16'hf695; // -0.0736
    w_real[126] = 16'h8027; // -0.9988
    w_img[126] = 16'hf9b8; // -0.0491
    w_real[127] = 16'h800a; // -0.9997
    w_img[127] = 16'hfcdc; // -0.0245    
    for (m = 0; m < 128; m = m + 1) begin
        w_real[m+128] = -w_real[m];
        w_img[m+128]  = -w_img[m];
    end    
end
initial begin
    // Initialize signals
    reset_task;
    pat_tot = 1;
    for (i = 0 ; i < 256; i = i+1) begin
        xp_real_reg[i] = 0;
        xp_img_reg[i] = 0;
    end
    
    for(pat_num = 0; pat_num < pat_tot; pat_num = pat_num + 1) begin
        input_task;
        in_valid = 1;
        for (i = 0 ; i < 256 ; i = i + 1 ) begin
            in_xp_real = xp_real_reg[i];
            in_xp_img = xp_img_reg[i];
            @(negedge clk);
        end
        @(negedge clk);
        in_valid = 0;
        in_xp_real = 'bx;
        in_xp_img = 'bx;
        latency = 0;

        wait_out_valid_task;
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

    // input 轉成 real
    real xr [0:255];
    real xi [0:255];

    // DFT 暫存
    integer n, k;
    real    sumr, sumi;

    // twiddle real 形式
    integer tw_idx;
    real    twr, twi;

    // Q1.15 轉換暫存
    integer tmp_r, tmp_i;
begin
    // twiddle table: Q1.15, same as FFT_256 design
    N     = 256;
    PI    = 3.141592653589793;
    // 跟硬體一樣：8 stage 每 stage /2 → 等效 /256
    scale = 1.0 / 256.0;

    // 1) Q1.15 array -> real (-1.0 ~ 1.0)
    for (n = 0; n < N; n = n + 1) begin
        xr[n] = $itor(xp_real_reg[n]) / 32768.0;
        xi[n] = $itor(xp_img_reg[n])  / 32768.0;
    end

    // 2) 用「量化過的 twiddle table」做 256 點 DFT
    //    Y[k] = Σ x[n] * W^(k*n)，其中 W^m 由 w_real/img[m] 給定 (Q1.15)
    for (k = 0; k < N; k = k + 1) begin
        sumr = 0.0;
        sumi = 0.0;

        for (n = 0; n < N; n = n + 1) begin
            tw_idx = (k * n) & 8'hFF;  // (k*n) mod 256

            // Q1.15 twiddle -> real
            twr = $itor(w_real[tw_idx]) / 32768.0;
            twi = $itor(w_img [tw_idx]) / 32768.0;

            // (xr + j*xi) * (twr + j*twi)
            sumr = sumr + (xr[n]*twr - xi[n]*twi);
            sumi = sumi + (xr[n]*twr + xi[n]*twi);
        end

        // 硬體總體 scaling /256
        sumr = sumr * scale;
        sumi = sumi * scale;

        // 3) real -> Q1.15，使用 truncate（模擬 $rtoi）
        tmp_r = $rtoi(sumr * 32768.0);  // toward 0
        tmp_i = $rtoi(sumi * 32768.0);

        // 飽和到 [-32768, 32767]
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
            $display("     Your answer = %4d", out_yp_real, "     Golden answer = %4h", golden_out_yp_real[out_counter]);
            $display("***************************************************************************");
            $finish;
        end
        else if(out_yp_img !== golden_out_yp_img[out_counter]) begin
            $display("***************************************************************************");
            $display("                         Your answer is incorrect!                         ");
            $display("                         failed at cycle = %4d                         ", out_counter);
            $display("     Your answer = %4d", out_yp_img, "     Golden answer = %4h", golden_out_yp_img[out_counter]);
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
    /*
    for (i = 0 ; i < 256 ; i = i + 1) begin
        xp_real_reg[i] = $urandom_range(-32768, 32767);
        xp_img_reg[i] = $urandom_range(-32768, 32767);
    end
    */
    f_in  = $fopen("fft_input_q15_hex.txt", "r");
    if (f_in == 0) begin
        $display("Failed to open input.txt");
        $finish;
    end
    // Initialize signals

    for(i = 0 ; i < 256 ; i = i + 1)begin
        a = $fscanf(f_in, "%h %h", in_real, in_img);
		xp_real_reg[i] = in_real;
		xp_img_reg[i] = in_img;
    end
    cal_gold_task;
end
endtask

task reset_task;begin
    rst_n = 1'b1;
    in_valid = 1'b0;
	in_xp_real = 16'bx;
    in_xp_img = 16'bx;
    total_latency = 0;

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

/*
task cal_gold_task;
    integer N;
    real    PI;
    real    scale;

    real xr [0:255];
    real xi [0:255];

    integer n, k;
    real    sumr, sumi;
    real    angle, c, s;

    integer tmp_r, tmp_i;

begin
    N     = 256;
    PI    = 3.141592653589793;
    scale = 1.0 / 256.0;

    // 1) Q1.15 array -> real
    for (n = 0; n < N; n = n + 1) begin
        xr[n] = $itor(xp_real_reg[n]) / 32768.0;  
        xi[n] = $itor(xp_img_reg[n])  / 32768.0;  
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
*/