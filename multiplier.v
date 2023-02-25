module multiplier(a, b, m);
	input [31:0] a;
	input [31:0] b;
	output [63:0] m;
	assign m = a*b;
endmodule 