
`timescale 1ns/1ps
module baudgenTx_tb;

	reg clk,rstn;
	reg [1:0] baud_rate;
	wire baud_clk;
	integer i;

	baudgenTx DUT(clk,rstn,baud_rate,baud_clk);

	initial
	begin
		clk=1'b0;
		forever #10 clk=~clk;
	end


	initial
	begin
		rstn=1'b0;
		#100 rstn=1'b1;
	end

	initial
	begin

		for(i=0;i<4;i=i+1)
		begin
			baud_rate=i;
			#(1680000/(i+1));
		end

		#3650000 $finish;
	end

endmodule
