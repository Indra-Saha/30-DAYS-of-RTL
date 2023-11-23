module demux_12(a,s,y);

	input a,s;
	output [1:0]y;

assign y[0]=(~s)&a;
assign y[1]=s&a;

endmodule
	