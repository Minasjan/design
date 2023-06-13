
module tb ();
    reg clk =0;
    wire  led;

    led l(clk, led);
    always #5 clk = ~clk;

    initial begin
	$dumpfile("v.vcd");
    $dumpvars();
    #1000000;
    $finish;

	
end

endmodule