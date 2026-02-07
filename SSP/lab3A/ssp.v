module my_ssp(
    PCLK,
    CLEAR_B,
    PSEL,
    PWRITE,
    PWDATA,
    SSPCLKIN,
    SSPFSSIN,
    SSPRXD,
    PRDATA, 
    SSPOE_B, 
    SSPTXD, 
    SSPCLKOUT, 
    SSPFSSOUT, 
    SSPTXINTR, 
    SSPRXINTR
);

input PCLK;
input CLEAR_B; //reset signal synchronous
input PSEL; //1: can write into Tfifo or read from PRDATA
input PWRITE; //fifo's write/read, 1: write, 0:read
input [7:0] PWDATA; //Tfifo
input SSPCLKIN; //Rfifo
input SSPFSSIN; //Rfifo
input SSPRXD; //Rfifo
output wire [7:0] PRDATA;
output reg SSPOE_B;
output reg SSPTXD;
output wire SSPCLKOUT; 
output reg SSPFSSOUT; 
output wire SSPTXINTR; 
output wire SSPRXINTR;

wire [2:0] rptr_t;
wire [2:0] wptr_t;
reg sspclk_div;
always @(posedge PCLK) begin
    if (!CLEAR_B)
        sspclk_div <= 1'b0;
    else
        sspclk_div <= ~sspclk_div;
end
assign SSPCLKOUT = sspclk_div;

wire [7:0] TXDATA;
reg [2:0] out_cnt, out_cnt_ns;
reg [7:0] out_reg;
reg [7:0] out_reg_ns;
reg [7:0] in_reg;
reg [2:0] in_cnt;
// ============================= Transmitter Logic ============================
//typedef enum reg [1:0]{TX_IDLE = 0, TX_PREPARE = 1, TX_SEND = 2}state;
//state cur_state_tx, nxt_state_tx;
localparam [1:0]
  TX_IDLE    = 2'd0,
  TX_PREPARE = 2'd1,
  TX_SEND    = 2'd2;

reg [1:0] cur_state_tx, nxt_state_tx;
wire empty_tx;
assign empty_tx = (wptr_t == rptr_t);
reg finish_reg;
wire finish;
/*
reg [1:0] clr_sync_tx;
always @(posedge SSPCLKOUT) clr_sync_tx <= {clr_sync_tx[0], CLEAR_B};
wire clear_b_sync_tx = clr_sync_tx[1];
*/

always @(posedge PCLK) begin
    if (!CLEAR_B) begin //PCLK && 
        cur_state_tx <= TX_IDLE;
    end
    /*
    else if (PCLK && !SSPCLKOUT) begin
        cur_state_tx <= cur_state_tx;
    end
    */
    else if (!SSPCLKOUT) begin
        cur_state_tx <= nxt_state_tx;
    end

end
reg delay_poe;
always @(posedge SSPCLKOUT) begin
    if (out_cnt == 0 && cur_state_tx == TX_SEND) begin
        delay_poe <= 1;
    end
    else begin
        delay_poe <= 0;
    end
end
always @(*) begin
    case(cur_state_tx) 
        TX_IDLE: begin
            if (!empty_tx) begin
                nxt_state_tx = TX_PREPARE;
            end
            else begin
                nxt_state_tx = cur_state_tx;
            end
        end
        TX_PREPARE: begin
            nxt_state_tx = TX_SEND;
        end
        TX_SEND: begin
            if (out_cnt == 0 && !empty_tx) begin
                nxt_state_tx = TX_PREPARE;
            end
            else if (empty_tx && delay_poe) begin
                nxt_state_tx = TX_IDLE;
            end
            /*
            else if (out_cnt == 1 && !empty_tx) begin
                nxt_state_tx = TX_PREPARE;
            end
            */
            else begin
                nxt_state_tx = cur_state_tx;
            end
        end
        default: nxt_state_tx = cur_state_tx;
    endcase
end
always @(posedge SSPCLKOUT) begin
    if (cur_state_tx == TX_IDLE) begin
        out_cnt <= 7;
    end
    else if (cur_state_tx == TX_SEND || out_cnt == 1 || out_cnt == 0)begin
        out_cnt <= out_cnt - 1;
    end
    else begin
        out_cnt <= out_cnt;
    end
