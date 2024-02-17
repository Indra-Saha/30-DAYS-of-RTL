module fibonacci_tb;

	reg clk,rst;
	wire [31:0]x;
	
	fibonacci DUT(clk,rst,x);

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

	initial
	begin
		reset;
		#1000 $finish;
	end
endmodule