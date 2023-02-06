//`include "register.v"
//`include "mux2_to_1.v"
module mem_data_reg (input busmuxout,
							input mdatain,
							input read,
							input clear,
							input clock,
							input mdrin,
							output q);
wire mux_output;
mux2_to_1 mdr_mux(.a(busmuxout), .b(mdatain), .sel(read), .output_val(mux_output));
register mdr_reg(.clk(clock), .clr(clear), .r1in(mdrin), .data_in(mux_output), .data_output(q));

endmodule
		
	
							