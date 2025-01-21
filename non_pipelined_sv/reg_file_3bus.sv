module reg_file_3bus #(parameter Reg_size = 32 , Addr_bits = 5 )

(
	//I/O Definitions
	
	input  logic clk,
	input  logic WE ,
	
	input  logic [Addr_bits-1:0] A1,A2,A3,
	
	input  logic signed [Reg_size-1:0] WD,
	
	output tri signed [Reg_size-1:0] RD1,RD2
	

);
	
	// -----Internal wire declaration -----
	
	
	logic [2**Addr_bits-1:0] dec_a3_out ;        // rd  ( Destination register ) address decoder output wires
	logic [2**Addr_bits-1:0] dec_a1_out ;        // rs1 ( Source register      ) address decoder output wires
	logic [2**Addr_bits-1:0] dec_a2_out ;        // rs2 ( Source register      ) address decoder output wires

	logic signed [2**Addr_bits-1:0][Reg_size-1:0] reg_data;        // Data out wires from registers --> 32 outputs from each register and
																						// - 32 registers






	// ---------- Module instantiation ---------
	
	
	decoder #(.Input_size(Addr_bits)) dec_a1       // rs1 source address decoder
	(
		.in(A1),
		.en(1),
		
		.out(dec_a1_out)

	);
	
	
	
	decoder #(.Input_size(Addr_bits)) dec_a2       // rs2 source address decoder
	(
		.in(A2),
		.en(1),
		
		.out(dec_a2_out)

	);
	
	
	
	decoder #(.Input_size(Addr_bits)) dec_a3       // rd destination address decoder
	(
		.in(A3),
		.en(WE),
		
		.out(dec_a3_out)

	);
	


	genvar i;  // Creating register array 
	
	generate

		for(i=1; i<2**Addr_bits ;i=i+1 ) begin : REGISTERS
			
			register #(.Reg_size(Reg_size)) Reg
			(
				.clk(clk),
				.en(dec_a3_out[i]),
				.d_in(WD),
				.d_out(reg_data[i])
			);
		
		end
	
	endgenerate
	
	
	// Making x0 as a hardwired zero register
	
	assign reg_data[0] = 0 ;
	
	
	
	
	// RD1 data bus 
	
	bus #(.Bus_width(Reg_size),.Bus_length(2**Addr_bits)) Bus_1 
	(
		.data_lines(reg_data),
		.sel_lines(dec_a1_out) ,
		
		.bus_out(RD1)
	);
	
	//RD2 data bus
	
	bus #(.Bus_width(Reg_size),.Bus_length(2**Addr_bits)) Bus_2 
	(
		.data_lines(reg_data),
		.sel_lines(dec_a2_out) ,
		
		.bus_out(RD2)
	);
	
	
	
	
	
	
	
	
endmodule