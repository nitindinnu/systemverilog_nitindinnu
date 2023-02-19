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