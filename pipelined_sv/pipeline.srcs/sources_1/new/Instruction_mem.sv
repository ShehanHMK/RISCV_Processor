`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 10:57:47 AM
// Design Name: 
// Module Name: Instruction_mem
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


module Instruction_mem#(parameter inst_width=32,inst_space=10)(
input logic [inst_width-1:0]pc,
output logic [inst_width-1:0]instruction
  );
    
    logic [inst_width-1:0] Inst_mem [2**(inst_space)-1:0];
        
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////


    // Data memory initialization will be done using I-Type instructions (ADDI & SW)
//    assign Inst_mem[0]    = 32'h00007033;                           // NOP 
//    assign Inst_mem[1]    = 32'h00007033;                           // NOP
//    assign Inst_mem[2]    = 32'h00007033;                           // NOP
//    assign Inst_mem[3]    = 32'h00002023; //mem[0]=0     //SW x0, 0(x0)
//    assign Inst_mem[4]    = 32'h000020a3; //mem[1]=0     //SW x0, 1(x0)
//    assign Inst_mem[5]    = 32'h00002123; //mem[2]=0     //SW x0, 2(x0)
//    assign Inst_mem[6]    = 32'h000021a3; //mem[3]=0     //SW x0, 3(x0)
//    assign Inst_mem[7]    = 32'h00500293; //mem[4]=5     //ADDI x5, x0, 5     //SW x5, 4(x0)
//    assign Inst_mem[8]    = 32'h00502223;
//    assign Inst_mem[9]    = 32'h000022a3; //mem[5]=0     //SW x0, 5(x0)
//    assign Inst_mem[10]   = 32'h00002323; //mem[6]=0     //SW x0, 6(x0)
//    assign Inst_mem[11]   = 32'h000023a3; //mem[7]=0     //SW x0, 7(x0)
      //assign Inst_mem[0]   = 32'hff700293; //mem[8]=-9    //ADDI x5, x0, -9    //SW x5, 8(x0)
      //assign Inst_mem[5]   = 32'h00502423;
//    assign Inst_mem[14]   = 32'h000024a3; //mem[9]=0     //SW x0, 9(x0)
//    assign Inst_mem[15]   = 32'h00002523; //mem[10]=0    //SW x0, 10(x0)
//    assign Inst_mem[16]   = 32'h000025a3; //mem[11]=0    //SW x0, 11(x0)
    //assign Inst_mem[10]   = 32'h00c00293; //mem[12]=12   //ADDI x5, x0, 12    //SW x5, 12(x0)
    //assign Inst_mem[15]   = 32'h00502623;
    //assign Inst_mem[20]   = 32'h00e00293; //mem[13]=14   //ADDI x5, x0, 14    //SW x5, 13(x0)
    //assign Inst_mem[25]   = 32'h005026a3;
    //assign Inst_mem[30]   = 32'hfee00293; //mem[14]=-18  //ADDI x5, x0, -18   //SW x5, 14(x0)
    //assign Inst_mem[35]   = 32'h00502723;
//    assign Inst_mem[23]   = 32'h000027a3; //mem[15]=0    //SW x0, 15(x0)
//    assign Inst_mem[24]   = 32'h00002823; //mem[16]=0    //SW x0, 16(x0)
//    assign Inst_mem[25]   = 32'h000028a3; //mem[17]=0    //SW x0, 17(x0)
//    assign Inst_mem[26]   = 32'h00002923; //mem[18]=0    //SW x0, 18(x0)
//    assign Inst_mem[27]   = 32'h000029a3; //mem[19]=0    //SW x0, 19(x0)
//    assign Inst_mem[28]   = 32'h0002f2b3;                           // Reset R5: AND x5, x5, x0
//    assign Inst_mem[29]   = 32'h00007033;                           // NOP
//    assign Inst_mem[30]   = 32'h00007033;                           // NOP
//    assign Inst_mem[31]   = 32'h00007033;                           // NOP 
//    assign Inst_mem[32]   = 32'h00007033;                           // NOP


    // Test Program 1 (R-Type Computational / Register-Register)
    ///*
//    assign Inst_mem[0]   = 32'b00000000110100000000001010010011;   // ADDI x5, x0, 13
//    assign Inst_mem[5]   = 32'b00000001011100000000001100010011;   // ADDI x6, x0, 23
//    assign Inst_mem[10]   = 32'b00000000011000101000100100110011;   // ADD x18, x5, x6
//    assign Inst_mem[15]   = 32'b01000000011000101000100110110011;   // SUB x19, x5, x6
//    assign Inst_mem[20]   = 32'b00000000011000101110101000110011;   // OR  x20, x5, x6
//    assign Inst_mem[25]   = 32'b00000000011000101111101010110011;   // AND x21, x5, x6
    //*/

    // Test Program 2 (I-Type Computational / Short Immediate Operands)
	 
	 
	 // Test Program 4 (I-Type Memory Access / Loads)
    /*
    assign Inst_mem[10]   = 32'b00000000100000000000100100000011;   // LB  x18, 8(x0)
    assign Inst_mem[15]   = 32'b00000000100000000100100110000011;   // LBU x19, 8(x0)
    assign Inst_mem[20]   = 32'b00000000100000000001101000000011;   // LH  x20, 8(x0)
    assign Inst_mem[25]   = 32'b00000000100000000101101010000011;   // LHU x21, 8(x0)
    assign Inst_mem[30]   = 32'b00000000100000000010101100000011;   // LW  x22, 8(x0)
    */
	 
//	 assign Inst_mem[40]    = 32'b00000000110000000010111000000011;   // LW x28, 12(x0)
//    assign Inst_mem[45]    = 32'b00000000110100000010111010000011;   // LW x29, 13(x0)
//    assign Inst_mem[50]    = 32'b00000000111000000010111100000011;   // LW x30, 14(x0)
//    assign Inst_mem[55]    = 32'b00000000110000000010111110000011;   // LW x31, 12(x0)
//    assign Inst_mem[60]    = 32'b00000001110111100000011001100011;   // BEQ x28, x29, 12
	 
    ///*
    assign Inst_mem[0]   = 32'b00000001011000000000100100010011;   // ADDI x18,  x0, 22
    assign Inst_mem[5]   = 32'b00000000001110010000100110010011;   // ADDI x19, x18,  3
    assign Inst_mem[10]   = 32'b00000000001110010100101000010011;   // XORI x20, x18,  3
    assign Inst_mem[15]   = 32'b00000000001110010110101010010011;   // ORI  x21, x18,  3
    assign Inst_mem[20]   = 32'b00000000001110010111101100010011;   // ANDI x22, x18,  3 
    assign Inst_mem[25]   = 32'b00000000001110010001101110010011;   // SLLI x23, x18,  3
    assign Inst_mem[30]   = 32'b00000000001110010010110000010011;   // SLTI x24, x18,  3
    //*/
    

    
    
    always_comb begin
        instruction<=Inst_mem[pc[31:2]];
    end
    
endmodule
