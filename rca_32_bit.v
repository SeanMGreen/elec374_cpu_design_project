//rca_32_bit.v
module half_adder(output c_out, sum, input a, b);		//Starts with half adder, used the most so done first
	xor (sum, a, b)
	and (c_out, a, b)
endmodule

module full_adder(output c_out, sum, input a, b, c_in);	//Full adder for one bit of a binary number
	wire w1, w2, w3;
	half_adder M1(w2, w1, a, b);
	half_adder M2(w3, sum, c_in, w1);
	or(c_out, w3, w2);
endmodule

module rca_4_bit(output c_out, output[3:0] sum, input [3:0] a, b, input c_in);	//Ripple carry adder for a 4 bit number
	wire c_in2, c_in3, c_in4;
	full_adder M1(c_in2, sum[0], a[0], b[0], c_in);
	full_adder M2(c_in3, sum[1], a[1], b[1], c_in);
	full_adder M3(c_in4, sum[2], a[2], b[2], c_in);
	full_adder M4(c_out, sum[3], a[3], b[3], c_in);
endmodule

module rca_16_bit(output c_out, output[15:0] sum, input [15:0] a, b, input c_in); //Ripple carry adder for a 16 bit number
	wire c_in4, c_in8, c_in12;
	rca_4_bit M1(c_in4, sum[3:0], a[3:0], b[3:0], c_in);
	rca_4_bit M2(c_in8, sum[7:4], a[7:4], b[7:4], c_4);
	rca_4_bit M3(c_in12, sum[11:8], a[11:8], b[11:8], c_8);
	rca_4_bit M4(c_out, sum[15:12], a[15:12], b[15:12], c_12);
endmodule

module rca_32_bit(output c_out, output[31:0] sum, input [31:0] a, b, input c_in); //Ripple carry adder for a 32 bit number
	wire c_in16;
	rca_16_bit M1(c_in16, sum[15:0], a[15:0], b[15:0], c_in);
	rca_16_bit M2(c_out, sum[31:16], a[31:16], b[31:16], c_in16);
endmodule