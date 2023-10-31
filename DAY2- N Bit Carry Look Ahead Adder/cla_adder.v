/*Carry Look Ahead Adder*/

module cla_adder(a,b,cin,s,cout);

	parameter ADDER_SIZE=4;

	input [(ADDER_SIZE-1):0]a,b;
	input cin;
	output cout;
	output [(ADDER_SIZE -1):0]s;
	wire [(ADDER_SIZE -1):0]c;
	genvar i;

	cla #(.asize(ADDER_SIZE)) cl(.a(a),.b(b),.cin(cin),.carry(c));
	full_adder_df fa0(.a(a[0]),.b(b[0]),.c(cin),.sum(s[0]));
	
	generate
		for(i=1;i<ADDER_SIZE;i=i+1)
		begin:rippler
			full_adder_df fa1(.a(a[i]),.b(b[i]),.c(c[i-1]),.sum(s[i]));
		end
	endgenerate

	assign cout=c[ADDER_SIZE-1];
endmodule