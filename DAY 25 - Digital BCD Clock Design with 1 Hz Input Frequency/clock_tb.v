`timescale 1s/1ms
module clock_tb;

	reg clk,rst,load;
	reg [3:0] load_ms_hr,load_ls_hr;
	reg [3:0] load_ms_min,load_ls_min;
	wire [3:0] time_ms_hr,time_ls_hr,time_ms_min,time_ls_min;

	clock DUT(clk,rst,load,load_ms_hr,load_ls_hr,load_ms_min,load_ls_min,time_ms_hr,
		time_ls_hr,time_ms_min,time_ls_min);

initial
begin
	clk=1'b1;
	forever #0.5 clk=~clk;
end

task reset;
begin
	@(negedge clk);
		rst=1'b0;
	@(negedge clk);
		rst=1'b1;
end
endtask

task ld;
input [3:0]hrms,hrls;
input [3:0]minms,minls;
begin
	@(negedge clk);
		load=1;
		load_ms_hr=hrms;
		load_ls_hr=hrls;
		load_ms_min=minms;
		load_ls_min=minls;
		$display("Loaded Time= %d%d:%d%d",hrms,hrls,minms,minls);
	@(negedge clk);
		load=0;
end
endtask

initial
begin
	reset;
	ld(4'd1,4'd7,4'd2,4'd5);
	#6735;
	$display("Time NOW after 6735s= %d%d:%d%d",time_ms_hr,time_ls_hr,time_ms_min,time_ls_min);
	$finish;
end

endmodule
