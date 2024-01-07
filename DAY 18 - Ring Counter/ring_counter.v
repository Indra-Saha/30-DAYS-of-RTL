module ring_counter(clk,rst,load,in,q);

	input clk,rst,in,load;
	output reg[3:0]q;

	always@(posedge clk)
	begin
		if(rst)
			q<=4'b0001;
		else
			begin
				if(load)
					q<={q[2:0],in};
				else
					q<={q[2:0],q[3]};
			end
	end

endmodule
				