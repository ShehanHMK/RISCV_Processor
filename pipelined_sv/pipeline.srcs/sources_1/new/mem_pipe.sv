`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/30/2023 02:49:58 AM
// Design Name: 
// Module Name: mem_pipe
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


module mem_pipe(
    input logic clk,
    input logic mem_flush,
    input logic mem_wrt_en,
    input logic mem_alu2mem_sig,
    input logic[31:0] mem_ALU_out,
    input logic [4:0]mem_rd_addr,
    input logic [31:0]mem_memout,
    output logic pc_wrt_en,
    output logic pc_alu2mem_sig,
    output logic [31:0]pc_ALU_out,
    output logic [4:0]pc_rd_addr,
    output logic [31:0]pc_memout
);

always_ff @(posedge clk) begin
    if (mem_flush) begin
      pc_wrt_en<=0;
      pc_alu2mem_sig<=0;
      pc_ALU_out<=0;
      pc_rd_addr<=0;
      pc_memout<=0;
    end else begin
      pc_wrt_en<=mem_wrt_en;
      pc_alu2mem_sig<=mem_alu2mem_sig;
      pc_ALU_out<=mem_ALU_out;
      pc_rd_addr<=mem_rd_addr;
      pc_memout<=mem_memout;    
    end
  end

endmodule
