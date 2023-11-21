module divider_tb;

	parameter size=4;

	reg[(size-1):0]dvnd,dvsr;
	reg rst;
	wire [(size-1):0]quo,rem;

	divider #(size)DUT(dvnd,dvsr,quo,rem,rst);

task inputs;
input [(size-1):0]x,y;
begin
	dvnd=x;
	dvsr=y;
	#10;
end
endtask

initial
begin
	rst=1;
	#10 rst=0;
	inputs(4'b1110,4'b0011);
	rst=1;
	#10 rst=0;
	inputs(4'b1111,4'b0010);
	rst=1;
	#10 rst=0;
	inputs(4'b1101,4'b0);
	#20 $finish;
end

initial
	$monitor($time, "DIVIDEND=%b, DIVISOR=%b, QUOTIENT=%b, REMAINDER= %b",dvnd,dvsr,quo,rem);

endmodule
