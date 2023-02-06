module mux2_to_1 (a,b,sel,output_val);
	input wire [31:0] a;
	input wire [31:0] b;
	input wire sel;
	output reg [31:0] output_val;
	always@(a,b,sel) begin
		if(sel == 0)
			output_val = a;
		else 
			output_val = b;
	end 
endmodule 