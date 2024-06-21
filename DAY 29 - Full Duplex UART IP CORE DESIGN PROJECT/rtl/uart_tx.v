module uart_tx(clk,rstn,en,data_in,baud_rate,parity_type,tx,done,busy);

	input clk,rstn,en,parity_type;
	input [1:0] baud_rate;
	input [7:0] data_in;
	output tx,done,busy;

	wire baud_clk,parity;

	baudgenTx TX1(	.clk(clk),
			.rstn(rstn),
			.baud_rate(baud_rate),
			.baud_clk(baud_clk));

	parity TX2(	.rstn(rstn),
			.parity_type(parity_type),
			.data_in(data_in),
			.parity(parity));

	piso TX3(	.baud_clk(baud_clk),
			.rstn(rstn),
			.en(en),
			.parity(parity),
			.data_in(data_in),
			.tx(tx),
			.busy(busy),
			.done(done));

endmodule










