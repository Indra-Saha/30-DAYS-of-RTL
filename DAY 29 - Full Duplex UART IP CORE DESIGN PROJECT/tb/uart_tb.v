`timescale 1ns/1ps
module uart_tb;

	reg en;
	reg [7:0] data_in;
	wire tx,done_tx,busy_tx;

	reg clk,rstn,rx,parity_type;
	reg [1:0] baud_rate;
	wire done_rx,busy_rx,start_err,stop_err,data_err;
	wire [7:0] data_out;

	uart_top DUT(clk,rstn,rx,parity_type,en,data_in,tx,done_tx,busy_tx,baud_rate,
		done_rx,busy_rx,start_err,stop_err,data_err,data_out);

	initial
	begin
		clk=1'b0;
		forever #10 clk=~clk;
	end

	initial
	begin
		rstn=1'b0;
		en=0;
		rx=1'b1;
		parity_type=1'b1; //ODD
		baud_rate=2'b10; //9600
		#10 rstn=1'b1;
		fork
		begin
			#1354166.67;
			en=1'b1;
			data_in=8'b11110110;
			#1354166.67;	
			en=1'b0;
		end


		begin
			#104166.667;
			rx=1'b0;
			#104166.667 rx=1'b0;
			#104166.667 rx=1'b1;
			#104166.667 rx=1'b1;
			#104166.667 rx=1'b1;
			#104166.667 rx=1'b0;
			#104166.667 rx=1'b1;
			#104166.667 rx=1'b0;
			#104166.667 rx=1'b1;
			#104166.667 rx=1'b0;
			#104166.667 rx=1'b1;
			#104166.667;
			#104166.667;
		end

		join
		rstn=1'b0;
		en=0;
		rx=1'b1;
		parity_type=1'b0; //EVEN
		baud_rate=2'b11; //19200
		#10 rstn=1'b1;
		fork
		begin
			#677083.332;
			en=1'b1;
			data_in=8'b10010010;
			#677083.332;	
			en=1'b0;
		end


		begin
			#52083.333;
			rx=1'b0;
			#52083.333 rx=1'b1;
			#52083.333 rx=1'b1;
			#52083.333 rx=1'b1;
			#52083.333 rx=1'b1;
			#52083.333 rx=1'b0;
			#52083.333 rx=1'b1;
			#52083.333 rx=1'b1;
			#52083.333 rx=1'b1;
			#52083.333 rx=1'b0;// Wrong Parity
			#52083.333 rx=1'b1;
			#52083.333;
			#52083.333;
		end

		join
		
		$finish;
	end
endmodule
			