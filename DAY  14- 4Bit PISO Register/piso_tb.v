// 4 Bit Piso Register

module piso_tb;

	reg [3:0]x;
	reg clk,rst,load;
	wire qout;

	piso DUT(clk,rst,x,qout,load);

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
input [3:0]in;
begin

	@(negedge clk);
		load=1'b1;
		x=in;
	@(negedge clk);
		load=1'b0;
end
endtask

initial
begin
	reset;
	inputs(4'b1011);
	repeat(3)
	@(negedge clk);
	inputs(4'b1111);
	repeat(3)
	@(negedge clk);
 	#10 $finish;
end

endmodule