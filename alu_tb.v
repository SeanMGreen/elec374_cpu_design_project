module alu_tb;
	reg [31:0] in_a; 
	reg [31:0] in_b;
	reg [1:0] in_sel;
	wire [31:0] output_hi;
	wire [31:0] output_lo;
	
	initial begin
		in_a <= 32'h00000000a;
		in_b <= 32'h00000005;
		in_sel <= 2'b0011;
		#300;
	end
	alu DUT (.a(in_a), .b(in_b), .alu_sel(in_sel), .c_hi(output_hi), .c_lo(output_lo));
endmodule 