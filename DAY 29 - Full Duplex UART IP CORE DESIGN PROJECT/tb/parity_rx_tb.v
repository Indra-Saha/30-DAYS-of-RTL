module parity_rx_tb;

	reg rstn,start,stop,parity,parity_type,def_en;
	reg [7:0] data_in;
	wire start_err;
	wire stop_err;
	wire data_err;
	
	parity_rx DUT(rstn,start,stop,parity,parity_type,def_en,data_in,start_err,stop_err,data_err);

	initial
	begin
		//Reset Active
		rstn=0;
		start=0;
		stop=1;
		parity=0;
		parity_type=0;
		def_en=1;
		data_in=8'b00010111;

		//Def_en=0
		#10;
		rstn=1;
		start=0;
		stop=1;
		parity=0;
		parity_type=0;
		def_en=0;
		data_in=8'b00010111;

		//No Error Even Parity
		#10;
		rstn=1;
		start=0;
		stop=1;
		parity=0;
		parity_type=0;
		def_en=1;
		data_in=8'b00010111;

		//Start Error
		#10;
		rstn=1;
		start=1;
		stop=1;
		parity=0;
		parity_type=0;
		def_en=1;
		data_in=8'b00010111;

		//Stop Error
		#10;
		rstn=1;
		start=0;
		stop=0;
		parity=0;
		parity_type=0;
		def_en=1;
		data_in=8'b00010111;

		//No Error Odd Parity
		#10; 
		rstn=1;
		start=0;
		stop=1;
		parity=1;
		parity_type=1;
		def_en=1;
		data_in=8'b00010111;

		//Start Error & Error in Even Parity
		#10;
		rstn=1;
		start=1;
		stop=1;
		parity=1;
		parity_type=0;
		def_en=1;
		data_in=8'b00010111;

		//Stop Error and Error in Odd Parity

		#10;
		rstn=1;
		start=0;
		stop=0;
		parity=0;
		parity_type=1;
		def_en=1;
		data_in=8'b00010111;


		//All Error
		#10;
		rstn=1;
		start=1;
		stop=0;
		parity=1;
		parity_type=0;
		def_en=1;
		data_in=8'b00010111;

		#10;

		$finish;
	end

endmodule

		
