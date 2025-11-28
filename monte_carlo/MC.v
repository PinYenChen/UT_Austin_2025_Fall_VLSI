//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright 
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   VLSI 2025 Fall
//   Exercise		: Monte-Carlo
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : MC.v
//   Module Name : MC
//   Release version : V1.0 (Release Date: 2025-11)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################



module MC(
    clk,
    rst_n,
    in_valid,
    x_real,
    //x_img,
    delta_real,
    delta_img,
    y_real,
    y_img,
    out_valid
);
input clk, rst_n, in_valid;
input signed [15:0] x_real; // x_img;
output reg signed [15:0] y_real, y_img;
output reg out_valid;


integer i;

reg [15:0] delta_real_reg[0:255];
reg [15:0] delta_img_reg[0:255];
reg [7:0] in_cnt;
reg [15:0] multa_real, multb_real;
reg [15:0] multa_img, multb_img;
reg [7:0] mult_cnt;
wire [15:0] mulres_real, mulres,img;

always @(posedge clk) begin
    if (!rst_n) begin
        mult_cnt <= 0;
    end
    else begin
        if (out_valid_fft) begin
            mult_cnt <= mult_cnt + 1;
        end
    end
end

always @(posedge clk) begin
    if (!rst_n) begin
        for (i = 0 ; i < 256 ; i = i +1 ) begin
            delta_real_reg[i] <= 0;
            delta_img_reg[i] <= 0;
        end
    end
    else begin
        if (in_valid) begin
            delta_real_reg[in_cnt] <= delta_real;
            delta_img_reg[in_cnt] <= delta_img;
        end
    end
end

always @(posedge clk) begin
    if (!rst_n) begin
        in_cnt <= 0;
    end
    else begin
        if (in_valid) begin
            in_cnt <= in_cnt + 1;
        end
    end
end

wire clk_fft, rst_n_fft, in_valid_fft;
assign clk_fft = clk;
assign rst_n_fft = rst_n;
assign in_valid_fft = in_valid;
assign in_xp_real = x_real;

// ================================================
// 1) FFT
// ================================================
FFT_256 fft_256(
    .clk(clk_fft),
    .rst_n(rst_n_fft),
    .in_valid(in_valid_fft),
    .x_real(in_xp_real),
    .y_real(out_yp_real),
    .y_img(out_yp_img),
    .out_valid(out_valid_fft)
);

// ================================================
// 2) MULT
// ================================================
always @(posedge clk) begin
    if (out_valid_fft) begin
        multa_real <= out_yp_real;
        multa_img <= out_yp_img;
    end
end
always @(posedge clk) begin
    if (out_valid_fft) begin
        multb_real <= delta_real_reg[mult_cnt];
        mult_b_img <= delta_img_reg[mult_cnt];
    end
end
MULT mul (    
    .multa_real(multa_real), 
    .multa_img(multa_img),  // P_fft
    .multb_real(multb_real), 
    .multb_img(multb_img),  // Delta_fft
    .mulres_real_15(mulres_real), 
    .mulres_img_15(mulres_img));

// ================================================
// 3) IFFT
// ================================================




endmodule

module MULT (
    multa_real, 
    multa_img,  // P_fft
    multb_real, 
    multb_img,  // Delta_fft
    mulres_real_15, 
    mulres_img_15;
);

input signed [15:0] multa_real, multa_img;  // P_fft
input signed [15:0] multb_real, multb_img;  // Delta_fft
output signed [15:0] mulres_real_15, mulres_img_15;

wire signed [31:0] real_real, img_img, real_img, img_real;
wire signed [31:0] mulres_real_30, mulres_img_30;

assign real_real = multa_real * multb_real;  // Q2.30
assign img_img = multa_img * multb_img;  // Q2.30
assign real_img = multa_real * multb_img;  // Q2.30
assign img_real = multa_img * multb_real;  // Q2.30

assign mulres_real_30 = real_real - img_img;     // Q2.30
assign mulres_img_30 = real_img + img_real;     // Q2.30

assign mulres_real_15 = mulres_real_30 >>> 15;
assign mulres_img_15 = mulres_img_30 >>> 15;

endmodule