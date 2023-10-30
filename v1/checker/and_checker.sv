checker and_checker (
    clk,
    rst,
    a,
    b,
    c
	) ;

	default
	clocking @(posedge clk);
	endclocking

	default disable iff rst;

	logic a_d1, b_d1;

	always @(posedge clk)
		a_d1 <= rst ? 1'b0 : a;
	always @(posedge clk)
		b_d1 <= rst ? 1'b0 : b;

	assert property (c == (a_d1 & b_d1));

endchecker
