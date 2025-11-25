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

assign in_valid_fft = in_valid;
assign clk_fft = clk;
assign rst_n_fft = rst_n;

reg [15:0] out_reg_real_fft [0:255];
reg [15:0] out_reg_img_fft [0:255];
reg [7:0] out_cnt_fft;

localparam [1:0]
  IDLE    ='d0,
  FFT ='d1,
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
        IDLE: if (in_valid) nxt_state = FFT;
        FFT: if (out_cnt_fft == 255) nxt_state = DIVIDE;
        DIVIDE: if (out_cnt == 0 && cnt == 511) nxt_state = IDLE;
    endcase
end

always @(posedge clk) begin
    if (!rst_n) begin
        out_cnt_fft <= 0;
    end
    else begin
        if (out_valid_fft) begin
            out_cnt_fft <= out_cnt_fft + 1;
        end
        else if (cur_state == IDLE) begin
            out_cnt_fft <= 0;
        end
    end
end

FFT_256 fft_256(
    .clk(clk_fft),
    .rst_n(rst_n_fft),
    .in_valid(in_valid_fft),
    .x_real(in_xp_real),
    .x_img(in_xp_img),
    .y_real(out_yp_real),
    .y_img(out_yp_img),
    .out_valid(out_valid_fft)
);
always @(posedge clk) begin
    if (out_valid_fft) begin
        
    end
end
endmodule