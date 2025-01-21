
module mux_3 #(parameter Input_size = 32)

(
	//	I/O Definitions
	
	input  logic [Input_size-1:0] y0 , y1 , y2 ,
	
	input  logic [1:0] sel ,
	
	output logic [Input_size-1:0] out


); 

	// Combinational logic
	
	
	always_comb begin
	
		unique case(sel) 
		
			2'b00 : out = y0 ;
			
			2'b01 : out = y1 ;
			
			2'b10 : out = y2 ;
			
			default: out = {Input_size{1'b0}} ; 
	
		endcase
	
	
	end
	
	
	
	
endmodule