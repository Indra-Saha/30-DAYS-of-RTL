/*Design 4 Bit Gray to Binary using DE-MUX and OR Gate*/

module gray_binary(g,b);

	input [3:0]g;
	output [3:0]b;
	wire [1:0]w0,w1,w2,w3,w4,w5;

assign b[3]=g[3];
demux_12 D0(b[3],g[2],w0);
demux_12 D1(g[2],b[3],w1);
or OR1(b[2],w0[0],w1[0]);

demux_12 D2(b[2],g[1],w2);
demux_12 D3(g[1],b[2],w3);
or OR2(b[1],w2[0],w3[0]);

demux_12 D4(b[1],g[0],w4);
demux_12 D5(g[0],b[1],w5);
or OR3(b[0],w4[0],w5[0]);

endmodule
