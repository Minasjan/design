module led (
    input clk,
    input rst,
    output reg led
);
// parameter T = 25_000_000;

reg [15:0] T1;
reg [15:0] T2;

reg [23:0] counter;
always @(posedge clk ) begin
        if (rst) begin
            // n<=1;
            counter <= 0;
            led<=1'b0;
            T1<=0;
            T2<=200;
        end else if (counter==200) begin
            T1<=T1+1;
            // T2<=T2-1;
            counter<=24'b0;
        end else counter<=counter+1'b1;          
end

always @(posedge clk) begin
    if (T1>T2 & T2>counter) begin
        T2<=T2-1'b1;
        led<=1'b1;
    end
    else if (T1>counter & T1<T2) begin
        led<=1'b1;
    end else led<=1'b0;
end

always @(posedge clk) begin
    if (T2==0) begin
        T1<=0;
        T2<=200;
        counter<=0;
    end
end
    
endmodule