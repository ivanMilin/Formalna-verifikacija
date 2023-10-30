module top (
    input logic clk,
    input logic rst,
    input logic a,
    input logic b,
    output logic r0,
    output logic r1,
    output logic r2
) ;
	simple_example uufv
	  (
	   .clk(clk),
	   .rst(rst),
	   .a(a),
	   .b(b),
	   .r0(r0),
	   .r1(r1),
	   .r2(r2));

	property p1;
		@(posedge clk) r0 == r1;
	endproperty

	property p2;
		@(posedge clk) r0 == r2;
	endproperty

	assert property (p1);
	assert property (p2);

endmodule
