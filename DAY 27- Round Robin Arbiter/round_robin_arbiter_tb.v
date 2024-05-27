module round_robin_arbiter_tb;

	reg clk,rst;
	reg[3:0] req;
	wire [3:0]grant;

	round_robin_arbiter DUT(clk,rst,req,grant);

initial
begin
	clk=1'b0;
	forever #10 clk=~clk;
end

task inputs;
input [3:0]din;
begin

	@(negedge clk);
		req=din;
end
endtask

task reset;
begin
	@(negedge clk);
		rst=1'b1;
	@(negedge clk);
		rst=1'b0;
end
endtask

initial
begin
	req=4'b0000;
	reset();
	inputs(4'b0110);
	inputs(4'b1001);
	inputs(4'b0110);
	inputs(4'b1011);
	inputs(4'b1000);
	inputs(4'b0011);
	inputs(4'b0001);
	inputs(4'b1110);
	inputs(4'b1111);
	#20 $finish;
end

endmodule
	
