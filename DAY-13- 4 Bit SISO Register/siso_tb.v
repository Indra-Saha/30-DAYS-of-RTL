module siso_tb;

	reg clk,rst,in;
	wire out;

siso DUT(.clk(clk),.rst(rst),.in(in),.out(out));

initial
begin
	clk=0;
	forever #10 clk=~clk;
end

task reset;
begin
	@(negedge clk);
		rst=1'b1;
	@(negedge clk)
		rst=1'b0;
end
endtask

task inputs;
input x;
begin
	@(negedge clk);
	in=x;
end
endtask

initial
begin

	in=1'b0;
	reset;
	inputs(1);
	inputs(1);
	inputs(1);
	inputs(0);
	inputs(1);
	inputs(0);
	#300
	$finish;
end

endmodule
