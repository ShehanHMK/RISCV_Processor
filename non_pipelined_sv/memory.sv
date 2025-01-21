import controls::*;


module D_memory #(parameter Word_size = 32 , Addr_bits = 32)
(
	// I/O Definitions
	
	input  logic clk,
	input  mem_op rd_wr ,             
	
	input  logic [Addr_bits-1:0] addr,
	
	input  logic [Word_size-1:0] din ,
	
	output logic [Word_size-1:0] dout


);

	// Memory array definitions
	
	
	logic [(Word_size/8)-1:0][7:0] mem [0:127] ;     // 4kB memory - 1024 ->32bit words

	logic [11:0] mem_addr;            // No need of these two lines if mem is 2**32 Bytes (4GB)
	
	assign mem_addr = addr[11:0];
	
	
	
	
	
	logic [Word_size-1:0] mem_word;

	

	// Combinational logic for Memory read
			
	assign mem_word = mem[mem_addr[11:2]] ;
	
	
	always_comb begin
	
		case (rd_wr) 
		
			LW: dout = mem_word ;
			
			LB: dout = {{(Word_size-8){mem_word[8*(mem_addr[1:0]+1)-1]}},mem_word[8*mem_addr[1:0] +: 8]} ;
			
			LBU:dout = {{(Word_size-8){1'b0}},mem_word[8*mem_addr[1:0] +: 8]} ;
			
			LH: dout = {{(Word_size-16){mem_word[8*(mem_addr[1:0]+2)-1]}},mem_word[8*mem_addr[1:0] +: 16]} ;
			
			LHU: dout = {{(Word_size-16){1'b0}},mem_word[8*mem_addr[1:0] +: 16]} ;

			default: dout = mem_word ;

		endcase

	end
	
			
			
	// Sequential logic for Memory write		
		
	always_ff @(posedge clk) begin
	
	
		if(rd_wr == SW )   mem[mem_addr[11:2]] <= din ;                          // Storing word(32bit)  
	
		else if (rd_wr == SB ) mem[mem_addr[11:2]][mem_addr[1:0]] <= din[7:0] ;
		
		else if(rd_wr == SH ) begin 
		
					mem[mem_addr[11:2]][mem_addr[1:0]+1] <= din[15:8] ;
					mem[mem_addr[11:2]][mem_addr[1:0]]   <= din[ 7:0] ;
		
				end
				
		else mem[mem_addr[11:2]] <= mem[mem_addr[11:2]] ;
					
			
	end
	
	
//	initial begin 
//		
//		$readmemh("memhexfile.txt",mem) ; 
//		
//	end


//
//	initial begin 
//		
//		//mem[0] = 'hb7e ;  // decimal - 2942 
//		//mem[1] = 'h87d ;  // decimal - 2137
//		//mem[2] = 'h12e ;  // decimal - 302 
//		//mem[3] = 'h311 ;  // decimal - 785
// 	
//		mem[0] = 1 ;
//		mem[1] = 2 ;
//		mem[2] = 3 ;
//		mem[3] = 4 ;
//		mem[4] = 5 ;
//		mem[5] = 6 ;
//		mem[6] = 7 ;
//		mem[7] = 0 ;
//		mem[8] = 112;
//	
//	
//	
//	end







endmodule