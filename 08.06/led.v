
module led (
    input clk,
    output [3:0] led
);

reg [7:0] counter=0;

always @(posedge clk) begin
    if (counter<100) begin
        counter<=counter+1;
    end else counter<=0;
end

assign led[0]=(counter<20)?1:0;
assign led[1]=(counter<40)?1:0;
assign led[2]=(counter<60)?1:0;
assign led[3]=(counter<80)?1:0;


    
endmodule



