end
always @(posedge SSPCLKOUT) begin
    if (nxt_state_tx == TX_PREPARE) begin
        SSPFSSOUT <= 1;
    end
    else begin
        SSPFSSOUT <= 0;
    end
end
reg SSPTXD_ns;
always @(posedge SSPCLKOUT) begin
    /*
    if (cur_state_tx == TX_PREPARE) begin
        SSPTXD <= TXDATA[7];
    end
    else if (cur_state_tx == TX_SEND || out_cnt == 0) begin
        SSPTXD <= out_reg[out_cnt];
    end
    else begin
        SSPTXD <= 0;
    end
    */
    SSPTXD <= SSPTXD_ns;
end
reg [7:0] TXDATA_delay;
reg [7:0] TXDATA_delay2;
always @(*) begin
    if (cur_state_tx == TX_PREPARE) begin
        SSPTXD_ns = out_reg_ns[7];
    end
    /*
    else if (cur_state_tx == TX_SEND && (out_cnt == 1 || out_cnt == 0 ))begin
        SSPTXD_ns = TXDATA_delay[out_cnt];
    end
    */
    else if (cur_state_tx == TX_SEND && nxt_state_tx != TX_IDLE) begin
        SSPTXD_ns = out_reg[out_cnt];
    end

    else begin
        SSPTXD_ns = 0;
    end    
end
always @(posedge SSPCLKOUT) begin
    /*
    if (cur_state_tx == TX_IDLE && !empty_tx && !PSEL) begin
        out_reg <= TXDATA;
    end
    else if (cur_state_tx == TX_PREPARE && !empty_tx && !PSEL) begin
        out_reg <= TXDATA;
    end
    
    else begin
        out_reg <= 0;
    end
    */
    out_reg <= out_reg_ns;
end
reg empty_tx_delay, empty_tx_delay_ns, empty_tx_delay2;
always @(posedge PCLK) begin
    empty_tx_delay <= empty_tx_delay_ns;
end
always @(*) begin
    empty_tx_delay_ns = empty_tx;
end
always @(posedge PCLK) begin
    empty_tx_delay2 <= empty_tx_delay;
end
/*
always @(posedge PCLK) begin
    if (cur_state_tx == TX_SEND && out_cnt == 4) begin
        TXDATA_delay <= TXDATA;
    end
    else if (cur_state_tx == TX_IDLE) begin
        TXDATA_delay <= TXDATA;
    end
    else begin
        TXDATA_delay <= TXDATA_delay;
    end
    
end
always @(posedge PCLK) begin
    TXDATA_delay2 <= TXDATA_delay;
end
*/
always @(*) begin
    /*
    if (cur_state_tx == TX_IDLE && !empty_tx) begin
        out_reg_ns = TXDATA;
    end
    else 
    */
    if (cur_state_tx == TX_PREPARE && !empty_tx_delay2 && out_cnt == 7) begin
        out_reg_ns = TXDATA;
    end
    else if (cur_state_tx == TX_SEND && !finish) begin
        out_reg_ns = out_reg;
    end
    else if (cur_state_tx == TX_SEND && finish) begin
        out_reg_ns = TXDATA; // the next data
    end
    else if (cur_state_tx == TX_PREPARE && out_cnt == 7) begin
        out_reg_ns = out_reg;
    end
    else begin
        out_reg_ns = 0;
    end
    
end
reg rd_en;
wire rd_en_wire;
always @(posedge PCLK) begin
    if (!CLEAR_B) begin
        rd_en <= 0;
    end
    else begin 
        if (cur_state_tx == TX_PREPARE && rd_en) begin
            rd_en <= 0;
        end
        else if (cur_state_tx == TX_SEND && out_cnt == 0 && nxt_state_tx == TX_PREPARE) begin
            rd_en <= 1;
        end
        else if (cur_state_tx == TX_IDLE && !rd_en) begin
            rd_en <= 1;
        end
        else if (cur_state_tx == TX_SEND) begin
            rd_en <= 0;
        end
    end
end
assign rd_en_wire = rd_en;
reg SSPOE_B_ns;
always @(negedge SSPCLKOUT) begin
    /*
    if (nxt_state_tx == TX_PREPARE || nxt_state_tx == TX_SEND || out_cnt == 0) begin
        SSPOE_B <= 0;
    end
    else begin
        SSPOE_B <= 1;
    end
    */
    SSPOE_B <= SSPOE_B_ns;
