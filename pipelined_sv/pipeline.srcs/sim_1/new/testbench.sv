`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2023 12:10:45 PM
// Design Name: 
// Module Name: testbench
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


module testbench();

//localparam width=32;
//localparam pc_width=5;

//logic [pc_width-1:0]pc_in;
logic clk=1'b0;
logic rst;

//always #10 clk=~clk;

datapath dut(
    .clk(clk),
    .rst(rst)
);

initial begin
    rst=0;
    #5;
    clk=1;
    #5;
    clk=0;
    rst=1;
    #5;
    clk=1;
    #5;
    clk=0;
    #5;
    clk=1;
    #5;
    clk=0;
    #5;
    clk=1;
    #5;
    clk=0;
    #5;
    clk=1;
    #5;
    clk=0;
    #5;
    clk=1;
    #5;
    clk=0;
    #5;
    clk=1;
    #5;
    clk=0;
    #5;
    clk=1;
    #5;
    clk=0;
    #5;
    clk=1;
    #5;
    clk=0;
    #5;
    clk=1;
    #5;
    clk=0;
    #5;
    clk=1;
    #5;
    clk=0;
    #5;
    clk=1;
    #5;
    clk=0;
    #5;
    clk=1;
    #5;
    clk=0;
    #5;
    clk=1;
    #5;
    clk=0;
    #5;
    clk=1;
    #5;
    clk=0;
    #5;
    clk=1;
    #5;
    clk=0;
    #5;
    clk=1;
    #5;
    clk=0;
    #5;
    clk=1;
    #5;
    $finish;    
end
endmodule
