module deframe_tb;

	reg def_en;
	reg [10:0] data_in;
	wire start,stop,parity;
	wire done;
	wire [7:0] data_out;

	deframe DUT(def_en,data_in,start,stop,parity,data_out,done);

	initial
	begin
		def_en=0;
		data_in=11'b11001000100;
		#10  def_en=1;
		#10 $finish;
	end

endmodule