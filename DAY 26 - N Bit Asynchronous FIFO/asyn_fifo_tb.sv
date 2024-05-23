module asyncr_fifo_tb;

  	parameter WIDTH = 8;

  	reg [WIDTH-1:0] data_in;
  	reg we, wclk, wrst;
  	reg re, rclk, rrst;

  	wire [WIDTH-1:0] data_out;
  	wire full;
  	wire empty;

  	reg [WIDTH-1:0] mem[$], wdata;

  	asyn_fifo DUT(wclk,rclk,we,re,data_in,data_out,empty,full,rrst,wrst);

 	always #10ns wclk = ~wclk;
  	always #35ns rclk = ~rclk;
  
  	initial 
	begin
   		wclk = 1'b0; 
    		we = 1'b0;
    		data_in = 0;
		wrst=1'b0;
    
    		repeat(10)
		@(posedge wclk);
    			wrst = 1'b1;

    		repeat(2) 
		begin
      			for (int i=0; i<30; i++) 
			begin
        			@(posedge wclk iff !full);
        			we = (i%2 == 0)? 1'b1 : 1'b0;
        			if (we) 
				begin
          				data_in = $urandom;
          				mem.push_back(data_in);
        			end
      			end
      			#50;
    		end
  	end



  	initial 
	begin
    		rclk = 1'b0; 
    		re = 1'b0;
		rrst=1'b0;

			repeat(15)
			@(posedge rclk);
    			rrst = 1'b1;

    		repeat(2) 
		begin
      			for (int i=0; i<30; i++) 
			begin
        			@(posedge rclk iff !empty);
        			re = (i%2 == 0)? 1'b1 : 1'b0;
        			if (re) 
				begin
          				wdata = mem.pop_front();
          				if(data_out !== wdata) 
						$error("Time = %0t: Comparison Failed: expected wr_data = %h, rd_data = %h", $time, wdata, data_out);
          				else 
						$display("Time = %0t: Comparison Passed: wr_data = %h and rd_data = %h",$time, wdata, data_out);
        			end
      			end
      			#50;
    		end

   	 	$finish;
  	end
  
endmodule

/*
module asyn_fifo_tb;

  parameter DATA_WIDTH = 8;

  wire [DATA_WIDTH-1:0] data_out;
  wire full;
  wire empty;
  reg [DATA_WIDTH-1:0] data_in;
  reg w_en, wclk, wrst_n;
  reg r_en, rclk, rrst_n;

  // Queue to push data_in
  reg [DATA_WIDTH-1:0] wdata_q[$], wdata;

  //asynchronous_fifo as_fifo (wclk, wrst_n,rclk, rrst_n,w_en,r_en,data_in,data_out,full,empty);
  asyn_fifo DUT(wclk,rclk,w_en,r_en,data_in,data_out,empty,full,rrst_n,wrst_n);

  always #10ns wclk = ~wclk;
  always #35ns rclk = ~rclk;
  
  initial begin
    wclk = 1'b0; wrst_n = 1'b1;
    w_en = 1'b0;
    data_in = 0;
    
    repeat(10) @(posedge wclk);
    wrst_n = 1'b0;

    repeat(2) begin
      for (int i=0; i<30; i++) begin
        @(posedge wclk iff !full);
        w_en = (i%2 == 0)? 1'b1 : 1'b0;
        if (w_en) begin
          data_in = $urandom;
          wdata_q.push_back(data_in);
        end
      end
      #50;
    end
  end

  initial begin
    rclk = 1'b0; rrst_n = 1'b1;
    r_en = 1'b0;

    repeat(20) @(posedge rclk);
    rrst_n = 1'b0;

    repeat(2) begin
      for (int i=0; i<30; i++) begin
        @(posedge rclk iff !empty);
        r_en = (i%2 == 0)? 1'b1 : 1'b0;
        if (r_en) begin
          wdata = wdata_q.pop_front();
          if(data_out !== wdata) $error("Time = %0t: Comparison Failed: expected wr_data = %h, rd_data = %h", $time, wdata, data_out);
          else $display("Time = %0t: Comparison Passed: wr_data = %h and rd_data = %h",$time, wdata, data_out);
        end
      end
      #50;
    end

    $finish;
  end
  
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule
*/