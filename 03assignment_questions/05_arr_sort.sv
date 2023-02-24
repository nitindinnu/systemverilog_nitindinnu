module array_sort_no_builtin_func(
);
    shortint arr[];
    shortint temp;
    initial begin
        arr=new[10];
        foreach (arr[i]) begin
            arr[i]=$random;
        end
        priint(arr);
        $display("printing descending order without inbuilt");
        desc(arr);
        $display("printing asccending order without inbuilt");
        asc(arr);
        //
        foreach (arr[i]) begin
            arr[i]=$random;
        end
        $display("printing asccending order with inbuilt");
        arr.sort();
        priint(arr);
        $display("printing adesccending order with inbuilt");
        arr.rsort();
        priint(arr);

        
    end
    
    function void desc(shortint arr[]);
        for(shortint i=0;i<$size(arr);i=i+1) begin
            for(shortint j=0;j<$size(arr);j=j+1) begin
                if(arr[i]>arr[j])// descending in sv but asc in v
                begin
                    temp=arr[i];
                    arr[i]=arr[j];
                    arr[j]=temp;
                end
                // $display(i,j);
            end
        end
        priint(arr);
    endfunction

    function void asc(shortint arr[]);
        for(shortint i=0;i<$size(arr);i=i+1) begin
            for(shortint j=0;j<$size(arr);j=j+1) begin
                if(arr[i]<arr[j])// ascending in sv but desc in v
                begin
                    temp=arr[i];
                    arr[i]=arr[j];
                    arr[j]=temp;
                end
                // $display(i,j);
            end
        end
        priint(arr);
    endfunction

    function void priint(shortint arr[]);
        $display("arr elem are %0p",arr);
        // $display("arr elem size is %0d",$size);
    endfunction
/*op:
# Loading work.array_sort_no_builtin_func(fast)
# arr elem are 13604 24193 -10743 22115 31501 -26227 -31643 21010 -7423 -13043
# printing descending order without inbuilt
# arr elem are 31501 24193 22115 21010 13604 -7423 -10743 -13043 -26227 -31643
# printing asccending order without inbuilt
# arr elem are -31643 -26227 -13043 -10743 -7423 13604 21010 22115 24193 31501
# printing asccending order with inbuilt
# arr elem are -31547 -12995 -11606 -5639 -3722 -2164 -2075 9414 22509 29303
# printing adesccending order with inbuilt
# arr elem are 29303 22509 9414 -2075 -2164 -3722 -5639 -11606 -12995 -31547*/
endmodule
/*
for (int i=0,j=i+1 ;i<$size(arr) ;i++,j++ ) begin
            if (arr[i]>arr[j]) begin
                temp=arr[i];
                arr[i]=arr[j];
                arr[j]=temp;
                $display("%0d %0d",i,j);
            end
        end
        ------------
function automatic swap(shortint i,shortint j);
        temp = i;
        i = j;
        j = temp;
    endfunction
*/