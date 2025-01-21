`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 03:43:12 PM
// Design Name: 
// Module Name: Imm_gen
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


module Imm_gen(
input logic [31:0]instruction,
output logic signed [31:0]Imm_out
);  
    always_comb begin
        unique case(instruction[6:0])
        //I type arithmatic operations
        7'b0010011: begin
            //SLLI , SRAI , SRLI
            if((instruction[14:12]==3'b101) ||(instruction[14:12]==3'b001))
                begin
                    Imm_out={instruction[24]? {27{1'b1}}: 27'b0,instruction[24:20]};
                end 
            else 
            //ADDI , XORI , SLTI , SLIU , ORI , ANDI
                begin
                    Imm_out={instruction[31]? 20'hFFFFF:20'h0 , instruction[31:20]}; 
                end 
            end
        //I type Load Instruction 
        7'b0000011:begin
            Imm_out={instruction[31]? 20'hFFFFF:20'h0 , instruction[31:20]};    
        end
        
        //S type instruction
        7'b0100011: begin
            Imm_out ={instruction[31]? {20{1'b1}}:20'b0 , instruction[31:25], instruction[11:7]};
        end
        
        //B type instruction
        7'b1100011: begin
            Imm_out = {instruction[31]? {20{1'b1}}:20'b0 , instruction[7], instruction[30:25],instruction[11:8],1'b0};
        end
        7'b1100111:begin 
            Imm_out = {instruction[31]? {20{1'b1}}:20'b0 , instruction[31:21],1'b0};
        end
        7'b1111111: Imm_out = {20'b0 , instruction[31:25], instruction[11:7]};
        default : Imm_out=32'bx;
        endcase
    end 
endmodule