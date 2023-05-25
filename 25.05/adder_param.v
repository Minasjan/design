module adder_with_parametr #(parameter Bit = 15)(
    input [Bit-1:0]a,
    input [Bit-1:0]b,
    output [Bit-1:0]sum,
    output c

);

    wire [0:Bit] result;
    assign result[0]=0;
    genvar i;
    generate
   
        for (i = 0 ; i<Bit ; i=i+1 ) begin:j
            adder inst(.a(a[i]), .b(b[i]), .carry_in(result[i]), .sum(sum[i]), .carry_out(result[i+1]));
        end
    endgenerate
    assign c=result[Bit];


endmodule