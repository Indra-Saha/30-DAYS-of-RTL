module uart_top(clk,rstn,rx,parity_type,en,data_in,tx,done_tx,busy_tx,baud_rate,
		done_rx,busy_rx,start_err,stop_err,data_err,data_out);
		

	input en;
	input [7:0] data_in;
	output tx,done_tx,busy_tx;

	input clk,rstn,rx,parity_type;
	input [1:0] baud_rate;
	output done_rx,busy_rx,start_err,stop_err,data_err;
	output [7:0] data_out;

	uart_tx TX(clk,rstn,en,data_in,baud_rate,parity_type,tx,done_tx,busy_tx);
	uart_rx RX(clk,rstn,rx,baud_rate,parity_type,done_rx,busy_rx,start_err,stop_err,data_err,data_out);

endmodule
	

