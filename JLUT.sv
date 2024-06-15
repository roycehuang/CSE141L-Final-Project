module JLUT(
  input[4:0] Jptr,
  output logic[11:0] Jump);

  always_comb case(Jptr)
	0: Jump = 'd77;
	1: Jump = 'd83;
	2: Jump = 'd10;
	3: Jump = 'd8; 
    
    4: Jump = 'd7;
    5: Jump = 'd9;
    6: Jump = 'd64;
    7: Jump = 'd76;
    8: Jump = 'd87;
    9: Jump = 'd101;
    10: Jump = 'd112;
    11: Jump = 'd114;
    12: Jump = 'd135;
    13: Jump = 'd139;
    14: Jump = 'd150;
    15: Jump = 'd186;
    16: Jump = 'd173;
    
    17: Jump = 'd2;
    18: Jump = 'd27;
    19: Jump = 'd39;
    20: Jump = 'd66;
    21: Jump = 'd83;
    22: Jump = 'd207;
    23: Jump = 'd238;
    24: Jump = 'd316;
    
	default: Jump = 0;
  endcase

endmodule