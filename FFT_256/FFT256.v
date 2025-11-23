module FFT_256(
    clk,
    rst_n,
    in_valid,
    x_real,
    x_img,
    y_real,
    y_img,
    out_valid
);
input clk, rst_n, in_valid;
input signed [15:0] x_real, x_img;
output signed [15:0] y_real, y_img;
output out_valid;
wire w0_img, w1_img, w2_img, w3_img, w4_img, w5_img, w6_img, w7_img, w8_img, w9_img, w10_img, w11_img, w12_img, w13_img, w14_img, w15_img, w16_img, w17_img, w18_img, w19_img, w20_img, w21_img, w22_img, w23_img, w24_img, w25_img, w26_img, w27_img, w28_img, w29_img, w30_img, w31_img, w32_img, w33_img, w34_img, w35_img, w36_img, w37_img, w38_img, w39_img, w40_img, w41_img, w42_img, w43_img, w44_img, w45_img, w46_img, w47_img, w48_img, w49_img, w50_img, w51_img, w52_img, w53_img, w54_img, w55_img, w56_img, w57_img, w58_img, w59_img, w60_img, w61_img, w62_img, w63_img;
wire w64_img, w65_img, w66_img, w67_img, w68_img, w69_img, w70_img, w71_img, w72_img, w73_img, w74_img, w75_img, w76_img, w77_img, w78_img, w79_img, w80_img, w81_img, w82_img, w83_img, w84_img, w85_img, w86_img, w87_img, w88_img, w89_img, w90_img, w91_img, w92_img, w93_img, w94_img, w95_img, w96_img, w97_img, w98_img, w99_img, w100_img, w101_img, w102_img, w103_img, w104_img, w105_img, w106_img, w107_img, w108_img, w109_img, w110_img, w111_img, w112_img, w113_img, w114_img, w115_img, w116_img, w117_img, w118_img, w119_img, w120_img, w121_img, w122_img, w123_img, w124_img, w125_img, w126_img, w127_img;
wire w128_img, w129_img, w130_img, w131_img, w132_img, w133_img, w134_img, w135_img, w136_img, w137_img, w138_img, w139_img, w140_img, w141_img, w142_img, w143_img, w144_img, w145_img, w146_img, w147_img, w148_img, w149_img, w150_img, w151_img, w152_img, w153_img, w154_img, w155_img, w156_img, w157_img, w158_img, w159_img, w160_img, w161_img, w162_img, w163_img, w164_img, w165_img, w166_img, w167_img, w168_img, w169_img, w170_img, w171_img, w172_img, w173_img, w174_img, w175_img, w176_img, w177_img, w178_img, w179_img, w180_img, w181_img, w182_img, w183_img, w184_img, w185_img, w186_img, w187_img, w188_img, w189_img, w190_img, w191_img;
wire w192_img, w193_img, w194_img, w195_img, w196_img, w197_img, w198_img, w199_img, w200_img, w201_img, w202_img, w203_img, w204_img, w205_img, w206_img, w207_img, w208_img, w209_img, w210_img, w211_img, w212_img, w213_img, w214_img, w215_img, w216_img, w217_img, w218_img, w219_img, w220_img, w221_img, w222_img, w223_img, w224_img, w225_img, w226_img, w227_img, w228_img, w229_img, w230_img, w231_img, w232_img, w233_img, w234_img, w235_img, w236_img, w237_img, w238_img, w239_img, w240_img, w241_img, w242_img, w243_img, w244_img, w245_img, w246_img, w247_img, w248_img, w249_img, w250_img, w251_img, w252_img, w253_img, w254_img, w255_img;
assign w_real[0] = 16'h8000; // 1.0000
assign w_img[0] = 16'h0000; // -0.0000
assign w_real[1] = 16'h7ff6; // 0.9997
assign w_img[1] = 16'hfcdc; // -0.0245
assign w_real[2] = 16'h7fd9; // 0.9988
assign w_img[2] = 16'hf9b8; // -0.0491
assign w_real[3] = 16'h7fa7; // 0.9973
assign w_img[3] = 16'hf695; // -0.0736
assign w_real[4] = 16'h7f62; // 0.9952
assign w_img[4] = 16'hf374; // -0.0980
assign w_real[5] = 16'h7f0a; // 0.9925
assign w_img[5] = 16'hf055; // -0.1224
assign w_real[6] = 16'h7e9d; // 0.9892
assign w_img[6] = 16'hed38; // -0.1467
assign w_real[7] = 16'h7e1e; // 0.9853
assign w_img[7] = 16'hea1e; // -0.1710
assign w_real[8] = 16'h7d8a; // 0.9808
assign w_img[8] = 16'he707; // -0.1951
assign w_real[9] = 16'h7ce4; // 0.9757
assign w_img[9] = 16'he3f4; // -0.2191
assign w_real[10] = 16'h7c2a; // 0.9700
assign w_img[10] = 16'he0e6; // -0.2430
assign w_real[11] = 16'h7b5d; // 0.9638
assign w_img[11] = 16'hdddc; // -0.2667
assign w_real[12] = 16'h7a7d; // 0.9569
assign w_img[12] = 16'hdad8; // -0.2903
assign w_real[13] = 16'h798a; // 0.9495
assign w_img[13] = 16'hd7d9; // -0.3137
assign w_real[14] = 16'h7885; // 0.9415
assign w_img[14] = 16'hd4e1; // -0.3369
assign w_real[15] = 16'h776c; // 0.9330
assign w_img[15] = 16'hd1ef; // -0.3599
assign w_real[16] = 16'h7642; // 0.9239
assign w_img[16] = 16'hcf04; // -0.3827
assign w_real[17] = 16'h7505; // 0.9142
assign w_img[17] = 16'hcc21; // -0.4052
assign w_real[18] = 16'h73b6; // 0.9040
assign w_img[18] = 16'hc946; // -0.4276
assign w_real[19] = 16'h7255; // 0.8932
assign w_img[19] = 16'hc673; // -0.4496
assign w_real[20] = 16'h70e3; // 0.8819
assign w_img[20] = 16'hc3a9; // -0.4714
assign w_real[21] = 16'h6f5f; // 0.8701
assign w_img[21] = 16'hc0e9; // -0.4929
assign w_real[22] = 16'h6dca; // 0.8577
assign w_img[22] = 16'hbe32; // -0.5141
assign w_real[23] = 16'h6c24; // 0.8449
assign w_img[23] = 16'hbb85; // -0.5350
assign w_real[24] = 16'h6a6e; // 0.8315
assign w_img[24] = 16'hb8e3; // -0.5556
assign w_real[25] = 16'h68a7; // 0.8176
assign w_img[25] = 16'hb64c; // -0.5758
assign w_real[26] = 16'h66d0; // 0.8032
assign w_img[26] = 16'hb3c0; // -0.5957
assign w_real[27] = 16'h64e9; // 0.7883
assign w_img[27] = 16'hb140; // -0.6152
assign w_real[28] = 16'h62f2; // 0.7730
assign w_img[28] = 16'haecc; // -0.6344
assign w_real[29] = 16'h60ec; // 0.7572
assign w_img[29] = 16'hac65; // -0.6532
assign w_real[30] = 16'h5ed7; // 0.7410
assign w_img[30] = 16'haa0a; // -0.6716
assign w_real[31] = 16'h5cb4; // 0.7242
assign w_img[31] = 16'ha7bd; // -0.6895
assign w_real[32] = 16'h5a82; // 0.7071
assign w_img[32] = 16'ha57e; // -0.7071
assign w_real[33] = 16'h5843; // 0.6895
assign w_img[33] = 16'ha34c; // -0.7242
assign w_real[34] = 16'h55f6; // 0.6716
assign w_img[34] = 16'ha129; // -0.7410
assign w_real[35] = 16'h539b; // 0.6532
assign w_img[35] = 16'h9f14; // -0.7572
assign w_real[36] = 16'h5134; // 0.6344
assign w_img[36] = 16'h9d0e; // -0.7730
assign w_real[37] = 16'h4ec0; // 0.6152
assign w_img[37] = 16'h9b17; // -0.7883
assign w_real[38] = 16'h4c40; // 0.5957
assign w_img[38] = 16'h9930; // -0.8032
assign w_real[39] = 16'h49b4; // 0.5758
assign w_img[39] = 16'h9759; // -0.8176
assign w_real[40] = 16'h471d; // 0.5556
assign w_img[40] = 16'h9592; // -0.8315
assign w_real[41] = 16'h447b; // 0.5350
assign w_img[41] = 16'h93dc; // -0.8449
assign w_real[42] = 16'h41ce; // 0.5141
assign w_img[42] = 16'h9236; // -0.8577
assign w_real[43] = 16'h3f17; // 0.4929
assign w_img[43] = 16'h90a1; // -0.8701
assign w_real[44] = 16'h3c57; // 0.4714
assign w_img[44] = 16'h8f1d; // -0.8819
assign w_real[45] = 16'h398d; // 0.4496
assign w_img[45] = 16'h8dab; // -0.8932
assign w_real[46] = 16'h36ba; // 0.4276
assign w_img[46] = 16'h8c4a; // -0.9040
assign w_real[47] = 16'h33df; // 0.4052
assign w_img[47] = 16'h8afb; // -0.9142
assign w_real[48] = 16'h30fc; // 0.3827
assign w_img[48] = 16'h89be; // -0.9239
assign w_real[49] = 16'h2e11; // 0.3599
assign w_img[49] = 16'h8894; // -0.9330
assign w_real[50] = 16'h2b1f; // 0.3369
assign w_img[50] = 16'h877b; // -0.9415
assign w_real[51] = 16'h2827; // 0.3137
assign w_img[51] = 16'h8676; // -0.9495
assign w_real[52] = 16'h2528; // 0.2903
assign w_img[52] = 16'h8583; // -0.9569
assign w_real[53] = 16'h2224; // 0.2667
assign w_img[53] = 16'h84a3; // -0.9638
assign w_real[54] = 16'h1f1a; // 0.2430
assign w_img[54] = 16'h83d6; // -0.9700
assign w_real[55] = 16'h1c0c; // 0.2191
assign w_img[55] = 16'h831c; // -0.9757
assign w_real[56] = 16'h18f9; // 0.1951
assign w_img[56] = 16'h8276; // -0.9808
assign w_real[57] = 16'h15e2; // 0.1710
assign w_img[57] = 16'h81e2; // -0.9853
assign w_real[58] = 16'h12c8; // 0.1467
assign w_img[58] = 16'h8163; // -0.9892
assign w_real[59] = 16'h0fab; // 0.1224
assign w_img[59] = 16'h80f6; // -0.9925
assign w_real[60] = 16'h0c8c; // 0.0980
assign w_img[60] = 16'h809e; // -0.9952
assign w_real[61] = 16'h096b; // 0.0736
assign w_img[61] = 16'h8059; // -0.9973
assign w_real[62] = 16'h0648; // 0.0491
assign w_img[62] = 16'h8027; // -0.9988
assign w_real[63] = 16'h0324; // 0.0245
assign w_img[63] = 16'h800a; // -0.9997
assign w_real[64] = 16'h0000; // 0.0000
assign w_img[64] = 16'h8000; // -1.0000
assign w_real[65] = 16'hfcdc; // -0.0245
assign w_img[65] = 16'h800a; // -0.9997
assign w_real[66] = 16'hf9b8; // -0.0491
assign w_img[66] = 16'h8027; // -0.9988
assign w_real[67] = 16'hf695; // -0.0736
assign w_img[67] = 16'h8059; // -0.9973
assign w_real[68] = 16'hf374; // -0.0980
assign w_img[68] = 16'h809e; // -0.9952
assign w_real[69] = 16'hf055; // -0.1224
assign w_img[69] = 16'h80f6; // -0.9925
assign w_real[70] = 16'hed38; // -0.1467
assign w_img[70] = 16'h8163; // -0.9892
assign w_real[71] = 16'hea1e; // -0.1710
assign w_img[71] = 16'h81e2; // -0.9853
assign w_real[72] = 16'he707; // -0.1951
assign w_img[72] = 16'h8276; // -0.9808
assign w_real[73] = 16'he3f4; // -0.2191
assign w_img[73] = 16'h831c; // -0.9757
assign w_real[74] = 16'he0e6; // -0.2430
assign w_img[74] = 16'h83d6; // -0.9700
assign w_real[75] = 16'hdddc; // -0.2667
assign w_img[75] = 16'h84a3; // -0.9638
assign w_real[76] = 16'hdad8; // -0.2903
assign w_img[76] = 16'h8583; // -0.9569
assign w_real[77] = 16'hd7d9; // -0.3137
assign w_img[77] = 16'h8676; // -0.9495
assign w_real[78] = 16'hd4e1; // -0.3369
assign w_img[78] = 16'h877b; // -0.9415
assign w_real[79] = 16'hd1ef; // -0.3599
assign w_img[79] = 16'h8894; // -0.9330
assign w_real[80] = 16'hcf04; // -0.3827
assign w_img[80] = 16'h89be; // -0.9239
assign w_real[81] = 16'hcc21; // -0.4052
assign w_img[81] = 16'h8afb; // -0.9142
assign w_real[82] = 16'hc946; // -0.4276
assign w_img[82] = 16'h8c4a; // -0.9040
assign w_real[83] = 16'hc673; // -0.4496
assign w_img[83] = 16'h8dab; // -0.8932
assign w_real[84] = 16'hc3a9; // -0.4714
assign w_img[84] = 16'h8f1d; // -0.8819
assign w_real[85] = 16'hc0e9; // -0.4929
assign w_img[85] = 16'h90a1; // -0.8701
assign w_real[86] = 16'hbe32; // -0.5141
assign w_img[86] = 16'h9236; // -0.8577
assign w_real[87] = 16'hbb85; // -0.5350
assign w_img[87] = 16'h93dc; // -0.8449
assign w_real[88] = 16'hb8e3; // -0.5556
assign w_img[88] = 16'h9592; // -0.8315
assign w_real[89] = 16'hb64c; // -0.5758
assign w_img[89] = 16'h9759; // -0.8176
assign w_real[90] = 16'hb3c0; // -0.5957
assign w_img[90] = 16'h9930; // -0.8032
assign w_real[91] = 16'hb140; // -0.6152
assign w_img[91] = 16'h9b17; // -0.7883
assign w_real[92] = 16'haecc; // -0.6344
assign w_img[92] = 16'h9d0e; // -0.7730
assign w_real[93] = 16'hac65; // -0.6532
assign w_img[93] = 16'h9f14; // -0.7572
assign w_real[94] = 16'haa0a; // -0.6716
assign w_img[94] = 16'ha129; // -0.7410
assign w_real[95] = 16'ha7bd; // -0.6895
assign w_img[95] = 16'ha34c; // -0.7242
assign w_real[96] = 16'ha57e; // -0.7071
assign w_img[96] = 16'ha57e; // -0.7071
assign w_real[97] = 16'ha34c; // -0.7242
assign w_img[97] = 16'ha7bd; // -0.6895
assign w_real[98] = 16'ha129; // -0.7410
assign w_img[98] = 16'haa0a; // -0.6716
assign w_real[99] = 16'h9f14; // -0.7572
assign w_img[99] = 16'hac65; // -0.6532
assign w_real[100] = 16'h9d0e; // -0.7730
assign w_img[100] = 16'haecc; // -0.6344
assign w_real[101] = 16'h9b17; // -0.7883
assign w_img[101] = 16'hb140; // -0.6152
assign w_real[102] = 16'h9930; // -0.8032
assign w_img[102] = 16'hb3c0; // -0.5957
assign w_real[103] = 16'h9759; // -0.8176
assign w_img[103] = 16'hb64c; // -0.5758
assign w_real[104] = 16'h9592; // -0.8315
assign w_img[104] = 16'hb8e3; // -0.5556
assign w_real[105] = 16'h93dc; // -0.8449
assign w_img[105] = 16'hbb85; // -0.5350
assign w_real[106] = 16'h9236; // -0.8577
assign w_img[106] = 16'hbe32; // -0.5141
assign w_real[107] = 16'h90a1; // -0.8701
assign w_img[107] = 16'hc0e9; // -0.4929
assign w_real[108] = 16'h8f1d; // -0.8819
assign w_img[108] = 16'hc3a9; // -0.4714
assign w_real[109] = 16'h8dab; // -0.8932
assign w_img[109] = 16'hc673; // -0.4496
assign w_real[110] = 16'h8c4a; // -0.9040
assign w_img[110] = 16'hc946; // -0.4276
assign w_real[111] = 16'h8afb; // -0.9142
assign w_img[111] = 16'hcc21; // -0.4052
assign w_real[112] = 16'h89be; // -0.9239
assign w_img[112] = 16'hcf04; // -0.3827
assign w_real[113] = 16'h8894; // -0.9330
assign w_img[113] = 16'hd1ef; // -0.3599
assign w_real[114] = 16'h877b; // -0.9415
assign w_img[114] = 16'hd4e1; // -0.3369
assign w_real[115] = 16'h8676; // -0.9495
assign w_img[115] = 16'hd7d9; // -0.3137
assign w_real[116] = 16'h8583; // -0.9569
assign w_img[116] = 16'hdad8; // -0.2903
assign w_real[117] = 16'h84a3; // -0.9638
assign w_img[117] = 16'hdddc; // -0.2667
assign w_real[118] = 16'h83d6; // -0.9700
assign w_img[118] = 16'he0e6; // -0.2430
assign w_real[119] = 16'h831c; // -0.9757
assign w_img[119] = 16'he3f4; // -0.2191
assign w_real[120] = 16'h8276; // -0.9808
assign w_img[120] = 16'he707; // -0.1951
assign w_real[121] = 16'h81e2; // -0.9853
assign w_img[121] = 16'hea1e; // -0.1710
assign w_real[122] = 16'h8163; // -0.9892
assign w_img[122] = 16'hed38; // -0.1467
assign w_real[123] = 16'h80f6; // -0.9925
assign w_img[123] = 16'hf055; // -0.1224
assign w_real[124] = 16'h809e; // -0.9952
assign w_img[124] = 16'hf374; // -0.0980
assign w_real[125] = 16'h8059; // -0.9973
assign w_img[125] = 16'hf695; // -0.0736
assign w_real[126] = 16'h8027; // -0.9988
assign w_img[126] = 16'hf9b8; // -0.0491
assign w_real[127] = 16'h800a; // -0.9997
assign w_img[127] = 16'hfcdc; // -0.0245

integer i;
localparam [1:0]
  IDLE    ='d0,
  CAL_IN ='d1;

reg [2:0] cur_state, nxt_state;
always @(posedge clk) begin
    if (!rst_n) begin
        cur_state = IDLE;
    end
    else cur_state <= nxt_state;
end
always @(*) begin
    case(cur_state) 
        IDLE: if (in_valid) nxt_state = CAL_IN;
        CAL_IN: if (cnt == 255) nxt_state = IDLE;
    endcase
end
always @(posedge clk) begin
	if (!rst_n) begin
		cur_state <= IDLE;
	end
	else begin
		cur_state <= nxt_state;
	end
end
reg [7:0] in_cnt;
reg [8:0] cnt;
reg [15:0] in_reg_real [0:128]; 
reg [15:0] in_reg_img [0:128];
always @(posedge clk) begin
    if (in_valid) begin
        in_reg_real [128] <= x_real;
        in_reg_img[128] <= x_img;
        for (i = 0 ; i < 128 ; i = i + 1) begin
            in_reg_real[i] <= in_reg_real[i+1];
            in_reg_img[i] <= in_reg_img[i+1];
        end 
    end
end
// ========================================
// STAGE 1 
// ========================================
always @(*) begin
    if (cnt > 128 && cnt < 257) begin
        b1_xp_real = in_reg_real[0];
        b1_xp_img = in_reg_img[0];
        b1_xq_real = in_reg_real[128];
        b1_xq_img = in_reg_real[128];
        b1_wreal = w_real[0];
        b1_wimg = w_img[0];
    end
end
reg [16:0] st1_real [0:129];
reg [16:0] st1_img [0:129];
always @(posedge clk) begin
    if (cnt > 128 && cnt < 257) begin // 6-133 can do butterfly 2 
        st1_real[64] <= b1_ypreal;
        st1_img[64] <= b1_ypimg;
        st1_real[129] <= b1_yqreal;
        st1_img[129] <= b1_yqimg;
        for (i = 0 ; i < 64 ; i = i + 1) begin
            st1_real[i] <= st1_real[i+1];
            st1_img[i] <= st1_img[i+1];
            st1_real[65 + i] <= st1_real[i+66];
            st1_img[65 + i] <= st1_img[i+66];            
        end
    end
end 
// ========================================
// Stage 2
// ========================================
always @(*) begin
    if (cnt > 193 && cnt < 258) begin
        b2_xp_real = st1_real[0];
        b2_xp_img = st1_img[0];
        b2_xq_real = st1_real[64];
        b2_xq_img = st1_img[64];
        b2_wreal = w_real[0];
        b2_wimg = w_img[0];
    end
end
always @(*) begin
    if (cnt > 193 && cnt < 258) begin
        b3_xp_real = st1_real[65];
        b3_xp_img = st1_img[65];
        b3_xq_real = st1_real[129];
        b3_xq_img = st1_img[129];
        b3_wreal = w_real[64];
        b3_wimg = w_img[64];
    end
end
reg [16:0] st2_real [0:131];
reg [16:0] st2_img [0:131];
always @(posedge clk) begin
    if (cnt > 193 && cnt < 258) begin // 6-133 can do butterfly 2 
        st2_real[32] <= b2_ypreal;
        st2_img[32] <= b2_ypimg;
        st2_real[65] <= b2_yqreal;
        st2_img[65] <= b2_yqimg;
        st2_real[98] <= b3_ypreal;
        st2_img[98] <= b3_ypimg;
        st2_real[131] <= b3_yqreal;
        st2_img[131] <= b3_yqimg;
        for (integer i = 0 ; i < 32 ; i = i + 1) begin
            st2_real[i] <= st2_real[i+1];
            st2_img[i] <= st2_img[i+1];
            st2_real[33 + i] <= st2_real[i+34];
            st2_img[33 + i] <= st2_img[i+34];    
            st2_real[66 + i] <= st2_real[i + 67];
            st2_img[66 + i] <= st2_img[i + 67];
            st2_real[99 + i] <= st2_real[i+100];
            st2_img[99 + i] <= st2_img[i+100];        
        end
    end
end

// ========================================
// Stage 3
// ========================================
always @(*) begin
    if (cnt > 226 && cnt < 259) begin
        b4_xp_real = st2_real[0];
        b4_xp_img = st2_img[0];
        b4_xq_real = st2_real[32];
        b4_xq_img = st2_img[32];
        b4_wreal = w_real[0];
        b4_wimg = w_img[0];
    end
end
always @(*) begin
    if (cnt > 226 && cnt < 259) begin
        b5_xp_real = st2_real[33];
        b5_xp_img = st2_img[33];
        b5_xq_real = st2_real[65];
        b5_xq_img = st2_img[65];
        b5_wreal = w_real[64];
        b5_wimg = w_img[64];
    end
end
always @(*) begin
    if (cnt > 226 && cnt < 259) begin
        b6_xp_real = st2_real[66];
        b6_xp_img = st2_img[66];
        b6_xq_real = st2_real[98];
        b6_xq_img = st2_img[98];
        b6_wreal = w_real[32];
        b6_wimg = w_img[32];
    end
end
always @(*) begin
    if (cnt > 226 && cnt < 259) begin
        b7_xp_real = st2_real[99];
        b7_xp_img = st2_img[99];
        b7_xq_real = st2_real[131];
        b7_xq_img = st2_img[131];
        b7_wreal = w_real[96];
        b7_wimg = w_img[96];
    end
end
reg [16:0] st3_real [0:135];
reg [16:0] st3_img [0:135];
always @(posedge clk) begin
    if (cnt > 226 && cnt < 259) begin // 6-133 can do butterfly 2 
        st3_real[16] <= b2_ypreal;
        st3_img[16] <= b2_ypimg;
        st3_real[33] <= b2_yqreal;
        st3_img[33] <= b2_yqimg;
        st3_real[50] <= b3_ypreal;
        st3_img[50] <= b3_ypimg;
        st3_real[67] <= b3_yqreal;
        st3_img[67] <= b3_yqimg;
        st3_real[84] <= b2_ypreal;
        st3_img[84] <= b2_ypimg;
        st3_real[101] <= b2_yqreal;
        st3_img[101] <= b2_yqimg;
        st3_real[118] <= b3_ypreal;
        st3_img[118] <= b3_ypimg;
        st3_real[135] <= b3_yqreal;
        st3_img[135] <= b3_yqimg;
        for (i = 0 ; i < 16 ; i = i + 1) begin
            st3_real[i] <= st3_real[i+1];
            st3_img[i] <= st3_img[i+1];
            st3_real[17 + i] <= st3_real[i+18];
            st3_img[17 + i] <= st3_img[i+18];    
            st3_real[34 + i] <= st3_real[i + 35];
            st3_img[34 + i] <= st3_img[i + 35];
            st3_real[51 + i] <= st3_real[i+52];
            st3_img[51 + i] <= st3_img[i+52]; 
            st3_real[i+68] <= st3_real[i+69];
            st3_img[i+68] <= st3_img[i+69];
            st3_real[85 + i] <= st3_real[i+86];
            st3_img[85 + i] <= st3_img[i+86];    
            st3_real[102 + i] <= st3_real[i + 103];
            st3_img[102 + i] <= st3_img[i + 103];
            st3_real[119 + i] <= st3_real[i+120];
            st3_img[119 + i] <= st3_img[i+120];        
        end
    end
end

// ========================================
// Stage 4
// ========================================
always @(*) begin
    if (cnt > 243 && cnt < 260) begin
        b8_xp_real = st3_real[0];
        b8_xp_img = st3_img[0];
        b8_xq_real = st3_real[16];
        b8_xq_img = st3_img[16];
        b8_wreal = w_real[0];
        b8_wimg = w_img[0];
    end
