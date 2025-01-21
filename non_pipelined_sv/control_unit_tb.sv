
// --------------- Test Bench for Control unit  -----------------------

import controls::* ; 


module control_unit_tb;

	timeunit 	   1ns;
	timeprecision  1ps;
	

	localparam  rom_bits = 16  ; 
	
	logic [31:0] instr;

	logic [6:0] opcode;
	
	logic [2:0] funct3;
	
	logic funct7_5;

	logic zero , neg ;
	
	//input  logic oe_main, oe_alu , oe_branch ,         // output enables are not necessary , maybe remove in future        

	logic pc_src ;
	
	logic result_src ; 
	
	mem_op mem_rdwr ;    // Memory read and write
	
	logic alu_src ; 
	
	logic regwrite ;
	
	Imm_ex_op imm_src;

	alu_op alu_ctrl ;
	
	assign opcode = instr[6:0] ;
	assign funct3 = instr[14:12] ; 
	assign funct7_5 = instr[30] ;


	
	control_unit #(.rom_bits(rom_bits)) dut_control(.*) ;
						
						
	   
	initial begin
	
		
		instr = 32'h015A04B3 ;     // R type  - add
		zero = 1 ; neg = 1 ;
		
		#10 $display("%b , %b , %b , %b , %b , %b , %b",pc_src,result_src,mem_rdwr,alu_src,regwrite,imm_src,alu_ctrl) ; 
		
		
		
		
		instr = 32'hCB910193 ;     // I type alu - addi
		zero = 0 ; neg = 0 ;
		
		#10 $display("%b , %b , %b , %b , %b , %b , %b",pc_src,result_src,mem_rdwr,alu_src,regwrite,imm_src,alu_ctrl) ; 
		
		
		
		
		instr = 32'h00812703 ;     // I type load
		zero = 0 ; neg = 1 ;
		
		#10 $display("%b , %b , %b , %b , %b , %b , %b",pc_src,result_src,mem_rdwr,alu_src,regwrite,imm_src,alu_ctrl) ; 
		
		
		
		
		
		
		instr = 32'h00E12423 ;     // S type store
		zero = 0 ; neg = 0 ;
		
		#10 $display("%b , %b , %b , %b , %b , %b , %b",pc_src,result_src,mem_rdwr,alu_src,regwrite,imm_src,alu_ctrl) ; 
		
		
		
		
		instr = 32'h00A5C663 ;     // SB type branch - blt ( branch less than )
		zero = 0 ; neg = 1 ;
		
		#10 $display("%b , %b , %b , %b , %b , %b , %b",pc_src,result_src,mem_rdwr,alu_src,regwrite,imm_src,alu_ctrl) ; 
		
		
		#10 $stop;
	

	end
	
	
	


endmodule