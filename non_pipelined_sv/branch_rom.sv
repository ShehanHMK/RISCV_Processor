

module branch_rom #(parameter rom_bits = 5)

(
	// I/O Definitions 
	
	input  logic [rom_bits-1:0] addr,

	//input  logic OE_N ,

	output logic branch_out

);

	always_comb begin
	
//		if(OE_N) begin
//			
//			branch_out = 1'bz;
//		
//		end
//		
//		else begin
	
			unique case(addr) 
			
				'b10000 : branch_out = 1'b1 ;    // beq
				'b00001 : branch_out = 1'b1 ;    // bne
				'b01001 : branch_out = 1'b1 ;    // bne
				'b01100 : branch_out = 1'b1 ;	  // blt
				'b10101 : branch_out = 1'b1 ;	  // bge
				'b00101 : branch_out = 1'b1 ;	  // bge
				
				default : branch_out = 1'b0 ;
			
			endcase
			
		//end
	
	end



endmodule