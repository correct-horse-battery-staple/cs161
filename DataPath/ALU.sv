module ALU(input logic  [31:0] I1,

	   input logic [31:0] I2,
	   input logic [4:0] Selector,
	   output logic zero,
	   output logic [31:0] O
	   );
	
   logic [31:0] sum;
   logic [31:0] nora;
   logic [31:0] rolv, rorv;
   logic [31:0] nota;
   logic [31:0] sub;
   
   assign sum = I1+I2;
   Nora norout(I1,I2,nora);
   Rolv rolvout(I2,I1[4:0],rolv);
   Rorv rorvout(I2,I1[4:0],rorv);
   
   Nota notout(I1,nota);
   assign sub = I1-I2;
   assign zero = sub==0;
   
   mux8to1B32 outputMux(Selector[2],Selector[1],Selector[0],32'b0,32'b0,32'b0,nota,rorv,rolv,nora,sum,O);
	
endmodule
