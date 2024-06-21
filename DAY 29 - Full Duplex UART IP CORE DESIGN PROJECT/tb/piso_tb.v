
`timescale 1ns/1ps
module piso_tb;


	reg baud_clk,rstn;
	reg en; //Enable signal for Transmission
	reg parity; //Parity Signnal from Parity Block
	reg [7:0] data_in;
	wire tx;
	wire busy;//Signal denoting Ongoing Transmission
	wire done;// Signal denoting Transmission done

	piso DUT(baud_clk,rstn,en,parity,data_in,tx,busy,done);

	initial
	begin

		baud_clk=1'b0;
		forever #104166.667 baud_clk=~baud_clk;
	end



	initial
	begin
		rstn=1'b0;
		en=1'b0;
		@(negedge baud_clk);
		rstn=1'b1;
		@(negedge baud_clk);	
		en=1'b1;
		data_in=8'b10101001;
		parity=^(8'b10101010);
		#2292000;
		data_in=8'b11110111;
		parity=^(8'b11110111);
		#2292000;
		data_in=8'b11111111;
		parity=^(8'b11111111);
		#2292000;
		data_in=8'b00001001;
		parity=^(8'b00001001);
		#2292000;
		$finish;
	end

	/*initial 
	begin
    		$monitor($time, "   The Outputs:  DataOut = %b  Busy = %b  Done = %b The Inputs:   Enable = %b  Reset = %b Parity Bit = %b  Data In = %b ",
     				tx, busy, done, en, rstn, parity, data_in);
	end
*/
endmodule