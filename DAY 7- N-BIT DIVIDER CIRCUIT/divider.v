module divider(dvnd,dvsr,quo,rem,rst);

	parameter size=4;

	input [(size-1):0]dvnd,dvsr;
	input rst;
	output reg [(size-1):0]quo,rem;
	reg [(size-1):0]d;
	integer i;

always@(*)
begin
	d=dvnd;
	if(rst)
	begin
		quo=0;
		rem=0;
	end
	else if(dvsr==0)
	begin
		quo='bz;
		rem='bz;
	end
	else
	begin
		for(i=0;i<size;i=i+1)
		begin
			rem={rem[(size-2):0],d[size-1]};
			d={d[(size-2):0],1'b0};
			quo={quo[(size-2):0],1'b0};
			if(rem>=dvsr)
			begin
				quo[0]=1'b1;
				rem=rem-dvsr;
			end
		end
	end
end

endmodule
	
