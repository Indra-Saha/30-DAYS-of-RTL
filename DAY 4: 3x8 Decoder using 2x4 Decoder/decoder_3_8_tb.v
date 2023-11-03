module decoder_3_8_tb;

	reg [2:0]i;
	wire [7:0]y;

	decoder_3_8 DUT(i,y);

	integer j;

task inputs;
begin
	for(j=0;j<8;j=j+1)
	begin
		i=j;
		#10;
	end
end
endtask

initial
begin
	inputs;
	#10 $finish;
end

initial
$monitor("I=%b,Y=%b",i,y);

endmodule	