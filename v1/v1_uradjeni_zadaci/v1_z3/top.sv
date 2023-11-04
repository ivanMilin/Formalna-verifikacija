module top(
        input clk, 
        input rst,	

        output RT1,         //ZADATAK 1.      
        output RDY1, 
        output START1, 
        output ENDD1,
	output HELP1,

        output ER2,         //ZADATAK 2.
        
        output ER3,         //ZADATAK 3.
        output RDY3,

        output RDY4,        //ZADATAK 4. 
        output START4,

        output ENDD5,       //ZADATAK 5. 
        output STOP5, 
        output ER5, 
        output RDY5, 
        output START5,

        output ENDD6,       //ZADATAK 6. 
        output STOP6, 
        output ER6, 
        output RDY6,

        output ENDD7,       //ZADATAK 7. 
        output START7, 
        output STATUS_VALID7, 
        output INSTARTSV7,
        
        output RT8,         //ZADATAK 8. 
        output ENABLE8,

        output RDY9,        //ZADATAK 9. 
        output START9,
                
        output INTERRUPT9,  //ZADATAK 10.
        output ACK10, 
        output REQ10
);

	v1_z3 uufv(
            .clk(clk),
            .rst(rst),
	    .HELP1(HELP1),
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

	zadatak1 : assert property(
		RT1 && HELP1 |=> ~RDY1 && ~START1 && ~ENDD1 
    	);

	zadatak2 : assert property(
        	ER2[*3] |=> ~ER2   //Ispravi ovo ako treba samo tekst zadatka da se gleda
    	);

	zadatak3 : assert property(
		ER3 & RDY1 |=> ~ER3 || ~RDY1
	);

	/*
	zadatak4 : assert property(
		(not RDY4) until START4 // ?????????????????????????????	
	);
	*/

	zadatak5 : assert property(
		(ENDD5 || STOP5 || ER5) |=> !RDY5
	);
	
	zadatak6 : assert property(
		~RDY6 |-> ~(ENDD6 || STOP6 || ER6)  
	);

	zadatak7 : assert property(
		ENDD7 |-> ~STATUS_VALID7 || ~START7  
	);

	zadatak8: assert property(
		RT8 |=> (~ENABLE8)[*2] 	
	);

	zadatak9: assert property(
		INTERRUPT9 |=> ~RDY9 && ~START9
	);

	/*
	zadatak10: assert property(
		REQ10 |-> ACK10[*3]  
	);
	*/
endmodule
