
module program_counter #(parameter Reg_size = 32 )

	// I/O Definitions 
(

	input logic clk,
	input logic en,
	input logic rst,
	input logic [Reg_size-1:0] pc_next,
	
	output logic [Reg_size-1:0] pc_out



); 
	// Combinational logic

	logic [Reg_size-1:0] en_out;
	
	assign en_out = (en == 1) ? pc_next : pc_out ; 
	
	
	// Sequential logic
	
	always_ff @(posedge clk ) begin        // Synchronous reset
	
		if(rst) pc_out <= {Reg_size{1'b0}} ;
		
		else pc_out <= en_out;
		
	
	end
	

	
	
	

	
endmodule