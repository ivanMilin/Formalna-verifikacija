module top(
	input clk, 
	input rst,	
	output RT1, 
	output RDY1, 
	output START1, 
	output ENDD1,
	output ER2,
	output ER3, 
	output RDY3,
	output RDY4, 
	output START4,
	output ENDD5, 
	output STOP5, 
	output ER5, 
	output RDY5, 
	output START5,
	output ENDD6, 
	output STOP6, 
	output ER6, 
	output RDY6,
	output ENDD7, 
	output START7, 
	output STATUS_VALID7, 
	output INSTARTSV7,
	output RT8, 
	output ENABLE8,
	output RDY9, 
	output START9, 
	output INTERRUPT9,
        output ACK10, 
	output REQ10
);

	v1_z3 uufv(
		.clk(clk),
		.rst(rst),
		.RT1(RT1), 
		.RDY1(RDY1), 
		.START1(START1), 
		.ENDD1(ENDD1),
		.ER2(ER2),
		.ER3(ER3), 
		.RDY3(RDY3),
		.RDY4(RDY4), 
		.START4(START4),
		.ENDD5(ENDD5), 
		.STOP5(STOP5), 
		.ER5(ER5), 
		.RDY5(RDY5), 
		.START5(START5),
		.ENDD6(ENDD6), 
		.STOP6(STOP6), 
		.ER6(ER6), 	
		.RDY6(RDY6),
		.ENDD7(ENDD7), 
		.START7(START7), 
		.STATUS_VALID7(STATUS_VALID7), 
		.INSTARTSV7(INSTARTSV7),
		.RT8(RT8), 
		.ENABLE8(ENABLE8),
		.RDY9(RDY9), 
		.START9(START9), 
		.INTERRUPT9(INTERRUPT9),
		.ACK10(ACK10), 
		.REQ10(REQ10)
	);

	default clocking @(posedge clk); endclocking
	default disable iff(rst);

	zadatak1 : cover property(
		(RT1 ##1 ~RT1) ##0 RDY1 ##1 ENDD1 
	);

endmodule
