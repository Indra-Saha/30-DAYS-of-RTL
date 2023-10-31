module cla_adder_tb;

	parameter ADDER_SIZE=8;

	reg [(ADDER_SIZE-1):0]a,b;
	reg cin;
	wire cout;
	wire [(ADDER_SIZE -1):0]s;
	wire [(ADDER_SIZE) :0]SUM;

cla_adder DUT(a,b,cin,s,cout);

task inputs;
input [(ADDER_SIZE-1):0]x,y;
input z;
begin
	a=x;
	b=y;
	cin=z;
	#10;
end
endtask

assign SUM={cout,s};
initial
begin
	inputs(8'hAB,8'hCD,1'b1);
	inputs(8'h9D,8'hB2,1'b0);
	#10 $finish;
end

initial
$monitor("a=%d,b=%d,sum=%d,cout=%b",a,b,SUM,cout);

endmodule