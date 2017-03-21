module dflipflop(input logic D, output logic Q, 
	input logic clock);
	
	initial
		Q = 'b0;
	
	always @ (posedge clock)
		begin
		   Q = D;
		end
		
endmodule
