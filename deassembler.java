// Java program to read machine code from one file
// and write it as assembly code into another file
/**
 * UNFINISHED
 */

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.*;

class deassembler {
 
    public static void main(String[] args)
    {

        try {
            FileReader fr = new FileReader("program3machine_code.txt");
            BufferedReader br = new BufferedReader(fr);
            FileWriter fw = new FileWriter("test-asm3.txt");

            String line;
 
            while ((line = br.readLine()) != null) {
                //System.out.println(line);fvc

                String opcode = line.substring(0,3); // end index is exclusive
                //String temp;
                // add instruction
       
                if(opcode.equals("000")) {
                    fw.write("add ");
                    fw.write(line.substring(3, 6));
                    fw.write(", ");
                    fw.write(line.substring(6, line.length()));
                    fw.write("\n");
                }
                else if(opcode.equals("001")) {
                    fw.write("xor ");
                    fw.write(line.substring(3, 6));
                    fw.write(", ");
                    fw.write(line.substring(6, line.length()));
                    fw.write("\n");
                }
                // else if(opcode.equals("and") || opcode.equals("And")) {
                else if(opcode.equals("010")){ //changed for new don flag
                    fw.write("don ");
                    fw.write(line.substring(3, 6));
                    fw.write(", ");
                    fw.write(line.substring(6, line.length()));
                    fw.write("\n");
                }
                
                else if(opcode.equals("011")) {
                    fw.write("lwd ");
                    fw.write(line.substring(3, 6));
                    fw.write(", ");
                    fw.write(line.substring(6, line.length()));
                    fw.write("\n");
                }
                else if(opcode.equals("100")) {
                    fw.write("str ");
                    fw.write(line.substring(3, 6));
                    fw.write(", ");
                    fw.write(line.substring(6, line.length()));
                    fw.write("\n");
                }
                else if(opcode.equals("101")) {
                    String tag = line.substring(3, 6);
                    if (tag.equals("000")){
                        fw.write("lsl ");
                        fw.write(line.substring(6, line.length()));
                        fw.write("\n");
                    } else if (tag.equals("100")) {
                        fw.write("rsl ");
                        fw.write(line.substring(6, line.length()));
                        fw.write("\n");
                    } else if (tag.equals("110")) {
                        fw.write("rsa ");
                        fw.write(line.substring(6, line.length()));
                        fw.write("\n");
                    } else if(tag.equals("010")) {
                        fw.write("not ");
                        fw.write(line.substring(6, line.length()));
                        fw.write("\n");
                    }
                }
                else if(opcode.equals("110")) {
                    char tag = line.charAt(3);
                    if (tag == '0') {
                        fw.write("bgt ");
                        fw.write(line.substring(4, line.length()));
                        fw.write("\n"); 
                    } else if (tag == '1') {
                        fw.write("beq ");
                        fw.write(line.substring(4, line.length()));
                        fw.write("\n");
                    }
                }
                else if(opcode.equals("111")) {
                    fw.write("mov ");
                    fw.write(line.substring(3, 6));
                    fw.write(", ");
                    fw.write(line.substring(6, line.length()));
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