end
always @(*) begin
    if (cnt > 243 && cnt < 260) begin
        b9_xp_real = st3_real[17];
        b9_xp_img = st3_img[17];
        b9_xq_real = st3_real[33];
        b9_xq_img = st3_img[33];
        b9_wreal = w_real[64];
        b9_wimg = w_img[64];
    end
end
always @(*) begin
    if (cnt > 243 && cnt < 260) begin
        b10_xp_real = st3_real[34];
        b10_xp_img = st3_img[34];
        b10_xq_real = st3_real[50];
        b10_xq_img = st3_img[50];
        b10_wreal = w_real[32];
        b10_wimg = w_img[32];
    end
end
always @(*) begin
    if (cnt > 243 && cnt < 260) begin
        b11_xp_real = st3_real[51];
        b11_xp_img = st3_img[51];
        b11_xq_real = st3_real[67];
        b11_xq_img = st3_img[67];
        b11_wreal = w_real[96];
        b11_wimg = w_img[96];
    end
end
always @(*) begin
    if (cnt > 243 && cnt < 260) begin
        b12_xp_real = st3_real[68];
        b12_xp_img = st3_img[68];
        b12_xq_real = st3_real[84];
        b12_xq_img = st3_img[84];
        b12_wreal = w_real[16];
        b12_wimg = w_img[16];
    end
end
always @(*) begin
    if (cnt > 243 && cnt < 260) begin
        b13_xp_real = st3_real[85];
        b13_xp_img = st3_img[85];
        b13_xq_real = st3_real[101];
        b13_xq_img = st3_img[101];
        b13_wreal = w_real[80];
        b13_wimg = w_img[80];
    end
end
always @(*) begin
    if (cnt > 243 && cnt < 260) begin
        b14_xp_real = st3_real[102];
        b14_xp_img = st3_img[102];
        b14_xq_real = st3_real[118];
        b14_xq_img = st3_img[118];
        b14_wreal = w_real[48];
        b14_wimg = w_img[48];
    end
end
always @(*) begin
    if (cnt > 243 && cnt < 260) begin
        b15_xp_real = st3_real[119];
        b15_xp_img = st3_img[119];
        b15_xq_real = st3_real[135];
        b15_xq_img = st3_img[135];
        b15_wreal = w_real[112];
        b15_wimg = w_img[112];
    end
end
reg [16:0] st4_real [0:143];
reg [16:0] st4_img [0:143];
always @(posedge clk) begin
    if (cnt > 243 && cnt < 260) begin // 6-133 can do butterfly 2 
        st4_real[8] <= b8_ypreal;
        st4_img[8] <= b8_ypimg;
        st4_real[17] <= b8_yqreal;
        st4_img[17] <= b8_yqimg;

        st4_real[26] <= b9_ypreal;
        st4_img[26] <= b9_ypimg;
        st4_real[35] <= b9_yqreal;
        st4_img[35] <= b9_yqimg;

        st4_real[44] <= b10_ypreal;
        st4_img[44] <= b10_ypimg;
        st4_real[53] <= b10_yqreal;
        st4_img[53] <= b10_yqimg;

        st4_real[62] <= b11_ypreal;
        st4_img[62] <= b11_ypimg;
        st4_real[71] <= b11_yqreal;
        st4_img[71] <= b11_yqimg;

        st4_real[80] <= b12_ypreal;
        st4_img[80] <= b12_ypimg;
        st4_real[89] <= b12_yqreal;
        st4_img[89] <= b12_yqimg;

        st4_real[98] <= b13_ypreal;
        st4_img[98] <= b13_ypimg;
        st4_real[107] <= b13_yqreal;
        st4_img[107] <= b13_yqimg;

        st4_real[116] <= b14_ypreal;
        st4_img[116] <= b14_ypimg;
        st4_real[125] <= b14_yqreal;
        st4_img[125] <= b14_yqimg;
        
        st4_real[134] <= b15_ypreal;
        st4_img[134] <= b15_ypimg;
        st4_real[143] <= b16_yqreal;
        st4_img[143] <= b16_yqimg;
        for (i = 0 ; i < 8 ; i = i + 1) begin
            st4_real[i] <= st4_real[i+1];
            st4_img[i] <= st4_img[i+1];
            st4_real[9 + i] <= st4_real[i+10];
            st4_img[9 + i] <= st4_img[i+10];    
            st4_real[18 + i] <= st4_real[i + 19];
            st4_img[18 + i] <= st4_img[i + 19];
            st4_real[27 + i] <= st4_real[i+28];
            st4_img[27 + i] <= st4_img[i+28]; 
            st4_real[i+36] <= st4_real[i+37];
            st4_img[i+36] <= st4_img[i+37];
            st4_real[45 + i] <= st4_real[i+46];
            st4_img[45 + i] <= st4_img[i+46];    
            st4_real[54 + i] <= st4_real[i + 55];
            st4_img[54 + i] <= st4_img[i + 55];
            st4_real[63 + i] <= st4_real[i+64];
            st4_img[63 + i] <= st4_img[i+64];  
            st4_real[i+72] <= st4_real[i+73];
            st4_img[i+72] <= st4_img[i+73];
            st4_real[81 + i] <= st4_real[i+82];
            st4_img[81 + i] <= st4_img[i+82];    
            st4_real[90 + i] <= st4_real[i + 91];
            st4_img[90 + i] <= st4_img[i + 91];
            st4_real[99 + i] <= st4_real[i+100];
            st4_img[99 + i] <= st4_img[i+100]; 
            st4_real[i+108] <= st4_real[i+109];
            st4_img[i+108] <= st4_img[i+109];
            st4_real[117 + i] <= st4_real[i+118];
            st4_img[117 + i] <= st4_img[i+118];    
            st4_real[126 + i] <= st4_real[i + 127];
            st4_img[126 + i] <= st4_img[i + 127];
            st4_real[135 + i] <= st4_real[i+136];
            st4_img[135 + i] <= st4_img[i+136];        
        end
    end
end


// ========================================
// Stage 5
// ========================================
always @(*) begin
    if (cnt > 252 && cnt < 261) begin
        b16_xp_real = st4_real[0];
        b16_xp_img = st4_img[0];
        b16_xq_real = st4_real[8];
        b16_xq_img = st4_img[8];
        b16_wreal = w_real[0];
        b16_wimg = w_img[0];
    end
end
always @(*) begin
    if (cnt > 252 && cnt < 261) begin
        b17_xp_real = st4_real[9];
        b17_xp_img = st4_img[9];
        b17_xq_real = st4_real[17];
        b17_xq_img = st4_img[17];
        b17_wreal = w_real[64];
        b17_wimg = w_img[64];
    end
end
always @(*) begin
    if (cnt > 252 && cnt < 261) begin
        b18_xp_real = st4_real[18];
        b18_xp_img = st4_img[18];
        b18_xq_real = st4_real[26];
        b18_xq_img = st4_img[26];
        b18_wreal = w_real[32];
        b18_wimg = w_img[32];
    end
end
always @(*) begin
    if (cnt > 252 && cnt < 261) begin
        b19_xp_real = st4_real[27];
        b19_xp_img = st4_img[27];
        b19_xq_real = st4_real[35];
        b19_xq_img = st4_img[35];
        b19_wreal = w_real[96];
        b19_wimg = w_img[96];
    end
end
always @(*) begin
    if (cnt > 252 && cnt < 261) begin
        b20_xp_real = st4_real[36];
        b20_xp_img = st4_img[36];
        b20_xq_real = st4_real[44];
        b20_xq_img = st4_img[44];
        b20_wreal = w_real[16];
        b20_wimg = w_img[16];
    end
end
always @(*) begin
    if (cnt > 252 && cnt < 261) begin
        b21_xp_real = st4_real[45];
        b21_xp_img = st4_img[45];
        b21_xq_real = st4_real[53];
        b21_xq_img = st4_img[53];
        b21_wreal = w_real[80];
        b21_wimg = w_img[80];
    end
end
always @(*) begin
    if (cnt > 252 && cnt < 261) begin
        b22_xp_real = st4_real[54];
        b22_xp_img = st4_img[54];
        b22_xq_real = st4_real[62];
        b22_xq_img = st4_img[62];
        b22_wreal = w_real[48];
        b22_wimg = w_img[48];
    end
end
always @(*) begin
    if (cnt > 252 && cnt < 261) begin
        b23_xp_real = st4_real[63];
        b23_xp_img = st4_img[63];
        b23_xq_real = st4_real[71];
        b23_xq_img = st4_img[71];
        b23_wreal = w_real[112];
        b23_wimg = w_img[112];
    end
end
always @(*) begin
    if (cnt > 252 && cnt < 261) begin
        b24_xp_real = st4_real[72];
        b24_xp_img = st4_img[72];
        b24_xq_real = st4_real[80];
        b24_xq_img = st4_img[80];
        b24_wreal = w_real[8];
        b24_wimg = w_img[8];
    end
end
always @(*) begin
    if (cnt > 252 && cnt < 261) begin
        b25_xp_real = st4_real[81];
        b25_xp_img = st4_img[81];
        b25_xq_real = st4_real[89];
        b25_xq_img = st4_img[89];
        b25_wreal = w_real[72];
        b25_wimg = w_img[72];
    end
end
always @(*) begin
    if (cnt > 252 && cnt < 261) begin
        b26_xp_real = st4_real[90];
        b26_xp_img = st4_img[90];
        b26_xq_real = st4_real[88];
        b26_xq_img = st4_img[88];
        b26_wreal = w_real[40];
        b26_wimg = w_img[40];
    end
end
always @(*) begin
    if (cnt > 252 && cnt < 261) begin
        b27_xp_real = st4_real[99];
        b27_xp_img = st4_img[99];
        b27_xq_real = st4_real[107];
        b27_xq_img = st4_img[107];
        b27_wreal = w_real[104];
        b27_wimg = w_img[104];
    end
end
always @(*) begin
    if (cnt > 252 && cnt < 261) begin
        b28_xp_real = st4_real[108];
        b28_xp_img = st4_img[108];
        b28_xq_real = st4_real[116];
        b28_xq_img = st4_img[116];
        b28_wreal = w_real[24];
        b28_wimg = w_img[24];
    end
end
always @(*) begin
    if (cnt > 252 && cnt < 261) begin
        b29_xp_real = st4_real[117];
        b29_xp_img = st4_img[117];
        b29_xq_real = st4_real[125];
        b29_xq_img = st4_img[125];
        b29_wreal = w_real[88];
        b29_wimg = w_img[88];
    end
end
always @(*) begin
    if (cnt > 252 && cnt < 261) begin
        b30_xp_real = st4_real[126];
        b30_xp_img = st4_img[126];
        b30_xq_real = st4_real[134];
        b30_xq_img = st4_img[134];
        b30_wreal = w_real[56];
        b30_wimg = w_img[56];
    end
end
always @(*) begin
    if (cnt > 252 && cnt < 261) begin
        b31_xp_real = st4_real[135];
        b31_xp_img = st4_img[135];
        b31_xq_real = st4_real[143];
        b31_xq_img = st4_img[143];
        b31_wreal = w_real[120];
        b31_wimg = w_img[120];
    end
end
reg [16:0] st5_real [0:159];
reg [16:0] st5_img [0:159];
always @(posedge clk) begin
    if (cnt > 252 && cnt < 261) begin // 6-133 can do butterfly 2 
        st5_real[4] <= b16_ypreal;
        st5_img[4] <= b16_ypimg;
        st5_real[9] <= b16_yqreal;
        st5_img[9] <= b16_yqimg;

        st5_real[14] <= b17_ypreal;
        st5_img[14] <= b17_ypimg;
        st5_real[19] <= b17_yqreal;
        st5_img[19] <= b17_yqimg;

        st5_real[24] <= b18_ypreal;
        st5_img[24] <= b18_ypimg;
        st5_real[29] <= b18_yqreal;
        st5_img[29] <= b18_yqimg;

        st5_real[34] <= b19_ypreal;
        st5_img[34] <= b19_ypimg;
        st5_real[39] <= b19_yqreal;
        st5_img[39] <= b19_yqimg;

        st5_real[44] <= b20_ypreal;
        st5_img[44] <= b20_ypimg;
        st5_real[49] <= b20_yqreal;
        st5_img[49] <= b20_yqimg;

        st5_real[54] <= b21_ypreal;
        st5_img[54] <= b21_ypimg;
        st5_real[59] <= b21_yqreal;
        st5_img[59] <= b21_yqimg;

        st5_real[64] <= b22_ypreal;
        st5_img[64] <= b22_ypimg;
        st5_real[69] <= b22_yqreal;
        st5_img[69] <= b22_yqimg;

        st5_real[74] <= b23_ypreal;
        st5_img[74] <= b23_ypimg;
        st5_real[79] <= b23_yqreal;
        st5_img[79] <= b23_yqimg;

        st5_real[84] <= b24_ypreal;
        st5_img[84] <= b24_ypimg;
        st5_real[89] <= b24_yqreal;
        st5_img[89] <= b24_yqimg;
        st5_real[94] <= b25_ypreal;
        st5_img[94] <= b25_ypimg;
        st5_real[99] <= b25_yqreal;
        st5_img[99] <= b25_yqimg;
        st5_real[104] <= b26_ypreal;
        st5_img[104] <= b26_ypimg;
        st5_real[109] <= b26_yqreal;
        st5_img[109] <= b26_yqimg;
        st5_real[114] <= b27_ypreal;
        st5_img[114] <= b27_ypimg;
        st5_real[119] <= b27_yqreal;
        st5_img[119] <= b27_yqimg;
        st5_real[124] <= b28_ypreal;
        st5_img[124] <= b28_ypimg;
        st5_real[129] <= b28_yqreal;
        st5_img[129] <= b28_yqimg;
        st5_real[134] <= b29_ypreal;
        st5_img[134] <= b29_ypimg;
        st5_real[139] <= b29_yqreal;
        st5_img[139] <= b29_yqimg;
        st5_real[144] <= b30_ypreal;
        st5_img[144] <= b30_ypimg;
        st5_real[149] <= b30_yqreal;
        st5_img[149] <= b30_yqimg;
        st5_real[154] <= b31_ypreal;
        st5_img[154] <= b31_ypimg;
        st5_real[159] <= b31_yqreal;
        st5_img[159] <= b31_yqimg;
        for (integer i = 0 ; i < 4 ; i = i + 1) begin
            st5_real[i] <= st5_real[i+1];
            st5_img[i]  <= st5_img[i+1];
            st5_real[5 + i] <= st5_real[6 + i];
            st5_img[5 + i]  <= st5_img[6 + i];
            st5_real[10 + i] <= st5_real[11 + i];
            st5_img[10 + i]  <= st5_img[11 + i];
            st5_real[15 + i] <= st5_real[16 + i];
            st5_img[15 + i]  <= st5_img[16 + i];
            st5_real[20 + i] <= st5_real[21 + i];
            st5_img[20 + i]  <= st5_img[21 + i];
            st5_real[25 + i] <= st5_real[26 + i];
            st5_img[25 + i]  <= st5_img[26 + i];
            st5_real[30 + i] <= st5_real[31 + i];
            st5_img[30 + i]  <= st5_img[31 + i];
            st5_real[35 + i] <= st5_real[36 + i];
            st5_img[35 + i]  <= st5_img[36 + i];
            st5_real[40 + i] <= st5_real[41 + i];
            st5_img[40 + i]  <= st5_img[41 + i];
            st5_real[45 + i] <= st5_real[46 + i];
            st5_img[45 + i]  <= st5_img[46 + i];
            st5_real[50 + i] <= st5_real[51 + i];
            st5_img[50 + i]  <= st5_img[51 + i];
            st5_real[55 + i] <= st5_real[56 + i];
            st5_img[55 + i]  <= st5_img[56 + i];
            st5_real[60 + i] <= st5_real[61 + i];
            st5_img[60 + i]  <= st5_img[61 + i];
            st5_real[65 + i] <= st5_real[66 + i];
            st5_img[65 + i]  <= st5_img[66 + i];
            st5_real[70 + i] <= st5_real[71 + i];
            st5_img[70 + i]  <= st5_img[71 + i];
            st5_real[75 + i] <= st5_real[76 + i];
            st5_img[75 + i]  <= st5_img[76 + i];
            st5_real[80 + i] <= st5_real[81 + i];
            st5_img[80 + i]  <= st5_img[81 + i];
            st5_real[85 + i] <= st5_real[86 + i];
            st5_img[85 + i]  <= st5_img[86 + i];
            st5_real[90 + i] <= st5_real[91 + i];
            st5_img[90 + i]  <= st5_img[91 + i];
            st5_real[95 + i] <= st5_real[96 + i];
            st5_img[95 + i]  <= st5_img[96 + i];
            st5_real[100 + i] <= st5_real[101 + i];
            st5_img[100 + i]  <= st5_img[101 + i];
            st5_real[105 + i] <= st5_real[106 + i];
            st5_img[105 + i]  <= st5_img[106 + i];
            st5_real[110 + i] <= st5_real[111 + i];
            st5_img[110 + i]  <= st5_img[111 + i];
            st5_real[115 + i] <= st5_real[116 + i];
            st5_img[115 + i]  <= st5_img[116 + i];
            st5_real[120 + i] <= st5_real[121 + i];
            st5_img[120 + i]  <= st5_img[121 + i];
            st5_real[125 + i] <= st5_real[126 + i];
            st5_img[125 + i]  <= st5_img[126 + i];
            st5_real[130 + i] <= st5_real[131 + i];
            st5_img[130 + i]  <= st5_img[131 + i];
            st5_real[135 + i] <= st5_real[136 + i];
            st5_img[135 + i]  <= st5_img[136 + i];
            st5_real[140 + i] <= st5_real[141 + i];
            st5_img[140 + i]  <= st5_img[141 + i];
            st5_real[145 + i] <= st5_real[146 + i];
            st5_img[145 + i]  <= st5_img[146 + i];
            st5_real[150 + i] <= st5_real[151 + i];
            st5_img[150 + i]  <= st5_img[151 + i];
            st5_real[155 + i] <= st5_real[156 + i];
            st5_img[155 + i]  <= st5_img[156 + i];
        end
    end
end

reg [16:0] st6_real [0:255];
reg [16:0] st6_img [0:255];

// ========================================
// Stage 6
// ========================================
always @(*) begin
    if (cnt > 257 && cnt < 262) begin // stage 6 input
        b32_xp_real = st5_real[0];
        b32_xp_img  = st5_img[0];
        b32_xq_real = st5_real[4];
        b32_xq_img  = st5_img[4];
        b32_wreal   = w_real[0];
        b32_wimg    = w_img[0];

        b33_xp_real = st5_real[5];
        b33_xp_img  = st5_img[5];
        b33_xq_real = st5_real[9];
        b33_xq_img  = st5_img[9];
        b33_wreal   = w_real[64];
        b33_wimg    = w_img[64];

        b34_xp_real = st5_real[10];
        b34_xp_img  = st5_img[10];
        b34_xq_real = st5_real[14];
        b34_xq_img  = st5_img[14];
        b34_wreal   = w_real[32];
        b34_wimg    = w_img[32];

        b35_xp_real = st5_real[15];
        b35_xp_img  = st5_img[15];
        b35_xq_real = st5_real[19];
        b35_xq_img  = st5_img[19];
        b35_wreal   = w_real[96];
        b35_wimg    = w_img[96];

        b36_xp_real = st5_real[20];
        b36_xp_img  = st5_img[20];
        b36_xq_real = st5_real[24];
        b36_xq_img  = st5_img[24];
        b36_wreal   = w_real[16];
        b36_wimg    = w_img[16];

        b37_xp_real = st5_real[25];
        b37_xp_img  = st5_img[25];
        b37_xq_real = st5_real[29];
        b37_xq_img  = st5_img[29];
        b37_wreal   = w_real[80];
        b37_wimg    = w_img[80];

        b38_xp_real = st5_real[30];
        b38_xp_img  = st5_img[30];
        b38_xq_real = st5_real[34];
        b38_xq_img  = st5_img[34];
        b38_wreal   = w_real[48];
        b38_wimg    = w_img[48];

        b39_xp_real = st5_real[35];
        b39_xp_img  = st5_img[35];
        b39_xq_real = st5_real[39];
        b39_xq_img  = st5_img[39];
        b39_wreal   = w_real[112];
        b39_wimg    = w_img[112];

        b40_xp_real = st5_real[40];
        b40_xp_img  = st5_img[40];
        b40_xq_real = st5_real[44];
        b40_xq_img  = st5_img[44];
        b40_wreal   = w_real[8];
        b40_wimg    = w_img[8];

        b41_xp_real = st5_real[45];
        b41_xp_img  = st5_img[45];
        b41_xq_real = st5_real[49];
        b41_xq_img  = st5_img[49];
        b41_wreal   = w_real[72];
        b41_wimg    = w_img[72];

        b42_xp_real = st5_real[50];
        b42_xp_img  = st5_img[50];
        b42_xq_real = st5_real[54];
        b42_xq_img  = st5_img[54];
        b42_wreal   = w_real[40];
        b42_wimg    = w_img[40];

        b43_xp_real = st5_real[55];
        b43_xp_img  = st5_img[55];
        b43_xq_real = st5_real[59];
        b43_xq_img  = st5_img[59];
        b43_wreal   = w_real[104];
        b43_wimg    = w_img[104];

        b44_xp_real = st5_real[60];
        b44_xp_img  = st5_img[60];
        b44_xq_real = st5_real[64];
        b44_xq_img  = st5_img[64];
        b44_wreal   = w_real[24];
        b44_wimg    = w_img[24];

        b45_xp_real = st5_real[65];
        b45_xp_img  = st5_img[65];
        b45_xq_real = st5_real[69];
        b45_xq_img  = st5_img[69];
        b45_wreal   = w_real[88];
        b45_wimg    = w_img[88];

        b46_xp_real = st5_real[70];
        b46_xp_img  = st5_img[70];
        b46_xq_real = st5_real[74];
        b46_xq_img  = st5_img[74];
        b46_wreal   = w_real[56];
        b46_wimg    = w_img[56];

        b47_xp_real = st5_real[75];
        b47_xp_img  = st5_img[75];
        b47_xq_real = st5_real[79];
        b47_xq_img  = st5_img[79];
        b47_wreal   = w_real[120];
        b47_wimg    = w_img[120];

        b48_xp_real = st5_real[80];
        b48_xp_img  = st5_img[80];
        b48_xq_real = st5_real[84];
        b48_xq_img  = st5_img[84];
        b48_wreal   = w_real[4];
        b48_wimg    = w_img[4];

        b49_xp_real = st5_real[85];
        b49_xp_img  = st5_img[85];
        b49_xq_real = st5_real[89];
        b49_xq_img  = st5_img[89];
        b49_wreal   = w_real[68];
        b49_wimg    = w_img[68];

        b50_xp_real = st5_real[90];
        b50_xp_img  = st5_img[90];
        b50_xq_real = st5_real[94];
        b50_xq_img  = st5_img[94];
        b50_wreal   = w_real[36];
        b50_wimg    = w_img[36];

        b51_xp_real = st5_real[95];
        b51_xp_img  = st5_img[95];
        b51_xq_real = st5_real[99];
        b51_xq_img  = st5_img[99];
        b51_wreal   = w_real[100];
        b51_wimg    = w_img[100];

        b52_xp_real = st5_real[100];
        b52_xp_img  = st5_img[100];
        b52_xq_real = st5_real[104];
        b52_xq_img  = st5_img[104];
        b52_wreal   = w_real[20];
        b52_wimg    = w_img[20];

        b53_xp_real = st5_real[105];
        b53_xp_img  = st5_img[105];
        b53_xq_real = st5_real[109];
        b53_xq_img  = st5_img[109];
        b53_wreal   = w_real[84];
        b53_wimg    = w_img[84];

        b54_xp_real = st5_real[110];
        b54_xp_img  = st5_img[110];
        b54_xq_real = st5_real[114];
        b54_xq_img  = st5_img[114];
        b54_wreal   = w_real[52];
        b54_wimg    = w_img[52];

        b55_xp_real = st5_real[115];
        b55_xp_img  = st5_img[115];
        b55_xq_real = st5_real[119];
        b55_xq_img  = st5_img[119];
        b55_wreal   = w_real[116];
        b55_wimg    = w_img[116];

        b56_xp_real = st5_real[120];
        b56_xp_img  = st5_img[120];
        b56_xq_real = st5_real[124];
        b56_xq_img  = st5_img[124];
        b56_wreal   = w_real[12];
        b56_wimg    = w_img[12];

        b57_xp_real = st5_real[125];
        b57_xp_img  = st5_img[125];
        b57_xq_real = st5_real[129];
        b57_xq_img  = st5_img[129];
        b57_wreal   = w_real[76];
        b57_wimg    = w_img[76];

        b58_xp_real = st5_real[130];
        b58_xp_img  = st5_img[130];
        b58_xq_real = st5_real[134];
        b58_xq_img  = st5_img[134];
        b58_wreal   = w_real[44];
        b58_wimg    = w_img[44];

        b59_xp_real = st5_real[135];
        b59_xp_img  = st5_img[135];
        b59_xq_real = st5_real[139];
        b59_xq_img  = st5_img[139];
        b59_wreal   = w_real[108];
        b59_wimg    = w_img[108];

        b60_xp_real = st5_real[140];
        b60_xp_img  = st5_img[140];
        b60_xq_real = st5_real[144];
        b60_xq_img  = st5_img[144];
        b60_wreal   = w_real[28];
        b60_wimg    = w_img[28];

        b61_xp_real = st5_real[145];
        b61_xp_img  = st5_img[145];
        b61_xq_real = st5_real[149];
        b61_xq_img  = st5_img[149];
        b61_wreal   = w_real[92];
        b61_wimg    = w_img[92];

        b62_xp_real = st5_real[150];
        b62_xp_img  = st5_img[150];
        b62_xq_real = st5_real[154];
        b62_xq_img  = st5_img[154];
        b62_wreal   = w_real[60];
        b62_wimg    = w_img[60];

        b63_xp_real = st5_real[155];
        b63_xp_img  = st5_img[155];
        b63_xq_real = st5_real[159];
        b63_xq_img  = st5_img[159];
        b63_wreal   = w_real[124];
        b63_wimg    = w_img[124];

    end
