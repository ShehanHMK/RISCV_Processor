import controls::* ; 


module control_unit #( rom_bits = 16 ) 
(

// -------------- I/O Definitions -----------------------------------


	input  logic [6:0] opcode,
	
	input  logic [2:0] funct3,
	
	input  logic funct7_5,

	input  logic zero , neg ,
	       

	output logic pc_src ,
	
	output logic result_src ,  
	
	output mem_op mem_rdwr,     // Memory read and write
	
	output logic alu_src , 
	
	output logic regwrite ,
	
	output Imm_ex_op imm_src,

	output alu_op alu_ctrl


);  



//-------------- Internal Signal definitions -------------------------


	logic [rom_bits-1:0] rom_out ;
	
	logic [10:0] rom_addr ;
	
	assign rom_addr = {funct7_5,funct3,opcode};      // Address lines for ROM
	
	

	//-------------------- Combiantional Logic 	--------------------------
	
	always_comb begin
	
		unique case(rom_out[14:12])
		
			'b001:pc_src = (zero == 1'b1 );
			'b010:pc_src = (zero == 1'b0 );
			'b011:pc_src = (neg  == 1'b1 );
			'b100:pc_src = (neg  == 1'b0 );
			default: pc_src = 1'b0 ;
		
		endcase
	
	end
	
	// ---- Initializing main rom ------------
	
	main_rom #(.Control_bits(rom_bits)) MAIN_ROM
	(
		.addr(rom_addr),
		
		.ctrl_out(rom_out)
	);
	
	
	
	
	// Assigning values to output control lines
	

	assign result_src = rom_out[11] ;
	
	assign mem_rdwr   = mem_op'(rom_out[10:8]) ;
	
	assign alu_src    = rom_out[7] ;
	
	assign regwrite   = rom_out[6] ;
	
	assign imm_src    = Imm_ex_op'(rom_out[5:4]) ;
	
	assign alu_ctrl   = alu_op'(rom_out[3:0]) ;
	
	


endmodule