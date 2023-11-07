module priority_enc(y,x,valid);

	input [7:0]y;
	output reg[2:0]x;
	output reg valid;

always@(*)
begin
	valid=1'b1;
	case(1'b1)
	y[7]:x=3'b111;
	y[6]:x=3'b110;
	y[5]:x=3'b101;
	y[4]:x=3'b100;
	y[3]:x=3'b011;
	y[2]:x=3'b010;
	y[1]:x=3'b001;
	y[0]:x=3'b000;
	default:begin
			x=3'bx;
			valid=1'b0;
		end
	endcase
end

endmodule