end
always @(*) begin
    if (cur_state_tx == TX_PREPARE || cur_state_tx == TX_SEND) begin
        SSPOE_B_ns = 0;
    end
    else begin
        SSPOE_B_ns = 1;
    end
end

always @(posedge PCLK) begin
    if (nxt_state_tx == TX_PREPARE && !finish) begin //cur_state_tx == TX_SEND && out_cnt == 2 &&
        finish_reg <= 1;
    end
    else begin
        finish_reg <= 0;
    end
end

assign finish = finish_reg;
/*
always @(posedge SSPCLKOUT) begin
    if (!CLEAR_B) begin
        out_cnt <= 7;
    end
    else begin
        out_cnt <= out_cnt_ns;
    end
end
always @(*) begin
    if (SSPFSSOUT) begin
        out_cnt_ns = out_cnt - 1;
    end
    else begin
        out_cnt_ns = out_cnt;
    end
end
always @(posedge SSPCLKOUT) begin
    if (!CLEAR_B) begin
        SSPTXD <= 0;
    end
    else begin
        if (SSPFSSOUT) begin
            SSPTXD <= out_reg[out_cnt];
        end
    end
end
always @(posedge SSPCLKOUT) begin
    if (!CLEAR_B ) begin
        SSPFSSOUT <= 0;
    end
    else begin
        if (wptr_t != 0 && rptr_t != wptr_t && out_cnt == 7) begin
            SSPFSSOUT <= 1;
        end
        else if (SSPFSSOUT) begin //only raise for one cycle
            SSPFSSOUT <= 0;
        end
    end
end

always @(posedge SSPCLKOUT) begin
    if (!CLEAR_B) begin
        out_reg <= 0;
    end
    else begin
        if (wptr_t != 0 && rptr_t != wptr_t && PSEL && !PWRITE && out_cnt == 7) begin
            out_reg <= TXDATA;
        end
    end
end
reg finish;
always @(posedge SSPCLKOUT) begin
    if (!CLEAR_B) begin
        finish <= 0;
    end
    else begin
        if (out_cnt == 0) begin
            finish <= 1;
        end
        else begin
            finish <= 0;
        end
    end
end
always @(negedge SSPCLKOUT) begin
    if (!CLEAR_B) begin
        SSPOE_B <= 1;
    end
    else begin
        if (SSPFSSOUT || out_cnt != 7 || finish) begin
            SSPOE_B <= 0;
        end
        else begin
            SSPOE_B <= 1;
        end
    end
end
*/
// ======================= Receiver Logic =========================
wire [2:0] wptr_r, rptr_r;
wire full_rx  = (wptr_r[1:0] == rptr_r[1:0]) && (wptr_r[2] != rptr_r[2]);
localparam [2:0]
  RX_IDLE       = 3'd0,
  RX_ACCUMULATE = 3'd1,
  RX_SEND       = 3'd2;
reg [1:0] cur_state_rx, nxt_state_rx;
always @(posedge PCLK) begin
    if (!CLEAR_B) begin
        cur_state_rx <= RX_IDLE;
    end
    else if (!SSPCLKIN) begin
        cur_state_rx <= nxt_state_rx;
    end
end 
always @(*) begin
    case (cur_state_rx)
        RX_IDLE: begin
            if (SSPFSSIN) begin
                nxt_state_rx = RX_ACCUMULATE;
            end            
            else begin
                nxt_state_rx = cur_state_rx;
            end
        end
        RX_ACCUMULATE: begin
            if (in_cnt == 0 && SSPFSSIN) begin
                nxt_state_rx = RX_ACCUMULATE;
            end
            else if (in_cnt == 0 && !SSPFSSIN) begin
                nxt_state_rx = RX_SEND;
            end
            else begin
                nxt_state_rx = cur_state_rx;
            end
        end
        RX_SEND: begin
            if (!full_rx && !SSPFSSIN) begin
                nxt_state_rx = RX_IDLE;
            end
            else begin
                nxt_state_rx = RX_SEND;
            end
        end
        default: nxt_state_rx = cur_state_rx;
    endcase
end
reg [2:0] in_cnt_ns;
always @(posedge SSPCLKIN) begin
    in_cnt <= in_cnt_ns;
