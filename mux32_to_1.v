module mux32_to_1 (output [31:0] mux_out,
                   input [31:0]  data_31, data_30, data_29, data_28, data_27, data_26, data_25, data_24, data_23, data_22, data_21, data_20, data_19, data_18, data_17, data_16, data_14, data_13, data_12, data_11, data_10, data_9, data_8, data_7, data_6, data_5, data_4, data_3, data_2, data_1, data_0,
						 input [4:0]   select,
						 input         enable
						 );
reg [31:0] mux_int; 
case(select):
  5'b00000 : data_0;
  5'b00001 : data_1;
  5'b00010 : data_2;
  5'b00011 : data_3; 
  5'b00100 : data_4;
  5'b00101 : data_5;
  5'b00110 : data_6;
  5'b00111 : data_7;
  5'b01000 : data_8;
  5'b01001 : data_9;
  5'b01010 : data_10;
  5'b01011 : data_11;
  5'b01100 : data_12;
  5'b01101 : data_13;
  5'b01110 : data_14;
  5'b01111 : data_15;
  5'b10000 : data_16;
  5'b10001 : data_17;
  5'b10010 : data_18;
  5'b10011 : data_19;
  5'b10100 : data_20;
  5'b10101 : data_21;
  5'b10110 : data_22;
  5'b10111 : data_23;
  5'b11000 : data_24;
  5'b11001 : data_25;
  5'b11010 : data_26; 
  5'b11011 : data_27;
  5'b11100 : data_28;
  5'b11101 : data_29;
  5'b11110 : data_30;
  5'b11111 : data_31;
endcase 
endmodule 