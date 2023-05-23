
module adder(
    input a,
    input b,
    input carry_in,
    output sum,
    output carry_out
);

assign sum = (a ^ b) ^ carry_in;
assign carry_out = (a & b) | ((a ^ b) & carry_in);

endmodule

module adder8(
    input [7:0]a,
    input [7:0]b,
    output [7:0]sum,
    output c

);

adder adder0(.a(a[0]), .b(b[0]), .carry_in(1'b0), .sum(sum[0]), .carry_out(c0));
adder adder1(.a(a[1]), .b(b[1]), .carry_in(c0), .sum(sum[1]), .carry_out(c1));
adder adder2(.a(a[2]), .b(b[2]), .carry_in(c1), .sum(sum[2]), .carry_out(c2));
adder adder3(.a(a[3]), .b(b[3]), .carry_in(c2), .sum(sum[3]), .carry_out(c3));
adder adder4(.a(a[4]), .b(b[4]), .carry_in(c3), .sum(sum[4]), .carry_out(c4));
adder adder5(.a(a[5]), .b(b[5]), .carry_in(c4), .sum(sum[5]), .carry_out(c5));
adder adder6(.a(a[6]), .b(b[6]), .carry_in(c5), .sum(sum[6]), .carry_out(c6));
adder adder7(.a(a[7]), .b(b[7]), .carry_in(c6), .sum(sum[7]), .carry_out(c));
// adder adder8(.a(a[8]), .b(b[8]), .carry_in(c7), .sum(sum[8]), .carry_out(c8));


endmodule


module top();

reg [7:0]a;
reg [7:0]b;
wire [7:0]s;

adder8 adder8_inst(.a(a), .b(b), .sum(s), .c(c));

initial begin
	$dumpfile("v.vcd");
	$dumpvars();
end

initial begin
    a = 35; b = 62; #1 $display("a =%d, b =%d, sum =%d", a, b, {s,c});
    a = 10; b = 160; #1 $display("a =%d, b =%d, sum =%d", a, b, {s,c});
    a = 190; b = 104; #1 $display("a =%d, b =%d, sum =%d", a, b, {s,c});
end

endmodule