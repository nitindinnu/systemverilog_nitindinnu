module packed_array_1D(
);
    //A packed array is used to refer to dimensions declared before the variable name.
    // bit [9:0]dd;

    // initial begin
    //     dd=10'hA2;
    //     foreach (dd[i]) begin
    //         $display("dd [%0b]~[%0d] = %0b",i,i,dd[i]);
    //     end
    //     // $display("%0p",dd1);
    //     $display("%0p",dd2);
    // end
/*
Packed dimensions not allowed on type 'byte'.
  Packed dimensions are only allowed on types resolving to single bit types 
  (reg, logic or bit), packed arrays, packed structures, and packed unions
*/
    bit [9:0]dd;
  	logic [9:0]dd1; //Can't have packed array of integer type.
    reg [9:0]dd2; //

    initial begin
        dd=10'hA2;
      	dd1=10'hA2;
      	dd2=10'hA2;
        foreach (dd[i]) begin
            $display("dd [%0b]~[%0d] = %0b",i,i,dd[i]);
        end
        foreach (dd1[i]) begin
            $display("dd [%0b]~[%0d] = %0b",i,i,dd1[i]);
        end
        foreach (dd2[i]) begin
            $display("dd [%0b]~[%0d] = %0b",i,i,dd2[i]);
        end

        // $display("%0p",dd);
        // $display("%0p",dd1);
        // $display("%0p",dd2);
    end
endmodule

module packed_array_2D(
);
    bit [3:0][7:0] dd; // a MDA of 32bits/4Bytes i.e 4arrays with each sizing 8 bits

    initial begin
        dd=32'hfacecafe;
        foreach (dd[i]) begin
            $display("dd [%0d] = %0b (0x%oh)",i,dd[i],dd[i]);
        end
        /*
        # dd [3] = 11111010 (0x372h)
        # dd [2] = 11001110 (0x316h)
        # dd [1] = 11001010 (0x312h)
        # dd [0] = 11111110 (0x376h)
        */
    end
endmodule

module packed_array_3D(
    // port_list
);
    // bit [3][4][8] dd; // a MDA of 12Bytes/96bits
    bit [2:0][3:0][7:0] dd; // a MDA of 12Bytes/96bits

    initial begin
        dd[0]=32'hface_cafe ; //
        dd[1]= 32'h1234_5678;
        dd[2]= 32'hc0de_fade;
        //to get the packet value
        $display("data in array is 0x%0h",dd);
        //iterate through each segment of MDA and print those value
        foreach (dd[i]) begin
            $display ("dd[%0d] = 0x%0h", i, dd[i]);
            foreach (dd[i][j]) begin
                $display ("dd[%0d][%0d] = 0x%0h", i, j, dd[i][j]);
            end
        end
    end
/*
# Loading work.packed_array_3D(fast)
# data in array is 0xc0defade12345678facecafe
# dd[2] = 0xc0defade
# dd[2][3] = 0xc0
# dd[2][2] = 0xde
# dd[2][1] = 0xfa
# dd[2][0] = 0xde
# dd[1] = 0x12345678
# dd[1][3] = 0x12
# dd[1][2] = 0x34
# dd[1][1] = 0x56
# dd[1][0] = 0x78
# dd[0] = 0xfacecafe
# dd[0][3] = 0xfa
# dd[0][2] = 0xce
# dd[0][1] = 0xca
# dd[0][0] = 0xfe
*/

endmodule