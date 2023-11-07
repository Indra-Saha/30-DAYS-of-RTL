module priority_enc_tb;

	reg [7:0]y;
	wire[2:0]x;
	wire valid;

	priority_enc DUT(y,x,valid);

task inputs;
input [7:0]a;
begin
	y=a;
	#10;
end
endtask

initial
begin
	inputs(8'b01011001);
	inputs(8'b00000111);
	inputs(8'b0);
	#10 $finish;
end

initial
$monitor("INPUT=%b,OUTPUT=%b,VALID=%b",y,x,valid);

endmodule