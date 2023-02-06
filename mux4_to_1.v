module mux4_to_1 (output [31:0] mux_out,
                  input [31:0]  data3, data2, data1, data0,
						input [1:0]   select,
						input enable
						);
reg [31:0] mux_int;
assign mux_out = mux_int;
always@(enable) begin
case(select)
  2'b00 : mux_int = data0;
  2'b01 : mux_int = data1;
  2'b10 : mux_int = data2; 
  2'b11 : mux_int = data3;
  default : mux_int = 32'bx;
endcase
end
endmodule 
  