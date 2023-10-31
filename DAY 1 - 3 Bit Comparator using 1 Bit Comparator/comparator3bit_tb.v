/*3 Bit Comparator TB*/

module comparator3bit_tb;

	reg [2:0] a,b;
	wire gr,le,eq;
comparator3bit DUT(a,b,gr,le,eq);
integer i,j;
task inputs;
begin
	for(i=0;i<8;i=i+1)
	begin
		a=i;
		for(j=0;j<8;j=j+1)
		begin
			b=j;
			#10;
		end
	end
end
endtask

initial
begin
	inputs;
	#20 $finish;
end

initial
$monitor($time, "a=%d,b=%d,Equal=%b,Greaterthan=%b,Lessthan=%b",a,b,eq,gr,le);

endmodule
		
