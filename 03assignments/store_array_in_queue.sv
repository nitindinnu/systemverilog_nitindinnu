module store_array_in_queue(
);
    /*Ex : `arr[8] = '{5,6,8,3,4,9,7,2}'` is the input sort & store in the queue `Q1[$]` and display that queue*/
    int arr[8] ='{5,6,8,3,4,9,7,2};
    int q1[$:7];
    initial begin
        $display("%p",arr);
        arr.sort();
        $display("arr vlues after sorting %p",arr); //'{2, 3, 4, 5, 6, 7, 8, 9}
        // q1.insert(arr[0:$]);
        foreach (arr[i]) begin
            // q1.push_front(arr[i]);{9, 8, 7, 6, 5, 4, 3, 2}
            q1.push_back(arr[i]);//{2, 3, 4, 5, 6, 7, 8, 9}
        end
        // q1.push_back(arr);//* Error: store_array_in_queue.sv(15): Bit stream casting is only allowed on same size data
        $display("queue values %p",q1);

        /*
        
        */
    end
endmodule


module store_array__in_queue_02(
    
);
    int array[];
    int ram[$]; 
    initial begin
        array='{1,5,6,2,9,4,7,10,8,3,0};
    $display("the updated value is %0p",array);

    array.sort();
    $display("the sorting values of array %0p",array);

    for(int i=0;i<<$size(array);i++)
    begin
        ram.push_back(array[i]);
    end
    $display("the array elemnets are stored in qu_back %0p",ram);

    for(int i=0;i<$size(array);i++)begin
        ram.push_back(array[i]);
    end
    $display("the array element are stored in qu_front %0p ",ram);
    end
endmodule