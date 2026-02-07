// 
// main.v
// 
// testenvironment
// 
// David Van Campenhout
// 
`ifndef SYNTHESIS
`include "test.config"
`include "signal.defs"
`include "signals2.defs"

`define fiq		TOP.ARM.fiq
`define irq		TOP.ARM.irq
`define swi		TOP.ARM.swi
`define und_i		TOP.ARM.undef_instr
`define d_abrt		TOP.ARM.data_abort
`define p_abrt		TOP.ARM.prefetch_abort

`define init_with_IRc	TOP.ARM.init_with_IRc

`define O_ror		TOP.ARM.CTRL.arm_ctrl_comb.zero_ror
`define O_shift	TOP.ARM.CTRL.arm_ctrl_comb.zero_shift
`define imm_op		TOP.ARM.imm_op
`define imm_amnt	TOP.ARM.imm_amnt
`define alu_s		TOP.ARM.DP.alu_s
`define alu_m		TOP.ARM.DP.alu_m
`define sh_in		TOP.ARM.DP.barrelShift.in
`define sh_amnt	TOP.ARM.DP.barrelShift.amount
`define sh_out		TOP.ARM.DP.barrelShift.out
`define IR		TOP.ARM.IR
`define sh_co		TOP.ARM.DP.shiftCarryOut

`define type_D		TOP.ARM.DP.barrelShift.type_D
`define type		TOP.ARM.DP.barrelShift.type
`define rrx		TOP.ARM.DP.barrelShift.rrx
`define right		TOP.ARM.DP.barrelShift.right
`define asr		TOP.ARM.DP.barrelShift.asr
`define s_cnst		TOP.ARM.DP.barrelShift.sel_cnst
//`define imm_amount	TOP.ARM.DP.barrelShift.imm_amount
`define left_amount	TOP.ARM.DP.barrelShift.left_amount
`define right_amount	TOP.ARM.DP.barrelShift.right_amount
`define amount		TOP.ARM.DP.barrelShift.amount
`define muxAs1		TOP.ARM.DP.barrelShift.mux_amount_s1
`define cnst		TOP.ARM.DP.barrelShift.cnst
`define inb		TOP.ARM.DP.barrelShift.inb
`define gte32		TOP.ARM.DP.barrelShift.gte32
`define IR7_xor	TOP.ARM.DP.barrelShift.IR7_xor
`define zero_amnt	TOP.ARM.DP.barrelShift.zero_amnt
`define imm_amnt_Q	TOP.ARM.DP.barrelShift.imm_amnt_Q
`define nR		TOP.ARM.DP.barrelShift.nR
`define nS1		TOP.ARM.DP.barrelShift.nS1
`define shift1		TOP.ARM.DP.barrelShift.shift1
`define over32		TOP.ARM.DP.barrelShift.shift_carry.over32
`define zero		TOP.ARM.DP.barrelShift.shift_carry.zero


`define fw_a		TOP.ARM.DP.forwardonA
`define fw_b		TOP.ARM.DP.forwardonB


`define CYCLE_TIME 40.0

module TOP;
  reg clk; //
  wire	phi1;//
  wire	phi2;//
  reg	clear;
  reg 	test;
  reg 	scanin;

  wire	[31:0]	dataBus;
  wire 	[25:0]	addressBus;
  wire 		r;
  wire		w;
  wire	scanout;
  wire oe_b;
  reg 	[7:0]	i;

  integer	cycles;

  integer	regsFile;
   wire	[31:0]	R0_U;
   wire	[31:0]	R1_U;
   wire	[31:0]	R2_U;
   wire	[31:0]	R3_U;
   wire	[31:0]	R4_U;
   wire	[31:0]	R5_U;
   wire	[31:0]	R6_U;
   wire	[31:0]	R7_U;
   wire	[31:0]	R8_U;
   wire	[31:0]	R9_U;
   wire	[31:0]	R10_U;
   wire	[31:0]	R11_U;
   wire	[31:0]	R12_U;
   wire	[31:0]	R13_U;
   wire	[31:0]	R14_U;
   wire	[31:0]	R15;
   wire	[31:0]	R13_S;
   wire	[31:0]	R14_S;   
   wire	[31:0]	R8_F;
   wire	[31:0]	R9_F;
   wire	[31:0]	R10_F;
   wire	[31:0]	R11_F;
   wire	[31:0]	R12_F;
   wire	[31:0]	R13_F;
   wire	[31:0]	R14_F;
   wire	[31:0]	R13_I;
   wire	[31:0]	R14_I;
   
   assign	R0_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[0];
   assign	R1_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[1];
   assign	R2_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[2];
   assign	R3_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[3];
   assign	R4_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[4];
   assign	R5_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[5];
   assign	R6_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[6];
   assign	R7_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[7];
   assign	R8_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[8];
   assign	R9_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[9];
   assign	R10_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[10];
   assign	R11_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[11];
   assign	R12_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[12];
   assign	R13_U =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[13];
   assign	R14_U = TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[14];
   assign	R15 =	{TOP.ARM.DP.regfile.STRUCT.stat_Q,
				TOP.ARM.DP.regfile.STRUCT.mask_Q,
				TOP.ARM.DP.regfile.STRUCT.pcAddr_Q,
				TOP.ARM.DP.regfile.STRUCT.mode_Q};
   assign	R8_F =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[16];
   assign	R9_F =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[17];
   assign	R10_F =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[18];
   assign	R11_F =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[19];
   assign	R12_F =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[20];
   assign	R13_F =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[21];
   assign	R14_F =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[22];
   assign	R13_I =	TOP.ARM.DP.regfile.STRUCT.IRQ13_Q;
   assign	R14_I =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[15];
   assign	R13_S =	TOP.ARM.DP.regfile.STRUCT.SVC13_Q;
   assign	R14_S =	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[23];

   

   initial //regfile
begin	
	if (`INIT_REGFILE) 
		begin		
			for  (i=0; i< 24; i=i+1)
				TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[i] = 32'b0;

			TOP.ARM.DP.regfile.STRUCT.SVC13.Q_temp = 32'b0;
//		TOP.ARM.DP.regfile.STRUCT.stat.Q_temp = 4'b0;
//		TOP.ARM.DP.regfile.STRUCT.mask.Q_temp = 2'b0;
			TOP.ARM.DP.regfile.STRUCT.pcAddr.Q_temp = 24'b0;
//		TOP.ARM.DP.regfile.STRUCT.mode.Q_temp = 2'b0;
			TOP.ARM.DP.regfile.STRUCT.IRQ13.Q_temp = 32'b0;
		end
	end

// scan stuff

  initial
	begin
		scanin 	= 0;
		test 	= 0;
	end
	

// clocks
/*
  initial
	begin
		phi1 = 0;
		phi2 = 0;
	end

  always
	begin
		#`NONOVERLAP phi1 = 1;
		#`PHI_HIGH phi1 = 0;
		#`NONOVERLAP phi2 = 1;
		#`PHI_HIGH phi2 = 0;
	end
*/
//initial clk = 0;
//integer CYCLE = `CYCLE_TIME;
//always #(CYCLE/2.0) clk = ~clk;

integer CYCLE;
initial begin
    clk   = 0;
    CYCLE = `CYCLE_TIME;
end

always #(CYCLE/2.0) clk = ~clk;


// clear

  initial
	begin
		clear = 0;
		//@(posedge phi1); #1;
		//@(posedge phi1); #1;
		repeat (4) begin
		  @(posedge clk);
		end		

		clear = 1;
	end


  always
  	begin
  	@(negedge phi1) 
		if (`SCAN_CIRCULAR) scanin = scanout;
	end
//wish_master
wire [25:0] addressBus_to_master;
wire [31:0] dataBus_to_master;
wire r_to_master, w_to_master;
wire mem_req_bar, mem_write_read;
wire we_i, stb_i, ack_o, cyc_i;
wire [25:0] adr_i;
//wish_slave 
wire PSEL, PWRITE;
//SSP
wire SSPTXINTR, SSPRXINTR;
wire SSPCLKIN, SSPFSSIN, SSPRXD;
//cmu
wire clear_o, clk_o;

wire [31:0] dat_o_slave, dat_o_master, dat_i_slave, dat_i_master;
wire tagn_i_slave, tagn_o_slave, tagn_i_master, tagn_o_master;

wire ssp_clear;
reg ssp_clear_reg;

reg [4:0] ssp_rst_cnt;
reg first;
always @(posedge clk_o) begin
	if (!clear_o) begin
		ssp_rst_cnt <= 0;
	end
	else begin
		ssp_rst_cnt <= ssp_rst_cnt + 1;
	end
end
always @(posedge clk_o) begin
	if (!clear_o) begin
		first <= 1;
	end
	else begin
		if (ssp_rst_cnt > 5) begin
			first <= 0;
		end
		else begin
			first <= first;
		end
	end
end
always @(posedge clk_o) begin
	if (!clear_o) begin
		ssp_clear_reg <= 1;
	end
	else begin
		if (ssp_rst_cnt < 2 && first) begin
			ssp_clear_reg <= 0;
		end
		else begin
			ssp_clear_reg <= 1;
		end
	end
