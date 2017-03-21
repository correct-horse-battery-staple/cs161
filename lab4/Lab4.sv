//Kevin Wang and Andy Tang

module Lab4(Sw1, Sw2, Sw3, L1, L2, L3, clock);

   input logic Sw1, Sw2, Sw3, clock;
   

   output logic L1, L2, L3;

   logic 	In1, In2,In3,Out1,Out2,Out3;
   

   // an instance of theCircuit, with inputs and outputs
   
   theCircuit c1(In1, In2, In3, Out1, Out2, Out3);
   
   logic 	D1,Q1,CLK1;
   dflipflop FF1(D1,Q1,CLK1);
   
   logic 	D2,Q2,CLK2;
   dflipflop FF2(D2,Q2,CLK2);

   logic 	D3,Q3,CLK3;
   dflipflop FF3(D3,Q3,CLK3);

   assign D1 = Out1;
   assign D2 = Out2;
   assign D3 = Out3;
   assign CLK1 = clock;
   assign CLK2 = clock;
   assign CLK3 = clock;

   // the following is like connecting wires, but the statements are
   // directinal  make sure that the source is on the right

   assign In1 = Q1;
   assign In2 = Q2;
   assign In3 = Q3;

   assign L1 = Out1;
   assign L2 = Out2;
   assign L3 = Out3;
  
   
endmodule