//Fixed RCA functionality by connecting outputs in rca_16_bit, and made code more concise by removing half_adder module.
module full_adder(c_out, s, a, b, c_in);
	output s;
	output c_out;
	input a;
	input b;
	input c_in;
	assign s = a ^ b ^ c_in;
	assign c_out = ((a ^ b) & c_in)|(a & b);
endmodule 

module rca_4_bit(output c_out, output[3:0] sum, input [3:0] a, b, input c_in);	//Ripple carry adder for a 4 bit number
	wire c_in2, c_in3, c_in4; 
	full_adder M1(c_in2, sum[0], a[0], b[0], c_in);
	full_adder M2(c_in3, sum[1], a[1], b[1], c_in2);
	full_adder M3(c_in4, sum[2], a[2], b[2], c_in3);
	full_adder M4(c_out, sum[3], a[3], b[3], c_in4);
endmodule

module rca_16_bit(output c_out, output[15:0] sum, input [15:0] a, b, input c_in); //Ripple carry adder for a 16 bit number
	wire c_in4, c_in8, c_in12;
	rca_4_bit M1(c_in4, sum[3:0], a[3:0], b[3:0], c_in);
	rca_4_bit M2(c_in8, sum[7:4], a[7:4], b[7:4], c_in4);
	rca_4_bit M3(c_in12, sum[11:8], a[11:8], b[11:8], c_in8);
	rca_4_bit M4(c_out, sum[15:12], a[15:12], b[15:12], c_in12);
endmodule

module rca_32_bit(c_out, sum, a, b, c_in); //Ripple carry adder for a 32 bit number
	output wire c_out;
	output wire [31:0] sum;
	input wire [31:0] a;
	input wire [31:0] b;
	input wire c_in;
	wire c_in16;
	rca_16_bit M1(c_in16, sum[15:0], a[15:0], b[15:0], c_in);
	rca_16_bit M2(c_out, sum[31:16], a[31:16], b[31:16], c_in16);
endmodule 
