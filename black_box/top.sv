checker top (clk,rst,x,y);

	default clocking @(posedge clk); endclocking
	default disable iff(rst);

	logic trigger;

	always @ (posedge clk) begin
		if (y[29]) 
			trigger <= 1'b1;		
		else
			trigger <= 1'b0;		
	end

	assert_1  : assert property ( y[0] |=> ~y[0] );
 
	assert_2  : assert property ( always s_eventually y[2] ); 

	assert_3  : assert property ( y[1] |=>  y[3] until y[4] );
	
	assert_4  : assert property ( (y[2] ##1 y[5]) |=> y[6] );

	assert_5  : assert property ( ~y[2] [*3] |-> y[7] );

	assert_6  : assert property ( (y[8] [*2:3] ##1 ~y[9]) |=> y[10] );

	assert_7  : assert property ( if(y[0]) ##1 y[1] else y[1]);

	assert_8  : assert property ( y[2] [->2] |=> y[16] );

	assert_9  : assert property ( y[28:17] [->3] |=> y[15]); 

	cover_10 : cover property (trigger |-> y[29] [*10]);

	assume_x0_xor_x1 : assume property ( x[0] ^ x[1] );	
		
	assert_11 : assert property ( not (x[31] && x[30])); 

endchecker
