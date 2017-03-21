module mux2to1B32 (input logic C0, input logic [31:0] I1, 
	input logic [31:0] I0, output logic [31:0] O);

   mux4to1B32 mux1(1'b0, C0, 32'b0, 32'b0, I1, I0, O);
	
endmodule