module  baudgenRx(clk,rstn,baud_rate,baud_clk);

	input clk,rstn;
	input [1:0] baud_rate;
	output reg baud_clk;

	parameter 	BR2400=2'b00,
			BR4800=2'b01,
			BR9600=2'b10,
			BR19200=2'b11;

	reg [9:0] max_clock,clock_count;

	//For Clock Frequenncy of 50Mhz	
	always@(*)
	begin

		case(baud_rate)
		BR2400:	max_clock=10'd651;
		BR4800: max_clock=10'd326;
		BR9600: max_clock=10'd163;
		BR19200:max_clock=10'd81;
		default: max_clock=10'd163;
		endcase
	end


	always@(negedge rstn,posedge clk)
	begin

		if(!rstn)
		begin
			clock_count<=0;
			baud_clk<=0;
		end

		else 
		begin
			if(clock_count==max_clock)
			begin
				clock_count<=0;
				baud_clk<=~baud_clk;
			end

			else
			begin
				clock_count<=clock_count+1'b1;
				baud_clk<=baud_clk;
			end
		end
	end

endmodule
