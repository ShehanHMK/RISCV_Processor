// ----------------- Testbench for 2 input mux ---------------------

module mux_2_tb;

	timeunit 1ns;
	timeprecision 1ps; 

	localparam Input_size = 32;
	logic [Input_size-1:0] y0 , y1 , out ;

	logic sel;
	
	mux_2 #(.Input_size(Input_size)) dut_mux2(.*) ;
	
	initial begin
		
		y0 = 10 ;
		
		y1 = 20 ;
		
		sel = 0;
		
		#20 sel = 1;
		
		#40 $stop;
	
	
	end



endmodule