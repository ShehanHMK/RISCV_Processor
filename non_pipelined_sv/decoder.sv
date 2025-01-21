module decoder #(parameter Input_size = 5)

(

	input  logic [Input_size-1:0] in, 
	input  logic en,
	
	output logic [2**Input_size-1:0] out

);
	
	always_comb begin

		if(en) begin 
		
			out     = (2**in) ; 

		end
		
		else out   = 'b0  ;


	end


endmodule