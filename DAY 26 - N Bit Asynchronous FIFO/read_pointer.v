module read_pointer(clk,rst,re,g_wrpt_sync,b_rdpt,g_rdpt,empty);

	parameter pt=3;

	input clk,rst,re;
	input [pt:0]g_wrpt_sync;
	output reg empty;
	output reg[pt:0]b_rdpt,g_rdpt;
	wire [pt:0] next_b_rdptr,next_g_rdptr;

	assign next_b_rdptr=b_rdpt+(re & !empty);
	assign next_g_rdptr=(next_b_rdptr >> 1)^next_b_rdptr;
	assign nxt_empty=(g_wrpt_sync == next_g_rdptr);

	always@(posedge clk,negedge rst)
	begin
		if(!rst)
		begin
			b_rdpt<=0;
			g_rdpt<=0;
		end
		else
		begin
			b_rdpt<=next_b_rdptr;
			g_rdpt<=next_g_rdptr;
		end
	end


	always@(posedge clk,negedge rst)
	begin
		if(!rst)
		begin
			empty<=1;
		end
		else
			empty<=nxt_empty;
	end

endmodule
			
	 