end
assign ssp_clear = ssp_clear_reg;
memory MEM( 	.dataBus(dataBus), 
	.addressBus(addressBus), 
	.r(r), 
	.w(w), 
	.phi1(phi1), 
	.phi2(phi2));
	
arm ARM( 	.phi1(phi1), 
	.phi2(phi2), 
	.clear(clear_o),
	.test(test),
	.scanin(scanin),
	.scanout(scanout),
	.addressBus(addressBus_to_master), 
	.dataBus(dataBus_to_master), 
	.memoryRead(r_to_master), 
	.memoryWrite(w_to_master),
	.mem_req_bar(mem_req_bar),
	.mem_write_read(mem_write_read));
		

wishbone_master WB_M (
	// face arm
	.addressBus (addressBus_to_master),
	.dataBus(dataBus_to_master), //inout
	.mem_req(mem_req_bar),
	.memoryRead(r_to_master),
	.memoryWrite(w_to_master),
	.mwr_arm(mem_write_read),
	.rst_i(clear_o),
	.clk_i(clk_o),		
	//face wish_slave
	//input
	.dat_i(dat_o_slave),
	.ack_i(ack_o),
	.tagn_i(tagn_o_slave),
	//output
	.adr_o(adr_i),
	.dat_o(dat_i_slave),
	.we_o(we_i),
	.stb_o(stb_i),
	.cyc_o(cyc_i),
	.tagn_o(tagn_i_slave)
);
wishbone_slave WB_S(
	// face wish_master
	.rst_i(clear_o),
	.clk_i(clk_o),
	.dat_i(dat_i_slave),
	.adr_i(adr_i),
	.tagn_i(tagn_i_slave),
	.we_i(we_i),
	.stb_i(stb_i),
	.cyc_i(cyc_i),
	//output
	.mem_adr_o(addressBus),
	.dataBus(dataBus),
	.mem_r_o(r),
	.mem_w_o(w),
	.ssp_sel_o(PSEL),
	.ssp_w_o(PWRITE),
	.dat_o(dat_o_slave),
	.tagn_o(tagn_o_slave),
	.ack_o(ack_o)
);
cmu CMU (
	//input
	.clk_i(clk),
	.clear_i(clear),
	.ssp_intr_i({SSPTXINTR, SSPRXINTR}),
	//output
	.phi1(phi1),
	.phi2(phi2),
	.clk_o(clk_o),
	.clear_o(clear_o)
);
wire [7:0] ssp_prdata;