end
always @(*) begin
	in_cnt_ns = in_cnt;
    if (cur_state_rx == RX_ACCUMULATE) begin
        in_cnt_ns = in_cnt - 1;
    end
    else if (cur_state_rx == RX_IDLE) begin
        in_cnt_ns = 7;
    end    
end
/*
reg SSPFSSIN_delay;
always @(posedge SSPCLKIN) begin
    SSPFSSIN_delay <= SSPFSSIN;
end
*/
reg [7:0] in_reg_ns;
always @(posedge SSPCLKIN) begin
    /*
    if (cur_state_rx == RX_ACCUMULATE) begin
        in_reg[in_cnt] <= SSPRXD;
    end
    
    else if (cur_state_rx == RX_SEND && SSPFSSIN_delay) begin // The next one
        in_reg[in_cnt] <= SSPRXD;
    end
    
    else if (cur_state_rx == RX_IDLE) begin
        in_reg <= 0;
    end
    */
    in_reg <= in_reg_ns;
end
always @(*) begin
    in_reg_ns = in_reg;
    if (cur_state_rx == RX_ACCUMULATE) begin
        in_reg_ns[in_cnt] = SSPRXD;
    end
    else if (cur_state_rx == RX_IDLE) begin
        in_reg_ns = 0;
    end    
end
reg [7:0] RXDATA,RXDATA_ns;
reg first;
always @(posedge SSPCLKIN) begin
	/*
    if (cur_state_rx == RX_SEND) begin 
        RXDATA <= in_reg;
    end
    else if (in_cnt == 7 && cur_state_rx == RX_ACCUMULATE && !first) begin
        RXDATA <= in_reg;
    end
	//else if (in_cnt == 7 && cur_state_rx == RX_ACCUMULATE )
    else if (cur_state_rx == RX_IDLE) begin
        RXDATA <= 0;
    end
	*/
	RXDATA <= RXDATA_ns;
end
always @(*) begin
    RXDATA_ns = 0;
    if (cur_state_rx == RX_SEND) begin 
        RXDATA_ns = in_reg;
    end
    else if (in_cnt == 7 && cur_state_rx == RX_ACCUMULATE && !first) begin
        RXDATA_ns = in_reg;
    end
	//else if (in_cnt == 7 && cur_state_rx == RX_ACCUMULATE )
    else if (cur_state_rx == RX_IDLE) begin
        RXDATA_ns = 0;
    end	
end
wire wr_en_wire;
reg wr_en, wr_en_ns;
always @(posedge SSPCLKIN) begin
    /*
    if (nxt_state_rx == RX_SEND) begin
        wr_en <= 1;
    end
    else if (in_cnt == 7 && cur_state_rx == RX_ACCUMULATE && !first) begin
        wr_en <= 1;
    end
    else begin
        wr_en <= 0;
    end
    */
    wr_en <= wr_en_ns;
end
always @(*) begin
    wr_en_ns = 0;
    if (nxt_state_rx == RX_SEND && !first) begin
        wr_en_ns = 1;
    end
    else if (in_cnt == 7 && cur_state_rx == RX_ACCUMULATE && !first) begin
        wr_en_ns = 1;
    end
    /*
    else begin
        
    end
    */
end
assign wr_en_wire = wr_en;
always @(posedge SSPCLKIN) begin
    if (cur_state_rx == RX_IDLE) begin
        first <= 1;
    end
    else if (in_cnt == 0) begin
        first <= 0;
    end
    else begin
        first <= 1;
    end
end
/*
always @(posedge SSPCLKIN) begin
    if (!CLEAR_B) begin
        in_reg <= 0;
    end
    else begin
        if (SSPFSSIN) begin
            in_reg[in_cnt] <= SSPRXD;
        end
    end
end
always @(posedge SSPCLKIN) begin
    if (!CLEAR_B) begin
        in_cnt <= 7;
    end
    else begin
        if (SSPFSSIN) begin
            in_cnt <= in_cnt - 1;
        end
    end
end
reg [7:0] RXDATA_reg;
always @(posedge SSPCLKIN) begin
    if (!CLEAR_B) begin
        RXDATA_reg <= 0;
    end
    else if (in_cnt == 0) begin
        RXDATA_reg <= in_reg;
    end
end
wire [7:0] RXDATA;
assign RXDATA = RXDATA_reg;
*/

