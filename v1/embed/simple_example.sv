module simple_example (/*AUTOARG*/
	// Outputs
	r0, r1, r2,
	// Inputs
	clk, rst, a, b
	) ;
    input clk;
    input rst;
    input a;
    input b;
    output reg r0;
    output reg r1;
    output reg r2;

	wire r0_d = a & b;
	reg r1_d;
	reg r2_d;

	wire [1:0] ab = {a, b};
	always @* begin
		case (ab)
			2'b00: r1_d = 1'b0;
			2'b01: r1_d = 1'b0;
			2'b10: r1_d = 1'b0;
			default: r1_d = 1'b1;
		endcase
	end

	always @* begin
		case (ab)
			2'b00: r2_d = 1'b1;
			2'b01: r2_d = 1'b0;
			2'b10: r2_d = 1'b0;
			default: r2_d = 1'b1;
		endcase
	end

	always @(posedge clk) begin
		if (rst) begin
			r0 <= 1'b0;
			r1 <= 1'b0;
			r2 <= 1'b0;
		end else begin
			r0 <= r0_d;
			r1 <= r1_d;
			r2 <= r2_d;
		end
	end

    default clocking
        @(posedge clk);
    endclocking

    default disable iff (rst);

	assert property (r0 == r1);
	assert property (r0 == r2);

endmodule
