module top(
	input clk,
	input rst,
	input a,
	input b,
	input c,
	input d,
	input e,
	input f,
	input g,
	input h,
	output out0,
	output out1
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
		.g(g),
		.h(h),
		.out0(out0),
		.out1(out1)
	);

	default clocking @(posedge clk); endclocking
	default disable iff(rst);

	is_equal : assert property(
		out0 == out1
	);

endmodule
