module sipo(baud_clk,rstn,rx,busy,data_out,def_en);

	input baud_clk,rstn;
	input rx;	// Serial Input
	output reg busy;	//  Denoting  busy state
	output [10:0] data_out;
	output reg def_en;	//Deframe Unit Enable

	localparam	IDLE=2'b00,
			START=2'b01,
			DATA=2'b10,
			STOP=2'b11;

	reg [1:0] state,nextstate;
	reg [3:0] s;
	reg [3:0] count;
	reg [10:0] temp_data;

	always@(posedge baud_clk,negedge rstn)
	begin
		if(!rstn)
			state<=IDLE;
		else
			state<=nextstate;
	end


	always@(*)
	begin

		case(state)
		
		IDLE:	begin
				busy=1'b0;
				if(!rx)
					nextstate=START;
				else
					nextstate=IDLE;

			end

		START:	begin
				busy=1'b1;
				if(s==7)
				begin
					nextstate=DATA;
				end
				else
				begin
					nextstate=START;
				end
			end

		DATA:	begin
				busy=1'b1;
				if(s==15)
				begin
					if(count==9)
					begin
						nextstate=STOP;
					end
					else
					begin
						nextstate=DATA;
					end
				end
				else
				begin
				
					
					nextstate=DATA;
				end
			end

		STOP:	begin
				busy=1'b1;
				if(s==15)
				begin
					nextstate=IDLE;
				end
				else
				begin
					nextstate=STOP;	
				end
			end

		default:begin
		
				s=0;
				busy=1'b0;
				def_en=1'b0;
				temp_data=11'b1;
				nextstate=IDLE;
			end
		endcase
		end

	always@(posedge baud_clk)
	begin

		case(state)
			IDLE:	begin
					def_en<=1'b0;
					s<=0;
					temp_data<={11{1'b1}};
					
					if(!rx)
					begin
						temp_data<={rx,temp_data[10:1]};
					end
				end

			START:	begin
					def_en<=1'b0;
					if(s==7)
					begin
						s<=0;
						count<=0;

					end
					else
						
						s<=s+1'b1;
				end

			DATA:	begin
					def_en<=1'b0;
					if(s==15)
					begin
						s<=0;
						temp_data<={rx,temp_data[10:1]};
						if(count==9)
							def_en<=1'b1;
						if(count<9)
							count<=count+1'b1;
					end
					else
					begin
						s<=s+1'b1;
					end

				end

			STOP:	begin

					if(s==15)
					begin
						def_en<=1'b0;
						temp_data<={rx,temp_data[10:1]};
					end
					else
						s<=s+1'b1;
				end
		endcase
	end
			
				
	
assign data_out=(def_en&state==STOP)?temp_data:{11{1'b1}};

endmodule
					
			
					
		