module RegFile(
  input      Clk,	 // clock
             Wen,    // write enable
  			 Reset,
  input[2:0] Ra,     // read address pointer A
             Rb,     //                      B
  input[7:0] Wdat,   // write data in
  output[7:0]RdatA,	 // read data out A
             RdatB,  // read data out B
			 Addr,
		     WdatD); 

  logic[7:0] Core[8]; // reg file itself (8*8 array)
  

  always_ff @(posedge Clk) begin
    if(Wen) begin
      Core[Ra] = Wdat;
    end
    if(Reset) begin
      Core[0] = 0;
      Core[1] = 0;
      Core[2] = 0;
      Core[3] = 0;
      Core[4] = 0;
      Core[5] = 0;
      Core[6] = 0;
      Core[7] = 0;
  	end
  end
  
  assign RdatA = Core[Ra];
  assign RdatB = Core[Rb];
  assign Addr = RdatB; // Operand register 2 will always hold the address into datamem
  assign WdatD = RdatA;

endmodule