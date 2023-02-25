module subtractor (bo_out, d, a, b, bo_in);
	output [31:0] d;
	output bo_out;
	input [31:0] a;
	input [31:0] b;
	input bo_in;
	reg [31:0] b_inv;
	wire [31:0] b_new;
	assign b_new = b_inv;
	integer i;
	always@(a or b or bo_in)begin
		for(i=0; i<32; i=i+1)begin
			b_inv[i] = ~b[i];
		end
	end
	rca_32_bit sub(.c_out(bo_out), .sum(d), .a(a), .b(b_new), .c_in(bo_in));
endmodule 