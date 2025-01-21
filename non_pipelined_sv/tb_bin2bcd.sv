module tb_bin2bcd;

	timeunit 	  1ns;
	timeprecision 1ps;
	
	logic [13:0] bin;
	logic [15:0] bcd;
	
	
	
	bin2bcd dut(.*);
	
	initial begin
	
	bin = 14'b0010_0010_1011_10;
	
	#20 $stop;
	
	
	
	
	
	
	
	
	end
	
endmodule