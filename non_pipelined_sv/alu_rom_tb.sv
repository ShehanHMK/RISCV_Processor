
// -------------- TestBench for alu rom ---------------

module alu_rom_tb;

	timeunit 1ns;
	timeprecision 1ps;

	localparam Control_bits = 4 ;
	
	logic [3:0] addr;
	//logic OE_N;
	
	logic [Control_bits-1:0] alu_ctrl_out;


	alu_rom #(.Control_bits(Control_bits)) dut_alu_rom(.*) ;
	
	integer i;

	
	initial begin

		//OE_N = 1'b0 ;

		#1
		
		for(i=0;i<16;i++) begin
			#5 addr = i ;

		end
		
		//OE_N = 1'b1; 
		
		#10 $stop;




	end



endmodule

