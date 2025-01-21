
// ------------- Test bench for decoder module ---------------


module decoder_tb;

	localparam Input_size = 5 ;

	timeunit       1ns;
	timeprecision  1ps;

	logic [Input_size-1:0] in; 
	logic en;
	
	logic [2**Input_size-1:0] out;
	
	
	decoder #(.Input_size(Input_size)) decoder_dut(.*) ;


	initial begin 

		en = 1; 
		in = 5; 
		
		#10 in = 2 ; 
		#10 in = 8 ; 
		#10 in = 31;


		#10 $stop;





	end








endmodule