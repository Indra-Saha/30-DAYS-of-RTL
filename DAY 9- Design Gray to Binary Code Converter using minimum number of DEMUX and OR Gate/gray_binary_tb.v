/*TB to Verify 4 Bit Gray to Binary using DE-MUX and OR Gate*/

module gray_binary_tb;

	reg [3:0]g;
	wire [3:0]b;
	gray_binary DUT(g,b);
	integer i;

task inputs;
begin
	for(i=0;i<16;i=i+1)
	begin
		g=i;
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
begin
$display("GRAY     BINARY");	
$monitor("%b         %b",g,b);
end

endmodule