T_FIFO TX(
    .PCLK (PCLK),
    .CLEAR_B(CLEAR_B),
    .PSEL(PSEL),
    .PWRITE(PWRITE),
    .PWDATA(PWDATA),
    .TXDATA(TXDATA),
    .SSPTXINTR(SSPTXINTR),
    .wptr(wptr_t),
    .rptr(rptr_t),
    .rd_en(rd_en_wire),
    .finish(finish));

R_FIFO RX(
    .PCLK (PCLK),
    .CLEAR_B(CLEAR_B),
    .PSEL(PSEL),
    .PWRITE(PWRITE),
    .RXDATA(RXDATA),
    .PRDATA(PRDATA),
    .SSPRXINTR(SSPRXINTR),
    .wptr(wptr_r),
    .rptr(rptr_r),
    .wr_en(wr_en_wire));

endmodule

module T_FIFO(
    PCLK,
    CLEAR_B,
    PSEL,
    PWRITE,
    PWDATA,
    TXDATA,
    SSPTXINTR,
    wptr,
    rptr,
    rd_en,
    finish     
);
input finish;
input PCLK;
input CLEAR_B; //reset signal synchronous
input PSEL; //1: can write into Tfifo or read from PRDATA
input PWRITE; //fifo's write/read, 1: write, 0:read
input [7:0] PWDATA; //Tfifo
output [7:0] TXDATA;
output SSPTXINTR;
output wire [2:0] wptr;
output wire [2:0] rptr;
input rd_en;

reg [7:0] FIFO [0:3]; //FIFO DEPTH = 4
integer i;
reg [2:0] wptr_reg, rptr_reg; 
//assign wptr_next = wptr_reg + 2'd1;
//wire full  = (wptr_next == rptr_reg);
//wire empty = (wptr_reg == rptr_reg);
assign wptr = wptr_reg;
assign rptr = rptr_reg;

