import controls::* ;


module Top #(parameter Reg_size = 32)    // Add required parameters

(

	input  logic clk_in,
	input  logic rst,
	input  logic en,
	input  logic wr,
	input  logic [7:0] address_line,
	input  logic [7:0] data_line,
	
	//output logic [Reg_size-1:0] result_out,  // Change- just for testing  // --->>>>>>>>>> Define an output   
	//output logic [15:0] data_out,
	
	output logic [0:6] s0,
	output logic [0:6] s1,   // Seven Segments 
	output logic [0:6] s2,
	output logic [0:6] s3,
	output logic [0:6] s4,
	output logic [0:6] s5,
	output logic [0:6] s6,
	output logic [0:6] s7
	

);
	// ----------- Local parameter Declaration  ------------ 
	

	localparam REGFILE_ADDR   = 5  ;    // Register file address lines size
	localparam NUM_OF_REG     = 32 ;    // Number of Registers inside the register file
	localparam IMEM_ADDR_BITS = 32 ;    // Instruction memory address lines
	localparam CONTROL_BITS   = 16 ;    // Number of output control lines from control unit 
	localparam DMEM_ADDR_BITS = 32 ;    // Data memory address lines
	
	
	// ----- clock dividing process -------- 
	
	logic clk;
	
	clk_divider clk_div(.clock_in(clk_in),.clock_out(clk)) ; 
	
	
	
	// ----------  INTERNAL DATA PATH WIRE DECLARATION  ------------ 
	

	logic [Reg_size-1:0] pc2Im    ;                 // PC to Instruction memory wire
	logic [Reg_size-1:0] add1_out ;                 // PC address + 4 adder out wire
	logic [Reg_size-1:0] add2_out ;                 // PC address + branch adder out wire
	logic [Reg_size-1:0] pcsrc_clk;                 // PC source  2mux to PC wire  
	
	logic [Reg_size-1:0] shift_out_wire;            // Shifter to Adder2  wire
	logic [Reg_size-1:0] D_mem_out;                 // Data memory out wire (RD)
	
	logic [Reg_size-1:0] result_out;                // Result source mux out wire bus
	
	logic [Reg_size-1:0] instr ;  // Instruction out from the Instruction memory
	
	tri   signed [Reg_size-1:0] RD1, RD2 ;  // Register file Data out lines
	
	logic signed [Reg_size-1:0] alu_src_mux_out ;   // ALU source Mux data out line
	
	logic signed [Reg_size-1:0] alu_out ;           // ALU result out data line
	
	logic signed [Reg_size-1:0] extender_out ;      // Sign extender out wires
	
	logic zero_wire,neg_wire ;         // Zero and negative flag wires 
	
	logic [Reg_size-1:0] dmem_address;
	logic [Reg_size-1:0] dmem_data;
	
	logic [15:0] data_out;
	
	
	
	// ---------- Seven Segment Display Wires -------------
	
	logic [15:0] address_line_bcd ;
	logic [15:0] data_line_bcd    ;
	logic [15:0] data_out_bcd;
	
	
	
		
	// -------------- CONTROL UNIT  OUT WIRES -------------
	
	
	
	logic      pcsrc_wire    ;                  // control signal from control unit to pc source select mux
	logic      alusrc_wire   ;                  // control signal from control unit to alu source select mux
	logic      resultsrc_wire;                  // control signal from control unit to result source select mux
	logic      regwrite_wire ;                  // control signal from control unit to register file for the write enable
	
	
	alu_op     alu_ctrl_wire ;                  // control signals from control unit to alu function selection
	Imm_ex_op  immsrc_wire   ;                  // control signals from control unit to sign extender immediate type selection
	mem_op     memwrite_wire ;                  // control signal from control unit to Data memory for enabling Data write
	
	mem_op     dmem_control  ;
	
	
	assign dmem_address = en ? alu_out : {{{Reg_size-8}{1'b0}},address_line}  ; 
	assign dmem_data    = (~en & wr) ? {{{Reg_size-8}{1'b0}},data_line} : RD2 ; 
	
	
	always_comb begin
	
		if(en) dmem_control = memwrite_wire ; 
		
		else begin
		
			if(wr) dmem_control = mem_op'(7) ;
	
			else   dmem_control = mem_op'(0) ;
			
		end
	
	
	end
	
	
	assign data_out = (~en & ~wr) ? D_mem_out[15:0] : 16'b0 ;
	
 	
	
	// ----------------- Seven Segment Displays ------------------
	
	bin2bcd unit1 (data_line,data_line_bcd) ;
	bin2bcd unit2 (address_line,address_line_bcd) ;
	bin2bcd unit3 (data_out[13:0],data_out_bcd) ;
	
	ss segment0 (data_out_bcd[3:0],s0) ;
	ss segment1 (data_out_bcd[7:4],s1) ;
	ss segment2 (data_out_bcd[11:8],s2) ;
	ss segment3 (data_out_bcd[15:12],s3) ;
	
	ss segment4 (data_line_bcd[3:0],s4) ;
	ss segment5 (data_line_bcd[7:4],s5) ;
	
	ss segment6 (address_line_bcd[3:0],s6) ;
	ss segment7 (address_line_bcd[7:4],s7) ;
	
	
	
	//---------------------DATA PATH ----------------------------
	
 	
	program_counter #(.Reg_size(Reg_size))  PC
	
	(
		.clk(clk),
		.rst(~rst),              // Push buttons are active LOW
		.en(en)  ,
      .pc_next(pcsrc_clk),
		.pc_out(pc2Im)
	);
	
	
	
	adder #(.Bus_size(Reg_size)) Adder1    // Adding 4 to current PC value
	
	(
		.a(pc2Im) , 
		.b('b100) ,         // value of 4 
		.out(add1_out)
	) ; 

	
	shifter #(.Bus_size(Reg_size)) Shift_Left_1
	
	(
		.shift_in(extender_out),
		.shift_out(shift_out_wire)
		
	);
	


	adder #(.Bus_size(Reg_size)) Adder2    // Adding Branch_immediate to current PC value
	
	(
		.a(pc2Im) ,
		.b(shift_out_wire) ,            // connected the shifter out
		.out(add2_out)
	
	);
	
	

	
	mux_2 #(.Input_size(Reg_size))  PC_Source 
	
	(	
		.y0(add1_out) , 
		.y1(add2_out) ,
		.sel(pcsrc_wire) ,
		
		.out(pcsrc_clk)
	) ; 
	
	
	
	
	I_memory #(.Word_size(Reg_size), .Addr_bits(IMEM_ADDR_BITS))  I_mem
	
	(
		.addr(pc2Im) , 
		
		.instr(instr)
	);  
	
	
	
	
	reg_file_3bus #(.Reg_size(Reg_size),
						 .Addr_bits(REGFILE_ADDR))   Register_File
				 
	(
		.clk(clk),
		.WE(regwrite_wire),           // control signal from control unit for the write enable       
		.A1(instr[19:15]),            // instr[19:15] is rs1 field in instruction
 		.A2(instr[24:20]),            // instr[24:20] is rs2 field in instruction
		.A3(instr[11:7]),             // instr[11:7]  is rd  field in instruction
		.WD(result_out),              // Alu result from the result source selector mux
		
		.RD1(RD1),
		.RD2(RD2)
	
	);
	
	
	
	
	mux_2 #(.Input_size(Reg_size))  Alu_src 
	
	(
		.y0(RD2),
		.y1(extender_out),         
		.sel(alusrc_wire),                 
		
		.out(alu_src_mux_out)
	);
	
	
	
	alu #(.BUS_WIDTH(Reg_size)) ALU
	
	(
		.a(RD1),
		.b(alu_src_mux_out),
		.sel(alu_ctrl_wire),                      
		
		.alu_out(alu_out),
		.zero(zero_wire),
		.neg(neg_wire)
		
	);
	
	
	D_memory #(.Word_size(Reg_size),.Addr_bits(DMEM_ADDR_BITS)) D_mem
	
	(
		.clk(clk),
		.rd_wr(dmem_control),
		.addr(dmem_address),
		.din(dmem_data),
		.dout(D_mem_out)
	
	);
	
	
	
	
	
	Sign_extender #(.Reg_size(Reg_size)) Sign_Extender 
	
	(
		.Instr(instr[31:7]),        // Inputs the instruction without opcode into sign extender unit
		.Im_type(immsrc_wire),
		
		.Im_out(extender_out)
	
	);
	
	
	
	
	
	
	control_unit #(.rom_bits(CONTROL_BITS)) Control_Unit     
	
	(
		.opcode(instr[6:0]),              // Inputs 
		.funct3(instr[14:12]),
		.funct7_5(instr[30]),  
		.zero(zero_wire),
		.neg(neg_wire),
													 // Outputs
		.pc_src(pcsrc_wire),
		.result_src(resultsrc_wire),
		.mem_rdwr(memwrite_wire),
		.alu_src(alusrc_wire),
		.regwrite(regwrite_wire),
		.imm_src(immsrc_wire),
		.alu_ctrl(alu_ctrl_wire)
	

	); 
	
	
	
	
	mux_2 #(.Input_size(Reg_size)) Result_src
	(
		.y0(alu_out),
		.y1(D_mem_out),       
		.sel(resultsrc_wire),
		
		.out(result_out)
	
	);
	
	
endmodule 


























