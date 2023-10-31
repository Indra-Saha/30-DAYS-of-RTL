/* 1 Bit Comparator*/


module comparator1bit(a,b,e,g,l);

	input a,b;
	output reg e,g,l;

	always@(*)
	begin
	e=0;
	g=0;
	l=0;
		if(a==b)
			e=1;
		else if(a>b)
			g=1;
		else if(a<b)
			l=1;
	end

endmodule
		