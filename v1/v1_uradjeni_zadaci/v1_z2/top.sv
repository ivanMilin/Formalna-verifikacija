module top(
	input clk,
	input rst,
	input a,
	input b,
	input c,
	input d,
	input e,
	input f,
	output out1,
	output out2
);

	v1_z2 uufv(
		.clk(clk),
		.rst(rst),
		.a(a),
		.b(b),
		.c(c),
		.d(d),
		.e(e),
		.f(f),
		.out1(out1),
		.out2(out2)
	);

	default clocking @(posedge clk); endclocking
	default disable iff(rst);

	is_equal : assert property(
		out1 == out2
	);

endmodule
