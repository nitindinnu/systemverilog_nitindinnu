class transaction_06;
    int array1[]; // array1 manipulation 
    int array2[];//array1 reduction
    task disply(string ss);
        $display("values of array1 are = %0s: [%0p] ",ss,array1);
    endtask
    task disply_arr2(string ss,int z);
        $display("values of array1 are = %0s: [%0d] ",ss,z);
    endtask
endclass

module nitin();
    int z;
    transaction_06 arraymanipulation = new();
    initial begin
        //! ORDERING
        arraymanipulation.array1=new[5];
        arraymanipulation.array1='{4,3,5,7,6};
        arraymanipulation.disply("normal array");
        arraymanipulation.array1.reverse();
        arraymanipulation.disply("reverse");
        arraymanipulation.array1.sort();
        arraymanipulation.disply("sort");
        arraymanipulation.array1.rsort();
        arraymanipulation.disply("reverse_sort");
        arraymanipulation.array1.shuffle();
        arraymanipulation.disply("shuffle");
        //! reduction
        arraymanipulation.array2=new[5];
        arraymanipulation.array2='{2,2,2,2,2};
        // z=arraymanipulation.array2.sum();
        // $display(z);
        $display(arraymanipulation.array2);
        z=arraymanipulation.array2.sum();
        arraymanipulation.disply_arr2("sum",z);
        z=arraymanipulation.array2.product();
        arraymanipulation.disply_arr2("product",z);
        z=arraymanipulation.array2.or();
        arraymanipulation.disply_arr2("or",z);
        z=arraymanipulation.array2.and();
        arraymanipulation.disply_arr2("and",z);
        z=arraymanipulation.array2.xor();
        arraymanipulation.disply_arr2("xor",z);
    end
endmodule
//! only we can write class followed by module
//! if we write module followed by class throwing error
