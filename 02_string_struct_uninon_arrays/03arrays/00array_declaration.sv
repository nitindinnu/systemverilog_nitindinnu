module array_example_01(

);
    //initializing an array
    int arr01[6]; //fixed size compact 1d array
    int arr02[0:5]; //fixed size verbose 1d array with litte endian
    int arr03[2:0][3:0] ;//fixed size multi-dimensional array
    int arr04[3][4]; // compact declaration with little endian

    //updation
    initial begin
        arr01[5]=18;
        arr02={1,2,3,4,5,6};//if elements give less than 6 ,then so must give all elemnts in unpacked array
        //--->Illegal unpacked array concatenation. The number of elements (4) doesn't match with the type's width (6).

        foreach (arr01[i]) begin
            $display("element of arr02 using for each %0d",arr01[i]);
        end

        $display("element of arr02 using percentile p = %0p",arr02);
        $display("element of arr01 using percentile p = %0p",arr01);

        
    end
endmodule