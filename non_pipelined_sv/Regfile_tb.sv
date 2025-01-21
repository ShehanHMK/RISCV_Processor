// --------- Test Bench for Register file -------------------------


module Regfile_tb;

	timeunit 1ns;
	timeprecision 1ps;
	
	localparam Reg_size = 32 , Addr_bits = 5 ;
	
	

	logic clk, WE ;
	
	logic [4:0] A1,A2,A3 ;
	
	logic signed [Reg_size-1:0] WD ;
	
	logic signed [Reg_size-1:0] RD1,RD2 ;

	reg_file_3bus #(.Reg_size(Reg_size), .Addr_bits(Addr_bits)) dut2(.*) ;

	
	
	always #5 clk = ~clk ;  // Clock  

	integer i;

	initial begin
	
		clk = 0;
		WE = 1;
		A3 = 1;
		WD = 100;
		
		for(i=1 ; i<32 ; i++) begin
		
			#20 WD = WD + 4; A3 = A3 + 1;
			
		end 
		
		WE = 0 ;
		A3 = 19;
		
		for(i=0 ; i<32 ; i++) begin
		
			#20 A1 = i; 
			$display("RD1  =  %d",RD1);
		
		end
		
		#10 A1 = 0 ;
		
		#1 $display("RD1 when x0 is selected = %d",RD1) ;
		
		#20
		
		$stop ; 
	
	end


endmodule

