module Rorv(input logic [31:0] I1, input logic [4:0] I2, output [31:0] O);

   logic [31:0] rorv0, rorv1, rorv2, rorv3, rorv4, rorv5, rorv6, rorv7; 
   assign rorv0 = I1;
   assign rorv1 = {{I1[0],I1[31:1]}};
   assign rorv2 = {{I1[1:0],I1[31:2]}};
   assign rorv3 = {{I1[2:0],I1[31:3]}};
   assign rorv4 = {{I1[3:0],I1[31:4]}};
   assign rorv5 = {{I1[4:0],I1[31:5]}};
   assign rorv6 = {{I1[5:0],I1[31:6]}};
   assign rorv7 = {{I1[6:0],I1[31:7]}};

   mux8to1B32 leftRotate(I2[2],I2[1],I2[0],rorv7,rorv6,rorv5,rorv4,rorv3,rorv2,rorv1,rorv0,O);

endmodule