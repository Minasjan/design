module debounce (clk, rst, button, button_out);

input clk;
input rst;

input button;
output button_out;

reg  [17:0] counter;
wire [17:0] counter_nxt;
wire full;

assign full = (counter == 18'd250000);
assign counter_nxt = (button) ? (~full ? counter + {{17{1'b0}}, 1'b1} : 18'd250000) : {18{1'b0}};
assign button_out = full;

always @(posedge clk) begin
    if (rst) counter <= {18{1'b0}};
    else     counter <= counter_nxt;
end

endmodule