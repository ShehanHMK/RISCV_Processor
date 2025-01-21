import controls::* ;


module Sign_extender #(parameter Reg_size = 32)

(  // I/O Definitions 

	input  Imm_ex_op Im_type,
	
	input  logic [24:0] Instr,

	output logic signed [Reg_size-1:0] Im_out
	

);
	
	// Combinational Logic
	
	
	always_comb begin
	                                                       // U and J type instructions are not needed
		unique case(Im_type) 
		
			I_TYPE : Im_out = {{(Reg_size-12){Instr[24]}},Instr[24:13]} ;                         						// I type 
			S_TYPE : Im_out = {{(Reg_size-12){Instr[24]}},Instr[24:18],Instr[4:0]} ;              						// S type  
			B_TYPE : Im_out = {{(Reg_size-12){Instr[24]}},Instr[0],Instr[23:18],Instr[4:1],1'b0} ; 				   // B type
			//U_TYPE : Im_out = {Instr[24:5],{(Reg_size-20){1'b0}}} ;  									  						// U type
			//J_TYPE : Im_out = {{(Reg_size-20){Instr[24]}},Instr[12:5],Instr[13],Instr[23:18],Instr[17:14],1'b0} ; // J type
	       
			default:Im_out = {Reg_size{1'b0}} ; 
	
		endcase
		
	end
	
	
endmodule