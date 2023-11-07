module adder_sub_tb;

	reg [3:0]a,b;
	reg mode;
	wire [3:0]out;
	wire cout;
	localparam SUM=0,
		   MINUS=1;

adder_sub DUT(a,b,out,cout,mode);

task inputs;
input [3:0]x,y;
input m;
begin
	a=x;
	b=y;
	mode=m;
	#10;
end
endtask

initial
begin
	inputs(4'b0011,4'b1000,MINUS);
	inputs(4'b1000,4'b1000,SUM);
	#10 $finish;
end

initial
$monitor("A=%b,B=%b,Mode=%b,out=%b,cout=%b",a,b,mode,out,cout);

endmodule


