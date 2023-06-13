
module led (
    input clk,
    output led
);

reg [7:0] counter=0;

always @(posedge clk) begin
    if (counter<150) begin
        counter<=counter+1;
    end else counter<=0;
end

// assign led[0]=(counter<20)?1:0;
// assign led[1]=(counter<40)?1:0;
// assign led[2]=(counter<60)?1:0;
// assign led[3]=(counter<80)?1:0;

// if (counter<20) begin
//     assign led=1;
// end else if (counter<40) begin
//     assign led=0;
// end else if (counter>60) begin
//     assign led=1;
// end else if (counter<80) begin
//     assign led=0;
// end else assign led=1;

assign led=(counter<20)? 1:
            ((counter<30)? 0:
                ((counter<60)? 1:
                    ((counter<90)? 0:    
                        ((counter<140)?1:0))));


    
endmodule



















