//`timescale 1ns / 1ps

module instructionmemory#(
    parameter INS_ADDRESS = 9,  // 9 bit address bus
    parameter INS_W = 32        // 32 bit data bus 
    )
    (
    input  logic [INS_ADDRESS-1:0] ra ,   // Read address of the instruction memory (Comes from PC)
    output logic [INS_W-1:0] rd           // Data output of the instruction memory (Instruction)
    );

    logic [INS_W-1 :0] Inst_mem [(2**(INS_ADDRESS-2))-1:0];

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////


    // Data memory initialization will be done using I-Type instructions (ADDI & SW)
    assign Inst_mem[0]    = 32'h00007033;                           // NOP 
    assign Inst_mem[1]    = 32'h00007033;                           // NOP
    assign Inst_mem[2]    = 32'h00007033;                           // NOP
    assign Inst_mem[3]    = 32'h00002023; //mem[0]=0     //SW x0, 0(x0)
    assign Inst_mem[4]    = 32'h000020a3; //mem[1]=0     //SW x0, 1(x0)
    assign Inst_mem[5]    = 32'h00002123; //mem[2]=0     //SW x0, 2(x0)
    assign Inst_mem[6]    = 32'h000021a3; //mem[3]=0     //SW x0, 3(x0)
    assign Inst_mem[7]    = 32'h00500293; //mem[4]=5     //ADDI x5, x0, 5     //SW x5, 4(x0)
    assign Inst_mem[8]    = 32'h00502223;
    assign Inst_mem[9]    = 32'h000022a3; //mem[5]=0     //SW x0, 5(x0)
    assign Inst_mem[10]   = 32'h00002323; //mem[6]=0     //SW x0, 6(x0)
    assign Inst_mem[11]   = 32'h000023a3; //mem[7]=0     //SW x0, 7(x0)
    assign Inst_mem[12]   = 32'hff700293; //mem[8]=-9    //ADDI x5, x0, -9    //SW x5, 8(x0)
    assign Inst_mem[13]   = 32'h00502423;
    assign Inst_mem[14]   = 32'h000024a3; //mem[9]=0     //SW x0, 9(x0)
    assign Inst_mem[15]   = 32'h00002523; //mem[10]=0    //SW x0, 10(x0)
    assign Inst_mem[16]   = 32'h000025a3; //mem[11]=0    //SW x0, 11(x0)
    assign Inst_mem[17]   = 32'h00c00293; //mem[12]=12   //ADDI x5, x0, 12    //SW x5, 12(x0)
    assign Inst_mem[18]   = 32'h00502623;
    assign Inst_mem[19]   = 32'h00e00293; //mem[13]=14   //ADDI x5, x0, 14    //SW x5, 13(x0)
    assign Inst_mem[20]   = 32'h005026a3;
    assign Inst_mem[21]   = 32'hfee00293; //mem[14]=-18  //ADDI x5, x0, -18   //SW x5, 14(x0)
    assign Inst_mem[22]   = 32'h00502723;
    assign Inst_mem[23]   = 32'h000027a3; //mem[15]=0    //SW x0, 15(x0)
    assign Inst_mem[24]   = 32'h00002823; //mem[16]=0    //SW x0, 16(x0)
    assign Inst_mem[25]   = 32'h000028a3; //mem[17]=0    //SW x0, 17(x0)
    assign Inst_mem[26]   = 32'h00002923; //mem[18]=0    //SW x0, 18(x0)
    assign Inst_mem[27]   = 32'h000029a3; //mem[19]=0    //SW x0, 19(x0)
    assign Inst_mem[28]   = 32'h0002f2b3;                           // Reset R5: AND x5, x5, x0
    assign Inst_mem[29]   = 32'h00007033;                           // NOP
    assign Inst_mem[30]   = 32'h00007033;                           // NOP
    assign Inst_mem[31]   = 32'h00007033;                           // NOP 
    assign Inst_mem[32]   = 32'h00007033;                           // NOP


    // Test Program 1 (R-Type Computational / Register-Register)
    /*
    assign Inst_mem[33]   = 32'b00000000110100000000001010010011;   // ADDI x5, x0, 13
    assign Inst_mem[34]   = 32'b00000001011100000000001100010011;   // ADDI x6, x0, 23
    assign Inst_mem[35]   = 32'b00000000011000101000100100110011;   // ADD x18, x5, x6
    assign Inst_mem[36]   = 32'b01000000011000101000100110110011;   // SUB x19, x5, x6
    assign Inst_mem[37]   = 32'b00000000011000101110101000110011;   // OR  x20, x5, x6
    assign Inst_mem[38]   = 32'b00000000011000101111101010110011;   // AND x21, x5, x6
    */

    // Test Program 2 (I-Type Computational / Short Immediate Operands)
    /*
    assign Inst_mem[33]   = 32'b00000001011000000000100100010011;   // ADDI x18,  x0, 22
    assign Inst_mem[34]   = 32'b00000000001110010000100110010011;   // ADDI x19, x18,  3
    assign Inst_mem[35]   = 32'b00000000001110010100101000010011;   // XORI x20, x18,  3
    assign Inst_mem[36]   = 32'b00000000001110010110101010010011;   // ORI  x21, x18,  3
    assign Inst_mem[37]   = 32'b00000000001110010111101100010011;   // ANDI x22, x18,  3 
    assign Inst_mem[38]   = 32'b00000000001110010001101110010011;   // SLLI x23, x18,  3
    assign Inst_mem[39]   = 32'b00000000001110010010110000010011;   // SLTI x24, x18,  3
    */

    // Test Program 3 (S-Type Memory Access / Stores)
    /*
    assign Inst_mem[33]   = 32'b00100000010100000000001100010011;   // ADDI x6, x0, 517
    assign Inst_mem[34]   = 32'b00000000011000000010001010100011;   // SW x6, 5(x0) 
    assign Inst_mem[35]   = 32'b00000000011000000000001100100011;   // SB x6, 6(x0)
    assign Inst_mem[36]   = 32'b00000000011000000001001110100011;   // SH x6, 7(x0)
    */

    // Test Program 4 (I-Type Memory Access / Loads)
    /*
    assign Inst_mem[33]   = 32'b00000000100000000000100100000011;   // LB  x18, 8(x0)
    assign Inst_mem[34]   = 32'b00000000100000000100100110000011;   // LBU x19, 8(x0)
    assign Inst_mem[35]   = 32'b00000000100000000001101000000011;   // LH  x20, 8(x0)
    assign Inst_mem[36]   = 32'b00000000100000000101101010000011;   // LHU x21, 8(x0)
    assign Inst_mem[37]   = 32'b00000000100000000010101100000011;   // LW  x22, 8(x0)
    */

    // Test Program 5 (SB-Type Control Transfer / Conditional Branches)
    /*
    assign Inst_mem[33]    = 32'b00000000110000000010111000000011;   // LW x28, 12(x0)
    assign Inst_mem[34]    = 32'b00000000110100000010111010000011;   // LW x29, 13(x0)
    assign Inst_mem[35]    = 32'b00000000111000000010111100000011;   // LW x30, 14(x0)
    assign Inst_mem[36]    = 32'b00000000110000000010111110000011;   // LW x31, 12(x0)
    assign Inst_mem[37]    = 32'b00000001110111100000011001100011;   // BEQ x28, x29, 12
    assign Inst_mem[38]    = 32'b00000001010100000000100100010011;   // ADDI x18, x0, 21
    assign Inst_mem[39]    = 32'b00000001111111100000011001100011;   // BEQ x28, x31, 12 
    assign Inst_mem[40]    = 32'b00000001011100000000100110010011;   // ADDI x19, x0, 23
    assign Inst_mem[41]    = 32'b00000001100100000000101000010011;   // ADDI x20, x0, 25
    assign Inst_mem[42]    = 32'b00000001101100000000101010010011;   // ADDI x21, x0, 27
    assign Inst_mem[43]    = 32'b00000001110111100001011001100011;   // BNE x28, x29, 12
    assign Inst_mem[44]    = 32'b00000001110100000000101100010011;   // ADDI x22, x0, 29
    assign Inst_mem[45]    = 32'b00000001111100000000101110010011;   // ADDI x23, x0, 31
    assign Inst_mem[46]    = 32'b00000010000100000000110000010011;   // ADDI x24, x0, 33
    assign Inst_mem[47]    = 32'b00000001111011100101010001100011;   // BGE x28, x30, 8
    assign Inst_mem[48]    = 32'b00000010001100000000110010010011;   // ADDI x25, x0, 35
    assign Inst_mem[49]    = 32'b00000010010100000000110100010011;   // ADDI x26, x0, 37
    assign Inst_mem[50]    = 32'b00000001111011100111010001100011;   // BGEU x28, x30, 8
    assign Inst_mem[51]    = 32'b00000010011100000000110110010011;   // ADDI x27, x0, 39
    */

    // Test Program 6 (Adding 2 numbers and saving the result to memory)
    /*
    assign Inst_mem[33]   = 32'b00000000001100000000001010010011;   // ADDI R5, R0, 3
    assign Inst_mem[34]   = 32'b00000000101100000000001100010011;   // ADDI R6, R0, 11
    assign Inst_mem[35]   = 32'b00000000011000101000000010110011;   // ADD R1, R5, R6
    assign Inst_mem[36]   = 32'b00000000000100000010010000100011;   // SW R1, 8, R0
    */

    // Test Program 7 (Program that reads the value of n from memory and computes the sum of numbers from 1 to n and stores the sum in memory) 
    /**/
    assign Inst_mem[33]   = 32'b00000000110000000010100100000011;   // LW x18, 12(x0)
    assign Inst_mem[34]   = 32'b00000000000100000000100110010011;   // ADDI x19, x0, 1
    assign Inst_mem[35]   = 32'b00000000000010100111101000010011;   // ANDI x20, x20, 0
    assign Inst_mem[36]   = 32'b00000001001010100000101000110011;   // ADD x20, x20, x18
    assign Inst_mem[37]   = 32'b00000000110000000010101010000011;   // LW x21, 12(x0)
    assign Inst_mem[38]   = 32'b01000001001110101000101010110011;   // SUB x21, x21, x19
    assign Inst_mem[39]   = 32'b00000001010110100000101000110011;   // ADD x20, x20, x21
    assign Inst_mem[40]   = 32'b11111111001110101001110011100011;   // BNE x21, x19, -8
    assign Inst_mem[41]   = 32'b00000001010000000010010110100011;   // SW x20, 11(x0)
    /**/

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////

    // PC is incremented by 4, but our instruction memory is word addressable.
    // So, we need to divide the PC value by 4 to get the correct address.
    // So, the 2 LSBs of the PC are ignored.
    assign rd =  Inst_mem [ra[INS_ADDRESS-1:2]];  

endmodule
