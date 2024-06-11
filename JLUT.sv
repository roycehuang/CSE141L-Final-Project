module JLUT(
  input[4:0] Jptr,
  output logic[11:0] Jump);

  always_comb case(Jptr)
	0: Jump = 'd74;
	1: Jump = 'd80;
	2: Jump = 'd10;
	3: Jump = 'd8; 
	default: Jump = 0;
  endcase

endmodule