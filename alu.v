module alu(a,b,alu_sel, c_hi, c_lo);
  input [31:0] a;
  input [31:0] b;
  input [1:0] alu_sel;
  reg [31:0] output_hi;
  reg [31:0] output_lo;
  output wire [31:0] c_hi;
  output wire [31:0] c_lo;
  reg [63:0] temp;
  assign c_hi = output_hi;
  assign c_lo = output_lo;
  always@(alu_sel or a or b) begin
    case(alu_sel)
	   2'b00 : begin
		   temp = a+b;
			output_hi= temp[63:32];
			output_lo = temp[31:0];
		end
		2'b01 : begin
			temp = a-b;
			output_hi= temp[63:32];
			output_lo = temp[31:0];
		end
		2'b10 : begin
			temp = a*b;
			output_hi= temp[63:32];
			output_lo = temp[31:0];
		end
		2'b11 : begin
			temp = a/b;
			output_hi= temp[63:32];
			output_lo = temp[31:0];
		end
		default : begin
			output_hi= 32'h00000000;
			output_lo = 32'h00000000;
		end
	endcase
  end
endmodule 
	
  