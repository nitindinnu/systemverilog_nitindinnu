module kk01(
);
 int arr1[];
//  int arr2[];
    initial begin
    arr1 = new[25];
    for (int i =0 ;i<25 ;i++ ) begin
        arr1[i]=i*2;
    end
    disp_print(arr1);
    arr1 = new[$size(arr1)*4](arr1);
    for (int i =25 ;i<101 ;i++ ) begin
        arr1[i]=i;
    end
    disp_print(arr1);
    arr1 = new[$size(arr1)/4](arr1);    
    disp_print(arr1);
    end

    function void disp_print(int arr1[]);
        $display("arr = %0p",arr1);
        $display("size =%0d",$size(arr1));
    endfunction
    
endmodule