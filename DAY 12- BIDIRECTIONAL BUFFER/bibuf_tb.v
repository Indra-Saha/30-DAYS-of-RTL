module bibuf_tb();


	wire a,b;
	reg c;


bibuf b1(a,b,c);

reg tempa,tempb;

initial
begin

	tempa=1'b0;
	tempb=1'b0;
	c=1'b0;
end

always#10 tempa=~tempa;
always#20 tempb=~tempb;
always#50 c=~c;

assign a=(c==1)?tempa:1'bz;
assign b=(c==0)?tempb:1'bz;

initial
begin
#1000 $finish;

end


endmodule