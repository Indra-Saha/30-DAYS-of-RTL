// 4 Bit PIPO Register

module pipo(clk,rst,x,q,load);

	input [3:0]x;
	input clk,rst,load;
	output reg [3:0] q;

always@(posedge clk)
begin
	if(rst)
		q<=4'b0;
	else
	begin	
		if(load)
			q<=x;
		else
			q<={1'b0,q[3:1]};
	end
end

endmodule
	