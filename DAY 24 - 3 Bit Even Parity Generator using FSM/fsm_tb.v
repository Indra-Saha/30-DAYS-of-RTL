module fsm_tb;

	reg clk,rst,w;
	wire z;

	fsm DUT(clk,rst,w,z);

	initial
	begin
		clk=1'b0;
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
input din;
begin
	@(negedge clk);
	w=din;
end
endtask


initial
begin
	w=0;
	reset();
	inputs(0);
	inputs(0);
	inputs(0);
	inputs(1);
	inputs(1);
	inputs(1);
	inputs(0);
	inputs(0);
	inputs(1);
	inputs(0);
	inputs(1);
	inputs(1);
	inputs(1);
	inputs(1);
	inputs(1);
	$finish();
end

endmodule
