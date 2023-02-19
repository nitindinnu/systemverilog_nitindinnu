module associate_array(
/*write an sv program using associative array of 8 elements of integer type,travel the array using methods 
and display the result*/
);
    reg[2:0] source[string];
    initial begin
        source = '{"a":0,"b":1,"c":2,"d":3,"e":4,"f":5,"g":6,"h":7,"i":8};
        //as index is string we can write it upto finite as per processor specification either332bit/64bit
        //but the array element is described as reg[2:0] i.e it can store only values upto 0 to 7 
        //going greater than that will be getting default value :0 in reg datatype
        //op : # '{"a":0, "b":1, "c":2, "d":3, "e":4, "f":5, "g":6, "h":7, "i":0 } here i became 0 than prescribed 8
        $display("%p",source);
    end
    
endmodule