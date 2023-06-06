module seg(
    input  clk,
    input  reset,
    input button,
    output reg [6:0] segOut
);
    reg dff_1;
    reg dff_2;
    wire change;
    wire button_out;

    assign change = dff_1 & ~dff_2;

    debounce debounce_i (   .clk(clk),
           .rst(rst),
           .button(button),
           .button_out(button_out)
    );

    reg [3:0] count;

    reg [23:0] timer=0;


    // DFF_1
always @(posedge clk) begin
    if (rst) dff_1 <= 1'b0;
    else     dff_1 <= button_out;
end

// DFF_2
always @(posedge clk) begin
    if (rst) dff_2 <= 1'b0;
    else     dff_2 <= dff_1;
end




    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
        
        end  else if (timer==12_500_000) begin
             count <= count + 1'b1;
             timer<=0;
        end  else if (change) begin
            count<=count - 1;
        end else timer<=timer+1'b1;
           
    end

    always @(count) begin
        case(count)
            4'd0: segOut = 7'b1000000;  // 0
            4'd1: segOut = 7'b1111001;  // 1
            4'd2: segOut = 7'b0100100;  // 2
            4'd3: segOut = 7'b0110000;  // 3
            4'd4: segOut = 7'b0011001;  // 4
            4'd5: segOut = 7'b0010010;  // 5
            4'd6: segOut = 7'b0000010;  // 6
            4'd7: segOut = 7'b1111000;  // 7
            4'd8: segOut = 7'b0000000;  // 8
            4'd9: segOut = 7'b0010000;  // 9
            default: segOut = 7'b1111111; 
        endcase
    end

endmodule
