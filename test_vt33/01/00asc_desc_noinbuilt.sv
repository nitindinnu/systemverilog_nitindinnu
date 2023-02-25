/*
!write an svcode for an array in ascending and descending order without usng any inbuilt methodds
*/
module asc_dsc(
);
    bit[3:0] arr[];
    bit[3:0] temp;
    initial begin
        arr=new[10];
        for (int i =0 ;i<$size(arr) ;i++ ) begin
            arr[i]=$random;
        end
        printt(arr);
        $display("descending order");
        dsc(arr);
        $display("ascending order");
        asc(arr);
    end
    
    function void dsc(bit[3:0] arr[]);
        for (int i =0 ;i<$size(arr) ;i++ ) begin
           for (int j =0 ;j<$size(arr) ;j++ ) begin
                if (arr[i]>arr[j]) begin
                    temp=arr[i];
                    arr[i]=arr[j];
                    arr[j]=temp;
                end
           end 
        end
        printt(arr);
    endfunction

    function void asc(bit[3:0] arr[]);
        for (int i =0 ;i<$size(arr) ;i++ ) begin
           for (int j =0 ;j<$size(arr) ;j++ ) begin
                if (arr[i]<arr[j]) begin
                    temp=arr[i];
                    arr[i]=arr[j];
                    arr[j]=temp;
                end
           end 
        end
        printt(arr);
    endfunction

    function void printt(bit[3:0] arr[]);
        $display("arr elements are %0p",arr);
        $display("arr size is %0d",$size(arr));
    endfunction
endmodule