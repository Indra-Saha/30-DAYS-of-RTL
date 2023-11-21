/* Detect no. of 1's in a 8 Bit Data i/p and express it as a output of 4 bit
.................Example................
INPUT: 8'b11011011
OUTPUT: 4'b0110
*/

module detect_tb;

	reg [7:0]in;
	wire [3:0]out;

detect DUT(in,out);

task inputs;
input [7:0]x;
begin
	in=x;
	#10;
end
endtask

initial
begin
	inputs(8'b11011011);
	inputs(8'b11100010);
	inputs(8'b00000011);
	inputs(8'b11111111);
	inputs(8'b0);
	#10 $finish;
end

initial
	$monitor("INPUT=%b & Nos. of 1 =%b",in,out);

endmodule
