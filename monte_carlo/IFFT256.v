//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright 
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   VLSI 2025 Fall
//   Exercise		: IFFT-256
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : IFFT256.v
//   Module Name : IFFT256
//   Release version : V1.0 (Release Date: 2025-11)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

// ==============================================
// Conjugate ==> FFT256 ==> Conjugate ==> >>8
// ==============================================
module IFFT_256(
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
output reg signed [15:0] y_real, y_img;
output reg out_valid;

// fft_signal
wire in_valid_fft, clk_fft, rst_n_fft;
wire signed [15:0] in_xp_real, in_xp_img;
wire signed [15:0] out_yp_real, out_yp_img;
wire out_valid_fft;

reg signed [15:0] out_reg_real_fft;
reg signed [15:0] out_reg_img_fft;
//reg [7:0] out_cnt_fft;
/*
localparam
  IDLE    ='d0,
  CAL ='d1,
  DIVIDE = 'd2;

reg cur_state, nxt_state;
always @(posedge clk) begin
    if (!rst_n) begin
        cur_state <= IDLE;
    end
    else cur_state <= nxt_state;
end
always @(*) begin
    nxt_state = cur_state;
    case(cur_state) 
        IDLE: if (in_valid) nxt_state = CAL;
        CAL: if (out_cnt_fft == 255) nxt_state = IDLE;
    endcase
end
*/
assign in_valid_fft = in_valid;
assign clk_fft = clk;
assign rst_n_fft = rst_n;

// ========================================
// 1. Conjugate
// ========================================
assign in_xp_real = x_real;
assign in_xp_img = -x_img;

// ========================================
// 3. Conjugate 
// ========================================
always @(posedge clk) begin
    if (out_valid_fft) begin
        out_reg_real_fft <= (out_yp_real);
        out_reg_img_fft <= (-out_yp_img);
    end
end
reg out_valid_delay;
always @(posedge clk) begin
    out_valid_delay <= out_valid_fft;
end
// ========================================
// Output
// ========================================
always @(posedge clk) begin
    if (!rst_n) begin
        out_valid <= 0;
    end
    else begin
        if (out_valid_delay) begin
            out_valid <= 1;
        end
        else begin
            out_valid <= 0;
        end
    end
end
always @(posedge clk) begin
    if (!rst_n) begin
        y_real <= 0;
        y_img <= 0;
    end
    else begin
        if (out_valid_delay) begin
            y_real <= out_reg_real_fft >>> 8;
            y_img <= out_reg_img_fft >>> 8;            
        end
        else begin
            y_real <= 0;
            y_img <= 0;            
        end
    end
end

FFT_256_ifft fft_256_ifft(
    .clk(clk_fft),
    .rst_n(rst_n_fft),
    .in_valid(in_valid_fft),
    .x_real(in_xp_real),
    .x_img(in_xp_img),
    .y_real(out_yp_real),
    .y_img(out_yp_img),
    .out_valid(out_valid_fft)
);
endmodule