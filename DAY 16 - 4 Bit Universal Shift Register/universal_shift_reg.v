/* 4 Bit Universal Shift Register

A Universal shift register is a register which has both the 
right shift and left shift with parallel load capabilities.

	 DIR=10-> LEFT SHIFT
   	 DIR=01-> RIGHT SHIFT
*/

module universal_shift_reg(clk,rst,xp,dir,qp,qs);

	input [3:0]xp;
	input [1:0] dir;
	input clk,rst;
	output reg [3:0]qp;
	output reg qs;

always@(posedge clk)
begin
	if(rst)
		qp=4'b0;
	else
	begin
		qs<=qp[3];
		if(dir==2'b11)	
			qp<=xp;
		else if(dir==2'b01)
			qp<={1'b0,qp[3:1]};
		else if(dir==2'b10)
			qp<={qp[2:0],1'b0};
		else
		begin
			qp<=qp;
			qs<=qs;
		end
			
	end
end

endmodule
			