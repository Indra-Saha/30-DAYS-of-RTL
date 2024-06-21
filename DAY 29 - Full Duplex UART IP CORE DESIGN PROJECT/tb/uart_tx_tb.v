
`timescale 1ns/1ps
module uart_tx_tb;


	reg clk,rstn,parity_type;
	reg [1:0] baud_rate;
	reg en; //Enable signal for Transmission
	reg [7:0] data_in;
	wire tx;
	wire busy;//Signal denoting Ongoing Transmission
	wire done;// Signal denoting Transmission done

	uart_tx DUT(clk,rstn,en,data_in,baud_rate,parity_type,tx,done,busy);

	initial
	begin

		clk=1'b0;
		forever #10 clk=~clk;
	end



	initial
	begin
		baud_rate=2;	
		parity_type=1;	
		rstn=1'b0;
		en=1'b0;
		@(negedge clk);
		rstn=1'b1;
		@(negedge clk);	
		en=1'b1;
		data_in=8'b10101001;
		#1354166.67;			//(50Mhz/2*9600)x(20)x2x13	(clkfreq/2*baud_rate)x(clkperiod)x2(no_of_clks required for 1 baud_clk)x(11 nos of bit + 2 for reset)
		baud_rate=1;
		parity_type=0;	
		data_in=8'b11110111;
		#2500000;			//Same Calculation as above
		baud_rate=0;	
		data_in=8'b11111111;
		#5000000.02;			//Same Calculation as above
		baud_rate=3;
		parity_type=1;
		data_in=8'b00001001;
		#677083.332;			//Same Calculation as above
		$finish;
	end

	
endmodule