// ========================================
// Stage 7
// ========================================
    else if (cnt == 262) begin // stage 7 input use b32-b63 pipeline 4 stage
        // k = 0, b32
        b32_xp_real = st6_real[0];
        b32_xp_img  = st6_img[0];
        b32_xq_real = st6_real[2];
        b32_xq_img  = st6_img[2];
        b32_wreal   = w_real[0];
        b32_wimg    = w_img[0];

        // k = 1, b33
        b33_xp_real = st6_real[4];
        b33_xp_img  = st6_img[4];
        b33_xq_real = st6_real[6];
        b33_xq_img  = st6_img[6];
        b33_wreal   = w_real[64];
        b33_wimg    = w_img[64];

        // k = 2, b34
        b34_xp_real = st6_real[8];
        b34_xp_img  = st6_img[8];
        b34_xq_real = st6_real[10];
        b34_xq_img  = st6_img[10];
        b34_wreal   = w_real[32];
        b34_wimg    = w_img[32];

        // k = 3, b35
        b35_xp_real = st6_real[12];
        b35_xp_img  = st6_img[12];
        b35_xq_real = st6_real[14];
        b35_xq_img  = st6_img[14];
        b35_wreal   = w_real[96];
        b35_wimg    = w_img[96];

        // k = 4, b36
        b36_xp_real = st6_real[16];
        b36_xp_img  = st6_img[16];
        b36_xq_real = st6_real[18];
        b36_xq_img  = st6_img[18];
        b36_wreal   = w_real[16];
        b36_wimg    = w_img[16];

        // k = 5, b37
        b37_xp_real = st6_real[20];
        b37_xp_img  = st6_img[20];
        b37_xq_real = st6_real[22];
        b37_xq_img  = st6_img[22];
        b37_wreal   = w_real[80];
        b37_wimg    = w_img[80];

        // k = 6, b38
        b38_xp_real = st6_real[24];
        b38_xp_img  = st6_img[24];
        b38_xq_real = st6_real[26];
        b38_xq_img  = st6_img[26];
        b38_wreal   = w_real[48];
        b38_wimg    = w_img[48];

        // k = 7, b39
        b39_xp_real = st6_real[28];
        b39_xp_img  = st6_img[28];
        b39_xq_real = st6_real[30];
        b39_xq_img  = st6_img[30];
        b39_wreal   = w_real[112];
        b39_wimg    = w_img[112];

        // k = 8, b40
        b40_xp_real = st6_real[32];
        b40_xp_img  = st6_img[32];
        b40_xq_real = st6_real[34];
        b40_xq_img  = st6_img[34];
        b40_wreal   = w_real[8];
        b40_wimg    = w_img[8];

        // k = 9, b41
        b41_xp_real = st6_real[36];
        b41_xp_img  = st6_img[36];
        b41_xq_real = st6_real[38];
        b41_xq_img  = st6_img[38];
        b41_wreal   = w_real[72];
        b41_wimg    = w_img[72];

        // k = 10, b42
        b42_xp_real = st6_real[40];
        b42_xp_img  = st6_img[40];
        b42_xq_real = st6_real[42];
        b42_xq_img  = st6_img[42];
        b42_wreal   = w_real[40];
        b42_wimg    = w_img[40];

        // k = 11, b43
        b43_xp_real = st6_real[44];
        b43_xp_img  = st6_img[44];
        b43_xq_real = st6_real[46];
        b43_xq_img  = st6_img[46];
        b43_wreal   = w_real[104];
        b43_wimg    = w_img[104];

        // k = 12, b44
        b44_xp_real = st6_real[48];
        b44_xp_img  = st6_img[48];
        b44_xq_real = st6_real[50];
        b44_xq_img  = st6_img[50];
        b44_wreal   = w_real[24];
        b44_wimg    = w_img[24];

        // k = 13, b45
        b45_xp_real = st6_real[52];
        b45_xp_img  = st6_img[52];
        b45_xq_real = st6_real[54];
        b45_xq_img  = st6_img[54];
        b45_wreal   = w_real[88];
        b45_wimg    = w_img[88];

        // k = 14, b46
        b46_xp_real = st6_real[56];
        b46_xp_img  = st6_img[56];
        b46_xq_real = st6_real[58];
        b46_xq_img  = st6_img[58];
        b46_wreal   = w_real[56];
        b46_wimg    = w_img[56];

        // k = 15, b47
        b47_xp_real = st6_real[60];
        b47_xp_img  = st6_img[60];
        b47_xq_real = st6_real[62];
        b47_xq_img  = st6_img[62];
        b47_wreal   = w_real[120];
        b47_wimg    = w_img[120];

        // k = 16, b48
        b48_xp_real = st6_real[64];
        b48_xp_img  = st6_img[64];
        b48_xq_real = st6_real[66];
        b48_xq_img  = st6_img[66];
        b48_wreal   = w_real[4];
        b48_wimg    = w_img[4];

        // k = 17, b49
        b49_xp_real = st6_real[68];
        b49_xp_img  = st6_img[68];
        b49_xq_real = st6_real[70];
        b49_xq_img  = st6_img[70];
        b49_wreal   = w_real[68];
        b49_wimg    = w_img[68];

        // k = 18, b50
        b50_xp_real = st6_real[72];
        b50_xp_img  = st6_img[72];
        b50_xq_real = st6_real[74];
        b50_xq_img  = st6_img[74];
        b50_wreal   = w_real[36];
        b50_wimg    = w_img[36];

        // k = 19, b51
        b51_xp_real = st6_real[76];
        b51_xp_img  = st6_img[76];
        b51_xq_real = st6_real[78];
        b51_xq_img  = st6_img[78];
        b51_wreal   = w_real[100];
        b51_wimg    = w_img[100];

        // k = 20, b52
        b52_xp_real = st6_real[80];
        b52_xp_img  = st6_img[80];
        b52_xq_real = st6_real[82];
        b52_xq_img  = st6_img[82];
        b52_wreal   = w_real[20];
        b52_wimg    = w_img[20];

        // k = 21, b53
        b53_xp_real = st6_real[84];
        b53_xp_img  = st6_img[84];
        b53_xq_real = st6_real[86];
        b53_xq_img  = st6_img[86];
        b53_wreal   = w_real[84];
        b53_wimg    = w_img[84];

        // k = 22, b54
        b54_xp_real = st6_real[88];
        b54_xp_img  = st6_img[88];
        b54_xq_real = st6_real[90];
        b54_xq_img  = st6_img[90];
        b54_wreal   = w_real[52];
        b54_wimg    = w_img[52];

        // k = 23, b55
        b55_xp_real = st6_real[92];
        b55_xp_img  = st6_img[92];
        b55_xq_real = st6_real[94];
        b55_xq_img  = st6_img[94];
        b55_wreal   = w_real[116];
        b55_wimg    = w_img[116];

        // k = 24, b56
        b56_xp_real = st6_real[96];
        b56_xp_img  = st6_img[96];
        b56_xq_real = st6_real[98];
        b56_xq_img  = st6_img[98];
        b56_wreal   = w_real[12];
        b56_wimg    = w_img[12];

        // k = 25, b57
        b57_xp_real = st6_real[100];
        b57_xp_img  = st6_img[100];
        b57_xq_real = st6_real[102];
        b57_xq_img  = st6_img[102];
        b57_wreal   = w_real[76];
        b57_wimg    = w_img[76];

        // k = 26, b58
        b58_xp_real = st6_real[104];
        b58_xp_img  = st6_img[104];
        b58_xq_real = st6_real[106];
        b58_xq_img  = st6_img[106];
        b58_wreal   = w_real[44];
        b58_wimg    = w_img[44];

        // k = 27, b59
        b59_xp_real = st6_real[108];
        b59_xp_img  = st6_img[108];
        b59_xq_real = st6_real[110];
        b59_xq_img  = st6_img[110];
        b59_wreal   = w_real[108];
        b59_wimg    = w_img[108];

        // k = 28, b60
        b60_xp_real = st6_real[112];
        b60_xp_img  = st6_img[112];
        b60_xq_real = st6_real[114];
        b60_xq_img  = st6_img[114];
        b60_wreal   = w_real[28];
        b60_wimg    = w_img[28];

        // k = 29, b61
        b61_xp_real = st6_real[116];
        b61_xp_img  = st6_img[116];
        b61_xq_real = st6_real[118];
        b61_xq_img  = st6_img[118];
        b61_wreal   = w_real[92];
        b61_wimg    = w_img[92];

        // k = 30, b62
        b62_xp_real = st6_real[120];
        b62_xp_img  = st6_img[120];
        b62_xq_real = st6_real[122];
        b62_xq_img  = st6_img[122];
        b62_wreal   = w_real[60];
        b62_wimg    = w_img[60];

        // k = 31, b63
        b63_xp_real = st6_real[124];
        b63_xp_img  = st6_img[124];
        b63_xq_real = st6_real[126];
        b63_xq_img  = st6_img[126];
        b63_wreal   = w_real[124];
        b63_wimg    = w_img[124];
    end
    else if (cnt == 263) begin // stage 7 input use b32-b63 pipeline 4 stage
        // k = 0, b32
        b32_xp_real = st6_real[1];
        b32_xp_img  = st6_img[1];
        b32_xq_real = st6_real[3];
        b32_xq_img  = st6_img[3];
        b32_wreal   = w_real[0];
        b32_wimg    = w_img[0];

        // k = 1, b33
        b33_xp_real = st6_real[5];
        b33_xp_img  = st6_img[5];
        b33_xq_real = st6_real[7];
        b33_xq_img  = st6_img[7];
        b33_wreal   = w_real[64];
        b33_wimg    = w_img[64];

        // k = 2, b34
        b34_xp_real = st6_real[9];
        b34_xp_img  = st6_img[9];
        b34_xq_real = st6_real[11];
        b34_xq_img  = st6_img[11];
        b34_wreal   = w_real[32];
        b34_wimg    = w_img[32];

        // k = 3, b35
        b35_xp_real = st6_real[13];
        b35_xp_img  = st6_img[13];
        b35_xq_real = st6_real[15];
        b35_xq_img  = st6_img[15];
        b35_wreal   = w_real[96];
        b35_wimg    = w_img[96];

        // k = 4, b36
        b36_xp_real = st6_real[17];
        b36_xp_img  = st6_img[17];
        b36_xq_real = st6_real[19];
        b36_xq_img  = st6_img[19];
        b36_wreal   = w_real[16];
        b36_wimg    = w_img[16];

        // k = 5, b37
        b37_xp_real = st6_real[21];
        b37_xp_img  = st6_img[21];
        b37_xq_real = st6_real[23];
        b37_xq_img  = st6_img[23];
        b37_wreal   = w_real[80];
        b37_wimg    = w_img[80];

        // k = 6, b38
        b38_xp_real = st6_real[25];
        b38_xp_img  = st6_img[25];
        b38_xq_real = st6_real[27];
        b38_xq_img  = st6_img[27];
        b38_wreal   = w_real[48];
        b38_wimg    = w_img[48];

        // k = 7, b39
        b39_xp_real = st6_real[29];
        b39_xp_img  = st6_img[29];
        b39_xq_real = st6_real[31];
        b39_xq_img  = st6_img[31];
        b39_wreal   = w_real[112];
        b39_wimg    = w_img[112];

        // k = 8, b40
        b40_xp_real = st6_real[33];
        b40_xp_img  = st6_img[33];
        b40_xq_real = st6_real[35];
        b40_xq_img  = st6_img[35];
        b40_wreal   = w_real[8];
        b40_wimg    = w_img[8];

        // k = 9, b41
        b41_xp_real = st6_real[37];
        b41_xp_img  = st6_img[37];
        b41_xq_real = st6_real[39];
        b41_xq_img  = st6_img[39];
        b41_wreal   = w_real[72];
        b41_wimg    = w_img[72];

        // k = 10, b42
        b42_xp_real = st6_real[41];
        b42_xp_img  = st6_img[41];
        b42_xq_real = st6_real[43];
        b42_xq_img  = st6_img[43];
        b42_wreal   = w_real[40];
        b42_wimg    = w_img[40];

        // k = 11, b43
        b43_xp_real = st6_real[45];
        b43_xp_img  = st6_img[45];
        b43_xq_real = st6_real[47];
        b43_xq_img  = st6_img[47];
        b43_wreal   = w_real[104];
        b43_wimg    = w_img[104];

        // k = 12, b44
        b44_xp_real = st6_real[49];
        b44_xp_img  = st6_img[49];
        b44_xq_real = st6_real[51];
        b44_xq_img  = st6_img[51];
        b44_wreal   = w_real[24];
        b44_wimg    = w_img[24];

        // k = 13, b45
        b45_xp_real = st6_real[53];
        b45_xp_img  = st6_img[53];
        b45_xq_real = st6_real[55];
        b45_xq_img  = st6_img[55];
        b45_wreal   = w_real[88];
        b45_wimg    = w_img[88];

        // k = 14, b46
        b46_xp_real = st6_real[57];
        b46_xp_img  = st6_img[57];
        b46_xq_real = st6_real[59];
        b46_xq_img  = st6_img[59];
        b46_wreal   = w_real[56];
        b46_wimg    = w_img[56];

        // k = 15, b47
        b47_xp_real = st6_real[61];
        b47_xp_img  = st6_img[61];
        b47_xq_real = st6_real[63];
        b47_xq_img  = st6_img[63];
        b47_wreal   = w_real[120];
        b47_wimg    = w_img[120];

        // k = 16, b48
        b48_xp_real = st6_real[65];
        b48_xp_img  = st6_img[65];
        b48_xq_real = st6_real[67];
        b48_xq_img  = st6_img[67];
        b48_wreal   = w_real[4];
        b48_wimg    = w_img[4];

        // k = 17, b49
        b49_xp_real = st6_real[69];
        b49_xp_img  = st6_img[69];
        b49_xq_real = st6_real[71];
        b49_xq_img  = st6_img[71];
        b49_wreal   = w_real[68];
        b49_wimg    = w_img[68];

        // k = 18, b50
        b50_xp_real = st6_real[73];
        b50_xp_img  = st6_img[73];
        b50_xq_real = st6_real[75];
        b50_xq_img  = st6_img[75];
        b50_wreal   = w_real[36];
        b50_wimg    = w_img[36];

        // k = 19, b51
        b51_xp_real = st6_real[77];
        b51_xp_img  = st6_img[77];
        b51_xq_real = st6_real[79];
        b51_xq_img  = st6_img[79];
        b51_wreal   = w_real[100];
        b51_wimg    = w_img[100];

        // k = 20, b52
        b52_xp_real = st6_real[81];
        b52_xp_img  = st6_img[81];
        b52_xq_real = st6_real[83];
        b52_xq_img  = st6_img[83];
        b52_wreal   = w_real[20];
        b52_wimg    = w_img[20];

        // k = 21, b53
        b53_xp_real = st6_real[85];
        b53_xp_img  = st6_img[85];
        b53_xq_real = st6_real[87];
        b53_xq_img  = st6_img[87];
        b53_wreal   = w_real[84];
        b53_wimg    = w_img[84];

        // k = 22, b54
        b54_xp_real = st6_real[89];
        b54_xp_img  = st6_img[89];
        b54_xq_real = st6_real[91];
        b54_xq_img  = st6_img[91];
        b54_wreal   = w_real[52];
        b54_wimg    = w_img[52];

        // k = 23, b55
        b55_xp_real = st6_real[93];
        b55_xp_img  = st6_img[93];
        b55_xq_real = st6_real[95];
        b55_xq_img  = st6_img[95];
        b55_wreal   = w_real[116];
        b55_wimg    = w_img[116];

        // k = 24, b56
        b56_xp_real = st6_real[97];
        b56_xp_img  = st6_img[97];
        b56_xq_real = st6_real[99];
        b56_xq_img  = st6_img[99];
        b56_wreal   = w_real[12];
        b56_wimg    = w_img[12];

        // k = 25, b57
        b57_xp_real = st6_real[101];
        b57_xp_img  = st6_img[101];
        b57_xq_real = st6_real[103];
        b57_xq_img  = st6_img[103];
        b57_wreal   = w_real[76];
        b57_wimg    = w_img[76];

        // k = 26, b58
        b58_xp_real = st6_real[105];
        b58_xp_img  = st6_img[105];
        b58_xq_real = st6_real[107];
        b58_xq_img  = st6_img[107];
        b58_wreal   = w_real[44];
        b58_wimg    = w_img[44];

        // k = 27, b59
        b59_xp_real = st6_real[109];
        b59_xp_img  = st6_img[109];
        b59_xq_real = st6_real[111];
        b59_xq_img  = st6_img[111];
        b59_wreal   = w_real[108];
        b59_wimg    = w_img[108];

        // k = 28, b60
        b60_xp_real = st6_real[113];
        b60_xp_img  = st6_img[113];
        b60_xq_real = st6_real[115];
        b60_xq_img  = st6_img[115];
        b60_wreal   = w_real[28];
        b60_wimg    = w_img[28];

        // k = 29, b61
        b61_xp_real = st6_real[117];
        b61_xp_img  = st6_img[117];
        b61_xq_real = st6_real[119];
        b61_xq_img  = st6_img[119];
        b61_wreal   = w_real[92];
        b61_wimg    = w_img[92];

        // k = 30, b62
        b62_xp_real = st6_real[121];
        b62_xp_img  = st6_img[121];
        b62_xq_real = st6_real[123];
        b62_xq_img  = st6_img[123];
        b62_wreal   = w_real[60];
        b62_wimg    = w_img[60];

        // k = 31, b63
        b63_xp_real = st6_real[125];
        b63_xp_img  = st6_img[125];
        b63_xq_real = st6_real[127];
        b63_xq_img  = st6_img[127];
        b63_wreal   = w_real[124];
        b63_wimg    = w_img[124];
    end
    else if (cnt == 264) begin // stage 7
        // k = 0, b32
        b32_xp_real = st6_real[128];
        b32_xp_img  = st6_img[128];
        b32_xq_real = st6_real[130];
        b32_xq_img  = st6_img[130];
        b32_wreal   = w_real[2];
        b32_wimg    = w_img[2];

        // k = 1, b33
        b33_xp_real = st6_real[132];
        b33_xp_img  = st6_img[132];
        b33_xq_real = st6_real[134];
        b33_xq_img  = st6_img[134];
        b33_wreal   = w_real[66];
        b33_wimg    = w_img[66];

        // k = 2, b34
        b34_xp_real = st6_real[136];
        b34_xp_img  = st6_img[136];
        b34_xq_real = st6_real[138];
        b34_xq_img  = st6_img[138];
        b34_wreal   = w_real[34];
        b34_wimg    = w_img[34];

        // k = 3, b35
        b35_xp_real = st6_real[140];
        b35_xp_img  = st6_img[140];
        b35_xq_real = st6_real[142];
        b35_xq_img  = st6_img[142];
        b35_wreal   = w_real[98];
        b35_wimg    = w_img[98];

        // k = 4, b36
        b36_xp_real = st6_real[144];
        b36_xp_img  = st6_img[144];
        b36_xq_real = st6_real[146];
        b36_xq_img  = st6_img[146];
        b36_wreal   = w_real[18];
        b36_wimg    = w_img[18];

        // k = 5, b37
        b37_xp_real = st6_real[148];
        b37_xp_img  = st6_img[148];
        b37_xq_real = st6_real[150];
        b37_xq_img  = st6_img[150];
        b37_wreal   = w_real[82];
        b37_wimg    = w_img[82];

        // k = 6, b38
        b38_xp_real = st6_real[152];
        b38_xp_img  = st6_img[152];
        b38_xq_real = st6_real[154];
        b38_xq_img  = st6_img[154];
        b38_wreal   = w_real[50];
        b38_wimg    = w_img[50];

        // k = 7, b39
        b39_xp_real = st6_real[156];
        b39_xp_img  = st6_img[156];
        b39_xq_real = st6_real[158];
        b39_xq_img  = st6_img[158];
        b39_wreal   = w_real[114];
        b39_wimg    = w_img[114];

        // k = 8, b40
        b40_xp_real = st6_real[160];
        b40_xp_img  = st6_img[160];
        b40_xq_real = st6_real[162];
        b40_xq_img  = st6_img[162];
        b40_wreal   = w_real[10];
        b40_wimg    = w_img[10];

        // k = 9, b41
        b41_xp_real = st6_real[164];
        b41_xp_img  = st6_img[164];
        b41_xq_real = st6_real[166];
        b41_xq_img  = st6_img[166];
        b41_wreal   = w_real[114];
        b41_wimg    = w_img[114];

        // k = 10, b42
        b42_xp_real = st6_real[168];
        b42_xp_img  = st6_img[168];
        b42_xq_real = st6_real[170];
        b42_xq_img  = st6_img[170];
        b42_wreal   = w_real[42];
        b42_wimg    = w_img[42];

        // k = 11, b43
        b43_xp_real = st6_real[172];
        b43_xp_img  = st6_img[172];
        b43_xq_real = st6_real[174];
        b43_xq_img  = st6_img[174];
        b43_wreal   = w_real[106];
        b43_wimg    = w_img[106];

        // k = 12, b44
        b44_xp_real = st6_real[176];
        b44_xp_img  = st6_img[176];
        b44_xq_real = st6_real[178];
        b44_xq_img  = st6_img[178];
        b44_wreal   = w_real[26];
        b44_wimg    = w_img[26];

        // k = 13, b45
        b45_xp_real = st6_real[180];
        b45_xp_img  = st6_img[180];
        b45_xq_real = st6_real[182];
        b45_xq_img  = st6_img[182];
        b45_wreal   = w_real[90];
        b45_wimg    = w_img[90];

        // k = 14, b46
        b46_xp_real = st6_real[184];
        b46_xp_img  = st6_img[184];
        b46_xq_real = st6_real[186];
        b46_xq_img  = st6_img[186];
        b46_wreal   = w_real[58];
        b46_wimg    = w_img[58];

        // k = 15, b47
        b47_xp_real = st6_real[188];
        b47_xp_img  = st6_img[188];
        b47_xq_real = st6_real[190];
        b47_xq_img  = st6_img[190];
        b47_wreal   = w_real[122];
        b47_wimg    = w_img[122];

        // k = 16, b48
        b48_xp_real = st6_real[192];
        b48_xp_img  = st6_img[192];
        b48_xq_real = st6_real[194];
        b48_xq_img  = st6_img[194];
        b48_wreal   = w_real[6];
        b48_wimg    = w_img[6];

        // k = 17, b49
        b49_xp_real = st6_real[196];
        b49_xp_img  = st6_img[196];
        b49_xq_real = st6_real[198];
        b49_xq_img  = st6_img[198];
        b49_wreal   = w_real[70];
        b49_wimg    = w_img[70];

        // k = 18, b50
        b50_xp_real = st6_real[200];
        b50_xp_img  = st6_img[200];
        b50_xq_real = st6_real[202];
        b50_xq_img  = st6_img[202];
        b50_wreal   = w_real[38];
        b50_wimg    = w_img[38];

        // k = 19, b51
        b51_xp_real = st6_real[204];
        b51_xp_img  = st6_img[204];
        b51_xq_real = st6_real[206];
        b51_xq_img  = st6_img[206];
        b51_wreal   = w_real[102];
        b51_wimg    = w_img[102];

        // k = 20, b52
        b52_xp_real = st6_real[208];
        b52_xp_img  = st6_img[208];
        b52_xq_real = st6_real[210];
        b52_xq_img  = st6_img[210];
        b52_wreal   = w_real[22];
        b52_wimg    = w_img[22];

        // k = 21, b53
        b53_xp_real = st6_real[212];
        b53_xp_img  = st6_img[212];
        b53_xq_real = st6_real[214];
        b53_xq_img  = st6_img[214];
        b53_wreal   = w_real[86];
        b53_wimg    = w_img[86];

        // k = 22, b54
        b54_xp_real = st6_real[216];
        b54_xp_img  = st6_img[216];
        b54_xq_real = st6_real[218];
        b54_xq_img  = st6_img[218];
        b54_wreal   = w_real[54];
        b54_wimg    = w_img[54];

        // k = 23, b55
        b55_xp_real = st6_real[220];
        b55_xp_img  = st6_img[220];
        b55_xq_real = st6_real[222];
        b55_xq_img  = st6_img[222];
        b55_wreal   = w_real[118];
        b55_wimg    = w_img[118];

        // k = 24, b56
        b56_xp_real = st6_real[224];
        b56_xp_img  = st6_img[224];
        b56_xq_real = st6_real[226];
        b56_xq_img  = st6_img[226];
        b56_wreal   = w_real[14];
        b56_wimg    = w_img[14];

        // k = 25, b57
        b57_xp_real = st6_real[228];
        b57_xp_img  = st6_img[228];
        b57_xq_real = st6_real[230];
        b57_xq_img  = st6_img[230];
        b57_wreal   = w_real[78];
        b57_wimg    = w_img[78];

        // k = 26, b58
        b58_xp_real = st6_real[232];
        b58_xp_img  = st6_img[232];
        b58_xq_real = st6_real[234];
        b58_xq_img  = st6_img[234];
        b58_wreal   = w_real[46];
        b58_wimg    = w_img[46];

        // k = 27, b59
        b59_xp_real = st6_real[236];
        b59_xp_img  = st6_img[236];
        b59_xq_real = st6_real[238];
        b59_xq_img  = st6_img[238];
        b59_wreal   = w_real[110];
        b59_wimg    = w_img[110];

        // k = 28, b60
        b60_xp_real = st6_real[240];
        b60_xp_img  = st6_img[240];
        b60_xq_real = st6_real[242];
        b60_xq_img  = st6_img[242];
        b60_wreal   = w_real[30];
        b60_wimg    = w_img[30];

        // k = 29, b61
        b61_xp_real = st6_real[244];
        b61_xp_img  = st6_img[244];
        b61_xq_real = st6_real[246];
        b61_xq_img  = st6_img[246];
        b61_wreal   = w_real[94];
        b61_wimg    = w_img[94];

        // k = 30, b62
        b62_xp_real = st6_real[248];
        b62_xp_img  = st6_img[248];
        b62_xq_real = st6_real[250];
        b62_xq_img  = st6_img[250];
        b62_wreal   = w_real[62];
        b62_wimg    = w_img[62];

        // k = 31, b63
        b63_xp_real = st6_real[252];
        b63_xp_img  = st6_img[252];
        b63_xq_real = st6_real[254];
        b63_xq_img  = st6_img[254];
        b63_wreal   = w_real[126];
        b63_wimg    = w_img[126];  
    end
    else if (cnt == 265) begin // stage 7
        // k = 0, b32
        b32_xp_real = st6_real[129];
        b32_xp_img  = st6_img[129];
        b32_xq_real = st6_real[131];
        b32_xq_img  = st6_img[131];
        b32_wreal   = w_real[2];
        b32_wimg    = w_img[2];

        // k = 1, b33
        b33_xp_real = st6_real[133];
        b33_xp_img  = st6_img[133];
        b33_xq_real = st6_real[135];
        b33_xq_img  = st6_img[135];
        b33_wreal   = w_real[66];
        b33_wimg    = w_img[66];

        // k = 2, b34
        b34_xp_real = st6_real[137];
        b34_xp_img  = st6_img[137];
        b34_xq_real = st6_real[139];
        b34_xq_img  = st6_img[139];
        b34_wreal   = w_real[34];
        b34_wimg    = w_img[34];

        // k = 3, b35
        b35_xp_real = st6_real[141];
        b35_xp_img  = st6_img[141];
        b35_xq_real = st6_real[143];
        b35_xq_img  = st6_img[143];
        b35_wreal   = w_real[98];
        b35_wimg    = w_img[98];

        // k = 4, b36
        b36_xp_real = st6_real[145];
        b36_xp_img  = st6_img[145];
        b36_xq_real = st6_real[147];
        b36_xq_img  = st6_img[147];
        b36_wreal   = w_real[18];
        b36_wimg    = w_img[18];

        // k = 5, b37
        b37_xp_real = st6_real[149];
        b37_xp_img  = st6_img[149];
        b37_xq_real = st6_real[151];
        b37_xq_img  = st6_img[151];
        b37_wreal   = w_real[82];
        b37_wimg    = w_img[82];

        // k = 6, b38
        b38_xp_real = st6_real[153];
        b38_xp_img  = st6_img[153];
        b38_xq_real = st6_real[155];
        b38_xq_img  = st6_img[155];
        b38_wreal   = w_real[50];
        b38_wimg    = w_img[50];

        // k = 7, b39
        b39_xp_real = st6_real[157];
        b39_xp_img  = st6_img[157];
        b39_xq_real = st6_real[159];
        b39_xq_img  = st6_img[159];
        b39_wreal   = w_real[114];
        b39_wimg    = w_img[114];

        // k = 8, b40
        b40_xp_real = st6_real[161];
        b40_xp_img  = st6_img[161];
        b40_xq_real = st6_real[163];
        b40_xq_img  = st6_img[163];
        b40_wreal   = w_real[10];
        b40_wimg    = w_img[10];

        // k = 9, b41
        b41_xp_real = st6_real[165];
        b41_xp_img  = st6_img[165];
        b41_xq_real = st6_real[167];
        b41_xq_img  = st6_img[167];
        b41_wreal   = w_real[114];
        b41_wimg    = w_img[114];

        // k = 10, b42
        b42_xp_real = st6_real[169];
        b42_xp_img  = st6_img[169];
        b42_xq_real = st6_real[171];
        b42_xq_img  = st6_img[171];
        b42_wreal   = w_real[42];
        b42_wimg    = w_img[42];

        // k = 11, b43
        b43_xp_real = st6_real[173];
        b43_xp_img  = st6_img[173];
        b43_xq_real = st6_real[175];
        b43_xq_img  = st6_img[175];
        b43_wreal   = w_real[106];
        b43_wimg    = w_img[106];

        // k = 12, b44
        b44_xp_real = st6_real[177];
        b44_xp_img  = st6_img[177];
        b44_xq_real = st6_real[179];
        b44_xq_img  = st6_img[179];
        b44_wreal   = w_real[26];
        b44_wimg    = w_img[26];

        // k = 13, b45
        b45_xp_real = st6_real[181];
        b45_xp_img  = st6_img[181];
        b45_xq_real = st6_real[183];
        b45_xq_img  = st6_img[183];
        b45_wreal   = w_real[90];
        b45_wimg    = w_img[90];

        // k = 14, b46
        b46_xp_real = st6_real[185];
        b46_xp_img  = st6_img[185];
        b46_xq_real = st6_real[187];
        b46_xq_img  = st6_img[187];
        b46_wreal   = w_real[58];
        b46_wimg    = w_img[58];

        // k = 15, b47
        b47_xp_real = st6_real[189];
        b47_xp_img  = st6_img[189];
        b47_xq_real = st6_real[191];
        b47_xq_img  = st6_img[191];
        b47_wreal   = w_real[122];
        b47_wimg    = w_img[122];

        // k = 16, b48
        b48_xp_real = st6_real[193];
        b48_xp_img  = st6_img[193];
        b48_xq_real = st6_real[195];
        b48_xq_img  = st6_img[195];
        b48_wreal   = w_real[6];
        b48_wimg    = w_img[6];

        // k = 17, b49
        b49_xp_real = st6_real[197];
        b49_xp_img  = st6_img[197];
        b49_xq_real = st6_real[199];
        b49_xq_img  = st6_img[199];
        b49_wreal   = w_real[70];
        b49_wimg    = w_img[70];

        // k = 18, b50
        b50_xp_real = st6_real[201];
        b50_xp_img  = st6_img[201];
        b50_xq_real = st6_real[203];
        b50_xq_img  = st6_img[203];
        b50_wreal   = w_real[38];
        b50_wimg    = w_img[38];

        // k = 19, b51
        b51_xp_real = st6_real[205];
        b51_xp_img  = st6_img[205];
        b51_xq_real = st6_real[207];
        b51_xq_img  = st6_img[207];
        b51_wreal   = w_real[102];
        b51_wimg    = w_img[102];

        // k = 20, b52
        b52_xp_real = st6_real[209];
        b52_xp_img  = st6_img[209];
        b52_xq_real = st6_real[211];
        b52_xq_img  = st6_img[211];
        b52_wreal   = w_real[22];
        b52_wimg    = w_img[22];

        // k = 21, b53
        b53_xp_real = st6_real[213];
        b53_xp_img  = st6_img[213];
        b53_xq_real = st6_real[215];
        b53_xq_img  = st6_img[215];
        b53_wreal   = w_real[86];
        b53_wimg    = w_img[86];

        // k = 22, b54
        b54_xp_real = st6_real[217];
        b54_xp_img  = st6_img[217];
        b54_xq_real = st6_real[219];
        b54_xq_img  = st6_img[219];
        b54_wreal   = w_real[54];
        b54_wimg    = w_img[54];

        // k = 23, b55
        b55_xp_real = st6_real[221];
        b55_xp_img  = st6_img[221];
        b55_xq_real = st6_real[223];
        b55_xq_img  = st6_img[223];
        b55_wreal   = w_real[118];
        b55_wimg    = w_img[118];

        // k = 24, b56
        b56_xp_real = st6_real[225];
        b56_xp_img  = st6_img[225];
        b56_xq_real = st6_real[227];
        b56_xq_img  = st6_img[227];
        b56_wreal   = w_real[14];
        b56_wimg    = w_img[14];

        // k = 25, b57
        b57_xp_real = st6_real[229];
        b57_xp_img  = st6_img[229];
        b57_xq_real = st6_real[231];
        b57_xq_img  = st6_img[231];
        b57_wreal   = w_real[78];
        b57_wimg    = w_img[78];

        // k = 26, b58
        b58_xp_real = st6_real[233];
        b58_xp_img  = st6_img[233];
        b58_xq_real = st6_real[235];
        b58_xq_img  = st6_img[235];
        b58_wreal   = w_real[46];
        b58_wimg    = w_img[46];

        // k = 27, b59
        b59_xp_real = st6_real[237];
        b59_xp_img  = st6_img[237];
        b59_xq_real = st6_real[239];
        b59_xq_img  = st6_img[239];
        b59_wreal   = w_real[110];
        b59_wimg    = w_img[110];

        // k = 28, b60
        b60_xp_real = st6_real[241];
        b60_xp_img  = st6_img[241];
        b60_xq_real = st6_real[243];
        b60_xq_img  = st6_img[243];
        b60_wreal   = w_real[30];
        b60_wimg    = w_img[30];

        // k = 29, b61
        b61_xp_real = st6_real[245];
        b61_xp_img  = st6_img[245];
        b61_xq_real = st6_real[247];
        b61_xq_img  = st6_img[247];
        b61_wreal   = w_real[94];
        b61_wimg    = w_img[94];

        // k = 30, b62
        b62_xp_real = st6_real[249];
        b62_xp_img  = st6_img[249];
        b62_xq_real = st6_real[251];
        b62_xq_img  = st6_img[251];
        b62_wreal   = w_real[62];
        b62_wimg    = w_img[62];

        // k = 31, b63
        b63_xp_real = st6_real[253];
        b63_xp_img  = st6_img[253];
        b63_xq_real = st6_real[255];
        b63_xq_img  = st6_img[255];
        b63_wreal   = w_real[126];
        b63_wimg    = w_img[126];
        
    end
