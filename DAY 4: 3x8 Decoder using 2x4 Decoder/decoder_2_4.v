/* Decoder 2x4 with active high enable*/

module decoder_2_4 (a,b,e,y);

	input a,b,e;
	output [3:0]y;

	assign y[0]= e &(~a)&(~b);	
	assign y[1]= e &(~a)& b;
	assign y[2]= e& a & (~b);
	assign y[3]=e & a & b;

endmodule