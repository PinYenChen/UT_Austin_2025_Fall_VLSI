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
input signed [15:0] delta_real, delta_img;
output wire signed [15:0] y_real, y_img;
output wire out_valid;

integer i;

reg [15:0] delta_real_reg[0:255];
reg [15:0] delta_img_reg[0:255];
reg [7:0] in_cnt;
reg out_valid_fft_delay;

wire clk_fft, rst_n_fft, in_valid_fft, out_valid_fft;
wire signed [15:0] in_xp_real, out_yp_real, out_yp_img;

reg in_valid_ifft, out_valid_ifft;
reg signed [15:0] in_xp_real_ifft, in_xp_img_ifft, out_yp_real_ifft, out_yp_img_ifft;

reg [15:0] multa_real, multb_real;
reg [15:0] multa_img, multb_img;
reg [7:0] mult_cnt;
wire [15:0] mulres_real, mulres_img;

reg [10:0] cnt;
always @(posedge clk) begin
    if (!rst_n) begin
        cnt <= 0;
    end
    else begin
        if (in_valid || cnt != 0) begin
            cnt <= cnt + 1;
        end
        else if (out_valid) begin
            cnt <= 0;
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

// ================================================
// 1) FFT + 3
// ================================================
assign clk_fft = clk;
assign rst_n_fft = rst_n;
wire in_valid_ifft_wire;
assign in_valid_ifft_wire = in_valid_ifft;

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
assign in_valid_fft = (cnt < 256)? in_valid : in_valid_ifft_wire;
assign in_xp_real = (cnt < 256)? x_real : in_xp_real_ifft;
assign in_xp_img = (cnt < 256)?  0: -in_xp_img_ifft;

// ================================================
// 2) MULT
// ================================================
reg [15:0] buffer_img[0:255], buffer_real[0:255];
reg [7:0] out_fft_cnt;
always @(posedge clk) begin
    if (!rst_n) begin
        out_fft_cnt <= 0;
    end
    else if (out_valid_fft && cnt < 535) begin
        out_fft_cnt <= out_fft_cnt + 1;
    end
    else begin
        out_fft_cnt <= 0;
    end
end
always @(posedge clk) begin
    if (out_valid_fft && cnt < 535) begin
        buffer_real[out_fft_cnt] <= out_yp_real;
        buffer_img[out_fft_cnt] <= out_yp_img;
    end   
end
always @(posedge clk) begin
    if (cnt > 534) begin
        multa_real <= buffer_real[mult_cnt];
        multa_img <= buffer_img[mult_cnt];
    end
    else begin
        multa_real <= 0;
        multa_img <= 0;        
    end
end
always @(posedge clk) begin
    if (cnt > 534) begin
        multb_real <= delta_real_reg[mult_cnt];
        multb_img <= delta_img_reg[mult_cnt];
    end
    else begin
        multb_real <= 0;
        multb_img <= 0;        
    end
end
always @(posedge clk) begin
    if (!rst_n) begin
        mult_cnt <= 0;
    end
    else begin
        if (cnt > 534) begin
            mult_cnt <= mult_cnt + 1;
        end
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

always @(*) begin
    if (cnt > 535 && cnt < 792) in_valid_ifft = 1;
    else in_valid_ifft = 0;
end
always @(posedge clk) begin
    if (cnt > 534 && cnt < 791) begin
        in_xp_real_ifft <= mulres_real;
        in_xp_img_ifft <= mulres_img;
    end
    else begin
        in_xp_real_ifft <= 0;
        in_xp_img_ifft <= 0;        
    end
end
// ================================================
// 3) IFFT module
/*
IFFT_256_lat ifft_256_lat(
    .clk(clk_fft),
    .rst_n(rst_n_fft),
    .in_valid(in_valid_ifft),
    .x_real(in_xp_real_ifft),
    .x_img(in_xp_img_ifft),
    .y_real(out_yp_real_ifft),
    .y_img(out_yp_img_ifft),
    .out_valid(out_valid_ifft)
);
*/
// ================================================
// fft_signal

reg signed [15:0] out_reg_real_fft;
reg signed [15:0] out_reg_img_fft;

// ========================================
// 3. Conjugate 
// ========================================
always @(posedge clk) begin
    if (out_valid_fft && cnt > 535) begin
        out_reg_real_fft <= (out_yp_real);
        out_reg_img_fft <= (-out_yp_img);
    end
end
reg out_valid_delay;
always @(posedge clk) begin
    if (cnt > 535) out_valid_delay <= out_valid_fft;
end
// ========================================
// Output
// ========================================
always @(posedge clk) begin
    if (!rst_n) begin
        out_valid_ifft <= 0;
    end
    else begin
        if (out_valid_delay && cnt > 536) begin
            out_valid_ifft <= 1;
        end
        else begin
            out_valid_ifft <= 0;
        end
    end
end
always @(posedge clk) begin
    if (!rst_n) begin
        out_yp_real_ifft <= 0;
        out_yp_img_ifft <= 0;
    end
    else begin
        if (out_valid_delay && cnt > 536) begin
            out_yp_real_ifft <= out_reg_real_fft >>> 8;
            out_yp_img_ifft <= out_reg_img_fft >>> 8;            
        end
        else begin
            out_yp_real_ifft <= 0;
            out_yp_img_ifft <= 0;            
        end
    end
end

assign out_valid = out_valid_ifft;
assign y_real = out_yp_real_ifft;
assign y_img = out_yp_img_ifft;
endmodule


module MULT (
    multa_real, 
    multa_img,  // P_fft
    multb_real, 
    multb_img,  // Delta_fft
    mulres_real_15, 
    mulres_img_15
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