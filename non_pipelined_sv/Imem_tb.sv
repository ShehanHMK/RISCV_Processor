module Imem_tb;

	timeunit      1ns;
	timeprecision 1ps;
	

	localparam Addr_bits =32 , Word_size = 32 ;
	
	logic [Addr_bits-1:0] addr;
	
	logic [Word_size-1:0] instr;

	
	I_memory #(.Word_size(Word_size),.Addr_bits(Addr_bits)) dut_Imem(.*) ; 
	
	integer i ; 
	
	initial begin
	
		addr = 0 ;
		
		#10
	
		for(i=0;i< 25 ; i++) begin
			
			#10 addr = addr + 1 ;
			$display("Data in Word address %d is %h",addr,instr) ;
			
		end
	
	
	end


endmodule