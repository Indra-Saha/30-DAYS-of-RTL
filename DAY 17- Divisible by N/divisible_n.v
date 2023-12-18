/* Divisible by N
Every cycle, number is left shifted by 1, and new LSB bit is injected. Calculate whether number is divisible by N. Where N is a parameter to the design module. 

Input to module 

clk-Clock
rst- posedge reset
MOD- Divisible by N
in- Input Bit Stream
out- Output 1 if divisible by N
     Output 0 if not
*/

module divisible_n(clk,rst,in,out);

	parameter MOD=5;
	input clk,rst,in;
	output out;
	localparam M=MOD<<1;
	localparam width=$clog2(M);
	reg[(width-1):0] div;
	wire [(width-1):0] sub;
	assign sub=(div>=MOD)?(div-MOD):div;

always@(posedge clk)
begin
		if(rst)
		div<=0;
	else
	begin
		div=sub;
		if(in)
			div<=(div<<1)+1'b1;
		else if(~in)
			div<=div<<1;	
	end
end

assign out=(sub==0);

endmodule
		


