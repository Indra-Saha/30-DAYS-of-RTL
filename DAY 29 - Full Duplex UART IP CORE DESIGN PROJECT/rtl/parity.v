module parity(rstn,parity_type,data_in,parity);

	input rstn;
	input [7:0]  data_in;
	input parity_type;
	output reg parity;

	localparam 	ODD=1'b1,
			EVEN=1'b0;

	always@(*)
	begin

		if(!rstn)
			parity=1'b1;
		else
		begin
			case(parity_type)
			
			ODD:	parity=(^data_in)?1'b0:1'b1;
			EVEN:	parity=(^data_in);
			default:parity=1'b1;
			endcase
		end
	end


endmodule