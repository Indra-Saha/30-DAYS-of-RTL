module divide_by_onepointfive_counter(clk,rst,q);

	input clk,rst;
	output q;

	reg [1:0] count;
	reg c1,c2;

	assign w=(count==2'd2)?1'b1:1'b0;

	always@(posedge clk)
	begin
		if(rst)
			count<=0;
		else
		begin
			if(w)
				count<=0;
			else
				count<=count+1'b1;
		end
	end

	always@(posedge clk)
	begin
		if(count==0 || count==2)
			c1<=1'b1;
		else
			c1<=1'b0;
	end

	always@(negedge clk)
	begin
		if(count==1 || count==2)
			c2<=1'b1;
		else
			c2<=1'b0;
	end

	assign q= c1 & c2;

endmodule
			
			
			
