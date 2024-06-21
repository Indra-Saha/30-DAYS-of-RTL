`timescale 1ns/1ps
module uart_rx_tb;

	reg clk,rstn,rx,parity_type;
	reg [1:0] baud_rate;
	wire done,busy,start_err,stop_err,data_err;
	wire [7:0] data_out;

	uart_rx DUT(clk,rstn,rx,baud_rate,parity_type,done,busy,start_err,stop_err,data_err,data_out);

	initial
	begin
		clk=1'b0;
		forever #10 clk=~clk;
	end


	initial
	begin
		rx=1'b1;
		rstn=1'b0;
		baud_rate=2'b10;//9600
		parity_type=1'b0;//EVEN
		#10 rstn=1'b1;
		#104166.667;	//[50 MHz/(2x9600)]x2x20   	[ClkFreq/(2xBaud_Rate)]x2(2 half cycles in 1 clk)xTimePeriod for 1 clk
		rx=1'b0;	// START Bit
		#104166.667 rx=1'b1;	//D0
		#104166.667 rx=1'b1;	//D1
		#104166.667 rx=1'b0;	//D2	
		#104166.667 rx=1'b0;	//D3
		#104166.667 rx=1'b0;	//D4
		#104166.667 rx=1'b1;	//D5
		#104166.667 rx=1'b0;	//D6
		#104166.667 rx=1'b1;	//D7
		
		#104166.667 rx=1'b0;	//Parity Bit

		#104166.667 rx=1'b1;	//Stop Bit
		#104166.667;
		#104166.667;

		#1000;
		baud_rate=2'b11;//19200
		parity_type=1'b1;//ODD
		rx=1'b1;	//IDLE

		#52083.333;	//Same Calculation as Previous foor 19200
		rx=1'b0;	// START Bit
		#52083.333 rx=1'b1;	//D0
		#52083.333 rx=1'b1;	//D1
		#52083.333 rx=1'b0;	//D2	
		#52083.333 rx=1'b0;	//D3
		#52083.333 rx=1'b0;	//D4
		#52083.333 rx=1'b1;	//D5
		#52083.333 rx=1'b0;	//D6
		#52083.333 rx=1'b1;	//D7
		

		#52083.333 rx=1'b1;	//Parity Bit

		#52083.333 rx=1'b1;	//Stop Bit
		#52083.333;
		#52083.333;

		$finish;
	end

endmodule

		
		

		
		




