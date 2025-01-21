
module main_rom #(parameter Control_bits = 16)

(
	// I/O Definitions 
	
	input  logic [10:0] addr,            			 // Address lines
	
	//input  logic OE_N,                            // Output enable  ( Active LOW )   

	output logic [Control_bits - 1:0] ctrl_out    // Control lines  

);

	logic  [Control_bits-1:0] rom [2047:0];
	
	
	//------- R type instructions control signals -----

	assign rom['h33 ] = 'b000000001000000;
	assign rom['h433] = 'b000000001000001;
	assign rom['h233] = 'b000000001000010;
	assign rom['h333] = 'b000000001000011;
	assign rom['h3B3] = 'b000000001000100;
	assign rom['hB3 ] = 'b000000001000101;
	assign rom['h2B3] = 'b000000001000110;
	assign rom['h6B3] = 'b000000001000111;
	assign rom['h133] = 'b000000001001000;
	assign rom['h1B3] = 'b000000001001001;
	
	assign rom['h633] = 'b000000001001010;  // MUL instruction
			
	
	// ----- I type instructions control signals ------
			
			
	assign rom['h13 ] = 'b000000011000000;
	assign rom['h413] = 'b000000011000000;
	assign rom['h213] = 'b000000011000010;
	assign rom['h613] = 'b000000011000010;
	assign rom['h313] = 'b000000011000011;
   assign rom['h713] = 'b000000011000011;
	assign rom['h393] = 'b000000011000100;
	assign rom['h793] = 'b000000011000100;
	assign rom['h93 ] = 'b000000011000101;
	assign rom['h493] = 'b000000011000101;
	assign rom['h293] = 'b000000011000110;
	assign rom['h693] = 'b000000011000111;
	assign rom['h113] = 'b000000011001000;
	assign rom['h513] = 'b000000011001000;
	assign rom['h193] = 'b000000011001001;
	assign rom['h593] = 'b000000011001001;

			

	assign rom['h103] = 'b000100011000000;     // load word instruction
	assign rom['h503] = 'b000100011000000;
				
	assign rom['h3]   = 'b000101011000000;     // load byte instruction
	assign rom['h403] = 'b000101011000000;
			
	assign rom['h203] = 'b000101111000000;     // load byte unsigned (lbu) instruction
	assign rom['h603] = 'b000101111000000;
	
	assign rom['h83]  = 'b000100111000000;     // load half word instruction
	assign rom['h483] = 'b000100111000000; 
	
	assign rom['h283] = 'b000110011000000;     // load half word unsigned instruction (lhu)
	assign rom['h683] = 'b000110011000000;
	
	
	
	
			
	// ------S type instructions control signals --------
			
			
	assign rom['h123] = 'b000011110010000;    // Store word instruction
	assign rom['h523] = 'b000011110010000;
			
	assign rom['hA3]  = 'b000011010010000;    // Store half word instruction
	assign rom['h4A3] = 'b000011010010000;
	
	assign rom['h23]   = 'b000010110010000;    // Store byte instruction
	assign rom['h423]  = 'b000010110010000; 
			
			
	// ----- SB type instructions control signals ---------
			
			
	assign rom['h63 ] = 'b001000000100001;
	assign rom['h463] = 'b001000000100001;
	assign rom['hE3 ] = 'b010000000100001;
	assign rom['h4E3] = 'b010000000100001;
	assign rom['h263] = 'b011000000100001;
	assign rom['h663] = 'b011000000100001;
	assign rom['h2E3] = 'b100000000100001;
	assign rom['h6E3] = 'b100000000100001;
	
	// add bltu,bgeu instructions too 


	
	
	assign ctrl_out = rom[addr];        // Can use a inital block too



	

endmodule
