module bus(R0out,
			  R1out,
			  R2out,
			  R3out,
			  R4out,
			  R5out,
			  R6out,
			  R7out,
			  R8out,
			  R9out,
			  R10out,
			  R11out,
			  R12out,
			  R13out,
			  R14out,
			  R15out,
			  HIout,
			  LOout,
			  Zhighout,
			  Zlowout,
			  PCout,
			  MDRout,
			  InPortOut,
			  Cout,
			  BusMuxIn_R0,
			  BusMuxIn_R1,
			  BusMuxIn_R2,
			  BusMuxIn_R3,
			  BusMuxIn_R4,
			  BusMuxIn_R5,
			  BusMuxIn_R6,
			  BusMuxIn_R7,
			  BusMuxIn_R8,
			  BusMuxIn_R9,
			  BusMuxIn_R10,
			  BusMuxIn_R11,
			  BusMuxIn_R12,
			  BusMuxIn_R13,
			  BusMuxIn_R14,
			  BusMuxIn_R15,
			  BusMuxIn_HI,
			  BusMuxIn_LO,
			  BusMuxIn_Zhigh,
			  BusMuxIn_Zlow,
			  BusMuxIn_PC,
			  BusMuxIn_MDR,
			  BusMuxIn_InPort,
			  C_sign_extended,
			  BusMuxOut
			  );
	input R0out;
	input R1out;
	input R2out;
	input R3out;
	input R4out;
	input R5out;
	input R6out;
	input R7out;
	input R8out;
	input R9out;
	input R10out;
	input R11out;
	input R12out;
	input R13out;
	input R14out;
	input R15out;
	input HIout;
	input LOout;
	input Zhighout;
	input Zlowout;
	input PCout;
	input MDRout;
	input InPortOut;
	input Cout;
	input [31:0] BusMuxIn_R0;
	input [31:0] BusMuxIn_R1;
	input [31:0] BusMuxIn_R2;
	input [31:0] BusMuxIn_R3;
	input [31:0] BusMuxIn_R4;
	input [31:0] BusMuxIn_R5;
	input [31:0] BusMuxIn_R6;
	input [31:0] BusMuxIn_R7;
	input [31:0] BusMuxIn_R8;
	input [31:0] BusMuxIn_R9;
	input [31:0] BusMuxIn_R10;
	input [31:0] BusMuxIn_R11;
	input [31:0] BusMuxIn_R12;
	input [31:0] BusMuxIn_R13;
	input [31:0] BusMuxIn_R14;
	input [31:0] BusMuxIn_R15;
	input [31:0] BusMuxIn_HI;
	input [31:0] BusMuxIn_LO;
	input [31:0] BusMuxIn_Zhigh;
	input [31:0] BusMuxIn_Zlow;
	input [31:0] BusMuxIn_PC;
	input [31:0] BusMuxIn_MDR;
	input [31:0] BusMuxIn_InPort;
	input [31:0] C_sign_extended;
	output [31:0] BusMuxOut;
	
	wire [31:0] code;
	wire [4:0] select;
	wire [31:0] tmp0;
	wire [31:0] tmp1;
	wire [31:0] tmp2;
	wire [31:0] tmp3;
	wire [31:0] tmp4;
	wire [31:0] tmp5;
	wire [31:0] tmp6;
	wire [31:0] tmp7;
	assign code[0] = R0out;
	assign code[1] = R1out;
	assign code[2] = R2out;
	assign code[3] = R3out;
	assign code[4] = R4out;
	assign code[5] = R5out;
	assign code[6] = R6out;
	assign code[7] = R7out;
	assign code[8] = R8out;
	assign code[9] = R9out;
	assign code[10] = R10out;
	assign code[11] = R11out;
	assign code[12] = R12out;
	assign code[13] = R13out;
	assign code[14] = R14out;
	assign code[15] = R15out;
	assign code[16] = HIout;
	assign code[17] = LOout;
	assign code[18] = Zhighout;
	assign code[19] = Zlowout;
	assign code[20] = PCout;
	assign code[21] = MDRout;
	assign code[22] = InPortOut;
	assign code[23] = Cout;
	assign code[24] = 0;
	assign code[25] = 0;
	assign code[26] = 0;
	assign code[27] = 0;
	assign code[28] = 0;
	assign code[29] = 0;
	assign code[30] = 0;
	assign code[31] = 0;
	assign tmp0=0;
	assign tmp1=0;
	assign tmp2=0;
	assign tmp3=0;
	assign tmp4=0;
	assign tmp5=0;
	assign tmp6=0;
	assign tmp7=0;
	
	encoder32_to_5(.Code(code), .select(select));
	mux32_to_1(.mux_out(BusMuxOut), .data31(tmp7), .data30(tmp6), .data29(tmp5), .data28(tmp4), .data27(tmp3), .data26(tmp2), .data25(tmp1), .data24(tmp0), .data23(C_sign_extended), .data22(BusMuxInPort), .data21(BusMuxIn_MDR), .data20(BusMuxIn_PC), .data19(BusMuxIn_Zlow), .data18(BusMuxIn_Zhigh),.data17(BusMuxIn_LO), .data16(BusMuxIn_HI), .data15(BusMuxIn_R15), .data14(BusMuxIn_R14), .data13(BusMuxIn_R13), .data12(BusMuxIn_R12), .data11(BusMuxIn_R11), .data10(BusMuxIn_R10), .data9(BusMuxIn_R9), .data8(BusMuxIn_R8), .data7(BusMuxIn_R7), .data6(BusMuxIn_R6), .data5(BusMuxIn_R5), .data4(BusMuxIn_R4), .data3(BusMuxIn_R3), .data2(BusMuxIn_R2), .data1(BusMuxIn_R1), .data0(BusMuxIn_R0));
endmodule
