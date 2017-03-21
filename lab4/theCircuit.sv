module theCircuit(Sw1, Sw2, Sw3, L1, L2, L3);

   input logic Sw1, Sw2, Sw3;
   

   output logic L1, L2, L3;


   assign L1 = (~Sw1&Sw2&Sw3)|(Sw1&~Sw2)|(Sw1&~Sw3) ;
   assign L2 = ~Sw2;
   assign L3 = Sw2^Sw3;
   
   
   

endmodule