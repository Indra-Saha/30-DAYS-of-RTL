`timescale 1ns/1ns

module freqdiv (clk,rst,fclk1,fclk2,fclk3);

	input rst,clk;
	output fclk1,fclk2,fclk3;
	reg a1,a2;

	reg [2:0] count;
	wire w1;
assign w1=(count==4)?1'b1:1'b0;

always@(posedge clk)
begin
	if(rst)
		count<=0;
	else if(w1)
		count<=0;
	else
		count<=count+1'b1;
end

assign fclk2=count[1];
assign fclk3=count[2];

always@(posedge clk)
begin
	if(count==0 && !rst)
		
		a1<=1;
	else
		a1<=0;
end

always@(negedge clk)
begin
	if(count==3)
		a2<=1;
	else
		a2<=0;
end

assign fclk1=a1 | a2;

endmodule	