// ========================================
// Stage 8
// ========================================    
    else if (cnt == 266) begin
        // k = 0, b32
        b32_xp_real = st6_real[0]; 
        b32_xp_img  = st6_img[0]; 
        b32_xq_real = st6_real[1]; 
        b32_xq_img  = st6_img[1]; 
        b32_wreal   = w_real[0];
        b32_wimg    = w_img[0];

        // k = 1, b33
        b33_xp_real = st6_real[2]; 
        b33_xp_img  = st6_img[2]; 
        b33_xq_real = st6_real[3]; 
        b33_xq_img  = st6_img[3]; 
        b33_wreal   = w_real[64];
        b33_wimg    = w_img[64];

        // k = 2, b34
        b34_xp_real = st6_real[4];
        b34_xp_img  = st6_img[4];
        b34_xq_real = st6_real[5];
        b34_xq_img  = st6_img[5];
        b34_wreal   = w_real[32];
        b34_wimg    = w_img[32];

        // k = 3, b35
        b35_xp_real = st6_real[6];
        b35_xp_img  = st6_img[6];
        b35_xq_real = st6_real[7];
        b35_xq_img  = st6_img[7];
        b35_wreal   = w_real[96];
        b35_wimg    = w_img[96];

        // k = 4, b36
        b36_xp_real = st6_real[8];
        b36_xp_img  = st6_img[8];
        b36_xq_real = st6_real[9];
        b36_xq_img  = st6_img[9];
        b36_wreal   = w_real[16];
        b36_wimg    = w_img[16];

        // k = 5, b37
        b37_xp_real = st6_real[10];
        b37_xp_img  = st6_img[10];
        b37_xq_real = st6_real[11];
        b37_xq_img  = st6_img[11];
        b37_wreal   = w_real[80];
        b37_wimg    = w_img[80];

        // k = 6, b38
        b38_xp_real = st6_real[12];
        b38_xp_img  = st6_img[12];
        b38_xq_real = st6_real[13];
        b38_xq_img  = st6_img[13];
        b38_wreal   = w_real[48];
        b38_wimg    = w_img[48];

        // k = 7, b39
        b39_xp_real = st6_real[14];
        b39_xp_img  = st6_img[14];
        b39_xq_real = st6_real[15];
        b39_xq_img  = st6_img[15];
        b39_wreal   = w_real[112];
        b39_wimg    = w_img[112];

        // k = 8, b40
        b40_xp_real = st6_real[16];
        b40_xp_img  = st6_img[16];
        b40_xq_real = st6_real[17];
        b40_xq_img  = st6_img[17];
        b40_wreal   = w_real[8];
        b40_wimg    = w_img[8];

        // k = 9, b41
        b41_xp_real = st6_real[18];
        b41_xp_img  = st6_img[18];
        b41_xq_real = st6_real[19];
        b41_xq_img  = st6_img[19];
        b41_wreal   = w_real[72];
        b41_wimg    = w_img[72];

        // k = 10, b42
        b42_xp_real = st6_real[20];
        b42_xp_img  = st6_img[20];
        b42_xq_real = st6_real[21];
        b42_xq_img  = st6_img[21];
        b42_wreal   = w_real[40];
        b42_wimg    = w_img[40];

        // k = 11, b43
        b43_xp_real = st6_real[22];
        b43_xp_img  = st6_img[22];
        b43_xq_real = st6_real[23];
        b43_xq_img  = st6_img[23];
        b43_wreal   = w_real[104];
        b43_wimg    = w_img[104];

        // k = 12, b44
        b44_xp_real = st6_real[24];
        b44_xp_img  = st6_img[24];
        b44_xq_real = st6_real[25];
        b44_xq_img  = st6_img[25];
        b44_wreal   = w_real[24];
        b44_wimg    = w_img[24];

        // k = 13, b45
        b45_xp_real = st6_real[26];
        b45_xp_img  = st6_img[26];
        b45_xq_real = st6_real[27];
        b45_xq_img  = st6_img[27];
        b45_wreal   = w_real[88];
        b45_wimg    = w_img[88];

        // k = 14, b46
        b46_xp_real = st6_real[28];
        b46_xp_img  = st6_img[28];
        b46_xq_real = st6_real[29];
        b46_xq_img  = st6_img[29];
        b46_wreal   = w_real[56];
        b46_wimg    = w_img[56];

        // k = 15, b47
        b47_xp_real = st6_real[30];
        b47_xp_img  = st6_img[30];
        b47_xq_real = st6_real[31];
        b47_xq_img  = st6_img[31];
        b47_wreal   = w_real[120];
        b47_wimg    = w_img[120];

        // k = 16, b48
        b48_xp_real = st6_real[32];
        b48_xp_img  = st6_img[32];
        b48_xq_real = st6_real[33];
        b48_xq_img  = st6_img[33];
        b48_wreal   = w_real[4];
        b48_wimg    = w_img[4];

        // k = 17, b49
        b49_xp_real = st6_real[34];
        b49_xp_img  = st6_img[34];
        b49_xq_real = st6_real[35];
        b49_xq_img  = st6_img[35];
        b49_wreal   = w_real[68];
        b49_wimg    = w_img[68];

        // k = 18, b50
        b50_xp_real = st6_real[36];
        b50_xp_img  = st6_img[36];
        b50_xq_real = st6_real[37];
        b50_xq_img  = st6_img[37];
        b50_wreal   = w_real[36];
        b50_wimg    = w_img[36];

        // k = 19, b51
        b51_xp_real = st6_real[38];
        b51_xp_img  = st6_img[38];
        b51_xq_real = st6_real[39];
        b51_xq_img  = st6_img[39];
        b51_wreal   = w_real[100];
        b51_wimg    = w_img[100];

        // k = 20, b52
        b52_xp_real = st6_real[40];
        b52_xp_img  = st6_img[40];
        b52_xq_real = st6_real[41];
        b52_xq_img  = st6_img[41];
        b52_wreal   = w_real[20];
        b52_wimg    = w_img[20];

        // k = 21, b53
        b53_xp_real = st6_real[42];
        b53_xp_img  = st6_img[42];
        b53_xq_real = st6_real[43];
        b53_xq_img  = st6_img[43];
        b53_wreal   = w_real[84];
        b53_wimg    = w_img[84];

        // k = 22, b54
        b54_xp_real = st6_real[44];
        b54_xp_img  = st6_img[44];
        b54_xq_real = st6_real[45];
        b54_xq_img  = st6_img[45];
        b54_wreal   = w_real[52];
        b54_wimg    = w_img[52];

        // k = 23, b55
        b55_xp_real = st6_real[46];
        b55_xp_img  = st6_img[46];
        b55_xq_real = st6_real[47];
        b55_xq_img  = st6_img[47];
        b55_wreal   = w_real[116];
        b55_wimg    = w_img[116];

        // k = 24, b56
        b56_xp_real = st6_real[48];
        b56_xp_img  = st6_img[48];
        b56_xq_real = st6_real[49];
        b56_xq_img  = st6_img[49];
        b56_wreal   = w_real[12];
        b56_wimg    = w_img[12];

        // k = 25, b57
        b57_xp_real = st6_real[50];
        b57_xp_img  = st6_img[50];
        b57_xq_real = st6_real[51];
        b57_xq_img  = st6_img[51];
        b57_wreal   = w_real[76];
        b57_wimg    = w_img[76];

        // k = 26, b58
        b58_xp_real = st6_real[52];
        b58_xp_img  = st6_img[52];
        b58_xq_real = st6_real[53];
        b58_xq_img  = st6_img[53];
        b58_wreal   = w_real[44];
        b58_wimg    = w_img[44];

        // k = 27, b59
        b59_xp_real = st6_real[54];
        b59_xp_img  = st6_img[54];
        b59_xq_real = st6_real[55];
        b59_xq_img  = st6_img[55];
        b59_wreal   = w_real[108];
        b59_wimg    = w_img[108];

        // k = 28, b60
        b60_xp_real = st6_real[56];
        b60_xp_img  = st6_img[56];
        b60_xq_real = st6_real[57];
        b60_xq_img  = st6_img[57];
        b60_wreal   = w_real[28];
        b60_wimg    = w_img[28];

        // k = 29, b61
        b61_xp_real = st6_real[58];
        b61_xp_img  = st6_img[58];
        b61_xq_real = st6_real[59];
        b61_xq_img  = st6_img[59];
        b61_wreal   = w_real[92];
        b61_wimg    = w_img[92];

        // k = 30, b62
        b62_xp_real = st6_real[60];
        b62_xp_img  = st6_img[60];
        b62_xq_real = st6_real[61];
        b62_xq_img  = st6_img[61];
        b62_wreal   = w_real[60];
        b62_wimg    = w_img[60];

        // k = 31, b63
        b63_xp_real = st6_real[62];
        b63_xp_img  = st6_img[62];
        b63_xq_real = st6_real[63];
        b63_xq_img  = st6_img[63];
        b63_wreal   = w_real[124];
        b63_wimg    = w_img[124];       
    end
    else if (cnt == 267) begin
        // k = 0, b32
        b32_xp_real = st6_real[64];  
        b32_xp_img  = st6_img[64];  
        b32_xq_real = st6_real[65];  
        b32_xq_img  = st6_img[65];  
        b32_wreal   = w_real[2];
        b32_wimg    = w_img[2];

        // k = 1, b33
        b33_xp_real = st6_real[66];  
        b33_xp_img  = st6_img[66];  
        b33_xq_real = st6_real[67];  
        b33_xq_img  = st6_img[67];  
        b33_wreal   = w_real[66];
        b33_wimg    = w_img[66];

        // k = 2, b34
        b34_xp_real = st6_real[68];
        b34_xp_img  = st6_img[68];
        b34_xq_real = st6_real[69];
        b34_xq_img  = st6_img[69];
        b34_wreal   = w_real[34];
        b34_wimg    = w_img[34];

        // k = 3, b35
        b35_xp_real = st6_real[70];
        b35_xp_img  = st6_img[70];
        b35_xq_real = st6_real[71];
        b35_xq_img  = st6_img[71];
        b35_wreal   = w_real[98];
        b35_wimg    = w_img[98];

        // k = 4, b36
        b36_xp_real = st6_real[72];
        b36_xp_img  = st6_img[72];
        b36_xq_real = st6_real[73];
        b36_xq_img  = st6_img[73];
        b36_wreal   = w_real[18];
        b36_wimg    = w_img[18];

        // k = 5, b37
        b37_xp_real = st6_real[74];
        b37_xp_img  = st6_img[74];
        b37_xq_real = st6_real[75];
        b37_xq_img  = st6_img[75];
        b37_wreal   = w_real[82];
        b37_wimg    = w_img[82];

        // k = 6, b38
        b38_xp_real = st6_real[76];
        b38_xp_img  = st6_img[76];
        b38_xq_real = st6_real[77];
        b38_xq_img  = st6_img[77];
        b38_wreal   = w_real[50];
        b38_wimg    = w_img[50];

        // k = 7, b39
        b39_xp_real = st6_real[78];
        b39_xp_img  = st6_img[78];
        b39_xq_real = st6_real[79];
        b39_xq_img  = st6_img[79];
        b39_wreal   = w_real[114];
        b39_wimg    = w_img[114];

        // k = 8, b40
        b40_xp_real = st6_real[80];
        b40_xp_img  = st6_img[80];
        b40_xq_real = st6_real[81];
        b40_xq_img  = st6_img[81];
        b40_wreal   = w_real[10];
        b40_wimg    = w_img[10];

        // k = 9, b41
        b41_xp_real = st6_real[82];
        b41_xp_img  = st6_img[82];
        b41_xq_real = st6_real[83];
        b41_xq_img  = st6_img[83];
        b41_wreal   = w_real[74];
        b41_wimg    = w_img[74];

        // k = 10, b42
        b42_xp_real = st6_real[84];
        b42_xp_img  = st6_img[84];
        b42_xq_real = st6_real[85];
        b42_xq_img  = st6_img[85];
        b42_wreal   = w_real[42];
        b42_wimg    = w_img[42];

        // k = 11, b43
        b43_xp_real = st6_real[86];
        b43_xp_img  = st6_img[86];
        b43_xq_real = st6_real[87];
        b43_xq_img  = st6_img[87];
        b43_wreal   = w_real[106];
        b43_wimg    = w_img[106];

        // k = 12, b44
        b44_xp_real = st6_real[88];
        b44_xp_img  = st6_img[88];
        b44_xq_real = st6_real[89];
        b44_xq_img  = st6_img[89];
        b44_wreal   = w_real[26];
        b44_wimg    = w_img[26];

        // k = 13, b45
        b45_xp_real = st6_real[90];
        b45_xp_img  = st6_img[90];
        b45_xq_real = st6_real[91];
        b45_xq_img  = st6_img[91];
        b45_wreal   = w_real[90];
        b45_wimg    = w_img[90];

        // k = 14, b46
        b46_xp_real = st6_real[92];
        b46_xp_img  = st6_img[92];
        b46_xq_real = st6_real[93];
        b46_xq_img  = st6_img[93];
        b46_wreal   = w_real[58];
        b46_wimg    = w_img[58];

        // k = 15, b47
        b47_xp_real = st6_real[94];
        b47_xp_img  = st6_img[94];
        b47_xq_real = st6_real[95];
        b47_xq_img  = st6_img[95];
        b47_wreal   = w_real[122];
        b47_wimg    = w_img[122];

        // k = 16, b48
        b48_xp_real = st6_real[96];
        b48_xp_img  = st6_img[96];
        b48_xq_real = st6_real[97];
        b48_xq_img  = st6_img[97];
        b48_wreal   = w_real[6];
        b48_wimg    = w_img[6];

        // k = 17, b49
        b49_xp_real = st6_real[98];
        b49_xp_img  = st6_img[98];
        b49_xq_real = st6_real[99];
        b49_xq_img  = st6_img[99];
        b49_wreal   = w_real[70];
        b49_wimg    = w_img[70];

        // k = 18, b50
        b50_xp_real = st6_real[100];
        b50_xp_img  = st6_img[100];
        b50_xq_real = st6_real[101];
        b50_xq_img  = st6_img[101];
        b50_wreal   = w_real[38];
        b50_wimg    = w_img[38];

        // k = 19, b51
        b51_xp_real = st6_real[102];
        b51_xp_img  = st6_img[102];
        b51_xq_real = st6_real[103];
        b51_xq_img  = st6_img[103];
        b51_wreal   = w_real[102];
        b51_wimg    = w_img[102];

        // k = 20, b52
        b52_xp_real = st6_real[104];
        b52_xp_img  = st6_img[104];
        b52_xq_real = st6_real[105];
        b52_xq_img  = st6_img[105];
        b52_wreal   = w_real[22];
        b52_wimg    = w_img[22];

        // k = 21, b53
        b53_xp_real = st6_real[106];
        b53_xp_img  = st6_img[106];
        b53_xq_real = st6_real[107];
        b53_xq_img  = st6_img[107];
        b53_wreal   = w_real[86];
        b53_wimg    = w_img[86];

        // k = 22, b54
        b54_xp_real = st6_real[108];
        b54_xp_img  = st6_img[108];
        b54_xq_real = st6_real[109];
        b54_xq_img  = st6_img[109];
        b54_wreal   = w_real[54];
        b54_wimg    = w_img[54];

        // k = 23, b55
        b55_xp_real = st6_real[110];
        b55_xp_img  = st6_img[110];
        b55_xq_real = st6_real[111];
        b55_xq_img  = st6_img[111];
        b55_wreal   = w_real[118];
        b55_wimg    = w_img[118];

        // k = 24, b56
        b56_xp_real = st6_real[112];
        b56_xp_img  = st6_img[112];
        b56_xq_real = st6_real[113];
        b56_xq_img  = st6_img[113];
        b56_wreal   = w_real[14];
        b56_wimg    = w_img[14];

        // k = 25, b57
        b57_xp_real = st6_real[114];
        b57_xp_img  = st6_img[114];
        b57_xq_real = st6_real[115];
        b57_xq_img  = st6_img[115];
        b57_wreal   = w_real[78];
        b57_wimg    = w_img[78];

        // k = 26, b58
        b58_xp_real = st6_real[116];
        b58_xp_img  = st6_img[116];
        b58_xq_real = st6_real[117];
        b58_xq_img  = st6_img[117];
        b58_wreal   = w_real[46];
        b58_wimg    = w_img[46];

        // k = 27, b59
        b59_xp_real = st6_real[118];
        b59_xp_img  = st6_img[118];
        b59_xq_real = st6_real[119];
        b59_xq_img  = st6_img[119];
        b59_wreal   = w_real[110];
        b59_wimg    = w_img[110];

        // k = 28, b60
        b60_xp_real = st6_real[120];
        b60_xp_img  = st6_img[120];
        b60_xq_real = st6_real[121];
        b60_xq_img  = st6_img[121];
        b60_wreal   = w_real[30];
        b60_wimg    = w_img[30];

        // k = 29, b61
        b61_xp_real = st6_real[122];
        b61_xp_img  = st6_img[122];
        b61_xq_real = st6_real[123];
        b61_xq_img  = st6_img[123];
        b61_wreal   = w_real[94];
        b61_wimg    = w_img[94];

        // k = 30, b62
        b62_xp_real = st6_real[124];
        b62_xp_img  = st6_img[124];
        b62_xq_real = st6_real[125];
        b62_xq_img  = st6_img[125];
        b62_wreal   = w_real[62];
        b62_wimg    = w_img[62];

        // k = 31, b63
        b63_xp_real = st6_real[126];
        b63_xp_img  = st6_img[126];
        b63_xq_real = st6_real[127];
        b63_xq_img  = st6_img[127];
        b63_wreal   = w_real[62];
        b63_wimg    = w_img[62];
        
    end
    else if (cnt == 268) begin
        // k = 0, b32
        b32_xp_real = st6_real[128];   
        b32_xp_img  = st6_img[128];   
        b32_xq_real = st6_real[129];   
        b32_xq_img  = st6_img[129];   
        b32_wreal   = w_real[1];
        b32_wimg    = w_img[1];

        // k = 1, b33
        b33_xp_real = st6_real[130];  
        b33_xp_img  = st6_img[130];  
        b33_xq_real = st6_real[131];  
        b33_xq_img  = st6_img[131];  
        b33_wreal   = w_real[65];
        b33_wimg    = w_img[65];

        // k = 2, b34
        b34_xp_real = st6_real[132];
        b34_xp_img  = st6_img[132];
        b34_xq_real = st6_real[133];
        b34_xq_img  = st6_img[133];
        b34_wreal   = w_real[33];
        b34_wimg    = w_img[33];

        // k = 3, b35
        b35_xp_real = st6_real[134];
        b35_xp_img  = st6_img[134];
        b35_xq_real = st6_real[135];
        b35_xq_img  = st6_img[135];
        b35_wreal   = w_real[97];
        b35_wimg    = w_img[97];

        // k = 4, b36
        b36_xp_real = st6_real[136];
        b36_xp_img  = st6_img[136];
        b36_xq_real = st6_real[137];
        b36_xq_img  = st6_img[137];
        b36_wreal   = w_real[17];
        b36_wimg    = w_img[17];

        // k = 5, b37
        b37_xp_real = st6_real[138];
        b37_xp_img  = st6_img[138];
        b37_xq_real = st6_real[139];
        b37_xq_img  = st6_img[139];
        b37_wreal   = w_real[81];
        b37_wimg    = w_img[81];

        // k = 6, b38
        b38_xp_real = st6_real[140];
        b38_xp_img  = st6_img[140];
        b38_xq_real = st6_real[141];
        b38_xq_img  = st6_img[141];
        b38_wreal   = w_real[49];
        b38_wimg    = w_img[49];

        // k = 7, b39
        b39_xp_real = st6_real[142];
        b39_xp_img  = st6_img[142];
        b39_xq_real = st6_real[143];
        b39_xq_img  = st6_img[143];
        b39_wreal   = w_real[113];
        b39_wimg    = w_img[113];

        // k = 8, b40
        b40_xp_real = st6_real[144];
        b40_xp_img  = st6_img[144];
        b40_xq_real = st6_real[145];
        b40_xq_img  = st6_img[145];
        b40_wreal   = w_real[9];
        b40_wimg    = w_img[9];

        // k = 9, b41
        b41_xp_real = st6_real[146];
        b41_xp_img  = st6_img[146];
        b41_xq_real = st6_real[147];
        b41_xq_img  = st6_img[147];
        b41_wreal   = w_real[73];
        b41_wimg    = w_img[73];

        // k = 10, b42
        b42_xp_real = st6_real[148];
        b42_xp_img  = st6_img[148];
        b42_xq_real = st6_real[149];
        b42_xq_img  = st6_img[149];
        b42_wreal   = w_real[41];
        b42_wimg    = w_img[41];

        // k = 11, b43
        b43_xp_real = st6_real[150];
        b43_xp_img  = st6_img[150];
        b43_xq_real = st6_real[151];
        b43_xq_img  = st6_img[151];
        b43_wreal   = w_real[105];
        b43_wimg    = w_img[105];

        // k = 12, b44
        b44_xp_real = st6_real[152];
        b44_xp_img  = st6_img[152];
        b44_xq_real = st6_real[153];
        b44_xq_img  = st6_img[153];
        b44_wreal   = w_real[25];
        b44_wimg    = w_img[25];

        // k = 13, b45
        b45_xp_real = st6_real[154];
        b45_xp_img  = st6_img[154];
        b45_xq_real = st6_real[155];
        b45_xq_img  = st6_img[155];
        b45_wreal   = w_real[89];
        b45_wimg    = w_img[89];

        // k = 14, b46
        b46_xp_real = st6_real[156];
        b46_xp_img  = st6_img[156];
        b46_xq_real = st6_real[157];
        b46_xq_img  = st6_img[157];
        b46_wreal   = w_real[57];
        b46_wimg    = w_img[57];

        // k = 15, b47
        b47_xp_real = st6_real[158];
        b47_xp_img  = st6_img[158];
        b47_xq_real = st6_real[159];
        b47_xq_img  = st6_img[159];
        b47_wreal   = w_real[121];
        b47_wimg    = w_img[121];

        // k = 16, b48
        b48_xp_real = st6_real[160];
        b48_xp_img  = st6_img[160];
        b48_xq_real = st6_real[161];
        b48_xq_img  = st6_img[161];
        b48_wreal   = w_real[5];
        b48_wimg    = w_img[5];

        // k = 17, b49
        b49_xp_real = st6_real[162];
        b49_xp_img  = st6_img[162];
        b49_xq_real = st6_real[163];
        b49_xq_img  = st6_img[163];
        b49_wreal   = w_real[69];
        b49_wimg    = w_img[69];

        // k = 18, b50
        b50_xp_real = st6_real[164];
        b50_xp_img  = st6_img[164];
        b50_xq_real = st6_real[165];
        b50_xq_img  = st6_img[165];
        b50_wreal   = w_real[37];
        b50_wimg    = w_img[37];

        // k = 19, b51
        b51_xp_real = st6_real[166];
        b51_xp_img  = st6_img[166];
        b51_xq_real = st6_real[167];
        b51_xq_img  = st6_img[167];
        b51_wreal   = w_real[101];
        b51_wimg    = w_img[101];

        // k = 20, b52
        b52_xp_real = st6_real[168];
        b52_xp_img  = st6_img[168];
        b52_xq_real = st6_real[169];
        b52_xq_img  = st6_img[169];
        b52_wreal   = w_real[21];
        b52_wimg    = w_img[21];

        // k = 21, b53
        b53_xp_real = st6_real[170];
        b53_xp_img  = st6_img[170];
        b53_xq_real = st6_real[171];
        b53_xq_img  = st6_img[171];
        b53_wreal   = w_real[85];
        b53_wimg    = w_img[85];

        // k = 22, b54
        b54_xp_real = st6_real[172];
        b54_xp_img  = st6_img[172];
        b54_xq_real = st6_real[173];
        b54_xq_img  = st6_img[173];
        b54_wreal   = w_real[53];
        b54_wimg    = w_img[53];

        // k = 23, b55
        b55_xp_real = st6_real[174];
        b55_xp_img  = st6_img[174];
        b55_xq_real = st6_real[175];
        b55_xq_img  = st6_img[175];
        b55_wreal   = w_real[117];
        b55_wimg    = w_img[117];

        // k = 24, b56
        b56_xp_real = st6_real[176];
        b56_xp_img  = st6_img[176];
        b56_xq_real = st6_real[177];
        b56_xq_img  = st6_img[177];
        b56_wreal   = w_real[13];
        b56_wimg    = w_img[13];

        // k = 25, b57
        b57_xp_real = st6_real[178];
        b57_xp_img  = st6_img[178];
        b57_xq_real = st6_real[179];
        b57_xq_img  = st6_img[179];
        b57_wreal   = w_real[77];
        b57_wimg    = w_img[77];

        // k = 26, b58
        b58_xp_real = st6_real[180];
        b58_xp_img  = st6_img[180];
        b58_xq_real = st6_real[181];
        b58_xq_img  = st6_img[181];
        b58_wreal   = w_real[45];
        b58_wimg    = w_img[45];

        // k = 27, b59
        b59_xp_real = st6_real[182];
        b59_xp_img  = st6_img[182];
        b59_xq_real = st6_real[183];
        b59_xq_img  = st6_img[183];
        b59_wreal   = w_real[109];
        b59_wimg    = w_img[109];

        // k = 28, b60
        b60_xp_real = st6_real[184];
        b60_xp_img  = st6_img[184];
        b60_xq_real = st6_real[185];
        b60_xq_img  = st6_img[185];
        b60_wreal   = w_real[29];
        b60_wimg    = w_img[29];

        // k = 29, b61
        b61_xp_real = st6_real[186];
        b61_xp_img  = st6_img[186];
        b61_xq_real = st6_real[187];
        b61_xq_img  = st6_img[187];
        b61_wreal   = w_real[93];
        b61_wimg    = w_img[93];

        // k = 30, b62
        b62_xp_real = st6_real[188];
        b62_xp_img  = st6_img[188];
        b62_xq_real = st6_real[189];
        b62_xq_img  = st6_img[189];
        b62_wreal   = w_real[61];
        b62_wimg    = w_img[61];

        // k = 31, b63
        b63_xp_real = st6_real[190];
        b63_xp_img  = st6_img[190];
        b63_xq_real = st6_real[191];
        b63_xq_img  = st6_img[191];
        b63_wreal   = w_real[125];
        b63_wimg    = w_img[125];
        
    end
    else if (cnt == 269) begin
        // k = 0, b32
        b32_xp_real = st6_real[192];    
        b32_xp_img  = st6_img[192];    
        b32_xq_real = st6_real[193];    
        b32_xq_img  = st6_img[193];    
        b32_wreal   = w_real[3];
        b32_wimg    = w_img[3];

        // k = 1, b33
        b33_xp_real = st6_real[194];  
        b33_xp_img  = st6_img[194];  
        b33_xq_real = st6_real[195];  
        b33_xq_img  = st6_img[195];  
        b33_wreal   = w_real[67];
        b33_wimg    = w_img[67];

        // k = 2, b34
        b34_xp_real = st6_real[196];
        b34_xp_img  = st6_img[196];
        b34_xq_real = st6_real[197];
        b34_xq_img  = st6_img[197];
        b34_wreal   = w_real[35];
        b34_wimg    = w_img[35];

        // k = 3, b35
        b35_xp_real = st6_real[198];
        b35_xp_img  = st6_img[198];
        b35_xq_real = st6_real[199];
        b35_xq_img  = st6_img[199];
        b35_wreal   = w_real[99];
        b35_wimg    = w_img[99];

        // k = 4, b36
        b36_xp_real = st6_real[200];
        b36_xp_img  = st6_img[200];
        b36_xq_real = st6_real[201];
        b36_xq_img  = st6_img[201];
        b36_wreal   = w_real[19];
        b36_wimg    = w_img[19];

        // k = 5, b37
        b37_xp_real = st6_real[202];
        b37_xp_img  = st6_img[202];
        b37_xq_real = st6_real[203];
        b37_xq_img  = st6_img[203];
        b37_wreal   = w_real[83];
        b37_wimg    = w_img[83];

        // k = 6, b38
        b38_xp_real = st6_real[204];
        b38_xp_img  = st6_img[204];
        b38_xq_real = st6_real[205];
        b38_xq_img  = st6_img[205];
        b38_wreal   = w_real[51];
        b38_wimg    = w_img[51];

        // k = 7, b39
        b39_xp_real = st6_real[206];
        b39_xp_img  = st6_img[206];
        b39_xq_real = st6_real[207];
        b39_xq_img  = st6_img[207];
        b39_wreal   = w_real[115];
        b39_wimg    = w_img[115];

        // k = 8, b40
        b40_xp_real = st6_real[208];
        b40_xp_img  = st6_img[208];
        b40_xq_real = st6_real[209];
        b40_xq_img  = st6_img[209];
        b40_wreal   = w_real[11];
        b40_wimg    = w_img[11];

        // k = 9, b41
        b41_xp_real = st6_real[210];
        b41_xp_img  = st6_img[210];
        b41_xq_real = st6_real[211];
        b41_xq_img  = st6_img[211];
        b41_wreal   = w_real[75];
        b41_wimg    = w_img[75];

        // k = 10, b42
        b42_xp_real = st6_real[212];
        b42_xp_img  = st6_img[212];
        b42_xq_real = st6_real[213];
        b42_xq_img  = st6_img[213];
        b42_wreal   = w_real[43];
        b42_wimg    = w_img[43];

        // k = 11, b43
        b43_xp_real = st6_real[214];
        b43_xp_img  = st6_img[214];
        b43_xq_real = st6_real[215];
        b43_xq_img  = st6_img[215];
        b43_wreal   = w_real[107];
        b43_wimg    = w_img[107];

        // k = 12, b44
        b44_xp_real = st6_real[216];
        b44_xp_img  = st6_img[216];
        b44_xq_real = st6_real[217];
        b44_xq_img  = st6_img[217];
        b44_wreal   = w_real[27];
        b44_wimg    = w_img[27];

        // k = 13, b45
        b45_xp_real = st6_real[218];
        b45_xp_img  = st6_img[218];
        b45_xq_real = st6_real[219];
        b45_xq_img  = st6_img[219];
        b45_wreal   = w_real[91];
        b45_wimg    = w_img[91];

        // k = 14, b46
        b46_xp_real = st6_real[220];
        b46_xp_img  = st6_img[220];
        b46_xq_real = st6_real[221];
        b46_xq_img  = st6_img[221];
        b46_wreal   = w_real[59];
        b46_wimg    = w_img[59];

        // k = 15, b47
        b47_xp_real = st6_real[222];
        b47_xp_img  = st6_img[222];
        b47_xq_real = st6_real[223];
        b47_xq_img  = st6_img[223];
        b47_wreal   = w_real[123];
        b47_wimg    = w_img[123];

        // k = 16, b48
        b48_xp_real = st6_real[224];
        b48_xp_img  = st6_img[224];
        b48_xq_real = st6_real[225];
        b48_xq_img  = st6_img[225];
        b48_wreal   = w_real[7];
        b48_wimg    = w_img[7];

        // k = 17, b49
        b49_xp_real = st6_real[226];
        b49_xp_img  = st6_img[226];
        b49_xq_real = st6_real[227];
        b49_xq_img  = st6_img[227];
        b49_wreal   = w_real[71];
        b49_wimg    = w_img[71];

        // k = 18, b50
        b50_xp_real = st6_real[228];
        b50_xp_img  = st6_img[228];
        b50_xq_real = st6_real[229];
        b50_xq_img  = st6_img[229];
        b50_wreal   = w_real[39];
        b50_wimg    = w_img[39];

        // k = 19, b51
        b51_xp_real = st6_real[230];
        b51_xp_img  = st6_img[230];
        b51_xq_real = st6_real[231];
        b51_xq_img  = st6_img[231];
        b51_wreal   = w_real[103];
        b51_wimg    = w_img[103];

        // k = 20, b52
        b52_xp_real = st6_real[232];
        b52_xp_img  = st6_img[232];
        b52_xq_real = st6_real[233];
        b52_xq_img  = st6_img[233];
        b52_wreal   = w_real[23];
        b52_wimg    = w_img[23];

        // k = 21, b53
        b53_xp_real = st6_real[234];
        b53_xp_img  = st6_img[234];
        b53_xq_real = st6_real[235];
        b53_xq_img  = st6_img[235];
        b53_wreal   = w_real[87];
        b53_wimg    = w_img[87];

        // k = 22, b54
        b54_xp_real = st6_real[236];
        b54_xp_img  = st6_img[236];
        b54_xq_real = st6_real[237];
        b54_xq_img  = st6_img[237];
        b54_wreal   = w_real[55];
        b54_wimg    = w_img[55];

        // k = 23, b55
        b55_xp_real = st6_real[238];
        b55_xp_img  = st6_img[238];
        b55_xq_real = st6_real[239];
        b55_xq_img  = st6_img[239];
        b55_wreal   = w_real[119];
        b55_wimg    = w_img[119];

        // k = 24, b56
        b56_xp_real = st6_real[240];
        b56_xp_img  = st6_img[240];
        b56_xq_real = st6_real[241];
        b56_xq_img  = st6_img[241];
        b56_wreal   = w_real[15];
        b56_wimg    = w_img[15];

        // k = 25, b57
        b57_xp_real = st6_real[242];
        b57_xp_img  = st6_img[242];
        b57_xq_real = st6_real[243];
        b57_xq_img  = st6_img[243];
        b57_wreal   = w_real[79];
        b57_wimg    = w_img[79];

        // k = 26, b58
        b58_xp_real = st6_real[244];
        b58_xp_img  = st6_img[244];
        b58_xq_real = st6_real[245];
        b58_xq_img  = st6_img[245];
        b58_wreal   = w_real[47];
        b58_wimg    = w_img[47];

        // k = 27, b59
        b59_xp_real = st6_real[246];
        b59_xp_img  = st6_img[246];
        b59_xq_real = st6_real[247];
        b59_xq_img  = st6_img[247];
        b59_wreal   = w_real[111];
        b59_wimg    = w_img[111];

        // k = 28, b60
        b60_xp_real = st6_real[248];
        b60_xp_img  = st6_img[248];
        b60_xq_real = st6_real[249];
        b60_xq_img  = st6_img[249];
        b60_wreal   = w_real[31];
        b60_wimg    = w_img[31];

        // k = 29, b61
        b61_xp_real = st6_real[250];
        b61_xp_img  = st6_img[250];
        b61_xq_real = st6_real[251];
        b61_xq_img  = st6_img[251];
        b61_wreal   = w_real[63];
        b61_wimg    = w_img[63];

        // k = 30, b62
        b62_xp_real = st6_real[252];
        b62_xp_img  = st6_img[252];
        b62_xq_real = st6_real[253];
        b62_xq_img  = st6_img[253];
        b62_wreal   = w_real[63];
        b62_wimg    = w_img[63];

        // k = 31, b63
        b63_xp_real = st6_real[254];
        b63_xp_img  = st6_img[254];
        b63_xq_real = st6_real[255];
        b63_xq_img  = st6_img[255];
        b63_wreal   = w_real[127];
        b63_wimg    = w_img[127];        
    end


