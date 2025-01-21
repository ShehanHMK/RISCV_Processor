module Reg_file #(parameter Reg_size = 32 , Num_of_reg = 32 , Addr_bits = 5 )

(   
	//I/O Definitions
	
	input  logic clk,
	input  logic WE,
	
	input  logic [Addr_bits-1:0] A1,A2,A3,
	
	input  logic signed [Reg_size-1:0] WD,
	
	output logic signed [Reg_size-1:0] RD1,RD2
	
	
);

	//Registers 

	logic signed [Num_of_reg-1:1][Reg_size-1:0] Register;
	
	
	//Hardwired x0 Register
	
	logic signed [Reg_size-1:0] x0 ;
	assign x0 = {Reg_size{1'b0}} ;
	
	
	//Assigning values to output
	
	assign RD1 = (A1 == 0)? x0:Register[A1] ;
	assign RD2 = (A2 == 0)? x0:Register[A2] ;
	
	
	//Writing Data to Registers
	
	always_ff @(posedge clk) begin                        // Timing issue in Regwrite signal -- > might work if negedge is used
	
	
		if(WE && (A3 != 0 )) begin
			Register[A3] <= WD ;
			
			$display("Data = %d --- Written to register %d",WD,A3);  // --------->> Just for the simulation, remove when sysnthesizing
			
		end
			
		
	end
	
	
	initial begin 
	
		Register[1] = 'h6 ;    //  stored values in decimal  - 1  remove when synthesizing or fully connecting the datapath
		Register[2] = 'h21 ;   // 33
		Register[5] = 'h32 ;   // 50
		Register[6] = 'h14 ;   // 20
		Register[10]= 'h22 ;   //34
		Register[11]= 'h22 ;   //34
		
	
	end
	
	
	


endmodule