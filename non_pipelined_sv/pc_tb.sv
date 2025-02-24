// ---------- Testbench for Program counter module -------------------------


module pc_tb;

	timeunit 1ns;
	timeprecision 1ps;
	
	localparam Reg_size = 32;

	logic clk;
	logic en;
	logic rst;
	logic [Reg_size-1:0] pc_next;
	logic [Reg_size-1:0] pc_out;



	program_counter #(.Reg_size(Reg_size)) dut_pc(.*) ;
	

	always #5 clk = ~ clk ; 
	
	integer i ;
	
	initial begin
	
		clk = 0;
	
		en = 1;
		
		
		rst = 0;
		pc_next = 0 ;
		
		for(i=0;i<10;i++) begin
			#10 pc_next = pc_next + 1 ; 
		end
		
		en = 0;
		
		for(i=0;i<10;i++) begin
			#10 pc_next = pc_next + 1 ; 
		end
		
		#10 rst = 1; 
	
	
		#20 $stop;
	
	end


endmodule

