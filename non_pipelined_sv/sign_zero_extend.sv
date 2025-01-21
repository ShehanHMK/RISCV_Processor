import controls::*;

module sign_zero_extend #(parameter Word_size = 32 )

(
	input logic [Word_size-1:0] mem_word ,
	input mem_op op ,
	input logic [1:0] byte_addr ,
	
	output logic [Word_size-1:0] dout
);

	always_comb begin
	
		case (op) 
		
			LW: dout = mem_word ;
			
			LB: dout = {{(Word_size-8){mem_word[8*(byte_addr+1)-1]}},mem_word[8*byte_addr +: 8]} ;
			
			LBU:dout = {{(Word_size-8){1'b0}},mem_word[8*byte_addr +: 8]} ;
			
			LH: dout = {{(Word_size-16){mem_word[8*(byte_addr+2)-1]}},mem_word[8*byte_addr +: 16]} ;
			
			LHU: dout = {{(Word_size-16){1'b0}},mem_word[8*byte_addr +: 16]} ;

			default: dout =mem_word ;

		endcase

	end



endmodule