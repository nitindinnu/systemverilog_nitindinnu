module static_array(
);
    bit [7:0]arr01; // a vector or 1d packed array


    initial begin
        arr01 = 8'hA2;

        for (int i =0 ;i<$size(arr01) ;i++ ) begin
        $display("arr01[%0d] = %0d",i,arr01[i]);
        end 
        /*op:lsb 0 to msb 7 by using for loop
        # arr01[0] = 0
        # arr01[1] = 1
        # arr01[2] = 0
        # arr01[3] = 0
        # arr01[4] = 0
        # arr01[5] = 1
        # arr01[6] = 0
        # arr01[7] = 1 */

        foreach (arr01[i]) begin
            $display("arr01[%0d] = %0d",i,arr01[i]);
        end
        /* using for each loop 7th index is shown first and goes upto 0th index
        # arr01[7] = 1
        # arr01[6] = 0
        # arr01[5] = 1
        # arr01[4] = 0
        # arr01[3] = 0
        # arr01[2] = 0
        # arr01[1] = 1
        # arr01[0] = 0
        */
    end

    
endmodule