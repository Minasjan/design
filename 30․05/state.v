module led (
  input clk,
  output reg [3:0] leds
);

parameter STATE1 = 4'b0000;
parameter STATE2 = 4'b0010;
parameter STATE3 = 4'b0100;
parameter STATE4 = 4'b1000;

reg [3:0] state;

always @(posedge clk) begin
  case (state)
    STATE1: begin
      leds <= 4'b0001;
      state <= STATE2;
    end
    STATE2: begin
      leds <= 4'b0010;
      state <= STATE3;
    end
    STATE3: begin
      leds <= 4'b0100;
      state <= STATE4;
    end
    STATE4: begin
      leds <= 4'b1000;
      state <= STATE1;
    end
  endcase
end

endmodule
