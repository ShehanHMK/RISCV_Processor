
module adder_tb;

	timeunit 	  1ns;
	timeprecision 1ps;

	localparam Bus_size = 32;
	
	logic signed [Bus_size-1:0] a,b ;

	logic signed [Bus_size-1:0] out ; 


	adder #(.Bus_size(Bus_size)) dut_adder(.*) ;
	
	
	initial begin
		
		#1
		a = 0 ; b = 15 ; 
		
		#20 a=44 ; b=21 ;
	
	   #10 $stop;
	
	
	
	end


endmodule