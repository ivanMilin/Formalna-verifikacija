module and_case (/*AUTOARG*/
	// Outputs
	c,
	// Inputs
	clk, rst, a, b
	) ;
    input clk;
    input rst;
    input a;
    input b;
    output reg c;

	wire [1:0] ab = {a, b};
	logic c_d;
	always @* begin
		case (ab)
			2'b00: c_d = 1'b0;
			2'b01: c_d = 1'b0;
			2'b10: c_d = 1'b0;
			default: c_d = 1'b1;
		endcase
	end

	always @(posedge clk)
		if (rst)
			c <= 1'b0;
		else
			c <= c_d;
endmodule
