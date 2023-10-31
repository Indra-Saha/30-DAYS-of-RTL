/*Carry Look Ahead Block*/

module cla(a,b,cin,carry);

	parameter asize=4;
	input [(asize-1):0]a,b;
	input cin;
	output reg [(asize-1):0]carry;
	reg [(asize-1):0]p,g;
	integer i;
	always@(*)
	begin
		for(i=0;i<asize;i=i+1)
		begin
			p[i]=a[i]^b[i];
			g[i]=a[i]&b[i];
			if(i==0)
				carry[i]=g[i]|(cin&p[i]);
			else
				carry[i]=g[i]|(carry[i-1]&p[i]);
		end
	end

endmodule
						
