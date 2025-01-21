
module shifter #(parameter Bus_size = 32) 
(

	input  logic [Bus_size-1:0] shift_in,

	output logic [Bus_size-1:0] shift_out


);

	
	assign shift_out = shift_in << 1 ; 


endmodule