wire [2:0] wptr_next;
assign wptr_next = {wptr_reg[2] ^ (wptr_reg[1:0]==2'd3), wptr_reg[1:0] + 2'd1};
wire empty = (wptr_reg == rptr_reg);
wire full  = (wptr_reg[1:0] == rptr_reg[1:0]) && (wptr_reg[2] != rptr_reg[2]);

always @(posedge PCLK) begin
    if (!CLEAR_B) begin
        for (i = 0 ; i< 4 ; i = i+1)begin
            FIFO[i] <= 0;
        end
    end
    else begin
        if (!full && PSEL && PWRITE) begin
            FIFO[wptr_reg[1:0]] <= PWDATA;
        end
    end
end
always @(posedge PCLK) begin
    if (!CLEAR_B)begin
        wptr_reg <= 0;
    end
    else begin
        if (!full && PWRITE && PSEL)begin
            wptr_reg <= wptr_next;
        end
    end
end
//assign wptr = wptr_reg;
reg rd_en_delay;

always @(posedge PCLK) begin
    rd_en_delay <= rd_en;
end
always @(posedge PCLK) begin
    if (!CLEAR_B) begin
        rptr_reg <= 0;
    end
    else begin
        if (!empty && finish) begin //finish
            rptr_reg <= rptr_reg + 1;
        end
    end
end

//assign rptr = rptr_reg;
reg [7:0] TXDATA_reg;
always @(posedge PCLK) begin
    if (!CLEAR_B) begin
        TXDATA_reg <= 0;
    end
    else begin
        //if (!empty && rd_en) begin//!psel
            TXDATA_reg <= FIFO[rptr_reg[1:0]];
        //end
    end
end  
reg [7:0] TXDATA_DELAY;  
always @(posedge PCLK) begin
    TXDATA_DELAY <= TXDATA_reg;
end
assign TXDATA = TXDATA_DELAY;
assign SSPTXINTR = full;
endmodule 

module R_FIFO(
    PCLK,
    CLEAR_B,
    PSEL,
    PWRITE,
    RXDATA,
    PRDATA,
    SSPRXINTR,
    wptr,
    rptr,
    wr_en     
);
input PCLK;
input CLEAR_B; //reset signal synchronous
input PSEL; //1: can write into Tfifo or read from PRDATA
input PWRITE; //fifo's write/read, 1: write, 0:read
input [7:0] RXDATA; //Tfifo
output [7:0] PRDATA;
output SSPRXINTR;
output wire [2:0] wptr;
output wire [2:0] rptr;
input wr_en;

reg [7:0] FIFO [0:3]; //FIFO DEPTH = 4
integer i;
reg [2:0] wptr_reg, rptr_reg; 
//assign wptr_next = wptr_reg + 2'd1;
//wire full  = (wptr_next == rptr_reg);
//wire empty = (wptr_reg == rptr_reg);
assign wptr = wptr_reg;
assign rptr = rptr_reg;

wire [2:0] wptr_next;
assign wptr_next = {wptr_reg[2] ^ (wptr_reg[1:0]==2'd3), wptr_reg[1:0] + 2'd1};
wire empty = (wptr_reg == rptr_reg);
reg empty_delay;
always @(posedge PCLK) begin
    empty_delay <= empty;
end
wire full  = (wptr_reg[1:0] == rptr_reg[1:0]) && (wptr_reg[2] != rptr_reg[2]);
reg wr_en_1_cycle;
always @(posedge PCLK) begin
    if (!CLEAR_B) begin
        wr_en_1_cycle <= 0;
    end
    else begin
        if (wr_en && !wr_en_1_cycle) begin
            wr_en_1_cycle <= 1;
        end
        else begin
            wr_en_1_cycle <= 0;
        end
    end
end
reg [7:0] stall_reg, stall_reg2;
reg stall, stall2;
always @(posedge PCLK) begin
    if (!CLEAR_B) begin
        for (i = 0 ; i< 4 ; i = i+1)begin
            FIFO[i] <= 0;
        end
    end
    else begin
        if (!full && wr_en_1_cycle && !stall && !stall2) begin //&& PSEL && PWRITE
            FIFO[wptr_reg[1:0]] <= RXDATA;
        end
		else if (stall && !full) begin
			FIFO[wptr_reg[1:0]] <= stall_reg;
		end
		else if (stall2 && !full && !stall) begin
			FIFO[wptr_reg[1:0]] <= stall_reg2;
		end
    end
end
/////////////////////////////////////////
always @(posedge PCLK) begin
	if (!CLEAR_B) begin
		stall_reg <= 0;
		stall <= 0;
	end
	else begin
		if (full && wr_en_1_cycle && !stall) begin
			stall_reg <= RXDATA;
			stall <= 1;
		end
		else if (!full) begin
			stall_reg <= 0;
			stall <= 0;
		end
	end
end
always @(posedge PCLK) begin
	if (!CLEAR_B) begin
		stall_reg2 <= 0;
		stall2 <= 0;
	end
	else begin
		if (full && wr_en_1_cycle && stall) begin
			stall_reg2 <= RXDATA;
			stall2 <= 1;
		end
		else if (!full && !stall) begin
			stall_reg2 <= 0;
			stall2 <= 0;
		end
	end
end
always @(posedge PCLK) begin
    if (!CLEAR_B)begin
        wptr_reg <= 0;
    end
    else begin
        if (!full && wr_en_1_cycle && !stall && !stall2)begin
            wptr_reg <= wptr_next;
        end
		else if (stall && !full) begin
			wptr_reg <= wptr_next;
		end
		else if (stall2 && !full && !stall) begin
			wptr_reg <= wptr_next;
		end
    end
end
//assign wptr = wptr_reg;
always @(posedge PCLK) begin
    if (!CLEAR_B) begin
        rptr_reg <= 0;
    end
    else begin
        if (!empty && PSEL && !PWRITE) begin //!psel
            rptr_reg <= rptr_reg + 1;
        end
    end
end
//assign rptr = rptr_reg;
reg [7:0] PRDATA_reg;

always @(posedge PCLK) begin
    if (!CLEAR_B) begin
        PRDATA_reg <= 0;
    end
    else begin
        //if (!empty && PSEL && !PWRITE) begin//!psel
            PRDATA_reg <= FIFO[rptr_reg[1:0]];
        //end
        //else begin
            //PRDATA_reg <= 0;
       // end
    end
end  

/*
always @(*) begin

    if (!empty && PSEL && !PWRITE) begin//!psel
        PRDATA_reg = FIFO[rptr_reg[1:0]];
    end
    else begin
        PRDATA_reg = 0;
    end

end    
*/
assign PRDATA = (!empty_delay && PSEL && !PWRITE) ? PRDATA_reg : 0; //!empty 
assign SSPRXINTR = full;
endmodule

