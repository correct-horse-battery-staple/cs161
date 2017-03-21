module mux8to1B1(C2,C1,C0,I7,I6,I5,I4,I3,I2,I1,I0,O);

   input logic C2, C1, C0, I7, I6, I5, I4, I3, I2, I1, I0;
   output logic O;

   logic 	temp1, temp2;
 
   mux4to1B1 s1(C1,C0,I7,I6,I5,I4,temp1);
   mux4to1B1 s2(C1,C0,I3,I2,I1,I0,temp2);
   mux4to1B1 s3(1'b0,C2,1'b0,1'b0,temp1,temp2,O);
   
	
endmodule