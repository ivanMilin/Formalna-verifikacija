module simple_example
  (
   input        clk,
   input        rst,
   input        a,
   input        b,
   output logic r0,
   output logic r1,
   output logic r2
   ) ;

    wire        r0_d = a & b;
    logic       r1_d;
    logic       r2_d;
    wire [1:0]  ab = {a, b};

    always_comb
      case (ab)
          2'b00: r1_d = 1'b0;
          2'b01: r1_d = 1'b0;
          2'b10: r1_d = 1'b0;
          default: r1_d = 1'b1;
      endcase

    always_comb
      case (ab)
          2'b00: r2_d = 1'b1;
          2'b01: r2_d = 1'b0;
          2'b10: r2_d = 1'b0;
          default: r2_d = 1'b1;
      endcase

    always @(posedge clk)
      if (rst)
        begin
            r0 <= 1'b0;
            r1 <= 1'b0;
            r2 <= 1'b0;
        end
      else
        begin
            r0 <= r0_d;
            r1 <= r1_d;
            r2 <= r2_d;
        end

endmodule
