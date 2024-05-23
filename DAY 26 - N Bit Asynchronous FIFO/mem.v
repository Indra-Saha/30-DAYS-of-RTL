module mem(w_clk,din,dout,we,full,wptr,rptr);

	parameter 	WIDTH=8,
			DEPTH=8,
			pt=3;
	input w_clk,we,full;
	input [WIDTH-1:0]din;
	input [pt:0]wptr,rptr;
	output  reg[WIDTH-1:0]dout;

	reg [WIDTH-1:0]fifo[0:DEPTH-1];

	always@(posedge w_clk)
	begin
		if(we && !full)
			fifo[wptr[pt-1:0]]<=din;
	end

	assign dout=fifo[rptr[pt-1:0]];
endmodule
	