assign dataBus[7:0] = (PSEL && !PWRITE) ? ssp_prdata : 8'bz;
my_ssp SSP(
	.CLEAR_B(ssp_clear),
	.PCLK(clk_o),
	.PSEL(PSEL),
	.PWRITE(PWRITE),
	.PWDATA(dataBus[7:0]),
	.PRDATA(ssp_prdata),
	.SSPTXINTR(SSPTXINTR),
	.SSPRXINTR(SSPRXINTR),
	.SSPCLKOUT(SSPCLKIN),
	.SSPFSSOUT(SSPFSSIN),
	.SSPTXD(SSPRXD),
	.SSPCLKIN(SSPCLKIN),
	.SSPFSSIN(SSPFSSIN),
	.SSPRXD(SSPRXD),
	.SSPOE_B(oe_b)
);


  always 
	begin
		@(negedge phi2)	
			strobe_bus;
	end

  initial
  	begin
	if (`SCAN) 
		begin
		#( `SCAN_START * `CYCLE);
		#( `SCAN_OFFSET);
		test = 1;
		if (!`SCAN_CIRCULAR) 
			begin
				scanin = 1;
				#`CYCLE;
				scanin = 0;
				#`CYCLE;
				scanin = 1;
		 		#`CYCLE;
				scanin = 0;
		 		#`CYCLE;
			end
		#( `SCAN_CYCLES * `CYCLE);
		test = 0;
		end
	end
	
  initial
	begin
//  	$dumpvars;
	  regsFile = $fopen("regsFile.txt"); 
  	if ( regsFile == 0) $finish;
	
	StrobeRegsSTRUCT;
		
	for(i = 0; i< 64; i= i+ 1)
		$display("%d: %h", i, TOP.MEM.mem[i]);

	$stop;
	for (cycles = 0; cycles <= `CYCLES; cycles = cycles + 1)
		begin
//		if (cycles == `START_WAVES) Waves;
		@(negedge phi2); #1;
			StrobeRegsSTRUCT;
		end
	@(negedge phi2); #1;
	for(i = 0; i< 64; i= i+ 1)
		$display("%d: %h", i, TOP.MEM.mem[i]);
	$stop;
	$fclose (regsFile);
	$finish(2);
       	end  



//------------------------------------------------------------------------
/*************************************************************************
task StrobeRegs;
	begin
	$fstrobe(regsFile,"time: %t aBus: %h dBus: %h\nstate: %d      IR: %h            IRcurr: %h\nR0:  %h R1:  %h R2:  %h R3:  %h\nR4:  %h R5:  %h R6:  %h R7:  %h\nR8:  %h R9:  %h R10: %h R11: %h\nR12: %h R13S:%h R14S:%h R15: %h\n ",
		$realtime, 
		TOP.ARM.addressBus,
		TOP.ARM.dataBus,
		TOP.ARM.CTRL.state,
		TOP.ARM.IR,
		TOP.ARM.IRcurr,
		TOP.ARM.DP.regfile.REG[0],
		TOP.ARM.DP.regfile.REG[1],
		TOP.ARM.DP.regfile.REG[2],
		TOP.ARM.DP.regfile.REG[3],
		TOP.ARM.DP.regfile.REG[4],
		TOP.ARM.DP.regfile.REG[5],
		TOP.ARM.DP.regfile.REG[6],
		TOP.ARM.DP.regfile.REG[7],
		TOP.ARM.DP.regfile.REG[8],
		TOP.ARM.DP.regfile.REG[9],
		TOP.ARM.DP.regfile.REG[10],
		TOP.ARM.DP.regfile.REG[11],
		TOP.ARM.DP.regfile.REG[12],
		TOP.ARM.DP.regfile.REG[25],
		TOP.ARM.DP.regfile.REG[26],
		TOP.ARM.DP.regfile.pc);
	end
endtask
*************************************************************************/

task StrobeRegsSTRUCT;
	begin
	$fstrobe(regsFile,"time: %t aBus: %h dBus: %h\ncycles:%d rd: %d wr: %d clear %d test %d scanin %d\nstate: %d      IR: %h            IRcurr: %h\nR0:  %h R1:  %h R2:  %h R3:  %h\nR4:  %h R5:  %h R6:  %h R7:  %h\nR8:  %h R9:  %h R10: %h R11: %h\nR12: %h R13S:%h R14S:%h R15: %h\nqfull: %d\n",
		$realtime, 
		TOP.ARM.addressBus,
		TOP.ARM.dataBus,
		TOP.cycles,
		TOP.r,
		TOP.w,
		TOP.clear,
		TOP.test,
		TOP.scanin,
		TOP.ARM.CTRL.state,
		TOP.ARM.IR,
		TOP.ARM.IRcurr,
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[0],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[1],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[2],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[3],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[4],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[5],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[6],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[7],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[8],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[9],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[10],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[11],
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[12],
		TOP.ARM.DP.regfile.STRUCT.SVC13_Q,
		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[23],
		{TOP.ARM.DP.regfile.STRUCT.stat_Q,
		TOP.ARM.DP.regfile.STRUCT.mask_Q,
		TOP.ARM.DP.regfile.STRUCT.pcAddr_Q,
		TOP.ARM.DP.regfile.STRUCT.mode_Q},
		TOP.ARM.CTRL.qFull_D
		);
	end
endtask

/*************************************************************************
	"R0U %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[0],
	"R1U %h",	TOP.ARM.DP.regfile.REG[1],
	"R2U %h",	TOP.ARM.DP.regfile.REG[2],
	"R3U %h",	TOP.ARM.DP.regfile.REG[3],
	"R4U %h",	TOP.ARM.DP.regfile.REG[4],
	"R5U %h",	TOP.ARM.DP.regfile.REG[5],
	"R6U %h",	TOP.ARM.DP.regfile.REG[6],
	"R7U %h",	TOP.ARM.DP.regfile.REG[7],
	"R8U %h",	TOP.ARM.DP.regfile.REG[8],
	"R9U %h",	TOP.ARM.DP.regfile.REG[9],
	"R10U %h",	TOP.ARM.DP.regfile.REG[10],
	"R11U %h",	TOP.ARM.DP.regfile.REG[11],
	"R12U %h",	TOP.ARM.DP.regfile.REG[12],
	"R13U %h",	TOP.ARM.DP.regfile.REG[13],
	"R14U %h",	TOP.ARM.DP.regfile.REG[14],
	"R15 %h",	TOP.ARM.DP.regfile.pc,
	"R8F %h",	TOP.ARM.DP.regfile.REG[16],
	"R9F %h",	TOP.ARM.DP.regfile.REG[17],
	"R10F %h",	TOP.ARM.DP.regfile.REG[18],
	"R11F %h",	TOP.ARM.DP.regfile.REG[19],
	"R12F %h",	TOP.ARM.DP.regfile.REG[20],
	"R13F %h",	TOP.ARM.DP.regfile.REG[21],
	"R14F %h",	TOP.ARM.DP.regfile.REG[22],
	"R13I %h",	TOP.ARM.DP.regfile.REG[23],
	"R14I %h",	TOP.ARM.DP.regfile.REG[24],
	"R13S %h",	TOP.ARM.DP.regfile.REG[25],
	"R14S %h",	TOP.ARM.DP.regfile.REG[26],
*************************************************************************/

/*
task Waves;
	begin
	$gr_waves_memsize(`WAVES_MEMSIZE);
 	$gr_waves(
	"phi1 %b",	TOP.phi1,
	"phi2 %b",	TOP.phi2,
	"cycle %d",    cycles,
	"clear %b",	TOP.clear,
	"test %b",	TOP.test,
	"scanin %b",	TOP.scanin,
	"scanout %b",	TOP.scanout,
	"data %h",	TOP.dataBus,
	"address %h", 	TOP.addressBus,
	"AR_SL %h",	TOP.ARM.AR_select,
	"enAR %b",	TOP.ARM.DP.enAR,
	"_alignA %b",	TOP.ARM.DP.align_alu_addr_bar,
	"read %b", 	TOP.r,
	"write %b", 	TOP.w,
	"state_D %h", 	`state_D,
	"state_Q %h", 	`state_Q,
	"state %h", 	`state,
	"qFull_D %b", 	`qFull_D,
	"qFull_Q %b",	`qFull_Q,
	"IR %h", 		TOP.ARM.IR,
	"IR1 %h",		TOP.ARM.DP.Ireg.IR1,
	"IR2 %h",		TOP.ARM.DP.Ireg.IR2,
	"IRcurr %h",	TOP.ARM.IRcurr,
	"enIR1 %b", 	TOP.ARM.enIR1,
	"enIR2 %b", 	TOP.ARM.enIR2,
	"enIRc %b", 	TOP.ARM.enIRcurr,
	"addrReg %h",	TOP.ARM.DP.addressRegister,
	"Ifetch_D %b",	`Ifetch_D,
	"Ifetch_Q %b",	`Ifetch_Q,
	"cond %b",	TOP.ARM.IRcurr[31:28],
	"sDin %b", 	TOP.ARM.sDin,
	"ldstrbyte %b",	TOP.ARM.DP.ldstrByte,
	"byte %b",	TOP.ARM.DP.byte0,
	"dpStat %b",	TOP.ARM.DP.dpStat,
	"mask %b",	TOP.ARM.mask,
	"pcAddr %h",	TOP.ARM.DP.pcAddr,
	"mode %d",	TOP.ARM.mode,
	"evalC_D %b",	`evalCondition_D,
	"evalC_Q %b",	`evalCondition_Q,
	"skip %b",	TOP.ARM.skip,
	"rA %h",		TOP.ARM.rA,
	"rB %h",		TOP.ARM.rB,
	"Aop %h",		TOP.ARM.DP.Aop,
	"Bop %h",		TOP.ARM.DP.Bop,
	"ShftA %h",	TOP.ARM.DP.shiftAmount,
//	"ShftT %h",	TOP.ARM.shiftType,

	"O_ror %b",	`O_ror,
	"O_shift %b",	`O_shift,
	"imm_op %b",	`imm_op,
	"imm_amnt %b",	`imm_amnt,
	"sh_amnt %h",	`sh_amnt,
	"sh_in %h",	`sh_in,
	"sh_out %h",	`sh_out,
	"alu_s %b",	`alu_s,
	"alu_m %b",	`alu_m,
	"sh_cond %b",	(`O_ror & `IR[25]) | (`O_shift & ~`IR[25]) ,
	"sh_co %b",	`sh_co,

	"Bopsh %h",	TOP.ARM.DP.BopShifted,
	"AluOp %h",	TOP.ARM.aluOperation,
	"aluOut %h",	TOP.ARM.DP.aluOut,
	"aluFlags %b",	TOP.ARM.DP.aluFlagsOut,
	"wStat %b",	TOP.ARM.DP.writeStatus,
	"dIn %h",		TOP.ARM.DP.dataIn,
	"enDIN %b",	TOP.ARM.DP.Ifetch_bar,
	"dOut %h",	TOP.ARM.DP.dataOut_mod.dout_q,
	"enW %b",		TOP.ARM.enW,
	"wA %h",		TOP.ARM.wA,
	"ar_clk %b",	`ar_clk,
	"enARf2 %b",	`enAR_phi2,

	"aop_s %b",	`aop_s,
	"bop_s %b",	`bop_s,
	"fw_a %b",	`fw_a,
	"fw_b %b",	`fw_b,

	"enMODE %b",	TOP.ARM.enMODE,
	"enINC %b",	TOP.ARM.enINC,
	"enMASK %b",	TOP.ARM.enMASK,
	"MODEw %b",	TOP.ARM.MODEw,
	"MASKw %b",	TOP.ARM.MASKw,
	"Aport %h",	TOP.ARM.DP.regfile.A,
	"Bport %h",	TOP.ARM.DP.regfile.B,
	"Wport %h",	TOP.ARM.DP.regfile.W,      
	"wA %h",		TOP.ARM.DP.regfile.wA,
	"enWphi2 %b", 	TOP.ARM.DP.regfile.STRUCT.en_regfile_phi2,
	"enPCphi2 %b", 	TOP.ARM.DP.regfile.STRUCT.en_pcAddr_phi2,
	"enmaskphi2 %b", 	TOP.ARM.DP.regfile.STRUCT.en_mask_phi2,
	"enmodephi2 %b", 	TOP.ARM.DP.regfile.STRUCT.en_mode_phi2,
	"enstatphi2 %b", 	TOP.ARM.DP.regfile.STRUCT.en_stat_phi2,
	"enIRQ13phi2 %b", 	TOP.ARM.DP.regfile.STRUCT.en_IRQ13_phi2,
	"enSVC13phi2 %b", 	TOP.ARM.DP.regfile.STRUCT.en_SVC13_phi2,
	"sel_inc %b",	TOP.ARM.DP.regfile.STRUCT.sel_inc,
	"sel_stat %b",	TOP.ARM.DP.regfile.STRUCT.sel_stat,
	"sel_mode %b",	TOP.ARM.DP.regfile.STRUCT.sel_mode,
	"sel_mask %b",	TOP.ARM.DP.regfile.STRUCT.sel_mask,
	"INCin %h", 	TOP.ARM.DP.regfile.STRUCT.INCin,
	"MODEin %h", 	TOP.ARM.DP.regfile.STRUCT.MODEin,
	"MASKin %h", 	TOP.ARM.DP.regfile.STRUCT.MASKin,
	"CONDin %h", 	TOP.ARM.DP.regfile.STRUCT.CONDin,
	"INCin %h", 	TOP.ARM.DP.regfile.STRUCT.INCin,
	"rCount %d",	TOP.ARM.DP.regCount,
	"rCount1 %d",	TOP.ARM.DP.regCount1,
	"rList_up %h",	TOP.ARM.DP.getreg.updated_reglist,
	"rList %h",	TOP.ARM.DP.getreg.reglist_q,
	"rEmpty %b",	TOP.ARM.DP.regListEmpty,
	"xReg_D %h",	TOP.ARM.DP.xReg_D,
	"rLinit %b",	TOP.ARM.DP.getreg.init,
	"rL_IRc %b",	`init_with_IRc,
	"R0U %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[0],
	"R1U %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[1],
	"R2U %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[2],
	"R3U %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[3],
	"R4U %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[4],
	"R5U %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[5],
	"R6U %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[6],
	"R7U %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[7],
	"R8U %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[8],
	"R9U %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[9],
	"R10U %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[10],
	"R11U %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[11],
	"R12U %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[12],
	"R13U %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[13],
	"R14U %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[14],
	"R15 %h",		{TOP.ARM.DP.regfile.STRUCT.stat_Q,
				TOP.ARM.DP.regfile.STRUCT.mask_Q,
				TOP.ARM.DP.regfile.STRUCT.pcAddr_Q,
				TOP.ARM.DP.regfile.STRUCT.mode_Q},
	"R8F %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[16],
	"R9F %h",		TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[17],
	"R10F %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[18],
	"R11F %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[19],
	"R12F %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[20],
	"R13F %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[21],
	"R14F %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[22],
	"R13I %h",	TOP.ARM.DP.regfile.STRUCT.IRQ13_Q,
	"R14I %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[15],
	"R13S %h",	TOP.ARM.DP.regfile.STRUCT.SVC13_Q,
	"R14S %h",	TOP.ARM.DP.regfile.STRUCT.regfile.mem_array[23],
	"M0 %h",		TOP.MEM.mem[0],
	"M1 %h",		TOP.MEM.mem[1],
	"M2 %h",		TOP.MEM.mem[2],
	"M3 %h",		TOP.MEM.mem[3],
	"M4 %h",		TOP.MEM.mem[4],
	"M5 %h",		TOP.MEM.mem[5],
	"M6 %h",		TOP.MEM.mem[6],
	"M7 %h",		TOP.MEM.mem[7],
	"M8 %h",		TOP.MEM.mem[8],
	"M9 %h",		TOP.MEM.mem[9],
	"M10 %h",		TOP.MEM.mem[10],
	"M11 %h",		TOP.MEM.mem[11],
	"M12 %h",		TOP.MEM.mem[12],
	"M13 %h",		TOP.MEM.mem[13],
	"M14 %h",		TOP.MEM.mem[14],
	"M15 %h",		TOP.MEM.mem[15],
	"M16 %h",		TOP.MEM.mem[16],
	"M17 %h",		TOP.MEM.mem[17],
	"M18 %h",		TOP.MEM.mem[18],
	"M19 %h",		TOP.MEM.mem[19],
	"M20 %h",		TOP.MEM.mem[20],
	"M21 %h",		TOP.MEM.mem[21],
	"M22 %h",		TOP.MEM.mem[22],
	"M23 %h",		TOP.MEM.mem[23],
	"M24 %h",		TOP.MEM.mem[24],
	"M25 %h",		TOP.MEM.mem[25],
	"M26 %h",		TOP.MEM.mem[26],
	"M27 %h",		TOP.MEM.mem[27],
	"M28 %h",		TOP.MEM.mem[28],
	"M29 %h",		TOP.MEM.mem[29],
	"M30 %h",		TOP.MEM.mem[30],
	"M31 %h",		TOP.MEM.mem[31],
	"M32 %h",		TOP.MEM.mem[32],
	"M33 %h",		TOP.MEM.mem[33],
	"M34 %h",		TOP.MEM.mem[34],
	"M35 %h",		TOP.MEM.mem[35],
	"M36 %h",		TOP.MEM.mem[36],
	"M37 %h",		TOP.MEM.mem[37],
	"M38 %h",		TOP.MEM.mem[38],
	"M39 %h",		TOP.MEM.mem[39],
	"M40 %h",		TOP.MEM.mem[40],
	"M41 %h",		TOP.MEM.mem[41],
	"M42 %h",		TOP.MEM.mem[42],
	"M43 %h",		TOP.MEM.mem[43],
	"M44 %h",		TOP.MEM.mem[44],
	"M45 %h",		TOP.MEM.mem[45],
	"M46 %h",		TOP.MEM.mem[46],
	"M47 %h",		TOP.MEM.mem[47],
	"M48 %h",		TOP.MEM.mem[48],
	"M49 %h",		TOP.MEM.mem[49],
	"M50 %h",		TOP.MEM.mem[50],
	"M51 %h",		TOP.MEM.mem[51],
	"M52 %h",		TOP.MEM.mem[52],
	"M53 %h",		TOP.MEM.mem[53],
	"M54 %h",		TOP.MEM.mem[54],
	"M55 %h",		TOP.MEM.mem[55],
	"M56 %h",		TOP.MEM.mem[56],
	"M57 %h",		TOP.MEM.mem[57],
	"M58 %h",		TOP.MEM.mem[58],
	"M59 %h",		TOP.MEM.mem[59],
	"M60 %h",		TOP.MEM.mem[60],
	"M61 %h",		TOP.MEM.mem[61],
	"M62 %h",		TOP.MEM.mem[62],
	"M63 %h",		TOP.MEM.mem[63],
//"immA %h",	`imm_amount,
"rightA %h", 	`right_amount,
"left %h", 	`left_amount,
"amount %h",	`amount,
"muxAs1 %b",	`muxAs1,
"inb %h", 	`inb,
"over32 %b", 	`gte32,
"gte32 %b", 	`over32,
"zero %b", 	`zero,
"type_D %b",	`type_D,
"type %b",	`type,
"rrx %b",       `rrx,
"right %b",	`right,
"asr %b",	`asr,
"s_cnst %b",    `s_cnst,
"cnst %b",     	`cnst,
"IR7_xor %b",   `IR7_xor,
"zero_amnt %b",	`zero_amnt,
"imm_amnt_Q %h",`imm_amnt_Q,
"nR %b",	`nR,
"nS1 %b",	`nS1,
"shift1 %h",    `shift1,

"IR1so %b",	TOP.ARM.DP.Ireg.IR1[31],
"IR2so %b",	TOP.ARM.DP.Ireg.IR2[31],
"IRcurrso %b",	TOP.ARM.DP.Ireg.IRcurr[31],
"addrso %b",	TOP.ARM.DP.ar.scanout,
"Aopso %b",	TOP.ARM.DP.aop_reg.scanout,
"Bopso %b",	TOP.ARM.DP.bop_reg.scanout,
"rListso %b",	TOP.ARM.DP.getreg.scanout,
"dInso %b",	TOP.ARM.DP.dataIn_mod.scanout,
"dOutso %b",	TOP.ARM.DP.dataOut_mod.scanout,
"wAso %b",	TOP.ARM.wA_scanout
);

	$define_group_waves(1, "+/-All",
	"cycle %d",
	"phi1 %b",
	"phi2 %b",
	"data %h",
	"address %h",
	"AR_SL %h",
	"state %h",
	"IR %h",
	"addrReg %h",
	"cond %b",
	"dpStat %b",
	"mask %b",
	"pcAddr %h",
	"mode %d",
	"skip %b",
	"Ifetch_D %b",
	"Ifetch_Q %b",
	"rA %h",
	"rB %h",
	"enW %b",
	"wA %h",
	"Aop %h",
	"Bop %h",
	"ShftA %h",
//	"ShftT %h",
	"Bopsh %h",
	"AluOp %h",
	"aluOut %h",
	"wStat %b",
	"aluFlags %b",
	"reset %b",
	"R0U %h", "R1U %h", "R2U %h", "R3U %h", 
	"R4U %h", "R5U %h", "R6U %h", "R7U %h",
	"R8U %h", "R9U %h", "R10U %h", "R11U %h",
	"R12U %h", "R13U %h", "R14U %h", "R15 %h",
	"R8F %h", "R9F %h", "R10F %h", "R11F %h",
	"R12F %h", "R13F %h", "R14F %h",
	"R13I %h", "R14I %h",
	"R13S %h", "R14S %h");


  	$define_group_waves(2, "Bus",
	"cycle %d",
	"phi1 %b",
	"phi2 %b",
	"data %h",
	"address %h",
	"read %b",
	"write %b",
	"enDIN %b",
	"dIn %h",
	"dOut %h",	
	"ldstrbyte %b",
	"byte %b");

	$define_group_waves(3, " User Regs",
	"cycle %d",
		"phi1 %b",
		"phi2 %b",
		"IR %h",
		"state %h",
		"aluOut %h",
		"R0U %h", "R1U %h", "R2U %h", "R3U %h", 
		"R4U %h", "R5U %h", "R6U %h", "R7U %h", 
		"R8U %h", "R9U %h", "R10U %h", "R11U %h",
		 "R12U %h", "R13U %h", "R14U %h", "R15 %h");

	$define_group_waves(4, " FIRQ Regs",
	"cycle %d",
		"phi1 %b",
		"phi2 %b",
		"IR %h",
		"state %h",
		"aluOut %h",
		"R0U %h", "R1U %h", "R2U %h", "R3U %h", 
		"R4U %h", "R5U %h", "R6U %h", "R7U %h", 
		"R8F %h", "R9F %h", "R10F %h", "R11F %h",
		 "R12F %h", "R13F %h", "R14F %h", "R15 %h");

	$define_group_waves(5, " IRQ Regs",
	"cycle %d",
		"phi1 %b",
		"phi2 %b",
		"IR %h",
		"state %h",
		"aluOut %h",
		"R0U %h", "R1U %h", "R2U %h", "R3U %h", 
		"R4U %h", "R5U %h", "R6U %h", "R7U %h", 
		"R8U %h", "R9U %h", "R10U %h", "R11U %h",
		 "R12U %h", "R13I %h", "R14I %h", "R15 %h");

	$define_group_waves(6, " SVC Regs",
	"cycle %d",
		"phi1 %b",
		"phi2 %b",
		"IR %h",
		"state %h",
		"aluOut %h",
		"R0U %h", "R1U %h", "R2U %h", "R3U %h", 
		"R4U %h", "R5U %h", "R6U %h", "R7U %h", 
		"R8U %h", "R9U %h", "R10U %h", "R11U %h",
		 "R12U %h", "R13S %h", "R14S %h", "R15 %h");


	
  	$define_group_waves(7, "State",
	"cycle %d",
		"phi1 %b",
		"phi2 %b",
		"IR %h",
		"IR1 %h",
		"IR2 %h",
		"IRcurr %h",
		"enIR1 %b",
		"enIR2 %b",
		"enIRc %b",
		"qFull_D %b",
		"qFull_Q %b",
		"qFull %b",
		"state %h",
		"state_D %h",
		"state_Q %h",
		"Ifetch_D %b",
		"Ifetch_Q %b",
		"AR_SL %h",
		"enAR %b",
		"enARf2 %b",
		"ar_clk %b",
		"_alignA %b",
		"sDin %b",
		"cond %b",
		"dpStat %b",
		"mask %b",
		"pcAddr %h",
		"mode %b",
		"skip %b",
		"aluFlags %b",
		"wStat %b",
		"enMODE %b",
		"enINC %b",
		"enMASK %b",
		"MODEw %b",
		"MASKw %b",
		"evalC_D %b",
		"evalC_Q %b"
		);
		
   	$define_group_waves(8, "Mem",
	"cycle %d",
		"phi1 %h", "phi2 %h", "address %h", "data %h",
		"read %b", "write %b",	"ldstrbyte %b",
		"M32 %h", "M33 %h", "M34 %h", "M35 %h",
		"M36 %h", "M37 %h", "M38 %h", "M39 %h",
		"M40 %h", "M41 %h", "M42 %h", "M43 %h",
		"M44 %h", "M45 %h", "M46 %h", "M47 %h",
		"M48 %h", "M49 %h", "M50 %h", "M51 %h",
		"M52 %h", "M53 %h", "M54 %h", "M55 %h",
		"M56 %h", "M57 %h", "M58 %h", "M59 %h",
		"M60 %h", "M61 %h", "M62 %h", "M63 %h",
		"M0 %h", "M1 %h", "M2 %h", "M3 %h",
		"M4 %h", "M5 %h", "M6 %h", "M7 %h", 
		"M8 %h", "M9 %h", "M10 %h", "M11 %h", 
		"M12 %h", "M13 %h", "M14 %h", "M15 %h", 
		"M16 %h", "M17 %h", "M18 %h", "M19 %h", 
		"M20 %h", "M21 %h", "M22 %h", "M23 %h", 
		"M24 %h", "M25 %h", "M26 %h", "M27 %h", 
		"M28 %h", "M29 %h", "M30 %h", "M31 %h");

   	$define_group_waves(9, "Regfile",
	"cycle %d",
		"phi1 %b", "phi2 %b", "clear %b", "rA %h", "Aport %h", 
		"rB %h", "Bport %h", "wA %h", "Wport %h",
		"INCin %h",
		"STATin %b",
		"MODEin %b",
		"CONDin %b",
		 "enW %h",
		"enINC %b",
		"enMODE %b",
		"enMASK %b",
		"enWphi2 %b",   
		"enPCphi2 %b",  
		"enmaskphi2 %b",
		"enmodephi2 %b",
		"enstatphi2 %b",
		"enIRQ13phi2 %b",
		"enSVC13phi2 %b",
		"sel_inc %b",
		"sel_mode %b",
		"sel_mask %b",	
		"sel_stat %b");

   	$define_group_waves(10, "Multiple",
	"cycle %d",
		"phi1 %b", "phi2 %b",
		"address %h",
		"rEmpty %b",
		"rCount %d",
		"rCount1 %d",
		"rList_up %h",
		"xReg_D %h",
		"rLinit %b",
		"rL_IRc %b");

   	$define_group_waves(11, "tstflgs",
	"cycle %d",
		"phi1 %b", "phi2 %b",
		"address %h",
		"data %h",
		"IR %h",
		"state %d",
		"R15 %h",
		"cond %b",
		"dpStat %b",
		"skip %b",
		"aluFlags %b",
		"evalC %b",
		"wStat %b",
		"enstatphi2 %b",
		"enW %b",
		"R0U %h",
		"R1U %h",
		"R2U %h",
		"R3U %h",
		"Aop %h",
		"Bop %h",
		"BopS %h",
		"aluOut %h"
		);

   	$define_group_waves(11, "tstalu",
	"cycle %d",
		"phi1 %b", "phi2 %b",
		"address %h",
		"data %h",
		"IR %h",
		"state %d",
		"R15 %h",
		"dpStat %b",
		"aluFlags %b",
		"evalC %b",
		"wStat %b",
		"R0U %h",
		"R1U %h",
		"R2U %h",
		"R3U %h",
		"R14S %h",
		"Aop %h",
		"Bop %h",
		"BopS %h",
		"aluOut %h"
		);
   	$define_group_waves(12, "tstshft",
	"cycle %d",
		"phi1 %b", "phi2 %b",
		"address %h",
		"data %h",
		"IR %h",
		"state %d",
		"R15 %h",
		"dpStat %b",
		"aluFlags %b",
		"wStat %b",
		"R0U %h",
		"R1U %h",
		"R2U %h",
		"R3U %h",
		"R4U %h",
		"R5U %h",
		"R6U %h",
		"Aop %h",
		"Bop %h",
		"BopS %h",
		"aluOut %h"
		);


   	$define_group_waves(13, "dp",
	"cycle %d",
		"phi1 %b", "phi2 %b",
		"address %h",
		"data %h",
		"IR %h",
		"state %d",
		"R15 %h",
		"dpStat %b",
	        "sh_co %b", 
		"aluFlags %b",
		"wStat %b",
		"Aop %h",
		"Bop %h",
		"aop_s %b",
		"bop_s %b",
		"fw_a %b",
		"fw_b %b",
		"O_shift %b",
		"O_ror %b",
		"imm_op %b",
		"imm_amnt %b",
		"alu_s %b",
		"alu_m %b",
		"aluOut %h"
		);


   	$define_group_waves(14, "shift",
	"cycle %d",
		"phi1 %b", "phi2 %b",
		"address %h",
		"data %h",
		"IR %h",
		"state %d",
		"dpStat %b",
		"aluFlags %b",
		"wStat %b",
		"Aop %h",
		"Bop %h",
		"BopSh %h",
		"alu_s %b",
		"alu_m %b",
		"aluOut %h",
//"immA %h",     
"rightA %h",   
"left %h",     
"amount %h",   
"muxAs1 %b",
"inb %h",      
"over32 %b",   
"gte32 %b",    
"zero %b",     
"type_D %b",   
"type %b",     
"rrx %b",      
"right %b",
"asr %b",
"s_cnst %b",
"cnst %b",     
"IR7_xor %b",  
"zero_amnt %b", 
"imm_amnt_Q %h",
"nR %b",       
"nS1 %b",      
"shift1 %h");

   	$define_group_waves(15, "scan",
"cycle %d",
"phi1 %b", 
"phi2 %b",
"test %b",
"scanin %b",
"scanout %b",

"IR1 %h",
"IR1so %b",
"IR2 %h",
"IR2so %b",
"IRcurr %h",
"IRcurrso %b",
"address %h",
"addrso %b",
"Aop %h",
"Aopso %b",
"Bop %h",
"Bopso %b",
//shift
"rList %h",
"rListso %b",
"dIn %h",
"dInso %b",
"dOut %h",
"dOutso %b",
"wA %h",
"wAso %b"
);




	
	end
endtask
*/
task strobe_test;
	begin
	case (`TESTPROGRAM)
	`TEST_MULTI : 
$strobe( "cycle: %d ",
cycles);
	`TEST_MULT : 
$strobe( "cycle: %d ",
cycles);
	`TEST_DIV : 
$strobe( "cycle: %d ",
cycles);
	endcase
	end
endtask

task strobe_bus;
	begin
	$strobe( "cycle: %d aBus: %h  dBus:%h ",
				cycles,
			 	addressBus, 
			 	dataBus);
	end
endtask

task strobe_test_alu;
	begin
$strobe( "cycle: %d ",
cycles);
	end
endtask

//------------------------------------------------------------------------

endmodule

module cmu (
	clk_i,
	clear_i,
	ssp_intr_i,
	phi1,
	phi2,
	clk_o,
	clear_o
);
input clk_i, clear_i;
input [1:0] ssp_intr_i;
output phi1; 
output phi2; 
output clk_o; 
output clear_o;

reg [1:0] clk_cnt;
/*
reg phi1_reg, phi2_reg;
assign phi1 = phi1_reg;
assign phi2 = phi2_reg;
*/
always @(posedge clk_i) begin
	if (!clear_i) begin
		clk_cnt <= 0;
	end
	else begin
		clk_cnt <= clk_cnt + 1;
	end
end
reg phi1_reg, phi2_reg;
always @(posedge clk_i) begin
	if (!clear_i) begin
		phi1_reg <= 0;
	end
	else begin
		if (clk_cnt == 3 && !ssp_intr_i[1]) begin
			phi1_reg <= 1;
		end
		else begin
			phi1_reg <= 0;
		end
	end
end
always @(posedge clk_i) begin
	if (!clear_i) begin
		phi2_reg <= 0;
	end
	else begin
		if (clk_cnt == 1 && !ssp_intr_i[1]) begin
			phi2_reg <= 1;
		end
		else begin
			phi2_reg <= 0;
		end
	end
end
assign phi1 = phi1_reg;
assign phi2 = phi2_reg;
//assign phi1 = (clk_cnt == 0 && !ssp_intr_i[1] == 0)? 1:0;
//assign phi2 = (clk_cnt == 2 && !ssp_intr_i[1] == 0)? 1:0;
assign clk_o = clk_i;
reg clr_sync;
always @(posedge clk_o) begin
  clr_sync <= clear_i; 
end
assign clear_o = clr_sync; 
endmodule

module wishbone_master(
	// face arm
	addressBus,
	dataBus,
	mem_req,
	memoryRead,
	memoryWrite,
	mwr_arm,
	rst_i,
	clk_i,		
	//face wish_slave
	//input
	dat_i,
	ack_i,
	tagn_i,
	//output
	adr_o,
	dat_o,
	we_o,
	stb_o,
	cyc_o,
	tagn_o
);
input rst_i; 
input clk_i ;
input mem_req ;
input mwr_arm ;
input memoryRead ;
input memoryWrite;
input [25:0] addressBus;
input [31:0] dat_i;
input ack_i; 
input tagn_i;
output [25:0] adr_o;
output [31:0] dat_o;
output we_o; 
output stb_o; 
output cyc_o; 
output tagn_o;
inout [31:0] dataBus;

localparam [2:0]
  IDLE    ='d0,
  HANDSHAKE_READ ='d1,
  WAIT_READ    ='d2,
  FINISH_READ ='d3,
  HANDSHAKE_WRITE ='d4,
  WAIT_WRITE ='d5,
  FINISH_WRITE ='d6;

reg [2:0] cur_state, nxt_state;
always @(posedge clk_i) begin
	if (!rst_i) begin
		cur_state <= IDLE;
	end
	else begin
		cur_state <= nxt_state;
	end
end
always @(*) begin
	case(cur_state)
		IDLE: begin
			if (!mem_req && !mwr_arm) begin
				nxt_state = WAIT_READ; //HANDSHAKE_READ
			end
			else if (!mem_req && mwr_arm) begin
				nxt_state = WAIT_WRITE; //
			end
			else begin
				nxt_state = cur_state;
			end
		end
		HANDSHAKE_READ: begin
			nxt_state = WAIT_READ;
		end
		WAIT_READ: begin
			if (ack_i) begin
				nxt_state = IDLE; //FINISH_READ
			end
			else begin
				nxt_state = cur_state;
			end
		end
		/*
		FINISH_READ: begin
			nxt_state = IDLE;
		end
		*/
		HANDSHAKE_WRITE: begin
			nxt_state = WAIT_WRITE;
		end
		WAIT_WRITE: begin
			if (ack_i) begin
				nxt_state = IDLE;
			end
			else begin
				nxt_state = cur_state;
			end
		end
		default: nxt_state = cur_state;
	endcase
end
 // ============ read/write signal ===============
assign stb_o = (mem_req == 0)? 1:0; //cur_state == HANDSHAKE_READ || cur_state == HANDSHAKE_WRITE ||
assign cyc_o = stb_o;
//assign we_o = (cur_state == HANDSHAKE_READ || cur_state == WAIT_READ)? 0:1;
reg we_o_reg;
always @(*) begin
	we_o_reg = 0;
	if (!mem_req && !mwr_arm) begin
		we_o_reg = 0;
	end
	else if (!mem_req && mwr_arm) begin
		we_o_reg = 1;
	end
end
assign we_o = we_o_reg;

assign adr_o = addressBus;
/*
always @(posedge clk_i) begin
	if (!rst_i) begin
		dataBus_reg <= 0;
	end
	else begin
		if (cur_state == WAIT_READ && ack_i && !we_o) begin
			dataBus_reg <= dat_i;
		end
	end
end
*/
// dataBus: in ==> data from ARM writing to slave ==> dat_o
// dataBus: out ==> data from slave (dat_i) to ARM
assign dataBus = (ack_i && !we_o)? dat_i : 32'bz; // output //cur_state == WAIT_READ &&

reg [31:0] dat_o_reg;
always @(posedge clk_i) begin
	if (!rst_i) begin
		dat_o_reg <= 0;
	end
	else begin
		if (!mem_req && mwr_arm) begin
			dat_o_reg <= dataBus;
		end
		else if (cur_state == IDLE) begin
			dat_o_reg <= 0;
		end
	end
end

assign dat_o = (!mem_req && mwr_arm) ? dat_o_reg : 32'b0; //input
//assign dat_o = (!mem_req && mwr_arm) ? dataBus:0;
endmodule

module wishbone_slave(
	// face wish_master
	rst_i,
	clk_i,
	dat_i,
	adr_i,
	tagn_i,
	we_i,
	stb_i,
	cyc_i,
	//output
	mem_adr_o,
	dataBus,
	mem_r_o,
	mem_w_o,
	ssp_sel_o,
	ssp_w_o,
	dat_o,
	tagn_o,
	ack_o
);
input rst_i ;
input clk_i; 
input tagn_i; 
input we_i; 
input stb_i; 
input cyc_i;
input [31:0] dat_i;
input [25:0] adr_i;
output [25:0] mem_adr_o;
output mem_r_o; 
output mem_w_o; 
output ssp_sel_o; 
output ssp_w_o; 
output tagn_o; 
output ack_o;
output [31:0] dat_o;
inout [31:0] dataBus; 

localparam [1:0]
  IDLE    ='d0,
  READ_MEM ='d1,
  READ_SSP    ='d2,
  //WAIT_MEM ='d3,
  WRITE_SSP ='d3;
  //WRITE_FINISH ='d5,
  //WAIT_SSP ='d6;
reg [2:0] cur_state, nxt_state;
always @(posedge clk_i) begin
	if (!rst_i) begin
		cur_state <= IDLE;
	end
	else begin
		cur_state <= nxt_state;
	end
end
always @(*) begin
	nxt_state = cur_state;
	case(cur_state)
		IDLE: begin
			if (cyc_i && stb_i && !we_i) begin
				if (adr_i == 26'h010001) begin
					nxt_state = READ_SSP;
				end
				else if (adr_i < 26'h010000)begin
					nxt_state = READ_MEM;
				end
			end
			else if (cyc_i && stb_i && we_i) begin
				nxt_state = WRITE_SSP;
			end
		end
		READ_MEM: begin
			nxt_state = IDLE;
		end
		READ_SSP: begin
			nxt_state = IDLE;
		end
		/*
		WAIT_MEM: begin
			
		end
		WAIT_SSP: begin
			
		end
		*/
		WRITE_SSP: begin
			nxt_state = IDLE;	
		end

	endcase
end
assign mem_w_o = 0; // no operation writing to the MEM
// Read from MEM
assign mem_r_o = (cyc_i && stb_i && !we_i && adr_i < 26'h010000) ?1:0;
assign mem_adr_o = (cyc_i && stb_i && !we_i && adr_i < 26'h010000)? adr_i:0;
// from SSP
reg ssp_sel_o_reg, ssp_w_o_reg;
reg ack_o_reg;
reg [3:0] cnt_sel;
reg [2:0] rd_cnt;
always @(posedge clk_i) begin
	if (!rst_i) begin
		rd_cnt <= 0;
	end 
	else begin
		if (cyc_i && stb_i && !we_i && adr_i == 26'h010001) begin
			rd_cnt <= rd_cnt + 1;
		end
		else begin
			rd_cnt <= 0;
		end
	end
end
always @(posedge clk_i) begin
	if (!rst_i) begin
		cnt_sel <= 0;
	end
	else begin
		if (cyc_i && stb_i && we_i && adr_i == 26'h010000) begin
			cnt_sel <= cnt_sel + 1;
		end
		else begin
			cnt_sel <= 0;
		end
	end
end
always @(*) begin
	ssp_sel_o_reg = 0;
	if (cyc_i && stb_i && we_i && cnt_sel == 1) begin //write
		ssp_sel_o_reg = 1;
	end
	else if (cyc_i && stb_i && !we_i && rd_cnt == 1) begin //read from sel
		ssp_sel_o_reg = 1;
	end
end

always @(*) begin
	ssp_w_o_reg = 0;
	if (cyc_i && stb_i && we_i) begin
		ssp_w_o_reg = 1;
	end 
	else if (cyc_i && stb_i && !we_i && adr_i == 26'h010001) begin
		ssp_w_o_reg = 0;
	end
end
assign ssp_sel_o = ssp_sel_o_reg;
assign ssp_w_o = ssp_w_o_reg;
// dataBus out: write data to SSP
// dataBus in: receive data from memory or SSP ==> dat_o back to master
// write from SSP
assign dataBus = (cyc_i && stb_i && we_i && adr_i == 26'h010000)? {24'b0, dat_i[7:0]} : 32'bz; 
//assign dataBus[7:0] = (PSEL && !PWRITE) ? ssp_prdata : 8'bz;
// read from MEM/SSP

reg [31:0] dat_o_reg;
/*
always @(posedge clk_i) begin
	if (!rst_i) begin
		dat_o_reg <= 0;
	end
	else begin
		if (cyc_i && stb_i && !we_i && adr_i == 26'h010001) begin
			dat_o_reg <= {24'b0, dataBus[7:0]};
		end
		else if (cyc_i && stb_i && !we_i && adr_i < 26'h010000) begin
			dat_o_reg <= dataBus;
		end
		else begin
			dat_o_reg <= dat_o_reg;
		end
	end
end
*/
reg [7:0] store_reg;
always @(posedge clk_i) begin
	if (!rst_i) begin
		store_reg <= 0;
	end
	else begin
		if (adr_i == 26'h010001 && rd_cnt == 1) begin
			store_reg <= dataBus[7:0];
		end
		else if (adr_i == 26'h010001 && rd_cnt > 1) begin
			store_reg <= store_reg;
		end
		else begin
			store_reg <= 0; 
		end
	end
end
always @(*) begin
	if (cyc_i && stb_i && !we_i && adr_i == 26'h010001 && rd_cnt == 1) begin
		dat_o_reg = {24'b0, dataBus[7:0]};
	end
	else if (cyc_i && stb_i && !we_i && adr_i == 26'h010001 && rd_cnt > 1) begin
		dat_o_reg = {24'b0, store_reg};
	end
	else if (cyc_i && stb_i && !we_i && adr_i < 26'h010000) begin
		dat_o_reg = dataBus;
	end
	else begin
		dat_o_reg = 0;
	end
end
assign dat_o = dat_o_reg;
//assign dat_o = (cur_state == READ_SSP)?{24'b0, dataBus[7:0]}:(cur_state == READ_MEM? dataBus:0); 
// ack control
/*
always @(posedge clk_i) begin
	if (!rst_i) begin
		ack_o_reg <= 0;
	end
	else begin
		if ((cur_state == READ_MEM || cur_state == READ_SSP || cur_state == WRITE_SSP) && nxt_state == IDLE) begin
			ack_o_reg <= 1;
		end
		else begin
			ack_o_reg <= 0;
		end
	end
end
*/
always @(*) begin
	if (cyc_i) begin
		ack_o_reg = 1;
	end
	else begin
		ack_o_reg = 0;
	end
end
assign ack_o = ack_o_reg;
//assign ack_o = (cur_state == READ_MEM || cur_state == READ_SSP || cur_state == WRITE_SSP)
endmodule

// ====================== FROM PART 1 ==========================
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
`endif




`ifdef SYNTHESIS
module TOP(
	clk,
	clear,
	ssp_clear,
	oe_b
);
  input clk; //
  wire	phi1;//
  wire	phi2;//
  input	clear;
  input ssp_clear;
  output oe_b;
  wire	[31:0]	dataBus;
  wire 	[25:0]	addressBus;
  wire 		r;
  wire		w;


//wish_master
wire [25:0] addressBus_to_master;
wire [31:0] dataBus_to_master;
wire r_to_master, w_to_master;
wire mem_req_bar, mem_write_read;
wire we_i, stb_i, ack_o, cyc_i;
wire [25:0] adr_i;
//wish_slave 
wire PSEL, PWRITE;
//SSP
wire SSPTXINTR, SSPRXINTR;
wire SSPCLKIN, SSPFSSIN, SSPRXD;
//cmu
wire clear_o, clk_o;

wire [31:0] dat_o_slave, dat_o_master, dat_i_slave, dat_i_master;
wire tagn_i_slave, tagn_o_slave, tagn_i_master, tagn_o_master;


reg [4:0] ssp_rst_cnt;
reg first;
always @(posedge clk_o) begin
	if (!clear_o) begin
		ssp_rst_cnt <= 0;
	end
	else begin
		ssp_rst_cnt <= ssp_rst_cnt + 1;
	end
end
always @(posedge clk_o) begin
	if (!clear_o) begin
		first <= 1;
	end
	else begin
		if (ssp_rst_cnt > 5) begin
			first <= 0;
		end
		else begin
			first <= first;
		end
	end
end
wire scanin;
wire scanout;
wire test;
memory MEM( 	.dataBus(dataBus), 
	.addressBus(addressBus), 
	.r(r), 
	.w(w), 
	.phi1(phi1), 
	.phi2(phi2));
	
arm ARM( 	.phi1(phi1), 
	.phi2(phi2), 
	.clear(clear_o),
	.test(test),
	.scanin(scanin),
	.scanout(scanout),
	.addressBus(addressBus_to_master), 
	.dataBus(dataBus_to_master), 
	.memoryRead(r_to_master), 
	.memoryWrite(w_to_master),
	.mem_req_bar(mem_req_bar),
	.mem_write_read(mem_write_read));
		

wishbone_master WB_M (
	// face arm
	.addressBus (addressBus_to_master),
	.dataBus(dataBus_to_master), //inout
	.mem_req(mem_req_bar),
	.memoryRead(r_to_master),
	.memoryWrite(w_to_master),
	.mwr_arm(mem_write_read),
	.rst_i(clear_o),
	.clk_i(clk_o),		
	//face wish_slave
	//input
	.dat_i(dat_o_slave),
	.ack_i(ack_o),
	.tagn_i(tagn_o_slave),
	//output
	.adr_o(adr_i),
	.dat_o(dat_i_slave),
	.we_o(we_i),
	.stb_o(stb_i),
	.cyc_o(cyc_i),
	.tagn_o(tagn_i_slave)
);
wishbone_slave WB_S(
	// face wish_master
	.rst_i(clear_o),
	.clk_i(clk_o),
	.dat_i(dat_i_slave),
	.adr_i(adr_i),
	.tagn_i(tagn_i_slave),
	.we_i(we_i),
	.stb_i(stb_i),
	.cyc_i(cyc_i),
	//output
	.mem_adr_o(addressBus),
	.dataBus(dataBus),
	.mem_r_o(r),
	.mem_w_o(w),
	.ssp_sel_o(PSEL),
	.ssp_w_o(PWRITE),
	.dat_o(dat_o_slave),
	.tagn_o(tagn_o_slave),
	.ack_o(ack_o)
);
cmu CMU (
	//input
	.clk_i(clk),
	.clear_i(clear),
	.ssp_intr_i({SSPTXINTR, SSPRXINTR}),
	//output
	.phi1(phi1),
	.phi2(phi2),
	.clk_o(clk_o),
	.clear_o(clear_o)
);
wire [7:0] ssp_prdata;

assign dataBus[7:0] = (PSEL && !PWRITE) ? ssp_prdata : 8'bz;
my_ssp SSP(
	.CLEAR_B(ssp_clear),
	.PCLK(clk_o),
	.PSEL(PSEL),
	.PWRITE(PWRITE),
	.PWDATA(dataBus[7:0]),
	.PRDATA(ssp_prdata),
	.SSPTXINTR(SSPTXINTR),
	.SSPRXINTR(SSPRXINTR),
	.SSPCLKOUT(SSPCLKIN),
	.SSPFSSOUT(SSPFSSIN),
	.SSPTXD(SSPRXD),
	.SSPCLKIN(SSPCLKIN),
	.SSPFSSIN(SSPFSSIN),
	.SSPRXD(SSPRXD),
	.SSPOE_B(oe_b)
);



//------------------------------------------------------------------------

endmodule

module cmu (
	clk_i,
	clear_i,
	ssp_intr_i,
	phi1,
	phi2,
	clk_o,
	clear_o
);
input clk_i, clear_i;
input [1:0] ssp_intr_i;
output phi1; 
output phi2; 
output clk_o; 
output clear_o;

reg [1:0] clk_cnt;
/*
reg phi1_reg, phi2_reg;
assign phi1 = phi1_reg;
assign phi2 = phi2_reg;
*/
always @(posedge clk_i) begin
	if (!clear_i) begin
		clk_cnt <= 0;
	end
	else begin
		clk_cnt <= clk_cnt + 1;
	end
end
reg phi1_reg, phi2_reg;
always @(posedge clk_i) begin
	if (!clear_i) begin
		phi1_reg <= 0;
	end
	else begin
		if (clk_cnt == 3 && !ssp_intr_i[1]) begin
			phi1_reg <= 1;
		end
		else begin
			phi1_reg <= 0;
		end
	end
end
always @(posedge clk_i) begin
	if (!clear_i) begin
		phi2_reg <= 0;
	end
	else begin
		if (clk_cnt == 1 && !ssp_intr_i[1]) begin
			phi2_reg <= 1;
		end
		else begin
			phi2_reg <= 0;
		end
	end
end
assign phi1 = phi1_reg;
assign phi2 = phi2_reg;
//assign phi1 = (clk_cnt == 0 && !ssp_intr_i[1] == 0)? 1:0;
//assign phi2 = (clk_cnt == 2 && !ssp_intr_i[1] == 0)? 1:0;
assign clk_o = clk_i;
reg clr_sync;
always @(posedge clk_o) begin
  clr_sync <= clear_i; 
end
assign clear_o = clr_sync; 
endmodule

module wishbone_master(
	// face arm
	addressBus,
	dataBus,
	mem_req,
	memoryRead,
	memoryWrite,
	mwr_arm,
	rst_i,
	clk_i,		
	//face wish_slave
	//input
	dat_i,
	ack_i,
	tagn_i,
	//output
	adr_o,
	dat_o,
	we_o,
	stb_o,
	cyc_o,
	tagn_o
);
input rst_i; 
input clk_i ;
input mem_req ;
input mwr_arm ;
input memoryRead ;
input memoryWrite;
input [25:0] addressBus;
input [31:0] dat_i;
input ack_i; 
input tagn_i;
output [25:0] adr_o;
output [31:0] dat_o;
output we_o; 
output stb_o; 
output cyc_o; 
output tagn_o;
inout [31:0] dataBus;

localparam [2:0]
  IDLE    ='d0,
  HANDSHAKE_READ ='d1,
  WAIT_READ    ='d2,
  FINISH_READ ='d3,
  HANDSHAKE_WRITE ='d4,
  WAIT_WRITE ='d5,
  FINISH_WRITE ='d6;

reg [2:0] cur_state, nxt_state;
always @(posedge clk_i) begin
	if (!rst_i) begin
		cur_state <= IDLE;
	end
	else begin
		cur_state <= nxt_state;
	end
end
always @(*) begin
	case(cur_state)
		IDLE: begin
			if (!mem_req && !mwr_arm) begin
				nxt_state = WAIT_READ; //HANDSHAKE_READ
			end
			else if (!mem_req && mwr_arm) begin
				nxt_state = WAIT_WRITE; //
			end
			else begin
				nxt_state = cur_state;
			end
		end
		HANDSHAKE_READ: begin
			nxt_state = WAIT_READ;
		end
		WAIT_READ: begin
			if (ack_i) begin
				nxt_state = IDLE; //FINISH_READ
			end
			else begin
				nxt_state = cur_state;
			end
		end
		/*
		FINISH_READ: begin
			nxt_state = IDLE;
		end
		*/
		HANDSHAKE_WRITE: begin
			nxt_state = WAIT_WRITE;
		end
		WAIT_WRITE: begin
			if (ack_i) begin
				nxt_state = IDLE;
			end
			else begin
				nxt_state = cur_state;
			end
		end
		default: nxt_state = cur_state;
	endcase
end
 // ============ read/write signal ===============
assign stb_o = (mem_req == 0)? 1:0; //cur_state == HANDSHAKE_READ || cur_state == HANDSHAKE_WRITE ||
assign cyc_o = stb_o;
//assign we_o = (cur_state == HANDSHAKE_READ || cur_state == WAIT_READ)? 0:1;
reg we_o_reg;
always @(*) begin
	we_o_reg = 0;
	if (!mem_req && !mwr_arm) begin
		we_o_reg = 0;
	end
	else if (!mem_req && mwr_arm) begin
		we_o_reg = 1;
	end
end
assign we_o = we_o_reg;

assign adr_o = addressBus;
/*
always @(posedge clk_i) begin
	if (!rst_i) begin
		dataBus_reg <= 0;
	end
	else begin
		if (cur_state == WAIT_READ && ack_i && !we_o) begin
			dataBus_reg <= dat_i;
		end
	end
end
*/
// dataBus: in ==> data from ARM writing to slave ==> dat_o
// dataBus: out ==> data from slave (dat_i) to ARM
assign dataBus = (ack_i && !we_o)? dat_i : 32'bz; // output //cur_state == WAIT_READ &&

reg [31:0] dat_o_reg;
always @(posedge clk_i) begin
	if (!rst_i) begin
		dat_o_reg <= 0;
	end
	else begin
		if (!mem_req && mwr_arm) begin
			dat_o_reg <= dataBus;
		end
		else if (cur_state == IDLE) begin
			dat_o_reg <= 0;
		end
	end
end

assign dat_o = (!mem_req && mwr_arm) ? dat_o_reg : 32'b0; //input
//assign dat_o = (!mem_req && mwr_arm) ? dataBus:0;
endmodule

module wishbone_slave(
	// face wish_master
	rst_i,
	clk_i,
	dat_i,
	adr_i,
	tagn_i,
	we_i,
	stb_i,
	cyc_i,
	//output
	mem_adr_o,
	dataBus,
	mem_r_o,
	mem_w_o,
	ssp_sel_o,
	ssp_w_o,
	dat_o,
	tagn_o,
	ack_o
);
input rst_i ;
input clk_i; 
input tagn_i; 
input we_i; 
input stb_i; 
input cyc_i;
input [31:0] dat_i;
input [25:0] adr_i;
output [25:0] mem_adr_o;
output mem_r_o; 
output mem_w_o; 
output ssp_sel_o; 
output ssp_w_o; 
output tagn_o; 
output ack_o;
output [31:0] dat_o;
inout [31:0] dataBus; 

localparam [1:0]
  IDLE    ='d0,
  READ_MEM ='d1,
  READ_SSP    ='d2,
  //WAIT_MEM ='d3,
  WRITE_SSP ='d3;
  //WRITE_FINISH ='d5,
  //WAIT_SSP ='d6;
reg [2:0] cur_state, nxt_state;
always @(posedge clk_i) begin
	if (!rst_i) begin
		cur_state <= IDLE;
	end
	else begin
		cur_state <= nxt_state;
	end
end
always @(*) begin
	nxt_state = cur_state;
	case(cur_state)
		IDLE: begin
			if (cyc_i && stb_i && !we_i) begin
				if (adr_i == 26'h010001) begin
					nxt_state = READ_SSP;
				end
				else if (adr_i < 26'h010000)begin
					nxt_state = READ_MEM;
				end
			end
			else if (cyc_i && stb_i && we_i) begin
				nxt_state = WRITE_SSP;
			end
		end
		READ_MEM: begin
			nxt_state = IDLE;
		end
		READ_SSP: begin
			nxt_state = IDLE;
		end
		/*
		WAIT_MEM: begin
			
		end
		WAIT_SSP: begin
			
		end
		*/
		WRITE_SSP: begin
			nxt_state = IDLE;	
		end

	endcase
end
assign mem_w_o = 0; // no operation writing to the MEM
// Read from MEM
assign mem_r_o = (cyc_i && stb_i && !we_i && adr_i < 26'h010000) ?1:0;
assign mem_adr_o = (cyc_i && stb_i && !we_i && adr_i < 26'h010000)? adr_i:0;
// from SSP
reg ssp_sel_o_reg, ssp_w_o_reg;
reg ack_o_reg;
reg [3:0] cnt_sel;
reg [2:0] rd_cnt;
always @(posedge clk_i) begin
	if (!rst_i) begin
		rd_cnt <= 0;
	end 
	else begin
		if (cyc_i && stb_i && !we_i && adr_i == 26'h010001) begin
			rd_cnt <= rd_cnt + 1;
		end
		else begin
			rd_cnt <= 0;
		end
	end
end
always @(posedge clk_i) begin
	if (!rst_i) begin
		cnt_sel <= 0;
	end
	else begin
		if (cyc_i && stb_i && we_i && adr_i == 26'h010000) begin
			cnt_sel <= cnt_sel + 1;
		end
		else begin
			cnt_sel <= 0;
		end
	end
end
always @(*) begin
	ssp_sel_o_reg = 0;
	if (cyc_i && stb_i && we_i && cnt_sel == 1) begin //write
		ssp_sel_o_reg = 1;
	end
	else if (cyc_i && stb_i && !we_i && rd_cnt == 1) begin //read from sel
		ssp_sel_o_reg = 1;
	end
end

always @(*) begin
	ssp_w_o_reg = 0;
	if (cyc_i && stb_i && we_i) begin
		ssp_w_o_reg = 1;
	end 
	else if (cyc_i && stb_i && !we_i && adr_i == 26'h010001) begin
		ssp_w_o_reg = 0;
	end
end
assign ssp_sel_o = ssp_sel_o_reg;
assign ssp_w_o = ssp_w_o_reg;
// dataBus out: write data to SSP
// dataBus in: receive data from memory or SSP ==> dat_o back to master
// write from SSP
assign dataBus = (cyc_i && stb_i && we_i && adr_i == 26'h010000)? {24'b0, dat_i[7:0]} : 32'bz; 
//assign dataBus[7:0] = (PSEL && !PWRITE) ? ssp_prdata : 8'bz;
// read from MEM/SSP

reg [31:0] dat_o_reg;
/*
always @(posedge clk_i) begin
	if (!rst_i) begin
		dat_o_reg <= 0;
	end
	else begin
		if (cyc_i && stb_i && !we_i && adr_i == 26'h010001) begin
			dat_o_reg <= {24'b0, dataBus[7:0]};
		end
		else if (cyc_i && stb_i && !we_i && adr_i < 26'h010000) begin
			dat_o_reg <= dataBus;
		end
		else begin
			dat_o_reg <= dat_o_reg;
		end
	end
end
*/
reg [7:0] store_reg;
always @(posedge clk_i) begin
	if (!rst_i) begin
		store_reg <= 0;
	end
	else begin
		if (adr_i == 26'h010001 && rd_cnt == 1) begin
			store_reg <= dataBus[7:0];
		end
		else if (adr_i == 26'h010001 && rd_cnt > 1) begin
			store_reg <= store_reg;
		end
		else begin
			store_reg <= 0; 
		end
	end
end
always @(*) begin
	if (cyc_i && stb_i && !we_i && adr_i == 26'h010001 && rd_cnt == 1) begin
		dat_o_reg = {24'b0, dataBus[7:0]};
	end
	else if (cyc_i && stb_i && !we_i && adr_i == 26'h010001 && rd_cnt > 1) begin
		dat_o_reg = {24'b0, store_reg};
	end
	else if (cyc_i && stb_i && !we_i && adr_i < 26'h010000) begin
		dat_o_reg = dataBus;
	end
	else begin
		dat_o_reg = 0;
	end
end
assign dat_o = dat_o_reg;
//assign dat_o = (cur_state == READ_SSP)?{24'b0, dataBus[7:0]}:(cur_state == READ_MEM? dataBus:0); 
// ack control
/*
always @(posedge clk_i) begin
	if (!rst_i) begin
		ack_o_reg <= 0;
	end
	else begin
		if ((cur_state == READ_MEM || cur_state == READ_SSP || cur_state == WRITE_SSP) && nxt_state == IDLE) begin
			ack_o_reg <= 1;
		end
		else begin
			ack_o_reg <= 0;
		end
	end
end
*/
always @(*) begin
	if (cyc_i) begin
		ack_o_reg = 1;
	end
	else begin
		ack_o_reg = 0;
	end
end
assign ack_o = ack_o_reg;
//assign ack_o = (cur_state == READ_MEM || cur_state == READ_SSP || cur_state == WRITE_SSP)
endmodule

// ====================== FROM PART 1 ==========================
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
`endif