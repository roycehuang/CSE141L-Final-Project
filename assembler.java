// Java program to read assembly code from one file
// and write it as machine code into another file
 

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.*;
class assembler {
 
    public static void main(String[] args)
    {

        try {
            FileReader fr = new FileReader("program2assembly.txt");
            BufferedReader br = new BufferedReader(fr);
            FileWriter fw = new FileWriter("program2machine_code.txt");

            String line;
 
            while ((line = br.readLine()) != null) {
                //System.out.println(line);

                String opcode = line.substring(0,3); // end index is exclusive
                String temp;
                // add instruction
       
                if(opcode.equals("add") || opcode.equals("Add")) {
                    fw.write("000");
                    temp = line.substring(3, line.length());
                    temp = temp.replace(" ", "");
                    temp = temp.replace(",", "");
                    fw.write(temp);
                    fw.write("\n");
                }
                else if(opcode.equals("xor") || opcode.equals("Xor")) {
                    fw.write("001");
                    temp = line.substring(3, line.length());
                    temp = temp.replace(" ", "");
                    temp = temp.replace(",", "");
                    fw.write(temp);
                    fw.write("\n");
                }
                // else if(opcode.equals("and") || opcode.equals("And")) {
                else if(opcode.equals("don") || opcode.equals("Don")){ //changed for new don flag
                    fw.write("010");
                    temp = line.substring(3, line.length());
                    temp = temp.replace(" ", "");
                    temp = temp.replace(",", "");
                    fw.write(temp);
                    fw.write("\n");
                }
                
                else if(opcode.equals("lwd") || opcode.equals("Lwd")) {
                    fw.write("011");
                    temp = line.substring(3, line.length());
                    temp = temp.replace(" ", "");
                    temp = temp.replace(",", "");
                    fw.write(temp);
                    fw.write("\n");
                }
                else if(opcode.equals("str") || opcode.equals("Str")) {
                    fw.write("100");
                    temp = line.substring(3, line.length());
                    temp = temp.replace(" ", "");
                    temp = temp.replace(",", "");
                    fw.write(temp);
                    fw.write("\n");
                }
                else if(opcode.equals("lsl") || opcode.equals("Lsl")) {
                    fw.write("101000");
                    temp = line.substring(3, line.length());
                    temp = temp.replace(" ", "");
                    temp = temp.replace(",", "");
                    fw.write(temp);
                    fw.write("\n");
                }
                else if(opcode.equals("rsl") || opcode.equals("Rsl")) {
                    fw.write("101100");
                    temp = line.substring(3, line.length());
                    temp = temp.replace(" ", "");
                    temp = temp.replace(",", "");
                    fw.write(temp);
                    fw.write("\n");
                }
                else if(opcode.equals("rsa") || opcode.equals("Rsa")){
                    fw.write("101110");
                    temp = line.substring(3, line.length());
                    temp = temp.replace(" ", "");
                    temp = temp.replace(",", "");
                    fw.write(temp);
                    fw.write("\n");
                }
                else if(opcode.equals("not") || opcode.equals("Not")) {
                    fw.write("101010");
                    temp = line.substring(3, line.length());
                    temp = temp.replace(" ", "");
                    temp = temp.replace(",", "");
                    fw.write(temp);
                    fw.write("\n");
                }
                else if(opcode.equals("bgt") || opcode.equals("Bgt")) {
                    fw.write("1100");
                    temp = line.substring(3, line.length());
                    temp = temp.replace(" ", "");
                    temp = temp.replace(",", "");
                    fw.write(temp);
                    fw.write("\n");
                }
                else if(opcode.equals("beq") || opcode.equals("Beq"))  {
                    fw.write("1101");
                    temp = line.substring(3, line.length());
                    temp = temp.replace(" ", "");
                    temp = temp.replace(",", "");
                    fw.write(temp);
                    fw.write("\n");
                }
                else if(opcode.equals("mov") || opcode.equals("Mov")) {
                    fw.write("111");
                    temp = line.substring(3, line.length());
                    temp = temp.replace(" ", "");
                    temp = temp.replace(",", "");
                    fw.write(temp);
                    fw.write("\n");
                }
                else {
                    fw.write("ERROR check syntax----------------");
                }
            }
 
            br.close();
            fw.close();
 
            System.out.println(
                "File reading and writing both done");
        }
 
        catch (IOException e) {
            System.out.println(
                "There are some IOException");
        }
    }
}