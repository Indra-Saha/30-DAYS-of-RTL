module sequence_tb;

	reg clk,rst;
	wire [31:0] seq_out;

	sequence DUT(clk,rst,seq_out);
	initial
	begin
		clk=1'b0;
		forever #10 clk=~clk;
	end


	initial
	begin
		@(negedge clk);
			rst=1'b0;
		@(negedge clk);
			rst=1'b1;
		repeat(18)
			@(negedge clk);
		$finish;
	end
endmodule