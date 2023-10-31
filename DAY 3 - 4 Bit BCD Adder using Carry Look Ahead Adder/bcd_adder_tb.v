module bcd_adder_tb;

	reg [3:0]a,b;
	reg cin;
	wire [3:0]s;
	wire c;

	bcd_adder DUT(a,b,cin,s,c);

task inputs;
input [3:0]x,y;
input z;
begin
	a=x;
	b=y;
	cin=z;
	#10;
end
endtask

initial
begin
	inputs(4'b0101,4'b1001,1'b0);
	inputs(4'b1001,4'b1001,1'b1);
	#10 $finish;
end

initial
$monitor("a=%b,b=%b,cin=%b,s=%b,cout=%b",a,b,cin,s,c);

endmodule