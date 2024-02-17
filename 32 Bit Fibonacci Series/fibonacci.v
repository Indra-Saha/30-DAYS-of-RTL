module fibonacci(clk,rst,x);

	input clk,rst;
	reg [31:0]out;
	reg [31:0] count;
	reg [32:0] check;
	output reg [31:0]x;

always@(posedge clk)
begin
	if(rst)
	begin
		count<=1;
		out<=0;
	end
	else if(count==32'b1)
	begin
		x<=out;
		out<=1;
		count<=count+1'b1;
		check=1'b1;
	end
	else if(check<32'hffffffff)
	begin
		check<=out+x;
		out<=out+x;
		x<=out;
		count<=count+1'b1;
	end
	else
	begin
		count<=1;
		out<=0;
		check=1'b1;
	end
end

endmodule
			