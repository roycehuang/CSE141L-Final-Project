module ALU(
  input [2:0] Aluop,
  input [7:0] DatA,
              DatB,
  input [1:0] mode,
  input       SCi,
              Ci,
              odd,
  output logic[7:0] Rslt,
  output logic  SCo,
                Co,
                gt,
  				eq, 
  				clear);

always @* begin
  Rslt = 8'b0;
  clear = 0;
  SCo = 0;
  Co = 0;
  eq = 0;
  gt = 0;
  case(Aluop)
    3'b000: begin 
        {Co,Rslt}  = DatA + DatB + SCi + Ci;   // add
        clear = 1;
        if (DatA > DatB) begin
          gt = 1;
        end else if(DatA == DatB) begin
          eq = 1;
        end else begin
          gt = 0;
          eq = 0;
        end
     
    end
    3'b010: Rslt = 0;
    3'b001: Rslt       = DatA ^ DatB;   // bitwise XOR
    3'b101: begin
      case(mode)
        2'b00: begin // Left Shift Logical
          {SCo,Rslt}  = DatA<<1'b1; // normal left shift, zeros replaced
          /*
          if(!odd) begin
            {SCo,Rslt}  = (DatA<<1'b1) || {7'b0, SCi}; // left shift by 1 and shift in SCi
          end
          else begin
            {SCo,Rslt}  = DatA<<1'b1; // normal left shift, zeros replaced
          end
          */
        end
        2'b10: begin // Right Shift Logical
          Rslt = (DatA >> 1);
          /*
          if(odd) begin
            {Rslt, Co} = (DatA >> 1'b1) || {SCi, 7'b0}; // logical right shift by SCi, replaced with zeros
          end
          else begin
            {Rslt, Co} = (DatA >> 1'b1);
          end
          */
        end
        2'b11: begin // Right Shift Arithmetic
          if(odd) begin
            {Rslt, Co} = (DatA >> 1'b1) || {SCi, 7'b0};
          end
          else begin
            {Rslt, Co} = (DatA >>> 1'b1); // normal arithmetic right shift
          end
        end
        2'b01: Rslt		= ~DatA;        // bitwise NOT
      endcase
    end
    /*
    3'b110: begin
      		//gt = 0;
      		//eq = 0;
    end
    */
    default: Rslt = 0;
  endcase
end


endmodule