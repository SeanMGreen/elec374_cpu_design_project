module alu(a, b, alu_sel, c_hi, c_lo);
  input [31:0] a;
  input [31:0] b;
  input [3:0] alu_sel;
  output [31:0] c_hi;
  output [31:0] c_lo;
  wire c_in;
  wire c_out;
  wire [31:0] add_out;
  wire [31:0] sub_out;
  wire [63:0] mul_out;
  wire [31:0] div_out;
  wire [30:0] tmp0;
  wire [31:0] tmp1;
  wire [31:0] tmp2;
  wire enable;
  wire bo_in;
  wire bo_out;
  assign c_in = 0;
  assign tmp0 = 0;
  assign tmp1 = 0;
  assign tmp2 = 0;
  assign bo_in = 1;
  rca_32_bit add(.c_out(c_out), .sum(add_out), .a(a), .b(b), .c_in(c_in));
  subtractor sub(.bo_out(bo_out), .d(sub_out), .a(a), .b(b), .bo_in(bo_in));
  multiplier mul(.a(a), .b(b), .m(mul_out));
  divider    div(.a(a), .b(b), .q(div_out));
  mux4_to_1  mux0(.mux_out(c_lo), .data3(add_out), .data2(sub_out), .data1(mul_out[31:0]), .data0(div_out), .select(alu_sel));
  mux4_to_1  mux1(.mux_out(c_hi), .data3({tmp0,c_out}), .data2({tmp1,bo_out}), .data1(mul_out[63:32]), .data0(tmp2), .select(alu_sel));
endmodule 
	
  
