module signed_datatypes( //by default not declaring signed or unsigned will be treated as unsigned
//By default, integer variables are signed in nature and hence can hold both positive and negative values
);
    shortint var1; //16 bit
    int var2;   //32bit
    longint var3; //64bit

    initial begin
        $display ("Sizes var1=%0d var2=%0d var3=%0d", $bits(var1), $bits(var2), $bits(var3));
        // Assign the maximum value for each of the variables
        // MSB of each variable represents the sign bit and is set to 0
        // Rest of the bit positions are filled with 1 and hence you
        // get the maximum value that these variables can hold
        #1 var1 = 'h7FFF;                  
           var2 = 'h7FFF_FFFF;           	
           var3 = 'h7FFF_FFFF_FFFF_FFFF;
           
        // When added a 1, the sign changes to negative because this is a signed variable
        #1 var1 += 1;   // Value becomes 'h8000 => which is a rollover from + sign to - sign
        var2 += 1;   // Value becomes 'h8000_0000 => which is a rollover from + sign to - sign
        var3 += 1;
    end
    
    // Start a monitor to print out values of each variables as they change
    initial $monitor ("var1=%0d var2=%0d var3=%0d", var1, var2, var3);
endmodule

module unsigned_datatypes(
);
    // In this case, we are going to make it unsigned which means
  // that MSB no longer holds the sign information and hence these
  // variables can only store positive values
  shortint unsigned     var_a;      
  int      unsigned		var_b;
  longint  unsigned 	var_c;
  
  initial begin
    // Print initial values of the integer variables
    $display ("Sizes var_a=%0d var_b=%0d var_c=%0d", $bits(var_a), $bits(var_b), $bits(var_c));
    
    // Assign the maximum value for each of the variables
    #1 var_a = 'hFFFF;                  
       var_b = 'hFFFF_FFFF;           	
       var_c = 'hFFFF_FFFF_FFFF_FFFF;   
    
    // When added a 1, value rolls over to 0
    #1 var_a += 1;   // Value becomes 'h0
       var_b += 1;   // Value becomes 'h0
       var_c += 1;
  end
  
  // Start a monitor to print out values of each variables as they change
  initial
    $monitor ("var_a=%0d var_b=%0d var_c=%0d", var_a, var_b, var_c);
endmodule

module byte_check;
  byte    			s_byte;   // By default byte is signed
  byte unsigned  	u_byte;   // Byte is set to unsigned
  
  initial begin
    $display ("Size s_byte=%0d, u_byte=%0d", $bits(s_byte), $bits(u_byte));
    
    // Assign the "assumed" maximum value to both variables
    #1 s_byte = 'h7F;
       u_byte = 'h7F;
    
    // Increment by 1, and see that s_byte rolled over to negative because
    // byte is signed by default. u_byte keeps increasing because it is 
    // unsigned and can go upto 255
    #1 s_byte += 1;
       u_byte += 1;
    
    // Assign 255 (8'hFF) to u_byte -> this is the max value it can hold
    #1 u_byte = 'hFF;
    
    // Add 1 and see that it rolls over to 0
    #1 u_byte += 1;    
  end
  
  initial begin
    $monitor ("[%0t ns] s_byte=%0d u_byte=%0d", $time, s_byte, u_byte);
  end
endmodule


  