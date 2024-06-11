module ProgCtr(
  input             Clk,
                    Reset,
					Jen,
  input       [11:0] Jump,
  output logic[11:0] PC);

  always_ff @(posedge Clk)
    if(Reset) PC <= 1'b0;
	else if(Jen) PC <= Jump;
	else      PC <= PC + 6'd1;

endmodule