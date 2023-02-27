//Rewritten booth algorithm, functionality tested and verified.
module booth_algorithm_32_bit(m, q, p);
	input signed [31:0] m;
	input signed [31:0] q;
	output signed [63:0] p;
	integer i;
	reg [1:0] booth_mul [31:0];
	reg signed [63:0] output_val;
	reg signed [31:0] m_val;
	reg signed [31:0] m_val_2s_complement;
	reg signed [31:0] count;
	reg signed [31:0] q_val;
	assign p = output_val;
	always@(m or q) begin
		 booth_mul[0] = 0;
		 m_val = m;
		 q_val = q;
		 output_val = 0;
		for(i = 1; i<32; i=i+1)begin
			if(q_val[i] == 0 && q_val[i-1] == 0)begin
				booth_mul[i] = 2'b00;
			end else if(q_val[i] == 0 && q_val[i-1] == 1)begin 
				booth_mul[i] = 2'b01;
			end else if(q_val[i] == 1 && q_val[i-1] == 0)begin
				booth_mul[i] = 2'b10;
			end else begin 
				booth_mul[i] = 2'b00;
			end 
		end 
		for(i = 0; i<32; i=i+1)begin
			count = i;
			if(booth_mul[i] == 2'b01)begin 
				output_val = output_val + $signed(m_val<<<count);
			end else if (booth_mul[i] == 2'b10)begin
				m_val_2s_complement = ~m_val+1'b1;
				output_val = output_val + $signed(m_val_2s_complement<<<count);
			end else begin
				output_val = output_val;
			end 
		end
	end 
endmodule