end


always @(posedge clk) begin
    if (cnt > 257 && cnt < 262) begin // stage 6 result
        st6_real[3]   <= b32_ypreal;
        st6_img[3]    <= b32_ypimg;
        st6_real[7]   <= b32_yqreal;
        st6_img[7]    <= b32_yqimg;

        st6_real[11]  <= b33_ypreal;
        st6_img[11]   <= b33_ypimg;
        st6_real[15]  <= b33_yqreal;
        st6_img[15]   <= b33_yqimg;

        st6_real[19]  <= b34_ypreal;
        st6_img[19]   <= b34_ypimg;
        st6_real[23]  <= b34_yqreal;
        st6_img[23]   <= b34_yqimg;

        st6_real[27]  <= b35_ypreal;
        st6_img[27]   <= b35_ypimg;
        st6_real[31]  <= b35_yqreal;
        st6_img[31]   <= b35_yqimg;

        st6_real[35]  <= b36_ypreal;
        st6_img[35]   <= b36_ypimg;
        st6_real[39]  <= b36_yqreal;
        st6_img[39]   <= b36_yqimg;

        st6_real[43]  <= b37_ypreal;
        st6_img[43]   <= b37_ypimg;
        st6_real[47]  <= b37_yqreal;
        st6_img[47]   <= b37_yqimg;

        st6_real[51]  <= b38_ypreal;
        st6_img[51]   <= b38_ypimg;
        st6_real[55]  <= b38_yqreal;
        st6_img[55]   <= b38_yqimg;

        st6_real[59]  <= b39_ypreal;
        st6_img[59]   <= b39_ypimg;
        st6_real[63]  <= b39_yqreal;
        st6_img[63]   <= b39_yqimg;

        st6_real[67]  <= b40_ypreal;
        st6_img[67]   <= b40_ypimg;
        st6_real[71]  <= b40_yqreal;
        st6_img[71]   <= b40_yqimg;

        st6_real[75]  <= b41_ypreal;
        st6_img[75]   <= b41_ypimg;
        st6_real[79]  <= b41_yqreal;
        st6_img[79]   <= b41_yqimg;

        st6_real[83]  <= b42_ypreal;
        st6_img[83]   <= b42_ypimg;
        st6_real[87]  <= b42_yqreal;
        st6_img[87]   <= b42_yqimg;

        st6_real[91]  <= b43_ypreal;
        st6_img[91]   <= b43_ypimg;
        st6_real[95]  <= b43_yqreal;
        st6_img[95]   <= b43_yqimg;

        st6_real[99]  <= b44_ypreal;
        st6_img[99]   <= b44_ypimg;
        st6_real[103] <= b44_yqreal;
        st6_img[103]  <= b44_yqimg;

        st6_real[107] <= b45_ypreal;
        st6_img[107]  <= b45_ypimg;
        st6_real[111] <= b45_yqreal;
        st6_img[111]  <= b45_yqimg;

        st6_real[115] <= b46_ypreal;
        st6_img[115]  <= b46_ypimg;
        st6_real[119] <= b46_yqreal;
        st6_img[119]  <= b46_yqimg;

        st6_real[123] <= b47_ypreal;
        st6_img[123]  <= b47_ypimg;
        st6_real[127] <= b47_yqreal;
        st6_img[127]  <= b47_yqimg;

        st6_real[131] <= b48_ypreal;
        st6_img[131]  <= b48_ypimg;
        st6_real[135] <= b48_yqreal;
        st6_img[135]  <= b48_yqimg;

        st6_real[139] <= b49_ypreal;
        st6_img[139]  <= b49_ypimg;
        st6_real[143] <= b49_yqreal;
        st6_img[143]  <= b49_yqimg;

        st6_real[147] <= b50_ypreal;
        st6_img[147]  <= b50_ypimg;
        st6_real[151] <= b50_yqreal;
        st6_img[151]  <= b50_yqimg;

        st6_real[155] <= b51_ypreal;
        st6_img[155]  <= b51_ypimg;
        st6_real[159] <= b51_yqreal;
        st6_img[159]  <= b51_yqimg;

        st6_real[163] <= b52_ypreal;
        st6_img[163]  <= b52_ypimg;
        st6_real[167] <= b52_yqreal;
        st6_img[167]  <= b52_yqimg;

        st6_real[171] <= b53_ypreal;
        st6_img[171]  <= b53_ypimg;
        st6_real[175] <= b53_yqreal;
        st6_img[175]  <= b53_yqimg;

        st6_real[179] <= b54_ypreal;
        st6_img[179]  <= b54_ypimg;
        st6_real[183] <= b54_yqreal;
        st6_img[183]  <= b54_yqimg;

        st6_real[187] <= b55_ypreal;
        st6_img[187]  <= b55_ypimg;
        st6_real[191] <= b55_yqreal;
        st6_img[191]  <= b55_yqimg;

        st6_real[195] <= b56_ypreal;
        st6_img[195]  <= b56_ypimg;
        st6_real[199] <= b56_yqreal;
        st6_img[199]  <= b56_yqimg;

        st6_real[203] <= b57_ypreal;
        st6_img[203]  <= b57_ypimg;
        st6_real[207] <= b57_yqreal;
        st6_img[207]  <= b57_yqimg;

        st6_real[211] <= b58_ypreal;
        st6_img[211]  <= b58_ypimg;
        st6_real[215] <= b58_yqreal;
        st6_img[215]  <= b58_yqimg;

        st6_real[219] <= b59_ypreal;
        st6_img[219]  <= b59_ypimg;
        st6_real[223] <= b59_yqreal;
        st6_img[223]  <= b59_yqimg;

        st6_real[227] <= b60_ypreal;
        st6_img[227]  <= b60_ypimg;
        st6_real[231] <= b60_yqreal;
        st6_img[231]  <= b60_yqimg;

        st6_real[235] <= b61_ypreal;
        st6_img[235]  <= b61_ypimg;
        st6_real[239] <= b61_yqreal;
        st6_img[239]  <= b61_yqimg;

        st6_real[243] <= b62_ypreal;
        st6_img[243]  <= b62_ypimg;
        st6_real[247] <= b62_yqreal;
        st6_img[247]  <= b62_yqimg;

        st6_real[251] <= b63_ypreal;
        st6_img[251]  <= b63_ypimg;
        st6_real[255] <= b63_yqreal;
        st6_img[255]  <= b63_yqimg;

        //st6_real[i] <= st6_real[i+1];
        //st6_img[i]  <= st6_img[i+1];
        //st6_real[4 + i] <= st6_real[5 + i];
        //st6_img[4 + i]  <= st6_img[5 + i];
        for (integer i = 0; i < 2; i = i + 1) begin
            for (integer j = 0; j < 64; j = j + 1) begin
                // base = 4*j -> 0,4,8,...,252
                st6_real[4*j + i] <= st6_real[4*j + 1 + i];
                st6_img [4*j + i] <= st6_img [4*j + 1 + i];
            end
        end
    end
    else if (cnt == 262) begin // stage 7 result
        st6_real[0] <= b32_ypreal;
        st6_img[0] <= b32_ypimg;
        st6_real[2] <= b32_yqreal;
        st6_img[2] <= b32_yqimg;
        st6_real[4]   <= b33_ypreal;
        st6_img[4]    <= b33_ypimg;
        st6_real[6]   <= b33_yqreal;
        st6_img[6]    <= b33_yqimg;

        st6_real[8]   <= b34_ypreal;
        st6_img[8]    <= b34_ypimg;
        st6_real[10]  <= b34_yqreal;
        st6_img[10]   <= b34_yqimg;

        st6_real[12]  <= b35_ypreal;
        st6_img[12]   <= b35_ypimg;
        st6_real[14]  <= b35_yqreal;
        st6_img[14]   <= b35_yqimg;

        st6_real[16]  <= b36_ypreal;
        st6_img[16]   <= b36_ypimg;
        st6_real[18]  <= b36_yqreal;
        st6_img[18]   <= b36_yqimg;

        st6_real[20]  <= b37_ypreal;
        st6_img[20]   <= b37_ypimg;
        st6_real[22]  <= b37_yqreal;
        st6_img[22]   <= b37_yqimg;

        st6_real[24]  <= b38_ypreal;
        st6_img[24]   <= b38_ypimg;
        st6_real[26]  <= b38_yqreal;
        st6_img[26]   <= b38_yqimg;

        st6_real[28]  <= b39_ypreal;
        st6_img[28]   <= b39_ypimg;
        st6_real[30]  <= b39_yqreal;
        st6_img[30]   <= b39_yqimg;

        st6_real[32]  <= b40_ypreal;
        st6_img[32]   <= b40_ypimg;
        st6_real[34]  <= b40_yqreal;
        st6_img[34]   <= b40_yqimg;

        st6_real[36]  <= b41_ypreal;
        st6_img[36]   <= b41_ypimg;
        st6_real[38]  <= b41_yqreal;
        st6_img[38]   <= b41_yqimg;

        st6_real[40]  <= b42_ypreal;
        st6_img[40]   <= b42_ypimg;
        st6_real[42]  <= b42_yqreal;
        st6_img[42]   <= b42_yqimg;

        st6_real[44]  <= b43_ypreal;
        st6_img[44]   <= b43_ypimg;
        st6_real[46]  <= b43_yqreal;
        st6_img[46]   <= b43_yqimg;

        st6_real[48]  <= b44_ypreal;
        st6_img[48]   <= b44_ypimg;
        st6_real[50]  <= b44_yqreal;
        st6_img[50]   <= b44_yqimg;

        st6_real[52]  <= b45_ypreal;
        st6_img[52]   <= b45_ypimg;
        st6_real[54]  <= b45_yqreal;
        st6_img[54]   <= b45_yqimg;

        st6_real[56]  <= b46_ypreal;
        st6_img[56]   <= b46_ypimg;
        st6_real[58]  <= b46_yqreal;
        st6_img[58]   <= b46_yqimg;

        st6_real[60]  <= b47_ypreal;
        st6_img[60]   <= b47_ypimg;
        st6_real[62]  <= b47_yqreal;
        st6_img[62]   <= b47_yqimg;

        st6_real[64]  <= b48_ypreal;
        st6_img[64]   <= b48_ypimg;
        st6_real[66]  <= b48_yqreal;
        st6_img[66]   <= b48_yqimg;

        st6_real[68]  <= b49_ypreal;
        st6_img[68]   <= b49_ypimg;
        st6_real[70]  <= b49_yqreal;
        st6_img[70]   <= b49_yqimg;

        st6_real[72]  <= b50_ypreal;
        st6_img[72]   <= b50_ypimg;
        st6_real[74]  <= b50_yqreal;
        st6_img[74]   <= b50_yqimg;

        st6_real[76]  <= b51_ypreal;
        st6_img[76]   <= b51_ypimg;
        st6_real[78]  <= b51_yqreal;
        st6_img[78]   <= b51_yqimg;

        st6_real[80]  <= b52_ypreal;
        st6_img[80]   <= b52_ypimg;
        st6_real[82]  <= b52_yqreal;
        st6_img[82]   <= b52_yqimg;

        st6_real[84]  <= b53_ypreal;
        st6_img[84]   <= b53_ypimg;
        st6_real[86]  <= b53_yqreal;
        st6_img[86]   <= b53_yqimg;

        st6_real[88]  <= b54_ypreal;
        st6_img[88]   <= b54_ypimg;
        st6_real[90]  <= b54_yqreal;
        st6_img[90]   <= b54_yqimg;

        st6_real[92]  <= b55_ypreal;
        st6_img[92]   <= b55_ypimg;
        st6_real[94]  <= b55_yqreal;
        st6_img[94]   <= b55_yqimg;

        st6_real[96]  <= b56_ypreal;
        st6_img[96]   <= b56_ypimg;
        st6_real[98]  <= b56_yqreal;
        st6_img[98]   <= b56_yqimg;

        st6_real[100] <= b57_ypreal;
        st6_img[100]  <= b57_ypimg;
        st6_real[102] <= b57_yqreal;
        st6_img[102]  <= b57_yqimg;

        st6_real[104] <= b58_ypreal;
        st6_img[104]  <= b58_ypimg;
        st6_real[106] <= b58_yqreal;
        st6_img[106]  <= b58_yqimg;

        st6_real[108] <= b59_ypreal;
        st6_img[108]  <= b59_ypimg;
        st6_real[110] <= b59_yqreal;
        st6_img[110]  <= b59_yqimg;

        st6_real[112] <= b60_ypreal;
        st6_img[112]  <= b60_ypimg;
        st6_real[114] <= b60_yqreal;
        st6_img[114]  <= b60_yqimg;

        st6_real[116] <= b61_ypreal;
        st6_img[116]  <= b61_ypimg;
        st6_real[118] <= b61_yqreal;
        st6_img[118]  <= b61_yqimg;

        st6_real[120] <= b62_ypreal;
        st6_img[120]  <= b62_ypimg;
        st6_real[122] <= b62_yqreal;
        st6_img[122]  <= b62_yqimg;

        st6_real[124] <= b63_ypreal;
        st6_img[124]  <= b63_ypimg;
        st6_real[126] <= b63_yqreal;
        st6_img[126]  <= b63_yqimg;         
    end
    else if (cnt == 263) begin // stage 7 result
        st6_real[1]   <= b32_ypreal;
        st6_img[1]    <= b32_ypimg;
        st6_real[3]   <= b32_yqreal;
        st6_img[3]    <= b32_yqimg;

        st6_real[5]   <= b33_ypreal;
        st6_img[5]    <= b33_ypimg;
        st6_real[7]   <= b33_yqreal;
        st6_img[7]    <= b33_yqimg;

        st6_real[9]   <= b34_ypreal;
        st6_img[9]    <= b34_ypimg;
        st6_real[11]  <= b34_yqreal;
        st6_img[11]   <= b34_yqimg;

        st6_real[13]  <= b35_ypreal;
        st6_img[13]   <= b35_ypimg;
        st6_real[15]  <= b35_yqreal;
        st6_img[15]   <= b35_yqimg;

        st6_real[17]  <= b36_ypreal;
        st6_img[17]   <= b36_ypimg;
        st6_real[19]  <= b36_yqreal;
        st6_img[19]   <= b36_yqimg;

        st6_real[21]  <= b37_ypreal;
        st6_img[21]   <= b37_ypimg;
        st6_real[23]  <= b37_yqreal;
        st6_img[23]   <= b37_yqimg;

        st6_real[25]  <= b38_ypreal;
        st6_img[25]   <= b38_ypimg;
        st6_real[27]  <= b38_yqreal;
        st6_img[27]   <= b38_yqimg;

        st6_real[29]  <= b39_ypreal;
        st6_img[29]   <= b39_ypimg;
        st6_real[31]  <= b39_yqreal;
        st6_img[31]   <= b39_yqimg;

        st6_real[33]  <= b40_ypreal;
        st6_img[33]   <= b40_ypimg;
        st6_real[35]  <= b40_yqreal;
        st6_img[35]   <= b40_yqimg;

        st6_real[37]  <= b41_ypreal;
        st6_img[37]   <= b41_ypimg;
        st6_real[39]  <= b41_yqreal;
        st6_img[39]   <= b41_yqimg;

        st6_real[41]  <= b42_ypreal;
        st6_img[41]   <= b42_ypimg;
        st6_real[43]  <= b42_yqreal;
        st6_img[43]   <= b42_yqimg;

        st6_real[45]  <= b43_ypreal;
        st6_img[45]   <= b43_ypimg;
        st6_real[47]  <= b43_yqreal;
        st6_img[47]   <= b43_yqimg;

        st6_real[49]  <= b44_ypreal;
        st6_img[49]   <= b44_ypimg;
        st6_real[51]  <= b44_yqreal;
        st6_img[51]   <= b44_yqimg;

        st6_real[53]  <= b45_ypreal;
        st6_img[53]   <= b45_ypimg;
        st6_real[55]  <= b45_yqreal;
        st6_img[55]   <= b45_yqimg;

        st6_real[57]  <= b46_ypreal;
        st6_img[57]   <= b46_ypimg;
        st6_real[59]  <= b46_yqreal;
        st6_img[59]   <= b46_yqimg;

        st6_real[61]  <= b47_ypreal;
        st6_img[61]   <= b47_ypimg;
        st6_real[63]  <= b47_yqreal;
        st6_img[63]   <= b47_yqimg;

        st6_real[65]  <= b48_ypreal;
        st6_img[65]   <= b48_ypimg;
        st6_real[67]  <= b48_yqreal;
        st6_img[67]   <= b48_yqimg;

        st6_real[69]  <= b49_ypreal;
        st6_img[69]   <= b49_ypimg;
        st6_real[71]  <= b49_yqreal;
        st6_img[71]   <= b49_yqimg;

        st6_real[73]  <= b50_ypreal;
        st6_img[73]   <= b50_ypimg;
        st6_real[75]  <= b50_yqreal;
        st6_img[75]   <= b50_yqimg;

        st6_real[77]  <= b51_ypreal;
        st6_img[77]   <= b51_ypimg;
        st6_real[79]  <= b51_yqreal;
        st6_img[79]   <= b51_yqimg;

        st6_real[81]  <= b52_ypreal;
        st6_img[81]   <= b52_ypimg;
        st6_real[83]  <= b52_yqreal;
        st6_img[83]   <= b52_yqimg;

        st6_real[85]  <= b53_ypreal;
        st6_img[85]   <= b53_ypimg;
        st6_real[87]  <= b53_yqreal;
        st6_img[87]   <= b53_yqimg;

        st6_real[89]  <= b54_ypreal;
        st6_img[89]   <= b54_ypimg;
        st6_real[91]  <= b54_yqreal;
        st6_img[91]   <= b54_yqimg;

        st6_real[93]  <= b55_ypreal;
        st6_img[93]   <= b55_ypimg;
        st6_real[95]  <= b55_yqreal;
        st6_img[95]   <= b55_yqimg;

        st6_real[97]  <= b56_ypreal;
        st6_img[97]   <= b56_ypimg;
        st6_real[99]  <= b56_yqreal;
        st6_img[99]   <= b56_yqimg;

        st6_real[101] <= b57_ypreal;
        st6_img[101]  <= b57_ypimg;
        st6_real[103] <= b57_yqreal;
        st6_img[103]  <= b57_yqimg;

        st6_real[105] <= b58_ypreal;
        st6_img[105]  <= b58_ypimg;
        st6_real[107] <= b58_yqreal;
        st6_img[107]  <= b58_yqimg;

        st6_real[109] <= b59_ypreal;
        st6_img[109]  <= b59_ypimg;
        st6_real[111] <= b59_yqreal;
        st6_img[111]  <= b59_yqimg;

        st6_real[113] <= b60_ypreal;
        st6_img[113]  <= b60_ypimg;
        st6_real[115] <= b60_yqreal;
        st6_img[115]  <= b60_yqimg;

        st6_real[117] <= b61_ypreal;
        st6_img[117]  <= b61_ypimg;
        st6_real[119] <= b61_yqreal;
        st6_img[119]  <= b61_yqimg;

        st6_real[121] <= b62_ypreal;
        st6_img[121]  <= b62_ypimg;
        st6_real[123] <= b62_yqreal;
        st6_img[123]  <= b62_yqimg;

        st6_real[125] <= b63_ypreal;
        st6_img[125]  <= b63_ypimg;
        st6_real[127] <= b63_yqreal;
        st6_img[127]  <= b63_yqimg;
    end
    else if (cnt == 264) begin // stage 7
        st6_real[128] <= b32_ypreal;
        st6_img[128]  <= b32_ypimg;
        st6_real[130] <= b32_yqreal;
        st6_img[130]  <= b32_yqimg;

        st6_real[132] <= b33_ypreal;
        st6_img[132]  <= b33_ypimg;
        st6_real[134] <= b33_yqreal;
        st6_img[134]  <= b33_yqimg;

        st6_real[136] <= b34_ypreal;
        st6_img[136]  <= b34_ypimg;
        st6_real[138] <= b34_yqreal;
        st6_img[138]  <= b34_yqimg;

        st6_real[140] <= b35_ypreal;
        st6_img[140]  <= b35_ypimg;
        st6_real[142] <= b35_yqreal;
        st6_img[142]  <= b35_yqimg;

        st6_real[144] <= b36_ypreal;
        st6_img[144]  <= b36_ypimg;
        st6_real[146] <= b36_yqreal;
        st6_img[146]  <= b36_yqimg;

        st6_real[148] <= b37_ypreal;
        st6_img[148]  <= b37_ypimg;
        st6_real[150] <= b37_yqreal;
        st6_img[150]  <= b37_yqimg;

        st6_real[152] <= b38_ypreal;
        st6_img[152]  <= b38_ypimg;
        st6_real[154] <= b38_yqreal;
        st6_img[154]  <= b38_yqimg;

        st6_real[156] <= b39_ypreal;
        st6_img[156]  <= b39_ypimg;
        st6_real[158] <= b39_yqreal;
        st6_img[158]  <= b39_yqimg;

        st6_real[160] <= b40_ypreal;
        st6_img[160]  <= b40_ypimg;
        st6_real[162] <= b40_yqreal;
        st6_img[162]  <= b40_yqimg;

        st6_real[164] <= b41_ypreal;
        st6_img[164]  <= b41_ypimg;
        st6_real[166] <= b41_yqreal;
        st6_img[166]  <= b41_yqimg;

        st6_real[168] <= b42_ypreal;
        st6_img[168]  <= b42_ypimg;
        st6_real[170] <= b42_yqreal;
        st6_img[170]  <= b42_yqimg;

        st6_real[172] <= b43_ypreal;
        st6_img[172]  <= b43_ypimg;
        st6_real[174] <= b43_yqreal;
        st6_img[174]  <= b43_yqimg;

        st6_real[176] <= b44_ypreal;
        st6_img[176]  <= b44_ypimg;
        st6_real[178] <= b44_yqreal;
        st6_img[178]  <= b44_yqimg;

        st6_real[180] <= b45_ypreal;
        st6_img[180]  <= b45_ypimg;
        st6_real[182] <= b45_yqreal;
        st6_img[182]  <= b45_yqimg;

        st6_real[184] <= b46_ypreal;
        st6_img[184]  <= b46_ypimg;
        st6_real[186] <= b46_yqreal;
        st6_img[186]  <= b46_yqimg;

        st6_real[188] <= b47_ypreal;
        st6_img[188]  <= b47_ypimg;
        st6_real[190] <= b47_yqreal;
        st6_img[190]  <= b47_yqimg;

        st6_real[192] <= b48_ypreal;
        st6_img[192]  <= b48_ypimg;
        st6_real[194] <= b48_yqreal;
        st6_img[194]  <= b48_yqimg;

        st6_real[196] <= b49_ypreal;
        st6_img[196]  <= b49_ypimg;
        st6_real[198] <= b49_yqreal;
        st6_img[198]  <= b49_yqimg;

        st6_real[200] <= b50_ypreal;
        st6_img[200]  <= b50_ypimg;
        st6_real[202] <= b50_yqreal;
        st6_img[202]  <= b50_yqimg;

        st6_real[204] <= b51_ypreal;
        st6_img[204]  <= b51_ypimg;
        st6_real[206] <= b51_yqreal;
        st6_img[206]  <= b51_yqimg;

        st6_real[208] <= b52_ypreal;
        st6_img[208]  <= b52_ypimg;
        st6_real[210] <= b52_yqreal;
        st6_img[210]  <= b52_yqimg;

        st6_real[212] <= b53_ypreal;
        st6_img[212]  <= b53_ypimg;
        st6_real[214] <= b53_yqreal;
        st6_img[214]  <= b53_yqimg;

        st6_real[216] <= b54_ypreal;
        st6_img[216]  <= b54_ypimg;
        st6_real[218] <= b54_yqreal;
        st6_img[218]  <= b54_yqimg;

        st6_real[220] <= b55_ypreal;
        st6_img[220]  <= b55_ypimg;
        st6_real[222] <= b55_yqreal;
        st6_img[222]  <= b55_yqimg;

        st6_real[224] <= b56_ypreal;
        st6_img[224]  <= b56_ypimg;
        st6_real[226] <= b56_yqreal;
        st6_img[226]  <= b56_yqimg;

        st6_real[228] <= b57_ypreal;
        st6_img[228]  <= b57_ypimg;
        st6_real[230] <= b57_yqreal;
        st6_img[230]  <= b57_yqimg;

        st6_real[232] <= b58_ypreal;
        st6_img[232]  <= b58_ypimg;
        st6_real[234] <= b58_yqreal;
        st6_img[234]  <= b58_yqimg;

        st6_real[236] <= b59_ypreal;
        st6_img[236]  <= b59_ypimg;
        st6_real[238] <= b59_yqreal;
        st6_img[238]  <= b59_yqimg;

        st6_real[240] <= b60_ypreal;
        st6_img[240]  <= b60_ypimg;
        st6_real[242] <= b60_yqreal;
        st6_img[242]  <= b60_yqimg;

        st6_real[244] <= b61_ypreal;
        st6_img[244]  <= b61_ypimg;
        st6_real[246] <= b61_yqreal;
        st6_img[246]  <= b61_yqimg;

        st6_real[248] <= b62_ypreal;
        st6_img[248]  <= b62_ypimg;
        st6_real[250] <= b62_yqreal;
        st6_img[250]  <= b62_yqimg;

        st6_real[252] <= b63_ypreal;
        st6_img[252]  <= b63_ypimg;
        st6_real[254] <= b63_yqreal;
        st6_img[254]  <= b63_yqimg;
    end
    else if (cnt == 265) begin // stage 7
        st6_real[129] <= b32_ypreal;
        st6_img[129]  <= b32_ypimg;
        st6_real[131] <= b32_yqreal;
        st6_img[131]  <= b32_yqimg;

        st6_real[133] <= b33_ypreal;
        st6_img[133]  <= b33_ypimg;
        st6_real[135] <= b33_yqreal;
        st6_img[135]  <= b33_yqimg;

        st6_real[137] <= b34_ypreal;
        st6_img[137]  <= b34_ypimg;
        st6_real[139] <= b34_yqreal;
        st6_img[139]  <= b34_yqimg;

        st6_real[141] <= b35_ypreal;
        st6_img[141]  <= b35_ypimg;
        st6_real[143] <= b35_yqreal;
        st6_img[143]  <= b35_yqimg;

        st6_real[145] <= b36_ypreal;
        st6_img[145]  <= b36_ypimg;
        st6_real[147] <= b36_yqreal;
        st6_img[147]  <= b36_yqimg;

        st6_real[149] <= b37_ypreal;
        st6_img[149]  <= b37_ypimg;
        st6_real[151] <= b37_yqreal;
        st6_img[151]  <= b37_yqimg;

        st6_real[153] <= b38_ypreal;
        st6_img[153]  <= b38_ypimg;
        st6_real[155] <= b38_yqreal;
        st6_img[155]  <= b38_yqimg;

        st6_real[157] <= b39_ypreal;
        st6_img[157]  <= b39_ypimg;
        st6_real[159] <= b39_yqreal;
        st6_img[159]  <= b39_yqimg;

        st6_real[161] <= b40_ypreal;
        st6_img[161]  <= b40_ypimg;
        st6_real[163] <= b40_yqreal;
        st6_img[163]  <= b40_yqimg;

        st6_real[165] <= b41_ypreal;
        st6_img[165]  <= b41_ypimg;
        st6_real[167] <= b41_yqreal;
        st6_img[167]  <= b41_yqimg;

        st6_real[169] <= b42_ypreal;
        st6_img[169]  <= b42_ypimg;
        st6_real[171] <= b42_yqreal;
        st6_img[171]  <= b42_yqimg;

        st6_real[173] <= b43_ypreal;
        st6_img[173]  <= b43_ypimg;
        st6_real[175] <= b43_yqreal;
        st6_img[175]  <= b43_yqimg;

        st6_real[177] <= b44_ypreal;
        st6_img[177]  <= b44_ypimg;
        st6_real[179] <= b44_yqreal;
        st6_img[179]  <= b44_yqimg;

        st6_real[181] <= b45_ypreal;
        st6_img[181]  <= b45_ypimg;
        st6_real[183] <= b45_yqreal;
        st6_img[183]  <= b45_yqimg;

        st6_real[185] <= b46_ypreal;
        st6_img[185]  <= b46_ypimg;
        st6_real[187] <= b46_yqreal;
        st6_img[187]  <= b46_yqimg;

        st6_real[189] <= b47_ypreal;
        st6_img[189]  <= b47_ypimg;
        st6_real[191] <= b47_yqreal;
        st6_img[191]  <= b47_yqimg;

        st6_real[193] <= b48_ypreal;
        st6_img[193]  <= b48_ypimg;
        st6_real[195] <= b48_yqreal;
        st6_img[195]  <= b48_yqimg;

        st6_real[197] <= b49_ypreal;
        st6_img[197]  <= b49_ypimg;
        st6_real[199] <= b49_yqreal;
        st6_img[199]  <= b49_yqimg;

        st6_real[201] <= b50_ypreal;
        st6_img[201]  <= b50_ypimg;
        st6_real[203] <= b50_yqreal;
        st6_img[203]  <= b50_yqimg;

        st6_real[205] <= b51_ypreal;
        st6_img[205]  <= b51_ypimg;
        st6_real[207] <= b51_yqreal;
        st6_img[207]  <= b51_yqimg;

        st6_real[209] <= b52_ypreal;
        st6_img[209]  <= b52_ypimg;
        st6_real[211] <= b52_yqreal;
        st6_img[211]  <= b52_yqimg;

        st6_real[213] <= b53_ypreal;
        st6_img[213]  <= b53_ypimg;
        st6_real[215] <= b53_yqreal;
        st6_img[215]  <= b53_yqimg;

        st6_real[217] <= b54_ypreal;
        st6_img[217]  <= b54_ypimg;
        st6_real[219] <= b54_yqreal;
        st6_img[219]  <= b54_yqimg;

        st6_real[221] <= b55_ypreal;
        st6_img[221]  <= b55_ypimg;
        st6_real[223] <= b55_yqreal;
        st6_img[223]  <= b55_yqimg;

        st6_real[225] <= b56_ypreal;
        st6_img[225]  <= b56_ypimg;
        st6_real[227] <= b56_yqreal;
        st6_img[227]  <= b56_yqimg;

        st6_real[229] <= b57_ypreal;
        st6_img[229]  <= b57_ypimg;
        st6_real[231] <= b57_yqreal;
        st6_img[231]  <= b57_yqimg;

        st6_real[233] <= b58_ypreal;
        st6_img[233]  <= b58_ypimg;
        st6_real[235] <= b58_yqreal;
        st6_img[235]  <= b58_yqimg;

        st6_real[237] <= b59_ypreal;
        st6_img[237]  <= b59_ypimg;
        st6_real[239] <= b59_yqreal;
        st6_img[239]  <= b59_yqimg;

        st6_real[241] <= b60_ypreal;
        st6_img[241]  <= b60_ypimg;
        st6_real[243] <= b60_yqreal;
        st6_img[243]  <= b60_yqimg;

        st6_real[245] <= b61_ypreal;
        st6_img[245]  <= b61_ypimg;
        st6_real[247] <= b61_yqreal;
        st6_img[247]  <= b61_yqimg;

        st6_real[249] <= b62_ypreal;
        st6_img[249]  <= b62_ypimg;
        st6_real[251] <= b62_yqreal;
        st6_img[251]  <= b62_yqimg;

        st6_real[253] <= b63_ypreal;
        st6_img[253]  <= b63_ypimg;
        st6_real[255] <= b63_yqreal;
        st6_img[255]  <= b63_yqimg;
    end
    else if (cnt == 266) begin
        st6_real[0] <= b32_ypreal;
        st6_img[0]  <= b32_ypimg;
        st6_real[128] <= b32_yqreal;
        st6_img[128]  <= b32_yqimg;

        st6_real[64] <= b33_ypreal;
        st6_img[64]  <= b33_ypimg;
        st6_real[192] <= b33_yqreal;
        st6_img[192]  <= b33_yqimg;

        st6_real[32] <= b34_ypreal;
        st6_img[32]  <= b34_ypimg;
        st6_real[160] <= b34_yqreal;
        st6_img[160]  <= b34_yqimg;

        st6_real[96] <= b35_ypreal;
        st6_img[96]  <= b35_ypimg;
        st6_real[224] <= b35_yqreal;
        st6_img[224]  <= b35_yqimg;

        st6_real[16] <= b36_ypreal;
        st6_img[16]  <= b36_ypimg;
        st6_real[144] <= b36_yqreal;
        st6_img[144]  <= b36_yqimg;

        st6_real[80] <= b37_ypreal;
        st6_img[80]  <= b37_ypimg;
        st6_real[208] <= b37_yqreal;
        st6_img[208]  <= b37_yqimg;

        st6_real[48] <= b38_ypreal;
        st6_img[48]  <= b38_ypimg;
        st6_real[176] <= b38_yqreal;
        st6_img[176]  <= b38_yqimg;

        st6_real[112] <= b39_ypreal;
        st6_img[112]  <= b39_ypimg;
        st6_real[240] <= b39_yqreal;
        st6_img[240]  <= b39_yqimg;

        st6_real[8] <= b40_ypreal;
        st6_img[8]  <= b40_ypimg;
        st6_real[136] <= b40_yqreal;
        st6_img[136]  <= b40_yqimg;

        st6_real[72] <= b41_ypreal;
        st6_img[72]  <= b41_ypimg;
        st6_real[200] <= b41_yqreal;
        st6_img[200]  <= b41_yqimg;

        st6_real[40] <= b42_ypreal;
        st6_img[40]  <= b42_ypimg;
        st6_real[168] <= b42_yqreal;
        st6_img[168]  <= b42_yqimg;

        st6_real[104] <= b43_ypreal;
        st6_img[104]  <= b43_ypimg;
        st6_real[232] <= b43_yqreal;
        st6_img[232]  <= b43_yqimg;

        st6_real[24] <= b44_ypreal;
        st6_img[24]  <= b44_ypimg;
        st6_real[152] <= b44_yqreal;
        st6_img[152]  <= b44_yqimg;

        st6_real[88] <= b45_ypreal;
        st6_img[88]  <= b45_ypimg;
        st6_real[216] <= b45_yqreal;
        st6_img[216]  <= b45_yqimg;

        st6_real[56] <= b46_ypreal;
        st6_img[56]  <= b46_ypimg;
        st6_real[184] <= b46_yqreal;
        st6_img[184]  <= b46_yqimg;

        st6_real[120] <= b47_ypreal;
        st6_img[120]  <= b47_ypimg;
        st6_real[248] <= b47_yqreal;
        st6_img[248]  <= b47_yqimg;

        st6_real[4] <= b48_ypreal;
        st6_img[4]  <= b48_ypimg;
        st6_real[132] <= b48_yqreal;
        st6_img[132]  <= b48_yqimg;

        st6_real[68] <= b49_ypreal;
        st6_img[68]  <= b49_ypimg;
        st6_real[196] <= b49_yqreal;
        st6_img[196]  <= b49_yqimg;

        st6_real[36] <= b50_ypreal;
        st6_img[36]  <= b50_ypimg;
        st6_real[164] <= b50_yqreal;
        st6_img[164]  <= b50_yqimg;

        st6_real[100] <= b51_ypreal;
        st6_img[100]  <= b51_ypimg;
        st6_real[228] <= b51_yqreal;
        st6_img[228]  <= b51_yqimg;

        st6_real[20] <= b52_ypreal;
        st6_img[20]  <= b52_ypimg;
        st6_real[148] <= b52_yqreal;
        st6_img[148]  <= b52_yqimg;

        st6_real[84] <= b53_ypreal;
        st6_img[84]  <= b53_ypimg;
        st6_real[212] <= b53_yqreal;
        st6_img[212]  <= b53_yqimg;

        st6_real[52] <= b54_ypreal;
        st6_img[52]  <= b54_ypimg;
        st6_real[180] <= b54_yqreal;
        st6_img[180]  <= b54_yqimg;

        st6_real[116] <= b55_ypreal;
        st6_img[116]  <= b55_ypimg;
        st6_real[244] <= b55_yqreal;
        st6_img[244]  <= b55_yqimg;

        st6_real[12] <= b56_ypreal;
        st6_img[12]  <= b56_ypimg;
        st6_real[140] <= b56_yqreal;
        st6_img[140]  <= b56_yqimg;

        st6_real[76] <= b57_ypreal;
        st6_img[76]  <= b57_ypimg;
        st6_real[204] <= b57_yqreal;
        st6_img[204]  <= b57_yqimg;

        st6_real[44] <= b58_ypreal;
        st6_img[44]  <= b58_ypimg;
        st6_real[172] <= b58_yqreal;
        st6_img[172]  <= b58_yqimg;

        st6_real[108] <= b59_ypreal;
        st6_img[108]  <= b59_ypimg;
        st6_real[236] <= b59_yqreal;
        st6_img[236]  <= b59_yqimg;

        st6_real[28] <= b60_ypreal;
        st6_img[28]  <= b60_ypimg;
        st6_real[156] <= b60_yqreal;
        st6_img[156]  <= b60_yqimg;

        st6_real[92] <= b61_ypreal;
        st6_img[92]  <= b61_ypimg;
        st6_real[220] <= b61_yqreal;
        st6_img[220]  <= b61_yqimg;

        st6_real[60] <= b62_ypreal;
        st6_img[60]  <= b62_ypimg;
        st6_real[188] <= b62_yqreal;
        st6_img[188]  <= b62_yqimg;

        st6_real[124] <= b63_ypreal;
        st6_img[124]  <= b63_ypimg;
        st6_real[252] <= b63_yqreal;
        st6_img[252]  <= b63_yqimg;
        
    end
    else if (cnt == 267) begin
        st6_real[2]   <= b32_ypreal;
        st6_img[2]    <= b32_ypimg;
        st6_real[130] <= b32_yqreal;
        st6_img[130]  <= b32_yqimg;

        st6_real[66]  <= b33_ypreal;
        st6_img[66]   <= b33_ypimg;
        st6_real[194] <= b33_yqreal;
        st6_img[194]  <= b33_yqimg;

        st6_real[34]  <= b34_ypreal;
        st6_img[34]   <= b34_ypimg;
        st6_real[162] <= b34_yqreal;
        st6_img[162]  <= b34_yqimg;

        st6_real[98]  <= b35_ypreal;
        st6_img[98]   <= b35_ypimg;
        st6_real[226] <= b35_yqreal;
        st6_img[226]  <= b35_yqimg;

        st6_real[18]  <= b36_ypreal;
        st6_img[18]   <= b36_ypimg;
        st6_real[146] <= b36_yqreal;
        st6_img[146]  <= b36_yqimg;

        st6_real[82]  <= b37_ypreal;
        st6_img[82]   <= b37_ypimg;
        st6_real[210] <= b37_yqreal;
        st6_img[210]  <= b37_yqimg;

        st6_real[50]  <= b38_ypreal;
        st6_img[50]   <= b38_ypimg;
        st6_real[178] <= b38_yqreal;
        st6_img[178]  <= b38_yqimg;

        st6_real[114] <= b39_ypreal;
        st6_img[114]  <= b39_ypimg;
        st6_real[242] <= b39_yqreal;
        st6_img[242]  <= b39_yqimg;

        st6_real[10]  <= b40_ypreal;
        st6_img[10]   <= b40_ypimg;
        st6_real[138] <= b40_yqreal;
        st6_img[138]  <= b40_yqimg;

        st6_real[74]  <= b41_ypreal;
        st6_img[74]   <= b41_ypimg;
        st6_real[202] <= b41_yqreal;
        st6_img[202]  <= b41_yqimg;

        st6_real[42]  <= b42_ypreal;
        st6_img[42]   <= b42_ypimg;
        st6_real[170] <= b42_yqreal;
        st6_img[170]  <= b42_yqimg;

        st6_real[106] <= b43_ypreal;
        st6_img[106]  <= b43_ypimg;
        st6_real[234] <= b43_yqreal;
        st6_img[234]  <= b43_yqimg;

        st6_real[26]  <= b44_ypreal;
        st6_img[26]   <= b44_ypimg;
        st6_real[154] <= b44_yqreal;
        st6_img[154]  <= b44_yqimg;

        st6_real[90]  <= b45_ypreal;
        st6_img[90]   <= b45_ypimg;
        st6_real[218] <= b45_yqreal;
        st6_img[218]  <= b45_yqimg;

        st6_real[58]  <= b46_ypreal;
        st6_img[58]   <= b46_ypimg;
        st6_real[186] <= b46_yqreal;
        st6_img[186]  <= b46_yqimg;

        st6_real[122] <= b47_ypreal;
        st6_img[122]  <= b47_ypimg;
        st6_real[250] <= b47_yqreal;
        st6_img[250]  <= b47_yqimg;

        st6_real[6]   <= b48_ypreal;
        st6_img[6]    <= b48_ypimg;
        st6_real[134] <= b48_yqreal;
        st6_img[134]  <= b48_yqimg;

        st6_real[70]  <= b49_ypreal;
        st6_img[70]   <= b49_ypimg;
        st6_real[198] <= b49_yqreal;
        st6_img[198]  <= b49_yqimg;

        st6_real[38]  <= b50_ypreal;
        st6_img[38]   <= b50_ypimg;
        st6_real[166] <= b50_yqreal;
        st6_img[166]  <= b50_yqimg;

        st6_real[102] <= b51_ypreal;
        st6_img[102]  <= b51_ypimg;
        st6_real[230] <= b51_yqreal;
        st6_img[230]  <= b51_yqimg;

        st6_real[22]  <= b52_ypreal;
        st6_img[22]   <= b52_ypimg;
        st6_real[150] <= b52_yqreal;
        st6_img[150]  <= b52_yqimg;

        st6_real[86]  <= b53_ypreal;
        st6_img[86]   <= b53_ypimg;
        st6_real[214] <= b53_yqreal;
        st6_img[214]  <= b53_yqimg;

        st6_real[54]  <= b54_ypreal;
        st6_img[54]   <= b54_ypimg;
        st6_real[182] <= b54_yqreal;
        st6_img[182]  <= b54_yqimg;

        st6_real[118] <= b55_ypreal;
        st6_img[118]  <= b55_ypimg;
        st6_real[246] <= b55_yqreal;
        st6_img[246]  <= b55_yqimg;

        st6_real[14]  <= b56_ypreal;
        st6_img[14]   <= b56_ypimg;
        st6_real[142] <= b56_yqreal;
        st6_img[142]  <= b56_yqimg;

        st6_real[78]  <= b57_ypreal;
        st6_img[78]   <= b57_ypimg;
        st6_real[206] <= b57_yqreal;
        st6_img[206]  <= b57_yqimg;

        st6_real[46]  <= b58_ypreal;
        st6_img[46]   <= b58_ypimg;
        st6_real[174] <= b58_yqreal;
        st6_img[174]  <= b58_yqimg;

        st6_real[110] <= b59_ypreal;
        st6_img[110]  <= b59_ypimg;
        st6_real[238] <= b59_yqreal;
        st6_img[238]  <= b59_yqimg;

        st6_real[30]  <= b60_ypreal;
        st6_img[30]   <= b60_ypimg;
        st6_real[158] <= b60_yqreal;
        st6_img[158]  <= b60_yqimg;

        st6_real[94]  <= b61_ypreal;
        st6_img[94]   <= b61_ypimg;
        st6_real[222] <= b61_yqreal;
        st6_img[222]  <= b61_yqimg;

        st6_real[62]  <= b62_ypreal;
        st6_img[62]   <= b62_ypimg;
        st6_real[190] <= b62_yqreal;
        st6_img[190]  <= b62_yqimg;

        st6_real[126] <= b63_ypreal;
        st6_img[126]  <= b63_ypimg;
        st6_real[254] <= b63_yqreal;
        st6_img[254]  <= b63_yqimg;
        
    end
    else if (cnt == 268) begin
        st6_real[2]   <= b32_ypreal;
        st6_img[2]    <= b32_ypimg;
        st6_real[130] <= b32_yqreal;
        st6_img[130]  <= b32_yqimg;

        st6_real[66]  <= b33_ypreal;
        st6_img[66]   <= b33_ypimg;
        st6_real[194] <= b33_yqreal;
        st6_img[194]  <= b33_yqimg;

        st6_real[34]  <= b34_ypreal;
        st6_img[34]   <= b34_ypimg;
        st6_real[162] <= b34_yqreal;
        st6_img[162]  <= b34_yqimg;

        st6_real[98]  <= b35_ypreal;
        st6_img[98]   <= b35_ypimg;
        st6_real[226] <= b35_yqreal;
        st6_img[226]  <= b35_yqimg;

        st6_real[18]  <= b36_ypreal;
        st6_img[18]   <= b36_ypimg;
        st6_real[146] <= b36_yqreal;
        st6_img[146]  <= b36_yqimg;

        st6_real[82]  <= b37_ypreal;
        st6_img[82]   <= b37_ypimg;
        st6_real[210] <= b37_yqreal;
        st6_img[210]  <= b37_yqimg;

        st6_real[50]  <= b38_ypreal;
        st6_img[50]   <= b38_ypimg;
        st6_real[178] <= b38_yqreal;
        st6_img[178]  <= b38_yqimg;

        st6_real[114] <= b39_ypreal;
        st6_img[114]  <= b39_ypimg;
        st6_real[242] <= b39_yqreal;
        st6_img[242]  <= b39_yqimg;

        st6_real[10]  <= b40_ypreal;
        st6_img[10]   <= b40_ypimg;
        st6_real[138] <= b40_yqreal;
        st6_img[138]  <= b40_yqimg;

        st6_real[74]  <= b41_ypreal;
        st6_img[74]   <= b41_ypimg;
        st6_real[202] <= b41_yqreal;
        st6_img[202]  <= b41_yqimg;

        st6_real[42]  <= b42_ypreal;
        st6_img[42]   <= b42_ypimg;
        st6_real[170] <= b42_yqreal;
        st6_img[170]  <= b42_yqimg;

        st6_real[106] <= b43_ypreal;
        st6_img[106]  <= b43_ypimg;
        st6_real[234] <= b43_yqreal;
        st6_img[234]  <= b43_yqimg;

        st6_real[26]  <= b44_ypreal;
        st6_img[26]   <= b44_ypimg;
        st6_real[154] <= b44_yqreal;
        st6_img[154]  <= b44_yqimg;

        st6_real[90]  <= b45_ypreal;
        st6_img[90]   <= b45_ypimg;
        st6_real[218] <= b45_yqreal;
        st6_img[218]  <= b45_yqimg;

        st6_real[58]  <= b46_ypreal;
        st6_img[58]   <= b46_ypimg;
        st6_real[186] <= b46_yqreal;
        st6_img[186]  <= b46_yqimg;

        st6_real[122] <= b47_ypreal;
        st6_img[122]  <= b47_ypimg;
        st6_real[250] <= b47_yqreal;
        st6_img[250]  <= b47_yqimg;

        st6_real[6]   <= b48_ypreal;
        st6_img[6]    <= b48_ypimg;
        st6_real[134] <= b48_yqreal;
        st6_img[134]  <= b48_yqimg;

        st6_real[70]  <= b49_ypreal;
        st6_img[70]   <= b49_ypimg;
        st6_real[198] <= b49_yqreal;
        st6_img[198]  <= b49_yqimg;

        st6_real[38]  <= b50_ypreal;
        st6_img[38]   <= b50_ypimg;
        st6_real[166] <= b50_yqreal;
        st6_img[166]  <= b50_yqimg;

        st6_real[102] <= b51_ypreal;
        st6_img[102]  <= b51_ypimg;
        st6_real[230] <= b51_yqreal;
        st6_img[230]  <= b51_yqimg;

        st6_real[22]  <= b52_ypreal;
        st6_img[22]   <= b52_ypimg;
        st6_real[150] <= b52_yqreal;
        st6_img[150]  <= b52_yqimg;

        st6_real[86]  <= b53_ypreal;
        st6_img[86]   <= b53_ypimg;
        st6_real[214] <= b53_yqreal;
        st6_img[214]  <= b53_yqimg;

        st6_real[54]  <= b54_ypreal;
        st6_img[54]   <= b54_ypimg;
        st6_real[182] <= b54_yqreal;
        st6_img[182]  <= b54_yqimg;

        st6_real[118] <= b55_ypreal;
        st6_img[118]  <= b55_ypimg;
        st6_real[246] <= b55_yqreal;
        st6_img[246]  <= b55_yqimg;

        st6_real[14]  <= b56_ypreal;
        st6_img[14]   <= b56_ypimg;
        st6_real[142] <= b56_yqreal;
        st6_img[142]  <= b56_yqimg;

        st6_real[78]  <= b57_ypreal;
        st6_img[78]   <= b57_ypimg;
        st6_real[206] <= b57_yqreal;
        st6_img[206]  <= b57_yqimg;

        st6_real[46]  <= b58_ypreal;
        st6_img[46]   <= b58_ypimg;
        st6_real[174] <= b58_yqreal;
        st6_img[174]  <= b58_yqimg;

        st6_real[110] <= b59_ypreal;
        st6_img[110]  <= b59_ypimg;
        st6_real[238] <= b59_yqreal;
        st6_img[238]  <= b59_yqimg;

        st6_real[30]  <= b60_ypreal;
        st6_img[30]   <= b60_ypimg;
        st6_real[158] <= b60_yqreal;
        st6_img[158]  <= b60_yqimg;

        st6_real[94]  <= b61_ypreal;
        st6_img[94]   <= b61_ypimg;
        st6_real[222] <= b61_yqreal;
        st6_img[222]  <= b61_yqimg;

        st6_real[62]  <= b62_ypreal;
        st6_img[62]   <= b62_ypimg;
        st6_real[190] <= b62_yqreal;
        st6_img[190]  <= b62_yqimg;

        st6_real[126] <= b63_ypreal;
        st6_img[126]  <= b63_ypimg;
        st6_real[254] <= b63_yqreal;
        st6_img[254]  <= b63_yqimg;        
    end
    else if (cnt == 269) begin
        st6_real[3]   <= b32_ypreal;
        st6_img[3]    <= b32_ypimg;
        st6_real[131] <= b32_yqreal;
        st6_img[131]  <= b32_yqimg;

        st6_real[67]  <= b33_ypreal;
        st6_img[67]   <= b33_ypimg;
        st6_real[195] <= b33_yqreal;
        st6_img[195]  <= b33_yqimg;

        st6_real[35]  <= b34_ypreal;
        st6_img[35]   <= b34_ypimg;
        st6_real[163] <= b34_yqreal;
        st6_img[163]  <= b34_yqimg;

        st6_real[99]  <= b35_ypreal;
        st6_img[99]   <= b35_ypimg;
        st6_real[227] <= b35_yqreal;
        st6_img[227]  <= b35_yqimg;

        st6_real[19]  <= b36_ypreal;
        st6_img[19]   <= b36_ypimg;
        st6_real[147] <= b36_yqreal;
        st6_img[147]  <= b36_yqimg;

        st6_real[83]  <= b37_ypreal;
        st6_img[83]   <= b37_ypimg;
        st6_real[211] <= b37_yqreal;
        st6_img[211]  <= b37_yqimg;

        st6_real[51]  <= b38_ypreal;
        st6_img[51]   <= b38_ypimg;
        st6_real[179] <= b38_yqreal;
        st6_img[179]  <= b38_yqimg;

        st6_real[115] <= b39_ypreal;
        st6_img[115]  <= b39_ypimg;
        st6_real[243] <= b39_yqreal;
        st6_img[243]  <= b39_yqimg;

        st6_real[11]  <= b40_ypreal;
        st6_img[11]   <= b40_ypimg;
        st6_real[139] <= b40_yqreal;
        st6_img[139]  <= b40_yqimg;

        st6_real[75]  <= b41_ypreal;
        st6_img[75]   <= b41_ypimg;
        st6_real[203] <= b41_yqreal;
        st6_img[203]  <= b41_yqimg;

        st6_real[43]  <= b42_ypreal;
        st6_img[43]   <= b42_ypimg;
        st6_real[171] <= b42_yqreal;
        st6_img[171]  <= b42_yqimg;

        st6_real[107] <= b43_ypreal;
        st6_img[107]  <= b43_ypimg;
        st6_real[235] <= b43_yqreal;
        st6_img[235]  <= b43_yqimg;

        st6_real[27]  <= b44_ypreal;
        st6_img[27]   <= b44_ypimg;
        st6_real[155] <= b44_yqreal;
        st6_img[155]  <= b44_yqimg;

        st6_real[91]  <= b45_ypreal;
        st6_img[91]   <= b45_ypimg;
        st6_real[219] <= b45_yqreal;
        st6_img[219]  <= b45_yqimg;

        st6_real[59]  <= b46_ypreal;
        st6_img[59]   <= b46_ypimg;
        st6_real[187] <= b46_yqreal;
        st6_img[187]  <= b46_yqimg;

        st6_real[123] <= b47_ypreal;
        st6_img[123]  <= b47_ypimg;
        st6_real[251] <= b47_yqreal;
        st6_img[251]  <= b47_yqimg;

        st6_real[7]   <= b48_ypreal;
        st6_img[7]    <= b48_ypimg;
        st6_real[135] <= b48_yqreal;
        st6_img[135]  <= b48_yqimg;

        st6_real[71]  <= b49_ypreal;
        st6_img[71]   <= b49_ypimg;
        st6_real[199] <= b49_yqreal;
        st6_img[199]  <= b49_yqimg;

        st6_real[39]  <= b50_ypreal;
        st6_img[39]   <= b50_ypimg;
        st6_real[167] <= b50_yqreal;
        st6_img[167]  <= b50_yqimg;

        st6_real[103] <= b51_ypreal;
        st6_img[103]  <= b51_ypimg;
        st6_real[231] <= b51_yqreal;
        st6_img[231]  <= b51_yqimg;

        st6_real[23]  <= b52_ypreal;
        st6_img[23]   <= b52_ypimg;
        st6_real[151] <= b52_yqreal;
        st6_img[151]  <= b52_yqimg;

        st6_real[87]  <= b53_ypreal;
        st6_img[87]   <= b53_ypimg;
        st6_real[215] <= b53_yqreal;
        st6_img[215]  <= b53_yqimg;

        st6_real[55]  <= b54_ypreal;
        st6_img[55]   <= b54_ypimg;
        st6_real[183] <= b54_yqreal;
        st6_img[183]  <= b54_yqimg;

        st6_real[119] <= b55_ypreal;
        st6_img[119]  <= b55_ypimg;
        st6_real[247] <= b55_yqreal;
        st6_img[247]  <= b55_yqimg;

        st6_real[15]  <= b56_ypreal;
        st6_img[15]   <= b56_ypimg;
        st6_real[143] <= b56_yqreal;
        st6_img[143]  <= b56_yqimg;

        st6_real[79]  <= b57_ypreal;
        st6_img[79]   <= b57_ypimg;
        st6_real[207] <= b57_yqreal;
        st6_img[207]  <= b57_yqimg;

        st6_real[47]  <= b58_ypreal;
        st6_img[47]   <= b58_ypimg;
        st6_real[175] <= b58_yqreal;
        st6_img[175]  <= b58_yqimg;

        st6_real[111] <= b59_ypreal;
        st6_img[111]  <= b59_ypimg;
        st6_real[239] <= b59_yqreal;
        st6_img[239]  <= b59_yqimg;

        st6_real[31]  <= b60_ypreal;
        st6_img[31]   <= b60_ypimg;
        st6_real[159] <= b60_yqreal;
        st6_img[159]  <= b60_yqimg;

        st6_real[95]  <= b61_ypreal;
        st6_img[95]   <= b61_ypimg;
        st6_real[223] <= b61_yqreal;
        st6_img[223]  <= b61_yqimg;

        st6_real[63]  <= b62_ypreal;
        st6_img[63]   <= b62_ypimg;
        st6_real[191] <= b62_yqreal;
        st6_img[191]  <= b62_yqimg;

        st6_real[127] <= b63_ypreal;
        st6_img[127]  <= b63_ypimg;
        st6_real[255] <= b63_yqreal;
        st6_img[255]  <= b63_yqimg;
        
    end
