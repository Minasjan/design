  module leds (
    input clk,
    output reg [3:0] led
  );

  reg [23:0] counter=0;
  reg puls=1'b0;
  reg [2:0] led_counter=3'b0;

    always @(posedge clk) 
        if (counter==12_500_000) begin
            counter<=0; 
            puls=~puls;
        end else begin
            counter=counter+1'b1;
        end
    
 
    always @(posedge puls) 
        if (led_counter==4) begin
            led_counter<=0;
        end else begin
            led_counter<=led_counter+1'b1;
        end
    

    always @(posedge puls)
        case (led_counter)
            4'b0000:
                led=4'b1111; 
            4'b0001:
                led=4'b1110;
            4'b0010:
                led=4'b1101;
            4'b0011:
                led=4'b1011;
            4'b0100:
                led=4'b0111;
            default: 
                led=4'b0000;
        endcase
    
    
  endmodule