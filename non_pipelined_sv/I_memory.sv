
module I_memory #(parameter Word_size = 32 , Addr_bits = 32)

(
	// I/O Definitions 

	input  logic [Addr_bits-1:0] addr,
	
	output logic [Word_size-1:0] instr



);
	
	// Memory array definition
	
	logic [Word_size-1:0] Imem [0:1023] ;
	
	logic [11:0] I_addr ;
	
	assign I_addr = addr[11:0] ;   // No need if Imem is [0:2**32]
	
	assign instr = Imem[I_addr[11:2]] ; 
	
	
//	initial begin 
//		
//		$readmemh("memhexfile.txt",Imem) ; 
//		
//	end

	//initial begin
	
		//Imem[0] = 'h00002083 ;
		//Imem[1] = 'h00402103 ;
		//Imem[2] = 'h002081b3 ; 
		//Imem[3] = 'h00302423 ;



	assign	Imem[0] = 'h00000093 ;
	assign	Imem[1] = 'h00100193 ;
	assign	Imem[2] = 'h0000a103 ; 
		
	assign	Imem[3] = 'b0_000000_00010_00000_000_01000_1100011; 
		
	assign	Imem[4] = 'b0100000_00011_00010_100_00011_0110011 ;      //multiplying program
		
	assign	Imem[5] = 'h00408093 ;
		
	assign	Imem[6] = 'b1_111111_00000_00000_000_11001_1100011;
		
	assign	Imem[7] = 'h0030a023 ; 
		
		
		
	
		//Imem[1] = 'h2081B3 ;  // add x3 x1 x2  --> R[x3] = R[x1] + R[x2]
		//Imem[1]   = 'hA0A123;   // sw x10 , x1, imm  --->   MEM[x1+imm] = R[x10]  imm = 2 
		//Imem[2]   = 'h20A183;   // lw x3, x1 , imm ---> R[x3] = MEM[x1+imm]    imm  = 2   
	
		//Imem[2] = 'h5303B3 ;  // add x7 x5 x6  --> R[x7] = R[x5] + R[x6]
		//Imem[3] = 'h405303B3 ; // sub x7 x5 x6 --> R[x7] = R[x6] - R[x5]
		
		//Imem[4] = 'hB710193  ;    // addi x3 x2 imm  --> R[x3] = R[x2] + imm   imm =  183
		
	//Imem[4] = 'h2B700193  ;     // addi x3 x0 imm  --> R[x3] = R[x0] + imm   imm =  695
		//Imem[5] = 'h10F00213  ;     // addi x4 x0 imm  --> R[x4] = R[x0] + imm   imm =  271
		//Imem[6] = 'h403242B3 ;   // mul x5, x3, x4 
//		Imem[6] = 'h4182B3    ;     // add x5 x4 x3  --> R[x5] = R[x3] + R[x4] 
//		Imem[7] = 'h100303    ;     // lb x6, imm(x0) ---> imm = 1 ;
//		Imem[8] = 'h6283b3    ;     // add x7,x5,x6  -- > R[x7] = R[x5] + R[x6] 
//		Imem[9] = 'h7006A3    ;     // sb x7 , imm(x0)  ---> imm =13 
//		Imem[10] = 'hC02083   ;     // lw x1, imm(x0)  ---> imm = 12 
 		
		//Imem[3] =   'hB718213  ;    // addi x4 x3 imm  --> R[x3] = R[x2] + imm   imm =  183
		
		//Imem[5] = 'hCB910193  ;   // addi x3 x2 imm  --> R[x3] = R[x2] + imm   imm = -839
		//Imem[6] = 'hA50463 ;      // beq x10 x11     --> pc = pc + imm   imm = 4  , braches to 10th instruction (6+4)
	
		//Imem[7] = 'h2081B3 ;  // add x3 x1 x2  --> R[x3] = R[x1] + R[x2] 
		
		//Imem[10] = 'h2081B3 ;  // add x3 x1 x2  --> R[x3] = R[x1] + R[x2] 
		
		
		//Imem[11] = 'hFE5149E3;    // blt x2 x5 -->  pc = pc + imm   imm =-7  branches to 4th instruction (11-7) 
		
	//end
	
	
	
endmodule