module bibuf(a,b,control);


	inout a,b;
	input control;


	bufif1(b,a,control);
	bufif0(a,b,control);

endmodule