module ImmToRegMux(
  input[7:0]  in1, 
  			  in2, 
  input       select,
  output logic[7:0] out);

// assign one of the inputs to the output based upon select line input
  
assign out = select ? in2 : in1;
  
endmodule