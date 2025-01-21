`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 03:48:17 PM
// Design Name: 
// Module Name: Microprograming
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


module Microprograming(
    input logic [31:0]instruction,
    output logic wrten,
    output logic jump,
    output logic [3:0]operation,
    output logic mux_rs2imm,
    output logic memread,
    output logic memwrt,
    output logic alu2mem_sig,
    output logic [2:0]space_sig,
    output logic branch,
    output logic [1:0]branch_type,
    output logic memcop
);

//assign memcop='b0;
logic [16:0]ROM[40:0];

assign ROM[0]=17'b00001000000000000; //ADD
assign ROM[1]=17'b00011000000000000; //SUB
assign ROM[2]=17'b01011000000000000; //SLL
assign ROM[3]=17'b10001000000000000; //SLT
assign ROM[4]=17'b10011000000000000; //SLTU
assign ROM[5]=17'b01001000000000000; //XOR
assign ROM[6]=17'b01101000000000000; //SRL
assign ROM[7]=17'b01111000000000000; //SRA
assign ROM[8]=17'b00111000000000000; //OR
assign ROM[9]=17'b00101000000000000; //AND

assign ROM[10]=17'b00001010000000000; //ADDI
assign ROM[11]=17'b10001010000000000; //SLTI
assign ROM[12]=17'b10011010000000000; //SLIU
assign ROM[13]=17'b01001010000000000; //XORI
assign ROM[14]=17'b00111010000000000; //ORI
assign ROM[15]=17'b00101010000000000; //ANDI
assign ROM[16]=17'b01011010000000000; //SLLI
assign ROM[17]=17'b01101010000000000; //SRLI
assign ROM[18]=17'b01111010000000000; //SRAI

assign ROM[19]=17'b00001011010000000; //LB
assign ROM[20]=17'b00001011010010000; //LH
assign ROM[21]=17'b00001011010100000; //LW
assign ROM[22]=17'b00001011011000000; //LBU
assign ROM[23]=17'b00001011011010000; //LHU

assign ROM[24]=17'b00000010100000000; //SB
assign ROM[25]=17'b00000010100010000; //SH
assign ROM[26]=17'b00000010100100000; //SW

assign ROM[27]=17'b00010000000001000; //BEQ
assign ROM[28]=17'b00010000000001010; //BNE
assign ROM[29]=17'b10000000000001100; //BLT
assign ROM[30]=17'b10000000000001110; //BGE
assign ROM[31]=17'b10010000000001100; //BLTU
assign ROM[32]=17'b10010000000001110; //BGEU

assign ROM[33]=17'b00001110000000000; //JALR
assign ROM[34]=17'b10101000000000000; //Mul
assign ROM[35]=17'b00000000000000001; //Memcop
assign ROM[36]=17'b00001011010100001;
assign ROM[37]=17'b00000010100100001;

logic [16:0]control_out;
logic [8:0]control1;
logic [7:0]control2;
logic com_sig;
assign com_sig=(instruction[6:2]==5'b01100)||(instruction[6:2]==5'b01010)||(instruction[6:2]==5'b00100 & instruction[14:12]==3'b101);


always_comb  begin
	control2={instruction[14:12],instruction[6:2]};
	control1={instruction[30],instruction[14:12],instruction[6:2]};
	
    if(!(com_sig))begin
        //control2={instruction[14:12],instruction[6:2]};
        unique case(control2) 
            8'b00000100: control_out=ROM[10];
            8'b01000100: control_out=ROM[11];
            8'b01100100: control_out=ROM[12];
            8'b10000100: control_out=ROM[13];
            8'b11000100: control_out=ROM[14];
            8'b11100100: control_out=ROM[15];
            8'b00100100: control_out=ROM[16];
            8'b00000000: control_out=ROM[19];
            8'b00100000: control_out=ROM[20];
            8'b01000000: control_out=ROM[21];
            8'b10000000: control_out=ROM[22];
            8'b10100000: control_out=ROM[23];
            8'b00001000: control_out=ROM[24];
            8'b00101000: control_out=ROM[25];
            8'b01001000: control_out=ROM[26];
            8'b00011000: control_out=ROM[27];
            8'b00111000: control_out=ROM[28];
            8'b10011000: control_out=ROM[29];
            8'b10111000: control_out=ROM[30];
            8'b11011000: control_out=ROM[31];
            8'b11111000: control_out=ROM[32];
            8'b00011001: control_out=ROM[33];
            8'b00011111: control_out=ROM[35];
            default: control_out<=16'b0;
        endcase
        end else begin
        //control1={instruction[30],instruction[14:12],instruction[6:2]};
        unique case(control1)
            9'b000001100: control_out=ROM[0];
            9'b100001100: control_out=ROM[1];
            9'b000101100: control_out=ROM[2];
            9'b001001100: control_out=ROM[3];
            9'b001101100: control_out=ROM[4];
            9'b010001100: control_out=ROM[5];
            9'b010101100: control_out=ROM[6];
            9'b110101100: control_out=ROM[7];
            9'b011001100: control_out=ROM[8];
            9'b011101100: control_out=ROM[9]; 
            9'b010100100: control_out=ROM[17];
            9'b110100100: control_out=ROM[18];
            9'b000001010: control_out=ROM[34];
            default: control_out<=16'b0;
        endcase    
   
    end
end


assign operation=control_out[16:13];
assign wrten=control_out[12];
assign jump=control_out[11];
assign mux_rs2imm=control_out[10];
assign memread=control_out[9];
assign memwrt = control_out[8];
assign alu2mem_sig=control_out[7];
assign space_sig = control_out[6:4];
assign branch = control_out[3];
assign branch_type = control_out[2:1];
assign memcop=control_out[0];
 
endmodule
