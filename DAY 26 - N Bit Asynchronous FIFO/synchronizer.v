module synchronizer(clk,rst,pin,pout);

	parameter pt=3;
	input clk,rst;
	input [pt:0]pin;
	output reg [pt:0]pout;
	reg [pt:0]dly;

always@(posedge clk,negedge rst)
begin
	if(!rst)
	begin
		dly<=0;
		pout<=0;
	end
	else
	begin
		pout<=dly;
		dly<=pin;
	end
end

endmodule