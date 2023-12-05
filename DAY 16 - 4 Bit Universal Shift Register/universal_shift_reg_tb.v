module universal_shift_reg_tb;

	reg [3:0]xp;
	reg [1:0] dir;
	reg clk,rst;
	wire [3:0]qp;
	wire qs;

universal_shift_reg DUT(clk,rst,xp,dir,qp,qs);

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
input [3:0]x;
input [1:0]d;
begin
	@(negedge clk);
		xp=x;
		dir=d;
end
endtask

initial
begin
	reset;
	inputs(4'b1010,2'b11);
	inputs(4'b1010,2'b10);
	inputs(4'b1010,2'b01);
	inputs(4'b1010,2'b0);
	inputs(4'b1100,2'b01);
	inputs(4'b1100,2'b11);
	inputs(4'b1000,2'b0);
	#20 $finish;
end

endmodule	