// --------------- Test Bench for Sign Extender -------------------

import controls::* ; 


module sign_extend_tb;



	timeunit 1ns;
	timeprecision 1ps;
	
	
	
	Imm_ex_op Im_type;
	
	localparam Reg_size = 32;

	logic [24:0] Instr; 

	logic signed [Reg_size-1:0] Im_out ;
	
	
	Sign_extender #(.Reg_size(Reg_size)) dut3(.*) ; 
	
	
	initial begin
	
		#5 Im_type = I_TYPE ;
	
		Instr = 25'b1100101110010001000000011 ;  // Immediate = -839
		#1
		$display("Immediate out I TYPE = %d", Im_out);
		
		
//		#5 Im_type = Im_type.next();
//		
//		Instr = 25'b0000000_01110_00010_010_01000 ; // Immediate = 8 
//		#1
//		$display("Immediate out S TYPE = %d", Im_out);
//		                                                                 // Uncomment if needed
//		
//		#5 Im_type = Im_type.next();
//		
//		Instr = 25'b0_000000_01010_10011_000_1000_0 ; // Immediate = 16 
//		#1
//		$display("Immediate out B TYPE = %d", Im_out);
//		
		
		
//		#5 Im_type = Im_type.next();
//		
//		Instr = 25'b1010111110111001111101010 ; // Immediate = 0xAFB9F000 
//		#1
//		$display("Immediate out U TYPE = %H", Im_out);
//		                                                                            // U and J type instructions are not needed
//		
//		#5 Im_type = Im_type.last();
//		
//		Instr = 25'b10111010111100001011_01100 ; // Immediate = 0xFFF0BBAE
//		#1
//		$display("Immediate out J TYPE = %H", Im_out);
//		
		
		
		
		#10
	   $stop ;
	
	end



endmodule



