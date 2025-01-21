
// -------------- TestBench for Top module ------------------- 

import controls::* ;
 

module top_tb;

	timeunit 	  1ns;
	timeprecision 1ps;

	localparam Reg_size = 32 ;
	
	logic clk, rst ,en;
	logic [7:0] address_line;
	logic [7:0] data_line;
	logic wr;
	
	
	//logic  [Reg_size-1:0] result_out ;
	logic [15:0] data_out;

	

	Top #(.Reg_size(Reg_size))  Top_dut
	
	(
		.clk(clk),
		.rst(rst),
		.en(en),
		.address_line(address_line),
		.data_line(data_line),
		//.result_out(result_out),
		.wr(wr),
		.data_out(data_out)
		
		
	);


	initial begin
	
		
		$monitor("Alu operation is %s -- Result source mux out is %d  -- Dmem out is  %d -- Alu_out is %d --- DATA OUT = %d",Top_dut.alu_ctrl_wire,Top_dut.result_out,
				Top_dut.D_mem_out,Top_dut.alu_out,data_out) ; 

		//$monitor("RD1 is %d  --- RD2 is %d -- Data memory out = %d  -- Result src signal = %b",Top_dut.RD1,Top_dut.RD2,Top_dut.D_mem_out,Top_dut.resultsrc_wire) ; 

		clk 		 = 0 ;
		
		en = 1;
		rst       = 0 ;
		
		#20 rst   = 1 ;
		en=0;
		wr=1;
		
		address_line=0;
		data_line   =3;
		
		#20
		
		address_line=4;
		data_line   =5;
		
		#20
		
		address_line=8;
		data_line   =0;
		
		#20
		
		//address_line=12;
		//data_line   =5;
		
		
		//#20
		
		address_line=16;
		data_line   =7;
		
		//#20
		
//		address_line=20;
//		data_line   =0;
//		
//		
		#20 wr = 0 ; en=1;
		
		#2000 en=0; address_line=8 ; wr = 0 ;
		
		#1000 $stop ;
		
	end
	
	

	
	always #5 clk = ~clk ;


	
endmodule