module alu(a,b,alu_sel,c);
  input [31:0] a;
  input [31:0] b;
  input [1:0] alu_sel;
  output[63:0] c;
  wire [31:0] reg1, reg2;
  
  assign reg1 = a;
  assign reg2 = b;
  
  assign c = reg3;
  
  always@(alu_sel or reg1 or reg2)
  begin
    case(alu_sel)
	   2'b00 : reg3<= reg1+reg2;
		2'b01 : reg3 <= reg1-reg2;
		2'b10 : reg3 <= reg1*reg2;
		2'b11 : reg3 <= reg1/reg2;
		default : reg3 <= 0;
	endcase 
endmodule 
	
  