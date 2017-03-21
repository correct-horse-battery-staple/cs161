//Kevin Wang

module DataPath(clock, pcQ, instr, pcD, regWriteEnable);   

   //PC
   input logic clock;
   output logic [31:0] instr;
   output logic [31:0] pcQ;
   output logic [31:0] pcD;
   output logic [0:0]  regWriteEnable;

   //Cycle
   //logic [31:0]        pcEnable;
   
   //Control
   logic [0:0] 	memWrite, alu4, alu3, alu2, alu1, alu0;
   logic [0:0] 	aluSrc, jjr, ja, link, brancha;
   logic [0:0] 	pcEnableIn, pcEnableOut,IRegEnable,IorD,regAEnable;

   //Memory
   logic [31:0]        memA,memRD,WD;
   logic [0:0] 	       WE;

   //Adder (PC->PC+4)
   logic [31:0] adderIn1, adderIn2, adderOut;
   logic [31:0] constant4;
   initial
     constant4 <= 32'b100;
   
   //Registers
   logic [4:0] 	       A3, A2, A1;
   logic 	       WE3;
   logic [31:0]        WD3, RD1, RD2;
   logic [4:0] 	       standardReg;

   //RegA1 and A2
   logic [31:0]        regA1Q,regA2Q;

   //ALUReg
   logic [31:0]        regALUQ;
   
   //SignImm
   logic [31:0]        SignImm;
   assign SignImm = {{16{instr[15]}}, instr[15:0]};

   //ALU
   logic [31:0]        SrcA, SrcB, ALUResult;
   logic [4:0] 	       aluSelect;
   logic 	       zeroLine;
   logic [31:0]	       aluInO;

   //Jump and Branch logic
   logic [31:0]        jumpLine;
   logic [31:0]        jalLine, jrLine;
   logic [4:0] 	       linkReg;
   initial
     linkReg <= 4'b0111;
   logic [31:0]        nonBranchLine;
   logic [31:0]        branchLine;
   logic [31:0]        branchLabel;
   logic 	       branchIf;
   logic [31:0]        branchMuxLine;

   //Declarations
   enabledRegister PC(pcD,pcQ,clock,pcEnableIn|branchIf);

   enabledRegister1b cycle(pcEnableOut,pcEnableIn,clock,1'b1);
   
   memory unifiedMem(memA,memRD,WD,clock,WE); //add lines

   enabledRegister IReg(memRD,instr,clock,IRegEnable);

   Control theControl(instr, pcEnableIn, memWrite, regWriteEnable, aluSrc, jjr, ja, link, brancha, memtoReg, alu4, alu3, alu2, alu1, alu0, pcEnableOut, IRegEnable,IorD,regAEnable);
   
   registerFile theRegisters(A1, A2, A3, clock, WE3, WD3, RD1, RD2);

   enabledRegister regA1(RD1,regA1Q,clock,regAEnable);
   enabledRegister regA2(RD2,regA2Q,clock,regAEnable);

   adder psAdd(adderIn1,adderIn2,adderOut);
   
   ALU theALU(SrcA, SrcB, aluSelect, zeroLine, ALUResult);

   enabledRegister ALUReg(ALUResult,regALUQ,clock,IorD);
   
   //Multiplexers
   ///mem source
   mux2to1B32 muxIorD(IorD,pcQ,regALUQ,memA);
   
   ///A3 source - non link choices between i and r
   mux2to1B5 standardRegIn(aluSrc,instr[20:16],instr[15:11],standardReg); 
   ///A3 source - link vs no link
   mux2to1B5 A3In(ja&~jjr,linkReg,standardReg,A3);
   ///PC jr vs jal
   mux2to1B32 muxJJR(jjr,jrLine,jalLine,jumpLine);
   ///PC jump vs not jump
   mux2to1B32 muxPCJ(ja,jumpLine,adderOut,nonBranchLine);
   ///PC branch vs not branch
   mux2to1B32 muxBranch(branchIf,branchLine,nonBranchLine,branchMuxLine);

   ///ALU1 source - regA2Q vs PC+4
   mux2to1B32 aluIn1(pcEnableIn&brancha,adderOut,regA1Q,SrcA);
   
   ///ALU2 source - i vs r vs branchLabel
   mux4to1B32 aluIn2(brancha&pcEnableIn,aluSrc,32'b0,branchLabel,SignImm,regA2Q,aluInO);

   ///WD3 source - ALU vs mem vs link
   mux4to1B32 WD3In(link,memtoReg,32'b0,jalLine,memRD,regALUQ,WD3);
   
   adder branchAdd(branchLabel,adderOut,branchLine); //to remove

   //set mem
   assign WD = regA2Q;
   assign WE = memWrite;
   //assign dataA = ALUResult;

   //set PC adder
   assign adderIn1 = pcQ;
   assign adderIn2 = constant4;

   //set registers
   assign A1 = instr[25:21];
   assign WE3 = regWriteEnable;
   assign A2 = instr[20:16];

   //set ALU
   assign aluSelect = {alu0,alu1,alu2,alu3,alu4};
   assign SrcB = aluInO;
   
   //set jump muxes
   assign jalLine = {adderOut[31:28],instr[25:0],2'b0};
   assign jrLine = regA1Q;

   //set branch muxes
   assign branchLabel = {{SignImm[29:0],2'b0}};   
   assign branchIf = brancha&(zeroLine|ALUResult[31]);

   //set PC in
   assign pcD = branchMuxLine;
	      

   always @(posedge clock)
     begin

	$display("memA:\t\t%d",memA);
	
	$display("memRD:\t%d",memRD);
	
	$display("regALUQ:\t%d",regALUQ);
	$display("WD3:\t\t%d",WD3);	
	
	$display("pcEnableIn:\t\t%d", pcEnableIn);
	$display("pcEnableOut:\t\t%d",pcEnableOut);
	
	$display("IRegEnable:\t\t%d",IRegEnable);
	$display("IorD:\t\t\t%d",IorD);
	$display("regAEnable:\t\t%d",regAEnable);
	
	$display("memWrite:\t\t%d", memWrite);
	$display("regWriteEnable:\t%d", regWriteEnable);
	$display("aluSrc:\t\t%d", aluSrc);
	$display("jjr:\t\t\t%d", jjr);
	$display("ja:\t\t\t%d", ja);
	$display("link:\t\t\t%d", link);
	$display("memtoReg:\t\t%d", memtoReg); 
	$display("brancha:\t\t%d", brancha);
	
     end  
   
endmodule

