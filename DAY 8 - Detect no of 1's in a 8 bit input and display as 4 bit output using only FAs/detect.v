/* Detect no. of 1's in a 8 Bit Data i/p and express it as a output of 4 bit
.................Example................
INPUT: 8'b11011011
OUTPUT: 4'b0110
*/

module detect(in,out);

	input [7:0]in;
	output [3:0]out;

	wire [3:0]w1;
	wire [5:0]w2;

	full_adder F0(in[3],in[2],in[1],w1[0],w2[0]);
	full_adder F1(in[6],in[5],in[4],w1[1],w2[1]);
	full_adder F2(w1[1],w1[0],in[0],w1[2],w2[2]);
	full_adder F3(w2[1],w2[0],w2[2],w1[3],w2[3]);
	full_adder F4(1'b0,w1[2],in[7],out[0],w2[4]);
	full_adder F5(1'b0,w1[3],w2[4],out[1],w2[5]);
	full_adder F6(1'b0,w2[3],w2[5],out[2],out[3]);

endmodule