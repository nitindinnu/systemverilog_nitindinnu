 module for_foreach( 
);
    int array[];
    initial begin
        array='{4,3,6,5,8,79,3,2,5,1,0};
        $display("the values of updated array is %0p",array);

        for(int i=0;i<$size(array);i++)
        begin
           // array.rsort();
             array.sort();
        end
        $display("the forloop iterartion values are %0p",array);

        foreach(array[i])
        array.rsort();
        $display("the foreach iterartion values are %0p",array);
    end
endmodule
