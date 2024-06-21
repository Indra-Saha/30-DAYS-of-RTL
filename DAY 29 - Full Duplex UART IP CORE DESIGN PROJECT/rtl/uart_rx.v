module uart_rx(clk,rstn,rx,baud_rate,parity_type,done,busy,start_err,stop_err,data_err,data_out);

	input clk,rstn,rx,parity_type;
	input [1:0] baud_rate;
	output done,busy,start_err,stop_err,data_err;
	output [7:0] data_out;

	wire baud_clk,def_en;
	wire [10:0] d_out1;
	wire start,stop,parity;
	

	baudgenRx RX1(	.clk(clk),
			.rstn(rstn),
			.baud_rate(baud_rate),
			.baud_clk(baud_clk));

	sipo RX2(	.baud_clk(baud_clk),
			.rstn(rstn),
			.rx(rx),
			.busy(busy),
			.data_out(d_out1),
			.def_en(def_en));

	deframe RX3(	.def_en(def_en),
			.data_in(d_out1),
			.start(start),
			.stop(stop),
			.parity(parity),
			.data_out(data_out),
			.done(done));

	parity_rx RX4(	.rstn(rstn),
			.start(start),
			.stop(stop),
			.parity(parity),
			.parity_type(parity_type),
			.def_en(def_en),
			.data_in(data_out),
			.start_err(start_err),
			.stop_err(stop_err),
			.data_err(data_err));

endmodule



