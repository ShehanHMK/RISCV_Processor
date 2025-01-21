import controls::* ;


module alu #(parameter BUS_WIDTH = 32)
(
	//I/O Definitions
	 
	input  logic signed [BUS_WIDTH-1:0] a,        // Bus A
	input  logic signed [BUS_WIDTH-1:0] b,        // Bus B

	input  alu_op sel,    		 						 // Control Signals
	
	output logic signed [BUS_WIDTH-1:0] alu_out,  // Alu Result 
	output logic zero,neg                         // Flags 


);


	// Combinational Circuit implementation

	always_comb begin
	
		unique case(sel)
		
			ADD: alu_out = a + b ;          
			SUB: alu_out = a - b ;
			AND: alu_out = a & b ;
			OR : alu_out = a | b ;
			XOR: alu_out = a ^ b ;
			SLL: alu_out = a <<  b[$clog2(BUS_WIDTH)-1:0] ;
			SRL: alu_out = a >>  b[$clog2(BUS_WIDTH)-1:0] ; 
			SRA: alu_out = a >>> b[$clog2(BUS_WIDTH)-1:0] ;
			SLT: alu_out = (a < b ) ? 1 : 0 ;
			SLTU:alu_out = ((a>>1) < (b>>1)) ? 1 : 0 ;       // Try $unsigned(a) < $unsigned(b)
			MUL :alu_out = $unsigned(a) * $unsigned(b)  ;
			
			
			default  alu_out = a ;
		
		endcase
	
	end
		
	assign zero = (alu_out == 0);                 //zero Flag       //&alu_out ;
	
	assign neg  = alu_out[BUS_WIDTH-1];           // Negative Flag
	
	

endmodule 