end
reg [7:0] out_cnt;
always @(posedge clk) begin
    if (!rst_n) begin
        out_cnt <= 0;
    end
    else begin
        if (cnt == 268) begin
            out_cnt <= out_cnt + 1;
        end
    end
end
always @(posedge clk) begin
    if (!rst_n) begin
        out_valid <= 0;
    end
    else begin
        if (cnt == 267 || (out_cnt > 0 && out_cnt != 255)) begin
            out_valid <= 1;
        end
        else if (out_cnt == 255) begin
            out_valid <= 0;
        end
    end
end
always @(posedge clk) begin
    if (!rst_n) begin
        out_yp_real <= 0;
        out_yp_img <= 0;
    end
    else begin
        if (cnt == 267 || (out_cnt > 0 && out_cnt != 255)) begin
            out_yp_real <= st6_real[out_cnt];
            out_yp_img <= st6_img[out_cnt];
        end
        else if (out_cnt == 255) begin
            out_yp_real <= 0;
            out_yp_img <= 0;            
        end
    end
end

// stage 7 suppose to use another 64 butterfly but consider the area that it may have, I built it by using Pipeline(4stage).
// stage 8 suppose to use another 128 butterfly but consider the area that it may have, I built it by using Pipeline (8stage).
// stage 1 use one butterfly
butterfly B1 (.xp_real(b1_xp_real), .xp_img(b1_xp_img), .xq_real(b1_xq_real), .xq_img(b1_xq_img), .w_real(b1_wreal), .w_img(b1_img), .yp_real(b1_ypreal), .yp_img(b1_ypimg), .yq_real(b1_yqreal), .yq_img(b1_yqimg));
// stage 2 use 2 butterfly (b2 b3)
butterfly B2 (.xp_real(b2_xp_real), .xp_img(b2_xp_img), .xq_real(b2_xq_real), .xq_img(b2_xq_img), .w_real(b2_wreal), .w_img(b2_img), .yp_real(b2_ypreal), .yp_img(b2_ypimg), .yq_real(b2_yqreal), .yq_img(b2_yqimg));
butterfly B3 (.xp_real(b3_xp_real), .xp_img(b3_xp_img), .xq_real(b3_xq_real), .xq_img(b3_xq_img), .w_real(b3_wreal), .w_img(b3_img), .yp_real(b3_ypreal), .yp_img(b3_ypimg), .yq_real(b3_yqreal), .yq_img(b3_yqimg));
// stage 3 use 4 butterfly
butterfly B4 (.xp_real(b4_xp_real), .xp_img(b4_xp_img), .xq_real(b4_xq_real), .xq_img(b4_xq_img), .w_real(b4_wreal), .w_img(b4_img), .yp_real(b4_ypreal), .yp_img(b4_ypimg), .yq_real(b4_yqreal), .yq_img(b4_yqimg));
butterfly B5 (.xp_real(b5_xp_real), .xp_img(b5_xp_img), .xq_real(b5_xq_real), .xq_img(b5_xq_img), .w_real(b5_wreal), .w_img(b5_img), .yp_real(b5_ypreal), .yp_img(b5_ypimg), .yq_real(b5_yqreal), .yq_img(b5_yqimg));
butterfly B6 (.xp_real(b6_xp_real), .xp_img(b6_xp_img), .xq_real(b6_xq_real), .xq_img(b6_xq_img), .w_real(b6_wreal), .w_img(b6_img), .yp_real(b6_ypreal), .yp_img(b6_ypimg), .yq_real(b6_yqreal), .yq_img(b6_yqimg));      
butterfly B7 (.xp_real(b7_xp_real), .xp_img(b7_xp_img), .xq_real(b7_xq_real), .xq_img(b7_xq_img), .w_real(b7_wreal), .w_img(b7_img), .yp_real(b7_ypreal), .yp_img(b7_ypimg), .yq_real(b7_yqreal), .yq_img(b7_yqimg));
// stage 4 use 8 butterfly
butterfly B8 (.xp_real(b8_xp_real), .xp_img(b8_xp_img), .xq_real(b8_xq_real), .xq_img(b8_xq_img), .w_real(b8_wreal), .w_img(b8_img), .yp_real(b8_ypreal), .yp_img(b8_ypimg), .yq_real(b8_yqreal), .yq_img(b8_yqimg));
butterfly B9 (.xp_real(b9_xp_real), .xp_img(b9_xp_img), .xq_real(b9_xq_real), .xq_img(b9_xq_img), .w_real(b9_wreal), .w_img(b9_img), .yp_real(b9_ypreal), .yp_img(b9_ypimg), .yq_real(b9_yqreal), .yq_img(b9_yqimg));
butterfly B10 (.xp_real(b10_xp_real), .xp_img(b10_xp_img), .xq_real(b10_xq_real), .xq_img(b10_xq_img), .w_real(b10_wreal), .w_img(b10_img), .yp_real(b10_ypreal), .yp_img(b10_ypimg), .yq_real(b10_yqreal), .yq_img(b10_yqimg));
butterfly B11 (.xp_real(b11_xp_real), .xp_img(b11_xp_img), .xq_real(b11_xq_real), .xq_img(b11_xq_img), .w_real(b11_wreal), .w_img(b11_img), .yp_real(b11_ypreal), .yp_img(b11_ypimg), .yq_real(b11_yqreal), .yq_img(b11_yqimg));
butterfly B12 (.xp_real(b12_xp_real), .xp_img(b12_xp_img), .xq_real(b12_xq_real), .xq_img(b12_xq_img), .w_real(b12_wreal), .w_img(b12_img), .yp_real(b12_ypreal), .yp_img(b12_ypimg), .yq_real(b12_yqreal), .yq_img(b12_yqimg));
butterfly B13 (.xp_real(b13_xp_real), .xp_img(b13_xp_img), .xq_real(b13_xq_real), .xq_img(b13_xq_img), .w_real(b13_wreal), .w_img(b13_img), .yp_real(b13_ypreal), .yp_img(b13_ypimg), .yq_real(b13_yqreal), .yq_img(b13_yqimg));
butterfly B14 (.xp_real(b14_xp_real), .xp_img(b14_xp_img), .xq_real(b14_xq_real), .xq_img(b14_xq_img), .w_real(b14_wreal), .w_img(b14_img), .yp_real(b14_ypreal), .yp_img(b14_ypimg), .yq_real(b14_yqreal), .yq_img(b14_yqimg));
butterfly B15 (.xp_real(b15_xp_real), .xp_img(b15_xp_img), .xq_real(b15_xq_real), .xq_img(b15_xq_img), .w_real(b15_wreal), .w_img(b15_img), .yp_real(b15_ypreal), .yp_img(b15_ypimg), .yq_real(b15_yqreal), .yq_img(b15_yqimg));
// stage 5 use 16 butterfly
butterfly B16 (.xp_real(b16_xp_real), .xp_img(b16_xp_img), .xq_real(b16_xq_real), .xq_img(b16_xq_img), .w_real(b16_wreal), .w_img(b16_img), .yp_real(b16_ypreal), .yp_img(b16_ypimg), .yq_real(b16_yqreal), .yq_img(b16_yqimg));
butterfly B17 (.xp_real(b17_xp_real), .xp_img(b17_xp_img), .xq_real(b17_xq_real), .xq_img(b17_xq_img), .w_real(b17_wreal), .w_img(b17_img), .yp_real(b17_ypreal), .yp_img(b17_ypimg), .yq_real(b17_yqreal), .yq_img(b17_yqimg));
butterfly B18 (.xp_real(b18_xp_real), .xp_img(b18_xp_img), .xq_real(b18_xq_real), .xq_img(b18_xq_img), .w_real(b18_wreal), .w_img(b18_img), .yp_real(b18_ypreal), .yp_img(b18_ypimg), .yq_real(b18_yqreal), .yq_img(b18_yqimg));
butterfly B19 (.xp_real(b19_xp_real), .xp_img(b19_xp_img), .xq_real(b19_xq_real), .xq_img(b19_xq_img), .w_real(b19_wreal), .w_img(b19_img), .yp_real(b19_ypreal), .yp_img(b19_ypimg), .yq_real(b19_yqreal), .yq_img(b19_yqimg));
butterfly B20 (.xp_real(b20_xp_real), .xp_img(b20_xp_img), .xq_real(b20_xq_real), .xq_img(b20_xq_img), .w_real(b20_wreal), .w_img(b20_img), .yp_real(b20_ypreal), .yp_img(b20_ypimg), .yq_real(b20_yqreal), .yq_img(b20_yqimg));
butterfly B21 (.xp_real(b21_xp_real), .xp_img(b21_xp_img), .xq_real(b21_xq_real), .xq_img(b21_xq_img), .w_real(b21_wreal), .w_img(b21_img), .yp_real(b21_ypreal), .yp_img(b21_ypimg), .yq_real(b21_yqreal), .yq_img(b21_yqimg));
butterfly B22 (.xp_real(b22_xp_real), .xp_img(b22_xp_img), .xq_real(b22_xq_real), .xq_img(b22_xq_img), .w_real(b22_wreal), .w_img(b22_img), .yp_real(b22_ypreal), .yp_img(b22_ypimg), .yq_real(b22_yqreal), .yq_img(b22_yqimg));
butterfly B23 (.xp_real(b23_xp_real), .xp_img(b23_xp_img), .xq_real(b23_xq_real), .xq_img(b23_xq_img), .w_real(b23_wreal), .w_img(b23_img), .yp_real(b23_ypreal), .yp_img(b23_ypimg), .yq_real(b23_yqreal), .yq_img(b23_yqimg));
butterfly B24 (.xp_real(b24_xp_real), .xp_img(b24_xp_img), .xq_real(b24_xq_real), .xq_img(b24_xq_img), .w_real(b24_wreal), .w_img(b24_img), .yp_real(b24_ypreal), .yp_img(b24_ypimg), .yq_real(b24_yqreal), .yq_img(b24_yqimg));
butterfly B25 (.xp_real(b25_xp_real), .xp_img(b25_xp_img), .xq_real(b25_xq_real), .xq_img(b25_xq_img), .w_real(b25_wreal), .w_img(b25_img), .yp_real(b25_ypreal), .yp_img(b25_ypimg), .yq_real(b25_yqreal), .yq_img(b25_yqimg));
butterfly B26 (.xp_real(b26_xp_real), .xp_img(b26_xp_img), .xq_real(b26_xq_real), .xq_img(b26_xq_img), .w_real(b26_wreal), .w_img(b26_img), .yp_real(b26_ypreal), .yp_img(b26_ypimg), .yq_real(b26_yqreal), .yq_img(b26_yqimg));
butterfly B27 (.xp_real(b27_xp_real), .xp_img(b27_xp_img), .xq_real(b27_xq_real), .xq_img(b27_xq_img), .w_real(b27_wreal), .w_img(b27_img), .yp_real(b27_ypreal), .yp_img(b27_ypimg), .yq_real(b27_yqreal), .yq_img(b27_yqimg));
butterfly B28 (.xp_real(b28_xp_real), .xp_img(b28_xp_img), .xq_real(b28_xq_real), .xq_img(b28_xq_img), .w_real(b28_wreal), .w_img(b28_img), .yp_real(b28_ypreal), .yp_img(b28_ypimg), .yq_real(b28_yqreal), .yq_img(b28_yqimg));
butterfly B29 (.xp_real(b29_xp_real), .xp_img(b29_xp_img), .xq_real(b29_xq_real), .xq_img(b29_xq_img), .w_real(b29_wreal), .w_img(b29_img), .yp_real(b29_ypreal), .yp_img(b29_ypimg), .yq_real(b29_yqreal), .yq_img(b29_yqimg));
butterfly B30 (.xp_real(b30_xp_real), .xp_img(b30_xp_img), .xq_real(b30_xq_real), .xq_img(b30_xq_img), .w_real(b30_wreal), .w_img(b30_img), .yp_real(b30_ypreal), .yp_img(b30_ypimg), .yq_real(b30_yqreal), .yq_img(b30_yqimg));
butterfly B31 (.xp_real(b31_xp_real), .xp_img(b31_xp_img), .xq_real(b31_xq_real), .xq_img(b31_xq_img), .w_real(b31_wreal), .w_img(b31_img), .yp_real(b31_ypreal), .yp_img(b31_ypimg), .yq_real(b31_yqreal), .yq_img(b31_yqimg));
// stage 6 use 32 butterfly
butterfly B32 (.xp_real(b32_xp_real), .xp_img(b32_xp_img), .xq_real(b32_xq_real), .xq_img(b32_xq_img), .w_real(b32_wreal), .w_img(b32_img), .yp_real(b32_ypreal), .yp_img(b32_ypimg), .yq_real(b32_yqreal), .yq_img(b32_yqimg));
butterfly B33 (.xp_real(b33_xp_real), .xp_img(b33_xp_img), .xq_real(b33_xq_real), .xq_img(b33_xq_img), .w_real(b33_wreal), .w_img(b33_img), .yp_real(b33_ypreal), .yp_img(b33_ypimg), .yq_real(b33_yqreal), .yq_img(b33_yqimg));
butterfly B34 (.xp_real(b34_xp_real), .xp_img(b34_xp_img), .xq_real(b34_xq_real), .xq_img(b34_xq_img), .w_real(b34_wreal), .w_img(b34_img), .yp_real(b34_ypreal), .yp_img(b34_ypimg), .yq_real(b34_yqreal), .yq_img(b34_yqimg));
butterfly B35 (.xp_real(b35_xp_real), .xp_img(b35_xp_img), .xq_real(b35_xq_real), .xq_img(b35_xq_img), .w_real(b35_wreal), .w_img(b35_img), .yp_real(b35_ypreal), .yp_img(b35_ypimg), .yq_real(b35_yqreal), .yq_img(b35_yqimg));
butterfly B36 (.xp_real(b36_xp_real), .xp_img(b36_xp_img), .xq_real(b36_xq_real), .xq_img(b36_xq_img), .w_real(b36_wreal), .w_img(b36_img), .yp_real(b36_ypreal), .yp_img(b36_ypimg), .yq_real(b36_yqreal), .yq_img(b36_yqimg));
butterfly B37 (.xp_real(b37_xp_real), .xp_img(b37_xp_img), .xq_real(b37_xq_real), .xq_img(b37_xq_img), .w_real(b37_wreal), .w_img(b37_img), .yp_real(b37_ypreal), .yp_img(b37_ypimg), .yq_real(b37_yqreal), .yq_img(b37_yqimg));
butterfly B38 (.xp_real(b38_xp_real), .xp_img(b38_xp_img), .xq_real(b38_xq_real), .xq_img(b38_xq_img), .w_real(b38_wreal), .w_img(b38_img), .yp_real(b38_ypreal), .yp_img(b38_ypimg), .yq_real(b38_yqreal), .yq_img(b38_yqimg));
butterfly B39 (.xp_real(b39_xp_real), .xp_img(b39_xp_img), .xq_real(b39_xq_real), .xq_img(b39_xq_img), .w_real(b39_wreal), .w_img(b39_img), .yp_real(b39_ypreal), .yp_img(b39_ypimg), .yq_real(b39_yqreal), .yq_img(b39_yqimg));
butterfly B40 (.xp_real(b40_xp_real), .xp_img(b40_xp_img), .xq_real(b40_xq_real), .xq_img(b40_xq_img), .w_real(b40_wreal), .w_img(b40_img), .yp_real(b40_ypreal), .yp_img(b40_ypimg), .yq_real(b40_yqreal), .yq_img(b40_yqimg));
butterfly B41 (.xp_real(b41_xp_real), .xp_img(b41_xp_img), .xq_real(b41_xq_real), .xq_img(b41_xq_img), .w_real(b41_wreal), .w_img(b41_img), .yp_real(b41_ypreal), .yp_img(b41_ypimg), .yq_real(b41_yqreal), .yq_img(b41_yqimg));
butterfly B42 (.xp_real(b42_xp_real), .xp_img(b42_xp_img), .xq_real(b42_xq_real), .xq_img(b42_xq_img), .w_real(b42_wreal), .w_img(b42_img), .yp_real(b42_ypreal), .yp_img(b42_ypimg), .yq_real(b42_yqreal), .yq_img(b42_yqimg));
butterfly B43 (.xp_real(b43_xp_real), .xp_img(b43_xp_img), .xq_real(b43_xq_real), .xq_img(b43_xq_img), .w_real(b43_wreal), .w_img(b43_img), .yp_real(b43_ypreal), .yp_img(b43_ypimg), .yq_real(b43_yqreal), .yq_img(b43_yqimg));
butterfly B44 (.xp_real(b44_xp_real), .xp_img(b44_xp_img), .xq_real(b44_xq_real), .xq_img(b44_xq_img), .w_real(b44_wreal), .w_img(b44_img), .yp_real(b44_ypreal), .yp_img(b44_ypimg), .yq_real(b44_yqreal), .yq_img(b44_yqimg));
butterfly B45 (.xp_real(b45_xp_real), .xp_img(b45_xp_img), .xq_real(b45_xq_real), .xq_img(b45_xq_img), .w_real(b45_wreal), .w_img(b45_img), .yp_real(b45_ypreal), .yp_img(b45_ypimg), .yq_real(b45_yqreal), .yq_img(b45_yqimg));
butterfly B46 (.xp_real(b46_xp_real), .xp_img(b46_xp_img), .xq_real(b46_xq_real), .xq_img(b46_xq_img), .w_real(b46_wreal), .w_img(b46_img), .yp_real(b46_ypreal), .yp_img(b46_ypimg), .yq_real(b46_yqreal), .yq_img(b46_yqimg));
butterfly B47 (.xp_real(b47_xp_real), .xp_img(b47_xp_img), .xq_real(b47_xq_real), .xq_img(b47_xq_img), .w_real(b47_wreal), .w_img(b47_img), .yp_real(b47_ypreal), .yp_img(b47_ypimg), .yq_real(b47_yqreal), .yq_img(b47_yqimg));
butterfly B48 (.xp_real(b48_xp_real), .xp_img(b48_xp_img), .xq_real(b48_xq_real), .xq_img(b48_xq_img), .w_real(b48_wreal), .w_img(b48_img), .yp_real(b48_ypreal), .yp_img(b48_ypimg), .yq_real(b48_yqreal), .yq_img(b48_yqimg));
butterfly B49 (.xp_real(b49_xp_real), .xp_img(b49_xp_img), .xq_real(b49_xq_real), .xq_img(b49_xq_img), .w_real(b49_wreal), .w_img(b49_img), .yp_real(b49_ypreal), .yp_img(b49_ypimg), .yq_real(b49_yqreal), .yq_img(b49_yqimg));
butterfly B50 (.xp_real(b50_xp_real), .xp_img(b50_xp_img), .xq_real(b50_xq_real), .xq_img(b50_xq_img), .w_real(b50_wreal), .w_img(b50_img), .yp_real(b50_ypreal), .yp_img(b50_ypimg), .yq_real(b50_yqreal), .yq_img(b50_yqimg));
butterfly B51 (.xp_real(b51_xp_real), .xp_img(b51_xp_img), .xq_real(b51_xq_real), .xq_img(b51_xq_img), .w_real(b51_wreal), .w_img(b51_img), .yp_real(b51_ypreal), .yp_img(b51_ypimg), .yq_real(b51_yqreal), .yq_img(b51_yqimg));
butterfly B52 (.xp_real(b52_xp_real), .xp_img(b52_xp_img), .xq_real(b52_xq_real), .xq_img(b52_xq_img), .w_real(b52_wreal), .w_img(b52_img), .yp_real(b52_ypreal), .yp_img(b52_ypimg), .yq_real(b52_yqreal), .yq_img(b52_yqimg));
butterfly B53 (.xp_real(b53_xp_real), .xp_img(b53_xp_img), .xq_real(b53_xq_real), .xq_img(b53_xq_img), .w_real(b53_wreal), .w_img(b53_img), .yp_real(b53_ypreal), .yp_img(b53_ypimg), .yq_real(b53_yqreal), .yq_img(b53_yqimg));
butterfly B54 (.xp_real(b54_xp_real), .xp_img(b54_xp_img), .xq_real(b54_xq_real), .xq_img(b54_xq_img), .w_real(b54_wreal), .w_img(b54_img), .yp_real(b54_ypreal), .yp_img(b54_ypimg), .yq_real(b54_yqreal), .yq_img(b54_yqimg));
butterfly B55 (.xp_real(b55_xp_real), .xp_img(b55_xp_img), .xq_real(b55_xq_real), .xq_img(b55_xq_img), .w_real(b55_wreal), .w_img(b55_img), .yp_real(b55_ypreal), .yp_img(b55_ypimg), .yq_real(b55_yqreal), .yq_img(b55_yqimg));
butterfly B56 (.xp_real(b56_xp_real), .xp_img(b56_xp_img), .xq_real(b56_xq_real), .xq_img(b56_xq_img), .w_real(b56_wreal), .w_img(b56_img), .yp_real(b56_ypreal), .yp_img(b56_ypimg), .yq_real(b56_yqreal), .yq_img(b56_yqimg));
butterfly B57 (.xp_real(b57_xp_real), .xp_img(b57_xp_img), .xq_real(b57_xq_real), .xq_img(b57_xq_img), .w_real(b57_wreal), .w_img(b57_img), .yp_real(b57_ypreal), .yp_img(b57_ypimg), .yq_real(b57_yqreal), .yq_img(b57_yqimg));
butterfly B58 (.xp_real(b58_xp_real), .xp_img(b58_xp_img), .xq_real(b58_xq_real), .xq_img(b58_xq_img), .w_real(b58_wreal), .w_img(b58_img), .yp_real(b58_ypreal), .yp_img(b58_ypimg), .yq_real(b58_yqreal), .yq_img(b58_yqimg));
butterfly B59 (.xp_real(b59_xp_real), .xp_img(b59_xp_img), .xq_real(b59_xq_real), .xq_img(b59_xq_img), .w_real(b59_wreal), .w_img(b59_img), .yp_real(b59_ypreal), .yp_img(b59_ypimg), .yq_real(b59_yqreal), .yq_img(b59_yqimg));
butterfly B60 (.xp_real(b60_xp_real), .xp_img(b60_xp_img), .xq_real(b60_xq_real), .xq_img(b60_xq_img), .w_real(b60_wreal), .w_img(b60_img), .yp_real(b60_ypreal), .yp_img(b60_ypimg), .yq_real(b60_yqreal), .yq_img(b60_yqimg));
butterfly B61 (.xp_real(b61_xp_real), .xp_img(b61_xp_img), .xq_real(b61_xq_real), .xq_img(b61_xq_img), .w_real(b61_wreal), .w_img(b61_img), .yp_real(b61_ypreal), .yp_img(b61_ypimg), .yq_real(b61_yqreal), .yq_img(b61_yqimg));
butterfly B62 (.xp_real(b62_xp_real), .xp_img(b62_xp_img), .xq_real(b62_xq_real), .xq_img(b62_xq_img), .w_real(b62_wreal), .w_img(b62_img), .yp_real(b62_ypreal), .yp_img(b62_ypimg), .yq_real(b62_yqreal), .yq_img(b62_yqimg));
butterfly B63 (.xp_real(b63_xp_real), .xp_img(b63_xp_img), .xq_real(b63_xq_real), .xq_img(b63_xq_img), .w_real(b63_wreal), .w_img(b63_img), .yp_real(b63_ypreal), .yp_img(b63_ypimg), .yq_real(b63_yqreal), .yq_img(b63_yqimg));


