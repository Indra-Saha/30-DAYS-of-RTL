module alu_tb();

	reg [7:0]a,b;
	reg [3:0]com;
	reg oenab;
	wire [15:0]out;

 parameter   ADD  = 4'b0000, // Add two 8 bit numbers a and b.
  	     INC  = 4'b0001, // Increment a by 1. 
	     SUB  = 4'b0010, // Subtracts b from a.
	     DEC  = 4'b0011, // Decrement a by 1.
	     MUL  = 4'b0100, // Multiply 4 bit numbers a and b.
	     DIV  = 4'b0101, // Divide a by b.
	     SHL  = 4'b0110, // Shift a to left side by 1 bit.
	     SHR  = 4'b0111, // Shift a to right by 1 bit.
	     AND  = 4'b1000, // Logical AND operation
	     OR   = 4'b1001, // Logical OR operation
	     INV  = 4'b1010, // Logical Negation
	     NAND = 4'b1011, // Bitwise NAND
	     NOR  = 4'b1100, // Bitwise NOR
	     XOR  = 4'b1101, // Bitwise XOR
	     XNOR = 4'b1110, // Bitwise XNOR
	     BUF  = 4'b1111; // BUF

reg [4*8:0] string_cmd;
integer j;
alu DUT(.a_in(a),.b_in(b),.oe(oenab),.command_in(com),.d_out(out));

task initialize;
begin
	{a,b,com,oenab}=0;
end
endtask

task enable (input i);
begin
	oenab=i;
end
endtask


task inputs;
input [7:0]x,y;
begin
	a=x;
	b=y;
end
endtask

task command;
input [3:0] z;
begin
	com=z;
end
endtask


task delay;
begin
	#10;
end
endtask


always@(com)
begin

	case(com)
	    ADD    :  string_cmd = "ADD";
	    INC    :  string_cmd = "INC";
	    SUB    :  string_cmd = "SUB";
	    DEC    :  string_cmd = "DEC";
	    MUL    :  string_cmd = "MUL";
	    DIV    :  string_cmd = "DIV";
	    SHL    :  string_cmd = "SHL";
	    SHR    :  string_cmd = "SHR";
	    INV    :  string_cmd = "INV";
	    AND    :  string_cmd = "AND";
	    OR     :  string_cmd = "OR";
	    NAND   :  string_cmd = "NAND";
	    NOR    :  string_cmd = "NOR";
	    XOR    :  string_cmd = "XOR";
	    XNOR   :  string_cmd = "XNOR";
	    BUF    :  string_cmd = "BUF";
	 endcase
end

initial
begin

	initialize;
	enable(1'b1);
	inputs(8'b11001110,8'b10011011);
	for(j=0;j<16;j=j+1)
	begin
		command(j);
		delay;
	end
end



initial
#2000 $finish;

initial
$monitor("a=%b,\tb=%b,\tenable=%b,\tcommand=%s,\toutput=%b",a,b,oenab,string_cmd,out);

endmodule

