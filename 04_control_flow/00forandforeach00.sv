 module forandforeach( 
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

        foreach(array[i]) array.rsort();
        $display("the foreach iterartion values are %0p",array);
    end
endmodule
/*
# the values of updated array is 4 3 6 5 8 79 3 2 5 1 0
# the forloop iterartion values are 0 1 2 3 3 4 5 5 6 8 79
# the foreach iterartion values are 79 8 6 5 5 4 3 3 2 1 0
*/

module foreach_2d(
);
    // byte unsigned arr[7][3];
    byte signed arr[7][3]; //=~ byte arr[7][3];
    initial begin
        foreach (arr[i,j]) begin
            $display("arr elements are a[%0d][%0d]=%0d",i,j,arr[i][j]);
        end

        foreach (arr[i,j]) begin
            arr[i][j]=$random;
        end

        //or

        // for (int i=0  ;i<7 ;i++ ) begin
        //     for (int j=0  ;j<3 ;j++ ) begin
        //         arr[i][j]=$random;
        //     end
        // end
            

        $display("-----------------------------------");

        foreach (arr[i,j]) begin
            $display("arr elements are using percentile d foreach loop : a[%0d][%0d]=%0d",i,j,arr[i][j]);
        end

        $display("arr elements are using percentile p without foreach loop : %0p",arr);

    end
endmodule
