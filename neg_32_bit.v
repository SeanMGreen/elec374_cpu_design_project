//neg_32_bit.v
`timescale 1ns/10ps
module neg_32_bit(a_out, a_in);
	input [31:0] a_in;
	
	integer i, carry;
	reg [1:0] temp [31:0];
	
	output [31:0] a_out;
	reg [31:0] a_out;
	
	initial begin
		for (i = 0; i < 32; i = i + 1) begin
			if (a_in[i] == 0)temp[i] = 1;else temp[i] = 0;
			
			if (i == 0) begin
				temp[i] = temp[i] + 1;
				if (temp[i] != 1) begin
					temp[i] = 0;
					carry = 1;
				end
			end else begin 
				if (carry == 1 && temp[i] == 1) begin
					temp[i] = 0;
				end else begin
					carry = 0;
				end
			end
			a_out[i] = temp [i];
		end
	end
endmodule