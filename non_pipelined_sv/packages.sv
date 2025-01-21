`ifndef PACKAGES

	`define PACKAGES

	package controls;

		typedef enum logic [1:0] {
		
			I_TYPE,S_TYPE,B_TYPE       
		
		} Imm_ex_op;
		
		
		typedef enum logic [2:0]{
		
			LW,LH,LB,LBU,LHU,SB,SH,SW
								
		} mem_op;
		
		
		typedef enum logic [3:0] {
		
			ADD,SUB,XOR,OR,AND,SLL,SRL,SRA,SLT,SLTU,MUL
		
		} alu_op;
		
		

	endpackage
	
	
`endif