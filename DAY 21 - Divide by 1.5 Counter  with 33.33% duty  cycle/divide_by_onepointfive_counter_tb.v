module divide_by_onepointfive_counter_tb;

	reg clk,rst;
	wire q;

	divide_by_onepointfive_counter DUT(clk,rst,q);

	initial
	begin
		clk=1'b0;
		forever #10 clk=~clk;
	end

	initial
	begin
		rst=1'b1;
		#20 rst=1'b0;
		#500 $finish;
	end

endmodule