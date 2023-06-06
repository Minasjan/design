module led_tb;

  reg clk;
  wire [3:0] leds;

  led led_inst (
    .clk(clk),
    .leds(leds)
  );

  initial begin
    clk = 0;

    forever #5 clk = ~clk;
  end

  initial begin
    $monitor("Time = %0t, LEDs = %b", $time, leds);
  end
  initial begin
	$dumpfile("v.vcd");
	
end

  initial begin
    #40 $finish;
  end

endmodule
