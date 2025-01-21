module register #(parameter Reg_size = 32)

	// I/O Definitions

(

	input  logic clk,
	input  logic en ,
	input  logic signed [Reg_size-1:0] d_in,
	
	output logic signed [Reg_size-1:0] d_out


);
	// Sequential Logic

	always_ff @(posedge clk) begin
		
		if(en) begin
		
			d_out <= d_in ;
			
		end
		
	end


endmodule