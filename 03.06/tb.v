 `timescale 1 ns/1 ps
module tb();

reg clk;
reg rst;
wire led;


led l(.clk(clk), .rst(rst), .led(led));

initial begin
	$dumpfile("v.vcd");
    $dumpvars();

	
end

initial begin 
	clk = 1'b0;
	rst = 1'b1;
    #10;
    rst = 1'b0;

end

always #3 clk = ~clk;

initial begin
repeat (100) begin
    @(posedge clk);
    #1;
    $display ("Time = %0t, LEDs = %b", $time, led);
end
end
initial begin
    #9000;
   
    $finish;
end

endmodule