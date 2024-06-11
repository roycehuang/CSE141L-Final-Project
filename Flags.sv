module Flags(
  input             Clk,
  					SCi,
  					Ci,
  					Res,
  					Gt,
  					Clear,
  output logic      Carry,
					SCarry,
					gtFlag);

  
// Greater than flag??
  
  always_ff @(posedge Clk) begin
    if(Res) begin
      SCarry = 0;
      Carry = 0;
      gtFlag = 0;
    end else if(Clear) begin
      SCarry = 0;
      Carry = 0;
      gtFlag = Gt;
    end else begin
		SCarry <= SCi;
  		Carry <= Ci;
        gtFlag <= Gt;
    end
    
  end

endmodule