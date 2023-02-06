module register (clk, clr, r1in, data_in, data_out);
input clk;
input clr;
input r1in;
input [31:0] data_in;
output reg [31:0] data_out;
always@(posedge clk) begin
  if(r1in)
    data_out <= data_in;
end
endmodule 