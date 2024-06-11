module Ctrl(
  input        [8:0] mach_code,
  input				 gt,
				 	 eq,
  output logic [2:0] Aluop,
  output logic [1:0] mode,
  output logic		 bmode,
  output logic [4:0] Jptr,
  output logic [2:0] Ra,
			         Rb,
  output logic [7:0] Imm,
  output logic       Done,
  					 WenR, // RF write enable
					 WenD, // DM write enable
  					 Jen, // Jump enable
  					 ImmToReg, // 1: write immediate to reg, 0: write datamem value/ALU output to reg
  					 MemToReg, // 1: write datamem value to reg, 0: write ALU output to reg
  					 Load,
  					 Store);
	
	
   always @* begin
     Aluop = mach_code[8:6];		// ALU op code
    
   case(Aluop)
     3'b000: begin
       		 Ra = mach_code[5:3];
             Rb = mach_code[2:0];
     		 WenR = 1'b1;
     		 WenD = 1'b0;
     		 Jen = 1'b0;
     		 ImmToReg = 1'b0;
     		 MemToReg = 1'b0;
			 Load = 1'b0;
			 Store = 1'b0;
     end
	 3'b001: begin // bitwise xor
       		 Ra = mach_code[5:3];
     		 Rb = mach_code[2:0];
     		 WenR = 1'b1;
     		 WenD = 1'b0;
     		 Jen = 1'b0;
     		 ImmToReg = 1'b0;
     		 MemToReg = 1'b0;
			 Load = 1'b0;
			 Store = 1'b0;
     end
     3'b010: begin // DONE
       		 // Reset everything for next test
       		 WenR = 1'b0;
       		 WenD = 1'b0;
     		 Jen = 1'b0;
       		 if(mach_code[0]) Done = 1'b0;
             else Done = 1'b1;
       		 /*
       		 Ra = mach_code[5:3];
     		 Rb = mach_code[8:6];
     		 WenR = 1'b1;
     		 WenD = 1'b0;
     		 Jen = 1'b0;
     		 ImmToReg = 1'b0;
     		 MemToReg = 1'b0;
			 Load = 1'b0;
			 Store = 1'b0;
             */
     end
     3'b011: begin
       		 Ra = mach_code[5:3]; // load
     		 Rb = mach_code[2:0];
     		 WenR = 1'b1;
     		 WenD = 1'b0;
     		 Jen = 1'b0;
     		 ImmToReg = 1'b0;
     		 MemToReg = 1'b1;
      		 Load = 1'b1;
			 Store = 1'b0;
     end
     3'b100: begin
       		 Ra = mach_code[5:3];
     		 Rb = mach_code[2:0];
			 WenR = 1'b0;
			 WenD = 1'b1;
			 Jen = 1'b0;
			 ImmToReg = 1'b0; // default to 0
			 MemToReg = 1'b0; // default to 0
			 Load = 1'b0;
			 Store = 1'b1;
     end
	 3'b101: begin
       		 mode = mach_code[5:4];
	 		 Ra = mach_code[2:0];
	 		 Rb = mach_code[2:0];
			 WenR = 1'b1;
			 WenD = 1'b0;
			 Jen = 1'b0;
			 ImmToReg = 1'b0;
			 MemToReg = 1'b0;
			 Load = 1'b0;
			 Store = 1'b0;
     end
	 3'b110: begin
             bmode = mach_code[5];
             Jptr = mach_code[4:0];
	 		 Ra = 3'b000;
	 		 Rb = 3'b000;
			 WenR = 1'b0;
			 WenD = 1'b0;
			 case(bmode)
			 	1'b0: begin //greater than
					if(gt) begin
				    	Jen = 1'b1;
					end
					else begin
						Jen = 1'b0;
					end
                end
				1'b1: begin //equal to
					if(eq) begin
						Jen = 1'b1;
					end
				    else begin
						Jen = 1'b0;
					end
                end
			 endcase
			 ImmToReg = 1'b0; // default to 0
			 MemToReg = 1'b0; // default to 0
			 Load = 1'b0;
			 Store = 1'b0;
     end
	 3'b111: begin
       		 Ra = mach_code[5:3]; //mov function
             Rb = mach_code[2:0];
			 Imm = mach_code[2:0];
			 WenR = 1'b1; //0?
     		 WenD = 1'b0;
     		 Jen = 1'b0;
     		 ImmToReg = 1'b1;
     		 MemToReg = 1'b0; // default to 0
			 Load = 1'b0;
			 Store = 1'b0;
     end
   endcase
  end

endmodule