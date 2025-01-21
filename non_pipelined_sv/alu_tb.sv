//--------- Test Bench For ALU -----------------------------------------

import controls::* ; 


module alu_tb;
	
	timeunit 1ns;
	timeprecision 1ps;
	
	localparam BUS_WIDTH = 32 ;
	
	logic signed [BUS_WIDTH-1:0] a,b,alu_out;
	
	alu_op sel;
	
	logic zero,neg;
	
	
	alu #(.BUS_WIDTH(BUS_WIDTH) ) dut1(.*) ; // Design under test
	
	
	initial begin
	
		sel = MUL;
		a = 16  ; b = 20 ;
		#10 a = 8 ; b = 107 ;
		
		#10 a = -21 ; b = 4 ;    
//	
//		b = 32'd3;
//		a = -32'd48;
//		
//		sel = SLT; 
//		
////		repeat(4) begin
////		
////			#10
////			//a = $random;
////			//b = $random;
////			
////			sel = sel.next() ;
////	
////		end
//		
//		#10 a = 32'd48 ;
//		
//		
//		#10 a = -32'd12 ;  sel = SLTU ;
//		
//		//sel = SRA;
		
		
		#100 $stop ; 
		
		
		
	end
	
	
endmodule