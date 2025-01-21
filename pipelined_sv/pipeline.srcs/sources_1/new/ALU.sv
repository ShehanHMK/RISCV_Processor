`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 05:59:56 PM
// Design Name: 
// Module Name: ALU
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


module ALU#(parameter width=32,op_bits=4)(
input logic signed [width-1:0]reg1,
input logic signed [width-1:0]reg2,
input logic [op_bits-1:0]operation,
output logic signed [width-1:0]out,
output logic zero_bit
//output logic lst_bit,
//output logic lstu_bit
 );
    
 always_comb 
    begin
    zero_bit='b0;
   // neg_bit='b0;
    //out='b0;
        case(operation)
            'b0000:out=reg1+reg2; //add
            'b0001:begin //sub
                    out=reg1-reg2;
                    zero_bit=(out==0)?1:0;
                    end         
            'b0010: out=reg1&reg2; //and
            'b0011: out=reg1|reg2; //or
            'b0100: out=reg1^reg2; //xor
            'b0101: out=reg1<<$unsigned(reg2); //sll
            'b0110: out=$unsigned(reg1)>>$unsigned(reg2); //srl
            'b0111: out=reg1 >>>$unsigned(reg2); //sra
            'b1000: out=reg1<reg2; //slt
            'b1001: out=$unsigned(reg1)<$unsigned(reg2);//sltu
            'b1010: out=$unsigned(reg1)*$unsigned(reg2);
            default:out='bx;    
        endcase
    end
endmodule
