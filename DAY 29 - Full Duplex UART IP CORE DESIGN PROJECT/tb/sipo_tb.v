`timescale 1ns/1ps
module sipo_tb;

	reg baud_clk,rstn;
	reg rx;	// Serial Input
	wire busy;	//  Denoting  busy state
	wire [10:0] data_out;
	wire def_en;	//Deframe Unit Enable

	sipo DUT(baud_clk,rstn,rx,busy,data_out,def_en);	

	initial
	begin
		baud_clk=1'b0;
		forever #3255.208 baud_clk=~baud_clk;
	end


	initial
	begin
		rx=1'b1;
		rstn=1'b0;
		@(negedge baud_clk);
		rstn=1'b1;
		rx=1'b0;
		//@(negedge baud_clk);	
		repeat(9)
		begin
			#104166.656 rx=~rx;
		end
		#104166.656 rx=1'b1;
		#104166.656;
		#104166.656;
		$finish;
	end

endmodule
		