//  ----------- Test bench for bus module ---------------

module bus_tb;
	
	timeunit      1ns;
	timeprecision 1ps;
	
	localparam Bus_length = 32 ; 
	localparam Bus_width  = 32 ;


	logic signed [Bus_length-1:0][Bus_width-1:0] data_lines ; 
	logic        [Bus_length-1:0]                sel_lines  ;

	tri   signed [Bus_width-1:0]                 bus_out    ;


	bus #(.Bus_length(Bus_length),.Bus_width(Bus_width)) bus_dut(.*) ;

	
	initial begin
		
		data_lines[0] = 'b1101 ; 
		data_lines[1] = 'b0011 ;
		data_lines[2] = 'd2432 ;
		data_lines[3] = 'd31123 ;

		sel_lines = 'b1 ; 
		
		
		#10 sel_lines = 'b10 ;
		
		#10 sel_lines = 'b100;
		
		#10 sel_lines = 'b1000;
		
		#10 $stop;

	end

endmodule