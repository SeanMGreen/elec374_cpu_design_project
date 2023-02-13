//restoring_div_32_bit.v
module restoring_div_32_bit(q, m, d, r);
	input [31:0] q;			//dividend
	input [31:0] m;			//divisor
	
	integer i;				//used for loops
	integer [32:0] r_prev;	//previous r value for restoring
	
	output [31:0] d;		//quotient
	output [32:0] r;		//remainder
	
	initial begin
		for (i = 0; i < 32; i = i + 1) begin
			r[i] = 0; 		//initializes r with all zeros
			d[i] = q[i]
		end
		
		for (i = 0; i < 32; i = i + 1) begin
			r[32:0] << 1;			//shift r by one bit
			if (d[31] == 1) begin
				r[0] = 1;	//makes bit 0 of r 1 if topmost bit of d is 1
			end
			
			r_prev[32:0] = r[32:0];		//stores prev value of r
			d[31:0] << 1;			//shift d by one bit
			
			r = r - m;		//subtracts r by the divisor
			if (r[32] == 1) begin
				d[0] = 0;	//bit 0 of quotient is 0
				r[32:0] = r_prev[32:0]	//restore the r value
			end else begin
				d[0] = 1;	//no restore, bit 0 of quotient is 1
			end
		end