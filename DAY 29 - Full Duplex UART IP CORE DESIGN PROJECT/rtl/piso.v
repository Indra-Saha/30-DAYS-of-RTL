


module piso(baud_clk,rstn,en,parity,data_in,tx,busy,done);

	input baud_clk,rstn;
	input en; //Enable signal for Transmission
	input parity; //Parity Signnal from Parity Block
	input [7:0] data_in;
	output reg tx;
	output reg busy;//Signal denoting Ongoing Transmission
	output reg done;// Signal denoting Transmission done


	localparam	IDLE=3'b000,
			START=3'b001,
			DATA=3'b010,
			PARITY=3'b011,
			STOP=3'b100;

	reg [7:0] temp;
	reg [2:0] state,nextstate;
	reg [2:0] count;

	always@(negedge rstn or posedge baud_clk)
	begin
		if(!rstn)
			state<=IDLE;
		else
		begin
			state<=nextstate;
		end
	end

	always@(*)
	begin

		case(state)

		IDLE:	begin

				tx=1'b1;
				busy=1'b0;
				done=1'b0;

				if(en)
					nextstate=START;
				else
					nextstate=IDLE;
			end
		    

		START:	begin
			
				tx=1'b0;
				busy=1'b1;
				done=1'b0;

				nextstate=DATA;
			end

		DATA:	begin

				tx=temp[0];
				busy=1'b1;
				done=1'b0;
				if(count==3'b111)
				begin
					nextstate=PARITY;
				end
				else
				begin
					nextstate=DATA;
				end
			end

		
		PARITY:	begin


				tx=parity;
				busy=1'b1;
				done=1'b0;
				nextstate=STOP;

			end

		STOP:	begin

				tx=1'b1;
				done=1'b1;
				busy=1'b0;

				nextstate=IDLE;

			end
		default:begin
			
				tx=1'b1;
				busy=1'b0;
				done=1'b0;
				nextstate=IDLE;
			end
				

		endcase
	end

always@(posedge baud_clk)
begin

	case(state)
	
		START:	begin
				temp<=data_in;
				count<=0;
			end
						

		DATA: 	begin

				if(count==3'b111)
				begin
					count<=0;
				end
				else
				begin
					temp<=temp>>1;
					count<=count+1'b1;
				end
			end
			
	endcase
end

endmodule	
				