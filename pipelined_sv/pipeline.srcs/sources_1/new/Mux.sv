`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 06:06:28 PM
// Design Name: 
// Module Name: Mux
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


module Mux#(parameter width=32)(
    input logic signed [width-1:0]input_1,input_2,
    input logic sig,
    output logic signed [width-1:0]mux_out
);

always_comb begin
    unique case(sig) 
        1'b0:mux_out<=input_1;
        1'b1:mux_out<=input_2;
        default : mux_out <=32'bx;
    endcase
end
endmodule
