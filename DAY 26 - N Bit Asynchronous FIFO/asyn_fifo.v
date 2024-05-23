module asyn_fifo(w_clk,r_clk,we,re,din,dout,empty,full,r_rst,w_rst);

	parameter	WIDTH=8,
			DEPTH=8,
			pt=$clog2(DEPTH);
			
	input w_clk,r_clk;
	input w_rst,r_rst;
	input we,re;
	input [WIDTH-1:0]din;
	output [WIDTH-1:0]dout;
	output empty,full;

	wire[pt:0]g_rdpt_sync;
	wire[pt:0]b_wrpt,g_wrpt;

	wire[pt:0]g_wrpt_sync;
	wire[pt:0]b_rdpt,g_rdpt;

	synchronizer #(pt)SYNC_WR(	.clk(w_clk),
					.rst(w_rst),
					.pin(g_rdpt),
					.pout(g_rdpt_sync)
		     	         );

	synchronizer #(pt)SYNC_RD(	.clk(r_clk),
					.rst(r_rst),
					.pin(g_wrpt),
					.pout(g_wrpt_sync)
		     	         );

	write_pointer #(pt)WR_PT(	.clk(w_clk),
					.rst(w_rst),
					.we(we),
					.g_rdpt_sync(g_rdpt_sync),
					.b_wrpt(b_wrpt),
					.g_wrpt(g_wrpt),
					.full(full)
		                );

	read_pointer #(pt)RD_PT(	.clk(r_clk),
					.rst(r_rst),
					.re(re),
					.g_wrpt_sync(g_wrpt_sync),
					.b_rdpt(b_rdpt),
					.g_rdpt(g_rdpt),
					.empty(empty)
		               );

	mem #(WIDTH,DEPTH,pt)MEMORY(	.w_clk(w_clk),
					.din(din),
					.dout(dout),
					.we(we),
					.full(full),
					.wptr(b_wrpt),
					.rptr(b_rdpt)
		  );

endmodule
