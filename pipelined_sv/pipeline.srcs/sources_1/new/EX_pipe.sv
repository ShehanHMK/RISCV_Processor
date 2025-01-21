`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 09:33:22 PM
// Design Name: 
// Module Name: EX_pipe
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


module EX_pipe#(width=32)(
    input logic clk,
    input logic [width-1:0]ex_ALU_out,
    input logic EX_flush,
    input logic [width-1:0]ex_reg2_val,
    input logic [4:0]ex_rd_addr,
    input logic ex_zero_bit,
    input logic [width-1:0]ex_branch_pc,
    input logic ex_memread,ex_memwrt,ex_wrt_en,ex_alu2mem_sig,ex_branch,ex_jump,
    input logic [2:0]ex_space_sig,
    input logic [1:0]ex_branch_type,
    output logic [width-1:0]mem_ALU_out,
    output logic [width-1:0]mem_reg2_val,
    output logic [4:0]mem_rd_addr,
    output logic mem_zero_bit,
    output logic [width-1:0]mem_branch_pc,
    output logic mem_memread,mem_memwrt,mem_wrt_en,mem_alu2mem_sig,mem_branch,mem_jump,
    output logic [2:0]mem_space_sig,
    output logic [1:0]mem_branch_type 
    );
    
always_ff @(posedge clk) begin
    if (EX_flush) begin
      mem_memread<=0;
      mem_memwrt<=0;
      mem_wrt_en<=0;
      mem_alu2mem_sig<=0;
      mem_branch<=0;
      mem_jump<=0;
      mem_ALU_out<=0;
      mem_reg2_val<=0;
      mem_rd_addr<=0;
      mem_zero_bit<=0;
      mem_branch_type<=0;
      mem_space_sig<=0;
    end else begin
      mem_memread<=ex_memread;
      mem_memwrt<=ex_memwrt;
      mem_wrt_en<=ex_wrt_en;
      mem_alu2mem_sig<=ex_alu2mem_sig;
      mem_branch<=ex_branch;
      mem_jump<=ex_jump;
      mem_ALU_out<=ex_ALU_out;
      mem_reg2_val<=ex_reg2_val;
      mem_rd_addr<=ex_rd_addr;
      mem_zero_bit<=ex_zero_bit;
      mem_branch_type<=ex_branch_type;
      mem_space_sig<=ex_space_sig;
      mem_branch_pc<=ex_branch_pc;
    end
  end
     
endmodule
