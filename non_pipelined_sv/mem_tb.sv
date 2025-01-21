import controls::*;



//----------- Test Bench for the memory module ----------------------



module mem_tb;

	timeunit 1ns;
	timeprecision 1ps;

	logic clk;
	mem_op rd_wr;
	
	localparam Addr_bits = 32 , Word_size = 32 ;

	
	logic [Addr_bits-1:0] addr;
	
	logic [Word_size-1:0] din;
	
	logic [Word_size-1:0] dout;

	

	D_memory #(.Addr_bits(Addr_bits) , .Word_size(Word_size)) dut4(.*) ;

	
	always #5 clk = ~clk ;
	
	
	integer i;

	initial begin
	
		clk = 0 ;
		addr = 0;
	
		#10
		rd_wr = LB;
		

		for(i=0;i< 25 ; i++) begin
			
			#10 addr = addr + 1 ;
			$display("Data in Word address %d is %h",addr,dout) ;
			
		end
		
		#10 rd_wr = SB ; 
		addr = 1 ; din = 555;
		#20 rd_wr = LB ; 
		#1$display("Data after writing to address 40 = %d",dout);
		
		#20 $stop;
		
	end
		

endmodule
