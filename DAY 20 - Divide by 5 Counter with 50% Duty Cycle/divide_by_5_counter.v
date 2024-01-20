module divide_by_5_counter(clk,rst,q);

	input clk,rst;
	output q;
	reg [2:0] count1,count2;

	assign w1=(count1==3'd4)?1'b1:1'b0;
	assign w2=(count2==3'd4)?1'b1:1'b0;
	
	always@(posedge clk)
	begin
		if(rst)
			count1<=0;
		else 
		begin

			if(w1)
				count1<=0;
			else
				count1<=count1+1'b1;
		end
	end

	always@(negedge clk)
	begin
		if(rst)
			count2<=0;
		else 
		begin

			if(w2)
				count2<=0;
			else
				count2<=count1+1'b1;
		end
	end

	assign q= count1[1] | count2[1];

endmodule
