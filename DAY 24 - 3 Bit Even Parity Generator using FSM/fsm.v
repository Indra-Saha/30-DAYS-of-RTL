module fsm(clk,rst,w,z);

	input clk,rst,w;
	output z;

	localparam 	S0=4'b0000,
			S1=4'b0001,
			S2=4'b0010,
			S3=4'b0011,
			S4=4'b0100,
			S5=4'b0101,
			S6=4'b0110,
			S7=4'b0111,
			S8=4'b1000,
			S9=4'b1001,
			S10=4'b1010;

	reg [3:0] state,nextstate;

	always@(posedge clk)
	begin
		if(rst)
			state<=S0;
		else
			state<=nextstate;
	end

	always@(*)
	begin

		nextstate=S0;

		case(state)
		
			S0:	if(w)
					nextstate=S2;
				else
					nextstate=S1;

			S1:	if(w)
					nextstate=S4;
				else
					nextstate=S3;

			S2:	if(w)
					nextstate=S8;
				else
					nextstate=S7;

			S3:	if(w)
					nextstate=S5;
				else
					nextstate=S3;

			S4:	if(w)
					nextstate=S2;
				else
					nextstate=S6;

			S5:	if(w)
					nextstate=S2;
				else
					nextstate=S6;

			S6:	if(w)
					nextstate=S4;
				else
					nextstate=S9;

			S7:	if(w)
					nextstate=S4;
				else
					nextstate=S9;

			S8:	if(w)
					nextstate=S10;
				else
					nextstate=S7;

			S9:	if(w)
					nextstate=S5;
				else
					nextstate=S3;

			S10:	if(w)
					nextstate=S10;
				else
					nextstate=S7;
		endcase
	end

	assign z=((state==S5)||(state==S6)||(state==S9)||(state==S10));

endmodule	