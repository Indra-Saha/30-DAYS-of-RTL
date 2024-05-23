module write_pointer(clk,rst,we,g_rdpt_sync,b_wrpt,g_wrpt,full);

	parameter pt=3;

	input clk,rst,we;
	input [pt:0]g_rdpt_sync;
	output reg full;
	output reg[pt:0]b_wrpt,g_wrpt;
	wire [pt:0]next_b_wrptr,next_g_wrptr;

	assign next_b_wrptr=b_wrpt+(we & !full);
	assign next_g_wrptr=(next_b_wrptr >> 1)^next_b_wrptr;
	assign nxt_full=(next_g_wrptr == {~g_rdpt_sync[pt:pt-1],g_rdpt_sync[pt-2:0]});

	always@(posedge clk,negedge rst)
	begin
		if(!rst)
		begin
			b_wrpt<=0;
			g_wrpt<=0;
		end
		else
		begin
			b_wrpt<=next_b_wrptr;
			g_wrpt<=next_g_wrptr;
		end
	end


	always@(posedge clk,negedge rst)
	begin
		if(!rst)
		begin
			full<=0;
		end
		else
			full<=nxt_full;
	end

endmodule
			
	 