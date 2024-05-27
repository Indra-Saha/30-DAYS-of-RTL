module round_robin_arbiter(clk,rst,req,grant);

	input clk,rst;
	input [3:0] req;
	output [3:0]grant;

	reg lcomreq;// Combinational Busy Signal Bus Status
	reg lmask1,lmask0;// Output of Encoder Logic Hold Register
	reg [1:0]lgnt; //Output of Encoder
	reg lgnt0,lgnt1,lgnt2,lgnt3; //Wire for Connecting to gnt0,gnt1,gnt2,gnt3
	
//Grant
assign grant[0]=lgnt0;
assign grant[1]=lgnt1;
assign grant[2]=lgnt2;
assign grant[3]=lgnt3;


//Arbiter Logic
always@(posedge clk)
begin
	if(rst)
		{lgnt0,lgnt1,lgnt2,lgnt3}<=4'b0;
	else
	begin

		lgnt0<=((~lcomreq&~lmask1&~lmask0&~req[3]&~req[2]&~req[1]&req[0])|
			 (~lcomreq&~lmask1&lmask0&~req[3]&~req[2]&req[0])|
			 (~lcomreq&lmask1&~lmask0&~req[3]&req[0])|
			 (~lcomreq&lmask1&lmask0&req[0])|
			 (lcomreq&lgnt0));

		
		lgnt1<=((~lcomreq&~lmask1&~lmask0&req[1])|
			 (~lcomreq&~lmask1&lmask0&~req[3]&~req[2]&req[1]&~req[0])|
			 (~lcomreq&lmask1&~lmask0&~req[3]&req[1]&~req[0])|
			 (~lcomreq&lmask1&lmask0&req[1]&~req[0])|
			 (lcomreq&lgnt1));

		lgnt2<=((~lcomreq&~lmask1&~lmask0&req[2]&~req[1])|
			 (~lcomreq&~lmask1&lmask0&req[2])|
			 (~lcomreq&lmask1&~lmask0&~req[3]&req[2]&~req[1]&~req[0])|
			 (~lcomreq&lmask1&lmask0&req[2]&~req[1]&~req[0])|
			 (lcomreq&lgnt2));

		lgnt3<=((~lcomreq&~lmask1&~lmask0&req[3]&~req[2]&~req[1])|
			 (~lcomreq&~lmask1&lmask0&req[3]&~req[2])|
			 (~lcomreq&lmask1&~lmask0&req[3])|
			 (~lcomreq&lmask1&lmask0&req[3]&~req[2]&~req[1]&~req[0])|
			 (lcomreq&lgnt3));
	end
end

//Busy State Bus Logic
assign lcomreq=((req[3]&lgnt3)|(req[2]&lgnt2)|(req[1]&lgnt1)|(req[0]&lgnt0));

//Encoder Output Logic
assign lgnt={(lgnt2|lgnt3),(lgnt1|lgnt3)};

//Registering Encoder Output and output to Arbiter
always@(posedge clk)
begin

	if(rst)
		{lmask1,lmask0}<=2'b0;
	else
	begin
		lmask1=lgnt[1];
		lmask0=lgnt[0];
	end
end

endmodule


