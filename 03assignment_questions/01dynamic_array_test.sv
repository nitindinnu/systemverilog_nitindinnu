module dynamic_array_test(
);
/*create a 32x32 bit memoryusing dynamic array & fill memory with your own data & read then extend it to 32x64 memory .check whether old data is there or not*/
    bit [31:0]dynamicarray[];

    initial begin
        dynamicarray=new[32];
        foreach (dynamicarray[i]) begin
            dynamicarray[i]=$random;
        end
        $display("elements of 32 \ %p \t" ,dynamicarray);
        dynamicarray=new[64](dynamicarray);
        $display("elements of 64 %p",dynamicarray);
/*
# Loading work.dynamic_array_test(fast)

# elements of 32 '{303379748, 3230228097, 2223298057, 2985317987, 112818957, 1189058957, 2999092325, 
2302104082, 15983361, 114806029, 992211318, 512609597, 
1993627629, 1177417612, 2097015289, 3812041926, 3807872197, 3574846122, 1924134885, 
3151131255, 2301810194, 1206705039, 2033215986, 3883308750, 4093672168, 3804909253, 777537884, 3733858493, 2527811629, 
2997298789, 2985255523, 91457290}

# elements of 64 '{303379748, 3230228097, 2223298057, 2985317987, 112818957, 1189058957, 2999092325, 2302104082, 15983361, 114806029,
 992211318, 512609597, 1993627629, 1177417612, 2097015289, 3812041926, 3807872197, 3574846122, 1924134885, 
3151131255, 2301810194, 1206705039, 2033215986, 3883308750, 4093672168, 3804909253, 777537884, 3733858493,
 2527811629, 2997298789, 2985255523, 91457290, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0,0, 0, 0, 0, 0, 0}
*/

    end
endmodule

//  Module: dynamic_array_test
//
module dynamic_array_test_2d(); //! regular dynamic array
    //! dynamic 2d array declaration
    bit [31:0] dynamicarray[][];

    initial begin
        //! memory allocation
        dynamicarray=new[32];
        foreach (dynamicarray[i]) begin
            dynamicarray[i]=new[32];
        end

        //! filling elemnts into 2d arrau 32x32
        foreach (dynamicarray[i,j]) begin
            dynamicarray[i][j]=i+j/6*2  ;
        end

        //! displaying elements in array 32x32
        // $display("elements of 32 \ %p \n",dynamicarray);
        $display("\tdynamic arr 2d of 32x32");
        // foreach (dynamicarray[i,j]) begin
        //     $display("[%0d,%0d] = %0d",i,j, dynamicarray[i][j]);
        // end
        $display("elements of 32 %p",dynamicarray);

        //! extending size of array using copy method
        foreach (dynamicarray[i]) begin
            dynamicarray[i]=new[64];
        end
        $display("-------------------");
        dynamicarray=new[64](dynamicarray);
        // $display("elements of 64 %p",dynamicarray);

        //!filling elemnts into 2d arrau 32x64
        // for(int i=0;i<32;i++)begin
        //     for (int j =0 ;j<64 ;j++ ) begin
        //         dynamicarray[i][j]=i+j/6*2  ;
        //     end
        // end

        //! displaying elements in array 32x64 
        $display("\tdynamic arr 2d of 32x64");
        // foreach (dynamicarray[i,j]) begin
            
        //     $display("[%0d,%0d] = %0d",i,j, dynamicarray[i][j]);
        // end
        $display("elements of 64 %p",dynamicarray);
    end
endmodule

module dynami2d;
    bit [31:0][31:0]d_array[];
     //bit d_array[][];
     initial begin
     d_array=new[32];
       foreach(d_array[i])   
       begin	
       d_array[i] =$random;
       end
        $display("d_aaray = %0p",d_array);
        
        
        $display("**************************");
       d_array=new[64](d_array);   ///copy above ramdom value
       for(int i=32;i<64;i++)begin
            for (int j =31 ;j>=0 ;j-- ) begin
                d_array[i][j]=i+j/6*2  ;
            end
        end
       $display("d_aaray= %0p",d_array);
        // foreach (d_array[i,j]) begin
            
        //     $display("[%0d,%0d] = %0d",i,j, d_array[i][j]);
        // end
       
       end
   endmodule