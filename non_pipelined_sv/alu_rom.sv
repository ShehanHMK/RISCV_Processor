
module alu_rom #(parameter Control_bits = 4) 

(
	// I/O Definitions

	input  logic [3:0] addr,                       // Address lines

	//input  logic OE_N,									  // Output Enable ( Active Low )

	output logic [Control_bits-1:0] alu_ctrl_out   // Alu control signals out


);
	
	always_comb begin


//		if(OE_N) begin
//
//			alu_ctrl_out = {Control_bits{1'bz}} ; 
//
//		end
//		
//		else begin

			unique case(addr) 

				4'd0 : alu_ctrl_out = 'd0 ;   // AND
				4'd8 : alu_ctrl_out = 'd1 ;	// SUB		
				4'd1 : alu_ctrl_out = 'd4 ;	// SLL
				4'd2 : alu_ctrl_out = 'd5 ; 	// SLT
				4'd3 : alu_ctrl_out = 'd6 ; 	// SLTU
				4'd4 : alu_ctrl_out = 'd7 ;	// XOR
				4'd5 : alu_ctrl_out = 'd8 ;	// SRL	
				4'd13 : alu_ctrl_out = 'd9;	// SRA
				4'd6 : alu_ctrl_out = 'd3 ;	// OR
				4'd7 : alu_ctrl_out = 'd2 ;	// AND
				
				default : alu_ctrl_out = 'd15;

			endcase
		
		//end


	end


endmodule