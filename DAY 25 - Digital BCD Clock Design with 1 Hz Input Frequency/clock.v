module clock(clk,rst,load,load_ms_hr,load_ls_hr,load_ms_min,load_ls_min,time_ms_hr,
		time_ls_hr,time_ms_min,time_ls_min);

	input clk,rst,load;
	input [3:0] load_ms_hr,load_ls_hr;
	input [3:0] load_ms_min,load_ls_min;
	output reg [3:0] time_ms_hr,time_ls_hr,time_ms_min,time_ls_min;
	reg [6:0] s;
always@(posedge clk or negedge rst)
begin
	if(!rst)
	begin
		time_ms_hr<=0;
		time_ls_hr<=0;
		time_ms_min<=0;
		time_ms_min<=0;
		s<=0;
	end

	else
	begin
		if(load)
		begin
			if((load_ms_hr>2)||((load_ms_hr==2)&&(load_ls_hr>3))||(((load_ms_hr==1)||(load_ms_hr==0))&&(load_ls_hr>9))||(load_ms_min>5)||(load_ls_min>9))
			begin
				time_ms_hr<=0;
				time_ls_hr<=0;
				time_ms_min<=0;
				time_ms_min<=0;
				s<=0;				
			end
			else
			begin
				time_ms_hr<=load_ms_hr;
				time_ls_hr<=load_ls_hr;
				time_ms_min<=load_ms_min;
				time_ls_min<=load_ls_min;
				s<=0;
			end
		end
		else
		begin
			if(s==59)
			begin
				if((time_ls_min==9)&&(time_ms_min==5))
				begin
					if((time_ls_hr==3)&&(time_ms_hr==2))
					begin
						time_ls_hr<=0;
						time_ms_hr<=0;
						time_ls_min<=0;
						time_ms_min<=0;
						s<=0;
					end
					else
					begin
						if(time_ls_hr==9)
						begin
							time_ls_hr<=0;
							time_ms_hr<=time_ms_hr+1'b1;
							time_ls_min<=0;
							time_ms_min<=0;
							s<=0;
						end
						else
						begin
							time_ls_hr<=time_ls_hr+1'b1;
							time_ms_hr<=time_ms_hr;
							time_ms_min<=0;
							time_ls_min<=0;
							s<=0;
						end
					end
				end
				else
				begin
					if(time_ls_min==9)
					begin
						time_ls_min<=0;
						time_ms_min<=time_ms_min+1'b1;
						time_ms_hr<=time_ms_hr;
						time_ls_hr<=time_ls_hr;
						s<=0;
					end
					else
					begin
						time_ls_min<=time_ls_min+1'b1;
						time_ms_min<=time_ms_min;
						time_ms_hr<=time_ms_hr;
						time_ls_hr<=time_ls_hr;
						s<=0;
					end
				end
			end
			else
			begin
				s<=s+1'b1;
				time_ls_min<=time_ls_min;
				time_ms_min<=time_ms_min;
				time_ls_hr<=time_ls_hr;
				time_ms_hr<=time_ms_hr;
			end
		end
	end
end
		
endmodule 