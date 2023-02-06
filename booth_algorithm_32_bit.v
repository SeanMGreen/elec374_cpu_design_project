//booth_algorithm_32_bit.v
module booth_algorithm_32_bit(q, m, p);
	input [31:0] q;				//Multiplier
	input [31:0] m;				//Multiplicand
	output [63:0] p;			//Product		
	
	integer i;					//Looping variable
	integer q_temp = q;			//Stores q value
	
	reg [1:0] q_vals [31:0]		//Stores value of each bit
	reg [1:0] booth_vals [31:0]	//Stores booth algorithm actions
	
	initial begin				//Converts the multiplier to binary, with each value accessible via an array
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
			
			p = p + m*booth_vals[i]		//Sums the values of the bits in the product
		end
	end
