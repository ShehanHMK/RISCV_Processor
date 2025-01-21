
// ---------- Test bench for shifter module ------------

module shifter_tb;
	
	timeunit  	  1ns;
	timeprecision 1ps;


	localparam Bus_size = 32;

	logic [Bus_size-1:0] shift_in;

	logic [Bus_size-1:0] shift_out;


	
	shifter #(.Bus_size(Bus_size)) shifter_dut(.*) ;
	
	
	initial begin
	
		shift_in = 'd10 ; 
		
		#10 shift_in = 'd24;
		
		#10 shift_in = 'd102;
		
		#10 $stop ; 


	end


endmodule