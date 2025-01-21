import controls::*;

module sign_zero_tb;

	timeunit 1ns;
	timeprecision 1ps;
	
	localparam Word_size = 32 ;

	logic [Word_size-1:0] mem_word ;
	mem_op op ;
	logic [1:0] byte_addr ;
	
	logic [Word_size-1:0] dout ;


	sign_zero_extend #(.Word_size(32)) dut(.*) ;
	
		
	initial begin 

		mem_word = 32'b11111111_10000001_00001111_11110000 ;
		op = LW;
		byte_addr = 2'b00;

		#10 op = LB ; 
		
		#10 byte_addr = 2'b10;
		
		#10 op = LBU ; 
		
		#10 op = LH ; byte_addr = 2'b00;
		
		#10 byte_addr = 2'b10;
		
		#10 op = LHU ; 
		
		#30$stop;


	end





endmodule