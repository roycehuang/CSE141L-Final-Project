module Top(
  input    Clk,
		       Reset,
  output logic Done);

  wire[11:0]  Jump, // 12 bit for absolute jumping address
	          PC; // 12 bit program counter
  wire[2:0] Aluop, // 3 bit ALU OpCode
            Ra, // 3 bit register address (8 total registers), Operand Register 1 == Destination Register
			Rb; // 3 bit register address (8 total registers), Operand Register 2
             // 3 bit immediate value for move
  wire[1:0] mode; // 2 bit mode for shifts
  wire[4:0] Jptr; // 5 bit pointer into lookup table for total of 32 values
  wire[8:0] mach_code; // 9 bit machine code
  wire[7:0] DatA,	     // ALU data in (8 bit datapath)
            DatB,
            Rslt,		 // ALU data out
            RdatA,		 // RF data out
            RdatB,
            WdatR,		 // RF data in
            WdatD,		 // DM data in
            Rdat,		 // DM data out
            Addr,		 // DM address
  			Imm;
  wire      Jen,		 // PC jump enable
            Co,      //carry out
            Ci,     //carry in
			SCo,      // ALU shift
  			SCi,		 // ALU shift
			WenR,		 // RF write enable
			WenD,		 // DM write enable
            ImmToReg,
            MemToReg,
            Load,
            Store,
            gt,
            eq,
            bmode,
  			clear;
  logic		odd,
  			SCarry,
  			Carry,
  			gtFlag,
  			eqFlag;

//assign SCi = SCo;
//assign Ci = Co;
  
always_ff @(posedge Clk) begin
  gtFlag <= gt;
  eqFlag <= eq;
  Carry <= Co;
  SCarry <= SCo;
end
  
/*
Flags F1(
  .Clk,
  .SCi(SCo),
  .Ci(Co),
  .Gt(gt),
  .Eq(eq),
  .Res(Reset),
  .Clear(clear),
  .SCarry,
  .Carry,
  .gtFlag,
  .eqFlag
);
*/

ImmToRegMux Mux1(
  .in1(DatA),
  .in2(Imm),
  .select(ImmToReg),
  .out(WdatR)
);
  
MemToRegMux Mux2(
  .in1(Rslt),
  .in2(Rdat),
  .select(MemToReg),
  .out(DatA)
);

JLUT JL1(
  .Jptr,
  .Jump
  );

ProgCtr PC1(
  .Clk,
  .Reset,
  .Jen,
  .Jump,
  .PC);

InstROM IR1(
  .PC,
  .mach_code);

Ctrl C1(
  .mach_code,
  .Aluop,
  .mode,
  .bmode,
  .Jptr,
  .gt(gtFlag),
  .eq(eqFlag),
  .Ra,
  .Rb,
  .Imm,
  .Done,
  .WenR,
  .WenD,
  .Jen,
  .ImmToReg,
  .MemToReg,
  .Load,
  .Store);

RegFile RF1(
  .Clk,
  .Wen(WenR),
  .Ra,
  .Rb,
  .Wdat(WdatR),
  .RdatA,
  .RdatB,
  .Addr,
  .WdatD,
  .Reset
);

ALU A1(
  .Aluop,
  .mode,
  .DatA(RdatA),
  .DatB(RdatB),
  .Rslt,
  .SCo,
  .SCi(SCarry),
  .Co,
  .Ci(Carry),
  .odd,
  .gt,
  .eq,
  .clear);

DMem DM1(
  .Clk,
  .Wen (WenD),
  .WDat(WdatD),
  .Addr,
  .Rdat);

always_comb begin
//  if(Load) begin
    if (Addr[0]) begin
      odd = 1;
    end
    else begin
      odd = 0;
    end
//  end
end

endmodule