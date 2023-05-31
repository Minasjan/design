`timescale 1 ns/1 ps
module tb();

reg clk;
wire [3:0] led;

leds l(.clk(clk), .led(led));

initial begin
	$dumpfile("v.vcd");
	
end

initial begin 
	clk = 1'b0;
end

// always #100000000 clk = ~clk;

initial begin
    
    // $display("%d %d %d %d", led[0], led[1], led[2], led[3]);
     $monitor("Time = %0t, LEDs = %b", $time, led);
   
    $finish;
end

endmodule