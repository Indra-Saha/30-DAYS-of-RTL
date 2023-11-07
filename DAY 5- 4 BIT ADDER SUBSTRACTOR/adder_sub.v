/*Adder Substractor Ckt*/



module adder_sub(a,b,out,cout,mode);

	
	localparam SUM=0,
		   MINUS=1;

	input [3:0]a,b;
	input mode;
	output [3:0]out;
	output cout;
	genvar i;
	wire w1;
	wire [3:0]w2,w3;

assign w2=(mode==SUM)?b:~b;
full_adder F0(a[0],w2[0],mode,out[0],w3[0]);
generate
	for(i=1;i<4;i=i+1)
	begin:addsub
		full_adder F1(a[i],w2[i],w3[i-1],out[i],w3[i]);
	end
endgenerate

assign cout=w3[3];

endmodule
	
	

