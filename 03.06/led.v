module led (
    input clk,
    input rst,
    output reg led=0
);
parameter T = 25_000_000;

reg [23:0] counter=0;
reg [3:0] n=1;
always @(posedge clk ) begin
        if (rst) begin
            counter <= 0;
            led<=1'b0;
        end else if (counter==(T/250)*n) begin
            led<=~led;
        end else if (counter==((T/250)*n)-(T/250)) begin
             led<=1'b0;
             n<=n+1;
        end else if (counter==T) begin
            counter<=0;
            n<=0;
        end else counter<=counter+1'b1;          
end
    
endmodule