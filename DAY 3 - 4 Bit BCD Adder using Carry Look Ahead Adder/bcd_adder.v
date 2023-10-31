module bcd_adder(a,b,cin,s,c);

	input [3:0]a,b;
	input cin;
	output [3:0]s;
	output c;
	wire w1;
	wire w2;
	wire [3:0]w3,w4;

cla_adder #(4)c1(.a(a),.b(b),.cin(cin),.s(w3),.cout(w2));

	assign w1=(w2|(w3[3]&w3[2])|(w3[3]&w3[1]))?1'b1:1'b0;
	assign w4={1'b0,w1,w1,1'b0};

cla_adder #(4)c2(.a(w3),.b(w4),.cin(1'b0),.s(s),.cout(c));

endmodule
