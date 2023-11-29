// 4 Bit PISO Register

module piso(clk,rst,x,qout,load);

	input [3:0]x;
	input clk,rst,load;
	output qout;
	reg [3:0] q;

always@(posedge clk)
begin
	if(rst)
		q<=4'b0;
	else
	begin	
		if(load)
			q<=x;
		else
			q<={q[2:0],1'b0};
	end
end

assign qout=q[3];

endmodule
	