module ss
(
	input logic [3:0] bcd,
	
	output logic [0:6] seg

);


	always_comb begin

		case(bcd) 
		
			0:seg = 7'b0000001;
			1:seg = 7'b1001111;
			2:seg = 7'b0010010;
			3:seg = 7'b0000110;
			4:seg = 7'b1001100;
			5:seg = 7'b0100100;
			6:seg = 7'b0100000;
			7:seg = 7'b0001111;
			8:seg = 7'b0000000;
			9:seg = 7'b0000100;
			default: seg = 7'b0000001;
			
			
		endcase

	end
	
endmodule