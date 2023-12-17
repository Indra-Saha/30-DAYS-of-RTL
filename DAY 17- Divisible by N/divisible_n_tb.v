module divisible_n_tb;

	reg clk,rst,in;
	wire out;
	parameter N=5;
	
	divisible_n #(N)DUT(clk,rst,in,out);

initial
begin
	clk=1'b1;
	forever #10 clk=~clk;
end

task reset;
begin
	@(negedge clk);
		rst=1'b1;
	@(negedge clk);
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
	in=0;
	reset;
	inputs(0);
	inputs(1);
	inputs(0);
	inputs(1);
	inputs(0);
	#50 $finish;
end

endmodule