/* 3bit Comparator using 1 bit Comparator*/

module comparator3bit(a,b,gr,le,eq);

	input [2:0] a,b;
	output gr,le,eq;
	wire [2:0] g,l,e;

comparator1bit C1(.a(a[0]),.b(b[0]),.e(e[0]),.g(g[0]),.l(l[0]));
comparator1bit C2(.a(a[1]),.b(b[1]),.e(e[1]),.g(g[1]),.l(l[1]));
comparator1bit C3(.a(a[2]),.b(b[2]),.e(e[2]),.g(g[2]),.l(l[2]));

assign eq=(e[0]&&e[1]&&e[2])?1'b1:1'b0;
assign gr=(g[2]||(e[2]&&g[1])||(e[2]&&e[1]&&g[0]))?1'b1:1'b0;
assign le=(l[2]||(e[2]&&l[1])||(e[2]&&e[1]&&l[0]))?1'b1:1'b0;

endmodule 