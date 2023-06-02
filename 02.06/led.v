  module leds (
    input clk,
    input rst,
    output reg led
    
  );

  reg [23:0] counter_1=0;
  reg [23:0] counter_2=0;

  reg puls=1'b0;


    always @(posedge clk) 
        if (counter_1==12_500_000) begin
            counter_1<=0; 
            puls=~puls;
        end else if (counter_2==13_000_000) begin
            counter_2<=0; 
            puls=~puls;
        end else begin
            counter_1<=counter_1+1'b1;
            counter_2<=counter_2+1'b1;

        end
    
 
    always @(posedge puls or posedge rst)
    if (rst) begin
	    	led <= 1'b0;
    end else begin
        led<=puls;
    end
    
    
  endmodule