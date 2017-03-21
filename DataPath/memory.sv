module memory(input logic [31:0] addr, 
		output logic [31:0] read,
		  input logic [31:0] writeData,
		  input logic clk, writeEnable);
   
logic [31:0] mem [6:0];

initial 
begin
   mem[0] = 32'b100011_00100_00001_0000000000101100;  // lw r1 <- 99;
   mem[1] = 32'b100011_00100_00000_0000000000101000;  // lw r0 <- 20;
   mem[2] = 32'b100000_00001_00000_00010_00000000000;  // add stored in 2
   //mem[3] = 32'b010000_00000_00000_0000000000000010;   // bleu to rorv
   mem[3] = 32'b100110_00001_00000_00011_00000000000;  // nora (ffffff88) stored in 3
   mem[4] = 32'b000000_00010_00000_00100_00000000000;  // rolv 0 by 1 stored in 4
   mem[5] = 32'b000010_00010_00000_00101_00000000000;  // rorv 0 by 1 stored in 5   
   mem[6] = 32'b000011_00000000000000000000000101;  // jal to rolv store in 7
   mem[7] = 0;
   mem[8] = 3;
   mem[9] = 16;
   mem[10] = 20;
   mem[11] = 99;
   mem[12] = 99;
   mem[13] = 0;
end

assign read = mem[addr[6:2]];

always @(posedge clk)
  if (writeEnable)
    begin
       $display("Writing address %d with %d", addr,writeData);
       
    mem[addr[31:2]] <= writeData;
    end

endmodule