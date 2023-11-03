/* Decoder 3x8 using 2x4*/


module decoder_3_8(i,y);

	input [2:0]i;
	output [7:0]y;

	decoder_2_4 D1(.a(i[1]),.b(i[0]),.e(~i[2]),.y(y[3:0]));
	decoder_2_4 D2(.a(i[1]),.b(i[0]),.e(i[2]),.y(y[7:4]));
endmodule