/*
!write an svcode for dynamic array and implement all array reduction methods in it
*/
module arr_red_meth(
);
    int signed arr1[];
    initial begin
        arr1=new[10];
        for (int i =0 ;i<10 ;i++ ) begin
           arr1[i]=i*7+5;
        end
        printt(arr1);
        $display("sum is",arr1.sum());
        $display("product is %0d ",arr1.product());
        $display("and of all elements is %0b",arr1.and());
        $display("or of all elements is %0b",arr1.or());
        $display("xor of all elements is %0b",arr1.xor());
        printt(arr1);

    end

    function void printt(int arr1[]);
        $display("arr elements are %0p",arr1);
        $display("arr size is %0d",$size(arr1));
    endfunction
endmodule