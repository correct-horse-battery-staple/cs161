module instructionMemory(input logic [31:0] A, 
		output logic [31:0] RD);

logic [31:0] instructs [19:0];
initial 
  begin
     
     instructs[0] = 32'b100011_00100_00001_0000000000001100;  // lw r1 <- 99;
     instructs[1] = 32'b100011_00100_00000_0000000000001000;  // lw r0 <- 20;
     instructs[2] = 32'b100000_00001_00000_00010_00000000000;  // add stored in 2
     instructs[3] = 32'b010000_00000_00000_0000000000000010;   // bleu to rorv
     instructs[4] = 32'b100110_00001_00000_00011_00000000000;  // nora (ffffff88) stored in 3
     instructs[5] = 32'b000000_00010_00000_00100_00000000000;  // rolv 0 by 1 stored in 4
     instructs[6] = 32'b000010_00010_00000_00101_00000000000;  // rorv 0 by 1 stored in 5   
     instructs[7] = 32'b000011_00000000000000000000000101;  // jal to rolv store in 7
     instructs[8] = 32'b000000_00000_00000_00000_00000000000; //rolv 0 by *4* stored in 0
  // instructs[9] = 32'b0;

end

assign RD = instructs[A[6:2]];




endmodule



