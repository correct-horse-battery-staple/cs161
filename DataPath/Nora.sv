module Nora(input logic [31:0] I1, input logic [31:0] I2, output logic [31:0] O);

   assign O[0]=~(I1[0]|I2[0]);
   assign O[1]=~(I1[1]|I2[1]);
   assign O[2]=~(I1[2]|I2[2]);
   assign O[3]=~(I1[3]|I2[3]);
   assign O[4]=~(I1[4]|I2[4]);
   assign O[5]=~(I1[5]|I2[5]);
   assign O[6]=~(I1[6]|I2[6]);
   assign O[7]=~(I1[7]|I2[7]);
   assign O[8]=~(I1[8]|I2[8]);
   assign O[9]=~(I1[9]|I2[9]);
   assign O[10]=~(I1[10]|I2[10]);
   assign O[11]=~(I1[11]|I2[11]);
   assign O[12]=~(I1[12]|I2[12]);
   assign O[13]=~(I1[13]|I2[13]);
   assign O[14]=~(I1[14]|I2[14]);
   assign O[15]=~(I1[15]|I2[15]);
   assign O[16]=~(I1[16]|I2[16]);
   assign O[17]=~(I1[17]|I2[17]);
   assign O[18]=~(I1[18]|I2[18]);
   assign O[19]=~(I1[19]|I2[19]);
   assign O[20]=~(I1[20]|I2[20]);
   assign O[21]=~(I1[21]|I2[21]);
   assign O[22]=~(I1[22]|I2[22]);
   assign O[23]=~(I1[23]|I2[23]);
   assign O[24]=~(I1[24]|I2[24]);
   assign O[25]=~(I1[25]|I2[25]);
   assign O[26]=~(I1[26]|I2[26]);
   assign O[27]=~(I1[27]|I2[27]);
   assign O[28]=~(I1[28]|I2[28]);
   assign O[29]=~(I1[29]|I2[29]);
   assign O[30]=~(I1[30]|I2[30]);
   assign O[31]=~(I1[31]|I2[31]);

endmodule