// ------------------ Test bench for register module -------------------------



module reg_tb;

	timeunit 1ns;
	timeprecision 1ps;
	
	localparam Reg_size = 32 ;
	
	logic clk;
	logic en;
	logic signed [Reg_size-1:0] d_in ;
	
	logic signed [Reg_size-1:0] d_out ;

	
	register #(.Reg_size(Reg_size)) dut_reg(.*) ; 
	
	
	always #5 clk = ~clk ; 
	

	initial begin

		clk = 0 ;
		d_in = 0 ;
		en =1 ;

		repeat(10) #10 d_in = d_in + 1 ;
		
		
		#150 $stop;



	end


endmodule
