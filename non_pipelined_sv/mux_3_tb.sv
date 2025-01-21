// ----------------- Testbench for 3 input Mux ------------------


module mux_3_tb;
	
	
	timeunit 1ns;
	timeprecision 1ps;

	localparam Input_size = 32 ;
	
	logic [Input_size-1:0] y0,y1,y2 , out ;
	
	logic [1:0] sel ;
	
	mux_3 #(.Input_size(Input_size)) dut_mux3(.*) ;

	initial begin
	
		y0 = 10 ; y1 = 20 ; y2 =30;
		
		#1
		
		sel = 2'b00 ;
		
		#10 sel = 2'b01;
		
		#10 sel = 2'b10;
	
		#20 $stop;
	
	end



endmodule