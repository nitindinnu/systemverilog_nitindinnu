module dynamic_array_test(
);
/*create a 32x32 bit memoryusing dynamic array & fill memory with your own data & read then extend it to 32x64 memory .check whether old data is there or not*/
    bit [31:0]dynamicarray[];

    initial begin
        dynamicarray=new[32];
        foreach (dynamicarray[i]) begin
            dynamicarray[i]=$random;
        end
        $display("elements of 32 %p",dynamicarray);
        dynamicarray=new[64](dynamicarray);
        $display("elements of 64 %p",dynamicarray);

    end
endmodule