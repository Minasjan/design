module tb#(parameter Bit=15)();

reg [Bit-1:0]a;
reg [Bit-1:0]b;
wire[Bit-1:0]s;

adder_with_parametr adder_inst(.a(a), .b(b), .sum(s), .c(c));

initial begin
	$dumpfile("v.vcd");
	$dumpvars();
end

initial begin
    a = 1050; b = 1209; #1 $display("a =%d, b =%d, sum =%d", a, b, {c,s});
   
end

endmodule