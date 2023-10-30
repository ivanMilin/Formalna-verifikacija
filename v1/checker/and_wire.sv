module and_wire (/*AUTOARG*/
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

	wire c_d = a & b;

	always @(posedge clk)
		if (rst)
			c <= 1'b0;
		else
			c <= c_d;
endmodule
