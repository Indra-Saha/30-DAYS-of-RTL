module parity_rx(rstn,start,stop,parity,parity_type,def_en,data_in,start_err,stop_err,data_err);

	input rstn,start,stop,parity,parity_type,def_en;
	input [7:0] data_in;
	output start_err;
	output stop_err;
	output data_err;

	reg parity_reg;
	reg d_err,str_err,sto_err;

	localparam	ODD=1'b1,
			EVEN=1'b0;

	always@(*)
	begin
		case(parity_type)
		ODD:	parity_reg=(^data_in)?1'b0:1'b1;
		EVEN:	parity_reg=(^data_in);	
		endcase
	end

	always@(*)
	begin
		if(def_en)
		begin
			d_err=parity^parity_reg;
			str_err= start;
			sto_err= ~stop;
		end
		else
		begin
			d_err=1'b0;
			str_err= 1'b0;
			sto_err= 1'b0;
		end
			
	end

	assign start_err=(rstn && def_en)?str_err:1'b0;
	assign stop_err=(rstn && def_en)?sto_err:1'b0;
	assign data_err=(rstn && def_en)?d_err:1'b0;

endmodule
	

		
	