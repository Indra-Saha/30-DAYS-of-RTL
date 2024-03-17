`timescale 1ns/1ns
module freqdiv_tb;

	reg rst,clk;
	wire fclk1,fclk2,fclk3;
	
	freqdiv DUT(clk,rst,fclk1,fclk2,fclk3);

initial
begin
	clk=1'b1;
	forever #5 clk=~clk;
end

initial
begin
	clk=0;
	rst=1'b1;
	#20 rst=1'b0;
	#300 $finish;
end

endmodule