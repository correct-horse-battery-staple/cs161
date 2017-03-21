module Rolv(input logic [31:0] I1, input logic [4:0] I2, output [31:0] O);

   logic [31:0] rolv0, rolv1, rolv2, rolv3, rolv4, rolv5, rolv6, rolv7; 
   assign rolv0 = I1;
   assign rolv1 = {{I1[30:0],I1[31]}};
   assign rolv2 = {{I1[29:0],I1[31:30]}};
   assign rolv3 = {{I1[28:0],I1[31:29]}};
   assign rolv4 = {{I1[27:0],I1[31:28]}};
   assign rolv5 = {{I1[26:0],I1[31:27]}};
   assign rolv6 = {{I1[25:0],I1[31:26]}};
   assign rolv7 = {{I1[24:0],I1[31:25]}};

   mux8to1B32 leftRotate(I2[2],I2[1],I2[0],rolv7,rolv6,rolv5,rolv4,rolv3,rolv2,rolv1,rolv0,O);

endmodule