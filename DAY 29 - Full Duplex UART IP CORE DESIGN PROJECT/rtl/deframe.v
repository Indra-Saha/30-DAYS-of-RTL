module deframe(def_en,data_in,start,stop,parity,data_out,done);

	input def_en;
	input [10:0] data_in;
	output reg start,stop,parity;
	output reg done;
	output reg [7:0] data_out;


	always@(*)
	begin
		if(def_en)
		begin
			start=data_in[0];
			stop=data_in[10];
			parity=data_in[9];
			data_out=data_in[8:1];
			done=1'b1;
		end
		else
		begin
			start=data_in[0];
			stop=data_in[10];
			parity=data_in[9];
			data_out=data_in[8:1];
			done=1'b0;
		end
	end

endmodule
			
			