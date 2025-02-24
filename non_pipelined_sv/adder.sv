
module adder #(parameter Bus_size = 32 )

(
	// I/O Definitions
	
	input  logic signed [Bus_size-1:0] a,
	input  logic signed [Bus_size-1:0] b,
	
	output logic signed [Bus_size-1:0] out

);

	// Combinational logic

	assign out = a + b ; 
	
	

endmodule