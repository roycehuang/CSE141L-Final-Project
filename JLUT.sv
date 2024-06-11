module JLUT(
  input[4:0] Jptr,
  output logic[11:0] Jump);

  always_comb case(Jptr)
	0: Jump = 'd74;
	1: Jump = 'd80;
	2: Jump = 'd10;
	3: Jump = 'd8; 
	4: Jump = 'd57;
	5: Jump = 'd81;
	6: Jump = 'd36; 
	7: Jump = 'd73; 
	8: Jump = 'd111; 
	9: Jump = 'd135; 
	10: Jump = 'd9; 
	11: Jump = 'd2; 
	12: Jump = 'd44; 
	13: Jump = 'd53; 
	14: Jump = 'd79; 
	15: Jump = 'd103; 
	16: Jump = 'd130; 
	default: Jump = 0;
  endcase

endmodule