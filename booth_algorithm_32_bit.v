//booth_algorithm_32_bit.v
`timescale 1ns/10ps
module booth_algorithm_32_bit(q, m, p);
	input [31:0] q;				//Multiplier
	input [31:0] m;				//Multiplicand
	output [63:0] p;			   //Product
	
	reg [63:0] p;
		
	integer i, j;					//Looping variable
	integer q_temp;			//Stores q value
	
	reg [31:0] q_vals;		//Stores value of each bit
	reg [31:0] booth_vals ;	//Stores booth algorithm actions
	wire [31:0] m_2_comp; 	//Stores 2's compliment value of multiplicand
	reg [63:0] temp; 		//Temp value used for required operations
	
	neg_32_bit M1(m_2_comp[31:0], m[31:0]);
	
	initial begin				//Converts the multiplier to binary, with each value accessible via an array
		q_temp = q;
		for (i = 31; i >= 0; i = i - 1) begin
			if (q_temp <= 2**i) begin 	//Checks if bit is in multiplier
				q_vals[i] = 1;			//Assigns 1 if true
				q_temp = q_temp - 2**i;
			end else begin				
				q_vals[i] = 0;			//Assigns 0 otherwise
			end
		end
		
		for (i = 0; i < 32; i = i + 1) begin		//Assigns the booth recording values for use in the booth algorithm
			if (i == 0) begin						//Bit 0 has no "right bit" so 0 is used in both cases
				if (q_vals[i] == 0)booth_vals[i] = 0;else booth_vals[i] = -1;
				//if (q_vals[i] == 1)booth_vals[i] = -1
			end else begin							//Otherwise, it checks both the current bit, and one bit lower
				if (q_vals[i] == 0 && q_vals[i-1] == 0)booth_vals[i] = 0;else
				if (q_vals[i] == 0 && q_vals[i-1] == 1)booth_vals[i] = 1;else
				if (q_vals[i] == 1 && q_vals[i-1] == 0)booth_vals[i] = -1;else booth_vals[i] = 0; 
				//if (q_vals[i] == 1 && q_vals[i-1] == 1)booth_vals[i] = 0;
			end
			
			if (booth_vals[i] == 1) begin				//Checks if the booth value is 1
				for (j = i; j < 63; j = j + 1) begin
					if (j < 32) begin
						temp[j] = m[j];					//Sets the temp value to that of the multiplicand
					end else begin
						temp[j] = m[31];				//Sets the other bits to the value of the highest bit
					end
				end
				p[j] = p[j] + temp[j];					//Adds the temp value to the result
				
			end else if (booth_vals[i] == -1) begin		//Checks if the booth value is -1
				for (j = i; j < 64; j = j + 1) begin
					if (j < 32) begin
						temp[j] = m_2_comp[j];			//Sets the temp value to the 2's compliment of the multiplicand
					end else begin
						temp[j] = m_2_comp[31];			//Sets the other bits to the value of the highest bit
					end
				end	
				p[j] = p[j] + temp[j];					//Adds the temp value to the result
			end
		end
	end
endmodule