// 4 Bit Multiplier TB

module multiplier_tb;

	reg [3:0]a,b;
	wire [7:0]p;

multiplier DUT(a,b,p);

task inputs;
input [3:0]x,y;
begin
	a=x;
	b=y;
	#10;
end
endtask

initial
begin

	inputs(4'b1111,4'b1111);
	inputs(4'b1100,4'b0110);
	inputs(4'b0001,4'b1110);
	#10 $finish;
end

initial
	$monitor("A=%b(%d) B=%b(%d) PRODUCT=%b(%d)",a,a,b,b,p,p);
endmodule
