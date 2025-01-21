`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 04:16:21 PM
// Design Name: 
// Module Name: ID_pipe
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


module ID_pipe#(width=32)(
    input logic clk,rst,ID_flush,
    input logic signed [width-1:0]ID_reg1_val,ID_reg2_val,
    input logic [4:0] ID_rd_addr,ID_r1_addr,ID_r2_addr,
    input logic ID_memread,
    input logic ID_memwrt,
    input logic [3:0]ID_operation,
    input logic ID_mux_rs2imm,
    input logic ID_wrt_en,
    input logic signed [width-1:0]ID_immediate,
    input logic ID_alu2mem_sig,
    input logic [2:0]ID_space_sig,
    input logic ID_branch,
    input logic [1:0]ID_branch_type,
    input logic ID_jump,
    input logic [width-1:0]ID_pc,
    output logic signed [width-1:0]ex_reg1_val,ex_reg2_val,ex_pc,
    output logic ex_memread,ex_memwrt,ex_mux_rs2imm,ex_wrt_en,
    output logic [3:0]ex_operation,
    output logic [width-1:0]ex_immediate,
    output logic ex_alu2mem_sig,ex_branch,ex_jump,
    output logic [2:0]ex_space_sig,
    output logic [1:0]ex_branch_type,
    output logic [4:0]ex_rd_addr,ex_r1_addr,ex_r2_addr 
    );
    
    
always_ff @(posedge clk) begin
    if (ID_flush) begin
        ex_reg1_val<=32'b0;
        ex_reg2_val<=32'b0;
        ex_immediate<=32'b0;
        ex_space_sig<=3'b0;
        ex_branch_type<=2'b0;
        ex_memread<=0;
        ex_memwrt<=0;
        ex_operation<=4'b0;
        ex_mux_rs2imm<=0;
        ex_wrt_en<=0;
        ex_alu2mem_sig<=0;
        ex_branch<=0;
        ex_jump<=0;
        ex_rd_addr<=0;
        ex_r1_addr<=0;
        ex_r2_addr<=0;
        
        
    end else begin
        ex_reg1_val<=ID_reg1_val;
        ex_reg2_val<=ID_reg2_val;
        ex_immediate<=ID_immediate;
        ex_space_sig<=ID_space_sig;
        ex_branch_type<=ID_branch_type;
        ex_memread<=ID_memread;
        ex_memwrt<=ID_memwrt;
        ex_operation<=ID_operation;
        ex_mux_rs2imm<=ID_mux_rs2imm;
        ex_wrt_en<=ID_wrt_en;
        ex_alu2mem_sig<=ID_alu2mem_sig;
        ex_branch<=ID_branch;
        ex_jump<=ID_jump;
        ex_pc<=ID_pc;
        ex_rd_addr<=ID_rd_addr;
        ex_r1_addr<=ID_r1_addr;
        ex_r2_addr<=ID_r2_addr;
    end
  end

    
    
    
    
endmodule
