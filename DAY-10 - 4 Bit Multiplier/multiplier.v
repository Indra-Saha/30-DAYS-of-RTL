// 4 Bit Multiplier

module multiplier(a,b,p);

	input [3:0]a,b;
	output reg [7:0]p;

	reg [7:0]m1,m2,m3,m4;

always@(*)
begin

	m1=(b[0]==1'b1)?a:8'b0;
	m2=(b[1]==1'b1)?(a<<1):8'b0;
	m3=(b[2]==1'b1)?(a<<2):8'b0;
	m4=(b[3]==1'b1)?(a<<3):8'b0;
	p=m1+m2+m3+m4;
end

endmodule
