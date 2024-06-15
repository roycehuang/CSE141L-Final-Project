# CSE141L-Final-Project
## May Chenh and Royce Huang
graded by Janav Kati - A

changes to testbench files:
1) To load machine code instructions into InstructionRom, add the following line to their corresponding testbench:
```
$readmemb("program1machine_code.txt",D1.IR1.Core);
$readmemb("program2machine_code.txt",D1.IR1.Core);
$readmemb("program3machine_code.txt",D1.IR1.Core);
```
2) replace DUT with Top (see #6)
3) repace dm with DM1 ex: D1.DM1.core[64] (see #7)
4) Make sure all of the cores for datamem are lowercase (see #7)
5) Make sure all of the cores for register file are uppercase
6) Replaced beginning connections to be 
```
  Top D1(.Clk  (clk  ),
		 .Reset(start),
		 .Done (done )); 
```
7) For program 3,
Preload datamem results (index 64-127) with 0 to initialize
```
for(int index=64; index <= 127; index++) begin
    D1.DM1.core[index] = 0;
end
```
NOTE: Our implementation of program 3 works by adding A to itself B times
- Takes quite a while to run
- Use simpletest.txt instead of given test files to see that it's working for $\text{pos}*\text{pos}$, $\text{neg}*\text{neg}$, $\text{pos}*\text{neg}$, $\text{neg}*\text{pos}$ and relatively big numbers

### Program 1: 
Closest and Farthest Hamming Pairs 

### Program 2:
Closest and Farthest Arithmetic Pairs

### Program 3:
Double-precision (16x16 bits = 32-bit product) Two's Complement Multiplication
