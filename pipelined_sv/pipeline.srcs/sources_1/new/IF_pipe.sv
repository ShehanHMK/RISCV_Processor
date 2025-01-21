`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 11:08:15 AM
// Design Name: 
// Module Name: IF_pipe
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


module IF_pipe#(parameter inst_width=32,pc_width=32)(
input logic [inst_width-1:0]instruction_fetch,
input logic [pc_width-1:0]current_pc_in,
input logic [pc_width-1:0]next_pc_in,
input logic clk,
input logic rst,
input logic IF_flush,
output logic [inst_width-1:0]instruction_deco,
output logic [pc_width-1:0]current_pc_out,
output logic [pc_width-1:0]next_pc_out
    );
    
always_ff @(posedge clk) begin
    if (IF_flush) begin
      current_pc_out<=0;
      next_pc_out<=0;
      instruction_deco<=0;
    end else begin
      current_pc_out<=current_pc_in;
      next_pc_out<=next_pc_in;
      instruction_deco<=instruction_fetch;
    end
  end

    
endmodule
