module mux_2 #(parameter Input_size = 32)

(

	//I/O Definitions

	input  logic [Input_size-1:0] y0, y1,
	
	
	input  logic sel,
	
	output logic [Input_size-1:0] out


);


	// Combinational logic

	assign out = (sel) ? y1 : y0 ; 



endmodule