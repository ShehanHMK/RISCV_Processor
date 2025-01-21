
// ------------- Test Bench for Main rom unit -------------

module main_rom_tb;

	timeunit      1ns ;
	timeprecision 1ps ;

	localparam Control_bits = 13 ;
	
	logic [10:0] addr ;
	//logic OE_N       ;

	logic [Control_bits-1:0] ctrl_out ;
	
	
	main_rom #(.Control_bits(Control_bits)) dut_main_rom(.*) ;


	initial begin
	      
		//OE_N = 1'b0;       // Output enabled

		#1 addr = 'h2B3 ;  // R type 

		#5 addr = 'h113 ;  // I type Alu
		
		#5 addr = 'h503 ;  // I type Load 
		
		#5 addr = 'h523 ;  // S type 
		
		#5 addr = 'h263 ;  // SB type
		
		#5 addr = 'h1 ;  // Not defined 
		
		//#5 OE_N = 1'b1 ;    // Output disabled
	

		#10 $stop;


	end


endmodule