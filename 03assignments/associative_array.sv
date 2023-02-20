module associate_array(
/*write an sv program using associative array of 8 elements of integer type,travel the array using methods 
and display the result*/
);
    reg[2:0] source[string];
    string index;
    initial begin
        source = '{"a":0,"b":1,"c":2,"d":3,"e":4,"f":5,"g":6,"h":7,"i":8};
        //as index is string we can write it upto finite as per processor specification either332bit/64bit
        //but the array element is described as reg[2:0] i.e it can store only values upto 0 to 7 
        //going greater than that will be getting default value :0 in reg datatype
        //op : # '{"a":0, "b":1, "c":2, "d":3, "e":4, "f":5, "g":6, "h":7, "i":0 } here i became 0 than prescribed 8
        $display("%p",source);
        //methods
        // $display("third elemnt of %0s is %0d",source[],source["c"]);
        index = "d";
        if(source.exists(index)) //exists method
        $display("%0p",index,source[index]);

        index = "i";
        if (source.last(index)) begin //last method
            $display("%0p",index,source[index]);
        end

        index = "i";
        if (source.prev(index)) begin //previous method
            $display("%0p",index,source[index]);
        end

        index = "b";
        if (source.next(index)) begin //next method
            $display("%0p",index,source[index]);
        end

        index = "b";
        source.delete(index); //delete method
        $display("%0p",source);
            // $display("%0p",index,source[index]); //use this and check


/*
# Loading work.associate_array(fast)
# '{"a":0, "b":1, "c":2, "d":3, "e":4, "f":5, "g":6, "h":7, "i":0 }
# d3
# i0
# h7
# c2
# {"a":0} {"c":2} {"d":3} {"e":4} {"f":5} {"g":6} {"h":7} {"i":0} 
*/
        
        



    end
    
endmodule

module associative_02(
    
 );
      //string array [string];
      int array [int];    //wild card entry
      initial begin
        array={0:1,1:2,2:3,5:9,19:51};
     // array='{"i20":"maruthi","kia":"collector","shift":"suzuki","ertiga":"vdi"};
   
     // array=f;
        $display("updated values =%0p",array);
      // array.num();
       $display("the array element are %0d",array.size());
        $display("the array element are %0d",array.num());

       /* if(array.exists(5))
        $display("the index is present  element are %0p",array);

        else begin
            $display("the 2 is not there");
        end*/
    begin
        int f;
          // string f;
        if(array.last(f))
        $display("the last element is %0d",f,array[f]);
        else  begin
            $display("the last element is not there");
    
        end
        begin
        int f=5;
        if(array.exists(5))
        $display("the index is present  element are %0p ",f,array[f]);

        else begin
            $display("the 2 is not there");
        end
        end
       
         if(array.prev(f))
        $display("the prev element is %0p",f,array[f]);
        else  begin
            $display("the prev element is not there");
    
        end
        array.delete(19);
        $display("delete the element %0p",array);
        end

        
      end
         
 endmodule