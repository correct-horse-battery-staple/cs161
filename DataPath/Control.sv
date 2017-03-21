module Control(ins, pcEnableIn,memWrite, regWriteEnable, aluSrc, jjr, ja, link, brancha, memtoReg, alu4, alu3, alu2, alu1, alu0,pcEnableOut,IRegEnable,IorD,regAEnable);

   input logic [31:0] ins;
   input logic [0:0]  pcEnableIn;
   
   output logic [0:0] memWrite, regWriteEnable, aluSrc, jjr, ja, link, brancha, memtoReg, alu4, alu3, alu2, alu1, alu0;
   
   output logic [0:0] pcEnableOut, IRegEnable, IorD, regAEnable;

   logic [0:0] 	      lw, sw, adda, jr, jal, nora, nori, nota, bleu, rolv, rorv;
   
   assign lw = ins[31] & ~ins[30] & ~ins[29] & ~ins[28] & ins[27] & ins[26];
   assign sw = ins[31] & ~ins[30] & ins[29] & ~ins[28] & ins[27] & ins[26];
   assign adda = ins[31] & ~ins[30] & ~ins[29] & ~ins[28] & ~ins[27] & ~ins[26];
   assign jr = ~ins[31] & ~ins[30] & ins[29] & ~ins[28] & ~ins[27] & ~ins[26];
   assign jal = ~ins[31] & ~ins[30] & ~ins[29] & ~ins[28] & ins[27] & ins[26];
   assign nora = ins[31] & ~ins[30] & ~ins[29] & ins[28] & ins[27] & ~ins[26];
   assign nori = ~ins[31] & ~ins[30] & ins[29] & ins[28] & ins[27] & ~ins[26];
   assign nota = ~ins[31] & ~ins[30] & ~ins[29] & ins[28] & ~ins[27] & ~ins[26];
   assign bleu = ~ins[31] & ins[30] & ~ins[29] & ~ins[28] & ~ins[27] & ~ins[26];
   assign rolv = ~ins[31] & ~ins[30] & ~ins[29] & ~ins[28] & ~ins[27] & ~ins[26];
   assign rorv = ~ins[31] & ~ins[30] & ~ins[29] & ~ins[28] & ins[27] & ~ins[26];

   
   assign alu0 = 1'b0;
   assign alu1 = 1'b0;
   assign alu2 = nota;
   assign alu3 = (rolv||rorv);
   assign alu4 = nori||nora||rorv;
   
   assign regWriteEnable = (lw&~pcEnableIn)||adda||jal||nora||nori||nota||rolv||rorv;
   assign memWrite = sw;
   assign aluSrc = nota||nori||lw||sw||(bleu&~pcEnableIn);
   assign jjr = jr;
   
   assign ja = jal||jr;
   assign link = jal;
   assign brancha = bleu;
   assign memtoReg = lw&&~pcEnableIn;

   assign pcEnableOut = ~(pcEnableIn&(sw|lw|brancha));
   assign IRegEnable = ~(lw&pcEnableIn);
   assign IorD = ~(~pcEnableIn&(sw|lw));
   assign regAEnable = ~(sw&pcEnableIn);

endmodule