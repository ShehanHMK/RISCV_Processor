`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 02:40:56 PM
// Design Name: 
// Module Name: register
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


module register#(parameter addr_width=5,width=32,nu_reg=32)(
input logic [addr_width-1:0]disp_addr,
input logic [addr_width-1:0]reg1_addr,
input logic [addr_width-1:0]reg2_addr,
input logic [addr_width-1:0]wrt_addr,
input logic signed [width-1:0]wrt_data,
output logic signed [width-1:0]reg1_val,
output logic signed [width-1:0]reg2_val,
output logic signed [width-1:0]disp_regval,
input clk,
input rst,
input wrt_en
 );
 
logic [width-1:0]register[nu_reg-1:0];


 always_ff @(posedge clk) begin
 if(!rst) begin
    for (int i=0;i<nu_reg;i+=1)begin
        register[i]<=32'b0;
    end
 end
 else if(wrt_en && (wrt_addr!=(5'b00000))) begin
    register[wrt_addr]<=wrt_data;
 end
 end
 
assign reg1_val=register[reg1_addr];
assign reg2_val=register[reg2_addr];

assign disp_regval = register[disp_addr];

endmodule
