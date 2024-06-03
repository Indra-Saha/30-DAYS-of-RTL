//Design the following 32 bit sequence generator module:
//0 ? 1 ? 1 ? 1 ? 2 ? 2 ? 3 ? 4 ? 5 ? 7 ? 9 ? 12 ? 16 ? 21 ? 28 ? 37 ? ...
// Consider Active Low Asynchronous Reset

module sequence(clk,rst,seq_out);

	input clk,rst;
	output [31:0] seq_out;

	reg [31:0] seq_t1,seq_t2,seq_t3;//Storing Sequence before 1,2,3 clk cycles.
	wire [31:0] next_seq;

	always@(posedge clk,negedge rst)
	begin
		if(!rst)
		begin
			seq_t3<=32'b0;
			seq_t2<=32'b1;
			seq_t1<=32'b1;
		end

		else
		begin

			seq_t3<=seq_t2;
			seq_t2<=seq_t1;
			seq_t1<=next_seq;
		end
	end


	assign next_seq =seq_t3+seq_t2;

	assign seq_out=seq_t3;

endmodule
	 