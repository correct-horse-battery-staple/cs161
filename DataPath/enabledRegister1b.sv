module enabledRegister1b(input logic D, output logic Q, 
	input logic clock, input logic writeEnable);
	
   // This initializes the register to 0.  This is cheating - it doesn't turn into hardware and would not
   // work in hardware, but it simplifies simulation
   
   initial
     begin
     Q = 1'b0;
     end
	
   logic writeReg;
    
// the always clause that follows happens on the positve edge of the clock

   mux4to1B1 mux0(1'b0,writeEnable,1'b0,1'b0,D,Q,writeReg);

   always @ (posedge clock)
     if(writeEnable)
        begin
	   Q = writeReg;
        end

	
   
endmodule