always @(posedge clk) begin
    if (!rst_n) begin
        in_cnt <= 0;
    end
    else begin
        if (in_valid)  in_cnt <= in_cnt + 1;
    end
end
always @(posedge clk) begin
    if (!rst_n) begin
        cnt <= 0;
    end
    else begin
        if (in_valid || in_cnt != 0) begin
            cnt <= cnt + 1;
        end
        else if (cur_state == IDLE) begin
            cnt <= 0;
        end
    end
end


endmodule



/**************** butterfly unit *************************
Xm(p) ------------------------> Xm+1(p)
           -        ->
             -    -
                -
              -   -
            -        ->
Xm(q) ------------------------> Xm+1(q)
      Wn          -1
*//////////////////////////////////////////////////////
module butterfly #(parameter integer SHIFT = 13  // twiddle 放大的位數，預設 2^13，跟 0x2000 一樣
)(
    input  signed [15:0] xp_real,
    input  signed [15:0] xp_img,
    input  signed [15:0] xq_real,
    input  signed [15:0] xq_img,
    // twiddle factor: 實際 W 被存成 factor ≈ W * 2^SHIFT
    input  signed [15:0] w_real,
    input  signed [15:0] w_img,

    output signed [15:0] yp_real,
    output signed [15:0] yp_img,
    output signed [15:0] yq_real,
    output signed [15:0] yq_img
);

    // --------------------------------------------------------
    // 1) xq * W：用「放大過的 twiddle」
    //    xq: 16-bit，w: 16-bit (W * 2^SHIFT) → 32-bit 中間結果
    //    這些值代表的是 xq * W * 2^SHIFT
    // --------------------------------------------------------
    wire signed [31:0] xq_w_real0 = xq_real * w_real;
    wire signed [31:0] xq_w_real1 = xq_img  * w_img;
    wire signed [31:0] xq_w_imag0 = xq_real * w_img;
    wire signed [31:0] xq_w_imag1 = xq_img  * w_real;

    // Re(xq * W * 2^SHIFT)，Im(xq * W * 2^SHIFT)
    wire signed [31:0] xq_w_real = xq_w_real0 - xq_w_real1;
    wire signed [31:0] xq_w_imag = xq_w_imag0 + xq_w_imag1;

    // --------------------------------------------------------
    // 2) xp 也乘上 2^SHIFT，把 scale 對齊到「* 2^SHIFT」
    //    先 sign-extend 再 shift
    // --------------------------------------------------------
    wire signed [31:0] xp_real_scaled =
        {{(32-16){xp_real[15]}}, xp_real} <<< SHIFT;  // xp * 2^SHIFT
    wire signed [31:0] xp_img_scaled  =
        {{(32-16){xp_img[15]}},  xp_img } <<< SHIFT;  // xp * 2^SHIFT

    // --------------------------------------------------------
    // 3) butterfly：
    //    yp = xp + xq * W
    //    yq = xp - xq * W
    //    此時結果代表 (xp ± xq*W) * 2^SHIFT
    // --------------------------------------------------------
    wire signed [31:0] yp_real_scaled = xp_real_scaled + xq_w_real;
    wire signed [31:0] yp_img_scaled  = xp_img_scaled  + xq_w_imag;
    wire signed [31:0] yq_real_scaled = xp_real_scaled - xq_w_real;
    wire signed [31:0] yq_img_scaled  = xp_img_scaled  - xq_w_imag;

    // --------------------------------------------------------
    // 4) 丟掉低 SHIFT bits：除以 2^SHIFT
    //    回到和輸入一樣的 Q1.15 scale（16-bit）
    //    取 [SHIFT+15 : SHIFT]，跟他那個 [39], [36:13] 的概念一樣
    // --------------------------------------------------------
    assign yp_real = yp_real_scaled[SHIFT+15 : SHIFT];
    assign yp_img  = yp_img_scaled [SHIFT+15 : SHIFT];
    assign yq_real = yq_real_scaled[SHIFT+15 : SHIFT];
    assign yq_img  = yq_img_scaled [SHIFT+15 : SHIFT];

endmodule



/*
always @(posedge clk) begin
    if (!rst_n) begin
        xqreal_wreal <= 0;
    end
    else begin
        xqreal_wreal <= xq_real * w_real;
    end
end
always @(posedge clk) begin
    if (!rst_n) begin
        xqimg_wimg <= 0;
    end
    else begin
        xqimg_wimg <= xq_img * w_img;
    end
end
always @(posedge clk) begin
    if (!rst_n) begin
        xqimg_wreal <= 0;
    end
    else begin
        xqimg_wreal <= xq_img * w_real;
    end
end
always @(posedge clk) begin
    if (!rst_n) begin
        xqreal_wimg <= 0;
    end
    else begin
        xqreal_wimg <= xq_real * w_img;
    end
end
*/