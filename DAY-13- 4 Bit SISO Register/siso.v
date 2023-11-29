module siso(clk,rst,in,out);

	input clk,rst,in;
	output reg out;
	reg [3:0]q;

always@(posedge clk)
begin

	if(rst)
		q<=4'b0000;
	else
	begin
		q<={q[2:0],in};
		out<=q[3];
	end
end
endmodule