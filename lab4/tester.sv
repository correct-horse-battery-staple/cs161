module tester;

   logic Switch1, Switch2, Switch3, Light1, Light2, Light3, clk;
   

// the is the device under test - a Lab4
   
Lab4 dut(Switch1, Switch2, Switch3, Light1, Light2, Light3, clk);

// the initial block is executed at the beginning of the simulation
   
initial begin


   
//the next lines set values 

   Switch1 <= 0;
   Switch2 <= 0;
   Switch3 <= 0;
   
   
   // #20 is a pause for 20 time units - circuits need time to settle
   #20;
   
    
   // Write the control signals and the output
     
   printS(Switch1, Switch2, Switch3, Light1, Light2, Light3);

   //pause 20 nanoseconds
   #20;
  
   //change the values of the control signals
   Switch3 <= 1;
   #20;
   printS(Switch1, Switch2, Switch3, Light1, Light2, Light3);
   
   #20;

   Switch3 <= 0;
   Switch2 <= 1;

   #20;
   
     printS(Switch1, Switch2, Switch3, Light1, Light2, Light3);
   
   #20;

   Switch3 <= 1;
   #20;
   
   printS(Switch1, Switch2, Switch3, Light1, Light2, Light3);
   
   #20;

   Switch3 <= 0;
   Switch2 <= 0;
   Switch1 <= 1;
   
   #5
   printS(Switch1, Switch2, Switch3, Light1, Light2, Light3);
   
   #20;

   Switch3 <= 1;
   #20;
   
   printS(Switch1, Switch2, Switch3, Light1, Light2, Light3);
   
   #20;

   Switch3 <= 0;
   Switch2 <= 1;
   #5
   printS(Switch1, Switch2, Switch3, Light1, Light2, Light3);

   Switch3 <=1;
   #20;

   printS(Switch1, Switch2, Switch3, Light1, Light2, Light3);

end  // end of the initial block

   function void printS(S1,S2,S3,L1, L2, L3);
      begin
	 $display("%b %b %b Output is %b %b %b",S1, S2, S3, 
	    L1, L2, L3);

      end
      
   endfunction // setAndPrint
   
endmodule // tester

