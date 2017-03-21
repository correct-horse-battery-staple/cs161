module tester2;

   logic Switch1, Switch2, Switch3, Light1, Light2, Light3, clk;
   int 	 clockCount;
   

// the is the device under test - a Lab4
   
Lab4 dut(Switch1, Switch2, Switch3, Light1, Light2, Light3, clk);

   
// This is a clock signal - it goes up and down
   
 always
  begin
     clk <=0;
     #20;
     clk <=1;
     clockCount <= clockCount + 1;
     #20;
  end

// this happens on the negative clock edge.  The flip-flops trigger
//   on the positive edge, so this is a good place to print stuff out
     
   
 always @ (negedge clk)
   begin
      $display("Output is %b %b %b", Light1, Light2, Light3);

      if (clockCount == 25)
	begin
	   $display("End of simulation at clock count %d",clockCount);
	   $stop;
	end
   end // always @ (negedge clock)

endmodule // tester


