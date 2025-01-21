`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 11:23:03 AM
// Design Name: 
// Module Name: datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module datapath#(parameter width=32,pc_width=32)(
    input logic clk,rst,
	 input logic [4:0] disp_addrline,
	 
	 output logic [0:6] s0,
	 output logic [0:6] s1,   // Seven Segments 
	 output logic [0:6] s2,
	 output logic [0:6] s3,
	 output logic [0:6] s4,
	 output logic [0:6] s5,
	 output logic [0:6] s6,
	 output logic [0:6] s7
	 
 );

 
logic signed [width-1:0] disp_regvalout ;
 
 
//pipe flush
logic IF_flush;
logic ID_flush;
logic mem_flush;
logic EX_flush;

//pc stage
logic pc_mux_pc2branch;
logic pc_wrt_en;
logic pc_alu2mem_sig;
logic signed [31:0]pc_ALU_out;
logic [4:0]pc_rd_addr;
logic signed[31:0] pc_memout;
logic signed[31:0] pc_alumem_data;
logic [31:0]pc_in;

 //IF stage
logic [pc_width-1:0]IF_pc;
logic [pc_width-1:0]IF_pc_next;
logic [width-1:0]IF_instruction;


//ID stage
logic [width-1:0]ID_instruction;
logic [pc_width-1:0]ID_pc;
logic [pc_width-1:0]ID_pc_next;
logic signed [width-1:0]ID_reg1_val,ID_reg2_val;
logic signed [width-1:0]ID_immediate;
logic ID_wrt_en;
logic [3:0]ID_operation;
logic ID_mux_rs2imm;
logic ID_memread;
logic ID_memwrt;
logic ID_alu2mem_sig;
logic [2:0]ID_space_sig;
logic ID_branch;
logic [1:0]ID_branch_type;
logic ID_jump;
logic ID_memcop;

 //ex stage
logic signed [width-1:0]ex_reg1_val,ex_reg2_val;
logic [width-1:0]ex_pc;
logic signed [width-1:0]ex_immediate;
logic ex_wrt_en;
logic [3:0]ex_operation;
logic ex_mux_rs2imm;
logic ex_memread;
logic ex_memwrt;
logic ex_alu2mem_sig;
logic [2:0]ex_space_sig;
logic ex_branch;
logic [1:0]ex_branch_type;
logic ex_jump;

logic signed [width-1:0] ex_rs2imm_mux_out;
logic signed [width-1:0] ex_ALU_out;


logic ex_zero_bit;
logic [width-1:0]ex_branch_pc;
logic [4:0]ex_rd_addr,ex_r1_addr,ex_r2_addr; 
 
 //mem stage
 logic mem_memread;
 logic mem_memwrt;
 logic mem_wrt_en;
 logic mem_alu2mem_sig;
 logic mem_branch;
 logic mem_jump;
 logic [width-1:0]mem_ALU_out;
 logic [width-1:0]mem_reg2_val;
 logic [4:0]mem_rd_addr;
 logic mem_zero_bit;
 logic [1:0]mem_branch_type;
 logic [2:0]mem_space_sig;
 logic [31:0]mem_branch_pc;
 logic [width-1:0]mem_memout;
 //1st domain
 
 Mux mux_pcbranch_blk(
    .input_1(IF_pc_next),
    .input_2(mem_branch_pc),
    .sig(pc_mux_pc2branch),
    .mux_out(pc_in)
 );
 
 
 program_count program_count_blk(
    .rst(rst),
    .clk(clk),
    .pc_in(pc_in),
    .pc_out(IF_pc)
 );
 
 
 
 //2nd domain
 
Adder Adder_blk_pc(
    .add_input1(IF_pc),
    .add_input2(32'd4),
    .out(IF_pc_next)
);

Instruction_mem Instruction_mem_blk(
    .pc(IF_pc),
    .instruction(IF_instruction)
);   

IF_pipe IF_pipr_blk(
    .instruction_fetch(IF_instruction),
    .current_pc_in(IF_pc),
    .next_pc_in(IF_pc_next),
    .clk(clk),
    .rst(rst),
    .IF_flush(IF_flush),
    .instruction_deco(ID_instruction),
    .current_pc_out(ID_pc),
    .next_pc_out(ID_pc_next)
);

//3rd domain

register register_blk(
    .reg1_addr(ID_instruction[19:15]),
    .reg2_addr(ID_instruction[24:20]),
	 .disp_addr(disp_addrline),
    .wrt_addr(pc_rd_addr),
    .wrt_data(pc_alumem_data),
    .reg1_val(ID_reg1_val),
    .reg2_val(ID_reg2_val),
	 .disp_regval(disp_regvalout),
    .clk(clk),
    .rst(rst),
    .wrt_en(pc_wrt_en)
);

Imm_gen Imm_gen_blk(
    .instruction(ID_instruction),
    .Imm_out(ID_immediate)
);

Microprograming microprograming(
    .instruction(ID_instruction),
    .wrten(ID_wrt_en),
    .operation(ID_operation),
    .mux_rs2imm(ID_mux_rs2imm),
    .memread(ID_memread),
    .memwrt(ID_memwrt),
    .alu2mem_sig(ID_alu2mem_sig),
    .space_sig(ID_space_sig),
    .branch(ID_branch),
    .branch_type(ID_branch_type),
    .jump(ID_jump),
    .memcop(ID_memcop)
);


ID_pipe ID_pipe_blk(
    .clk(clk),
    .rst(rst),
    .ID_flush(ID_flush),
    .ID_rd_addr(ID_instruction[11:7]),
    .ID_r1_addr(ID_instruction[19:15]),
    .ID_r2_addr(ID_instruction[24:20]),
    .ID_reg1_val(ID_reg1_val),
    .ID_reg2_val(ID_reg2_val),
    .ID_memread(ID_memread),
    .ID_memwrt(ID_memwrt),
    .ID_operation(ID_operation),
    .ID_mux_rs2imm(ID_mux_rs2imm),
    .ID_wrt_en(ID_wrt_en),
    .ID_immediate(ID_immediate),
    .ID_alu2mem_sig(ID_alu2mem_sig),
    .ID_space_sig(ID_space_sig),
    .ID_branch(ID_branch),
    .ID_branch_type(ID_branch_type),
    .ID_jump(ID_jump),
    .ID_pc(ID_pc),
    .ex_reg1_val(ex_reg1_val),
    .ex_reg2_val(ex_reg2_val),
    .ex_memread(ex_memread),
    .ex_memwrt(ex_memwrt),
    .ex_operation(ex_operation),
    .ex_mux_rs2imm(ex_mux_rs2imm),
    .ex_wrt_en(ex_wrt_en),
    .ex_immediate(ex_immediate),
    .ex_alu2mem_sig(ex_alu2mem_sig),
    .ex_branch(ex_branch),
    .ex_jump(ex_jump),
    .ex_space_sig(ex_space_sig),
    .ex_branch_type(ex_branch_type),
    .ex_pc(ex_pc),
    .ex_rd_addr(ex_rd_addr),
    .ex_r1_addr(ex_r1_addr),
    .ex_r2_addr(ex_r2_addr)
);

//4th domain
Mux Mux_blk (
    .input_1(ex_reg2_val),
    .input_2(ex_immediate),
    .sig(ex_mux_rs2imm),
    .mux_out(ex_rs2imm_mux_out)
);


ALU ALU_blk(
    .reg1(ex_reg1_val),
    .reg2(ex_rs2imm_mux_out),
    .operation(ex_operation),
    .out(ex_ALU_out),
    .zero_bit(ex_zero_bit) 
);

Adder Adder_blk_branch(
    .add_input1(ex_pc),
    .add_input2(ex_immediate),
    .out(ex_branch_pc)
);

EX_pipe ex_pipe_blk(
    .clk(clk),
    .EX_flush(EX_flush),
    .ex_rd_addr(ex_rd_addr),
    .ex_ALU_out(ex_ALU_out),
    .ex_reg2_val(ex_reg2_val),
    .ex_zero_bit(ex_zero_bit),
    .ex_branch_pc(ex_branch_pc),
    .ex_memread(ex_memread),
    .ex_memwrt(ex_memwrt),
    .ex_wrt_en(ex_wrt_en),
    .ex_alu2mem_sig(ex_alu2mem_sig),
    .ex_branch(ex_branch),
    .ex_jump(ex_jump),
    .ex_space_sig(ex_space_sig),
    .ex_branch_type(ex_branch_type),
    .mem_memread(mem_memread),
    .mem_memwrt(mem_memwrt),
    .mem_wrt_en(mem_wrt_en),
    .mem_alu2mem_sig(mem_alu2mem_sig),
    .mem_branch(mem_branch),
    .mem_jump(mem_jump),
    .mem_ALU_out(mem_ALU_out),
    .mem_reg2_val(mem_reg2_val),
    .mem_rd_addr(mem_rd_addr),
    .mem_zero_bit(mem_zero_bit),
    .mem_branch_type(mem_branch_type),
    .mem_space_sig(mem_space_sig),
    .mem_branch_pc(mem_branch_pc)   
);

//5th domain
Data_mem data_mem_blk(
    .clk(clk),
    .data_addr(mem_ALU_out),
    .data_in(mem_reg2_val),
    .memread(mem_memread),
    .memwrt(mem_memwrt),
    .space_sig(mem_space_sig),
    .data_out(mem_memout)
);

branch_pre branch_pre_blk(
    .is_zero(mem_zero_bit),
    .branch(mem_branch),
    .out_last_bit(mem_ALU_out[0]),
    .branch_type(mem_branch_type),
    .mux_pc2branch(pc_mux_pc2branch)
);

mem_pipe mem_pipe_blk(
    .mem_flush(mem_flush),
    .clk(clk),
    .mem_wrt_en(mem_wrt_en),
    .mem_alu2mem_sig(mem_alu2mem_sig),
    .mem_ALU_out(mem_ALU_out),
    .mem_rd_addr(mem_rd_addr),
    .mem_memout(mem_memout),
    .pc_wrt_en(pc_wrt_en),
    .pc_alu2mem_sig(pc_alu2mem_sig),
    .pc_ALU_out(pc_ALU_out),
    .pc_rd_addr(pc_rd_addr),
    .pc_memout(pc_memout)
);

Mux mux_Alumem_blk(
    .input_1(pc_ALU_out),
    .input_2(pc_memout),
    .sig(pc_alu2mem_sig),
    .mux_out(pc_alumem_data)
);



   logic [15:0] regval_bcd ;
	logic [15:0] aluout_bcd ;
	logic [15:0] reg_addr_bcd;
	

	bin2bcd unit1 (disp_regvalout,regval_bcd) ;
	bin2bcd unit2 (ex_ALU_out[7:0],aluout_bcd) ;
	bin2bcd unit3 (disp_addrline,reg_addr_bcd) ;
	
	
	ss segment0 (regval_bcd[3:0],s0) ;
	ss segment1 (regval_bcd[7:4],s1) ;
	ss segment2 (regval_bcd[11:8],s2) ;
	ss segment3 (regval_bcd[15:12],s3) ;
	

	ss segment4 (aluout_bcd[3:0],s4) ;
	ss segment5 (aluout_bcd[7:4],s5) ;
	
	ss segment6 (reg_addr_bcd[3:0],s6);
	ss segment7 (reg_addr_bcd[7:4],s7);
	







endmodule
