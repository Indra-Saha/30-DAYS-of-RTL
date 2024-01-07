module ring_counter_tb;

	reg clk,rst,in,load;
	wire[3:0]q;

	ring_counter DUT(clk,rst,load,in,q);

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
	input i;
	begin
		@(negedge clk);
			load=1'b1;
			in=i;
		@(negedge clk);
			load=1'b0;
	end
	endtask

	initial
		begin
			reset;
			repeat(7)
			@(negedge clk);
			inputs(1'b1);
			repeat(2)
			@(negedge clk);
			inputs(1'b1);
			repeat(5)
			@(negedge clk);
			$finish;
		end
	
endmodule