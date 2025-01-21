

module bus #(parameter Bus_width =32 , Bus_length = 32) 

(

	input  logic signed [Bus_length-1:0][Bus_width-1:0] data_lines , 
	input  logic        [Bus_length-1:0]                sel_lines  ,

	output tri   signed      [Bus_width-1:0]                bus_out    
	
	
);


	genvar i ;
	
	generate 
	
		for(i=0 ; i<Bus_length ; i=i+1) begin : buffer

			assign bus_out = (sel_lines[i]==1) ? data_lines[i] : {Bus_width{1'bz}} ;

		end

	endgenerate




endmodule