module associate_array_01(
);
    // int associate_array_01[*];
    int associate_array_01[string]; //a int array with string index
    string associate_array_02[int]; //a string array with int index -which is a default type when you use arrays
    string associate_array_03[string];

    initial begin
        associate_array_01["nitin"]=424;
        associate_array_01["sasi"]=423;
        associate_array_01["phani"]=440;
        associate_array_01[32'hface]=333;
        $display("assoc array one is %0p",associate_array_01);
        associate_array_02 = '{5:"aa",9:"bb",11:"cc"};
        $display("assoc array two is %0p",associate_array_02);
        associate_array_03 ='{"a":"b","c":"9","d":"#"};
        $display("assoc array two is %0p",associate_array_03);
        /*
        # assoc array one is {"nitin":424} {"phani":440} {"sasi":423} {"úÎ":333} 
        # assoc array two is {5:aa} {9:bb} {11:cc} 
        # assoc array two is {"a":b} {"c":9} {"d":#} 
        */
  end
endmodule

module associate_array_methods(
);
    int fruits[string];
    initial begin
        fruits ='{"banana":1,"apple":2,"pineapple":3,"orange":4,"strawberry":5};
        $display("%0p",fruits);
        $display("fruits.size method = %0d",fruits.size());
        $display("fruits.size method = %0d",fruits.num());
        if (fruits.exists("banana"))
        begin
            $display("found %0s",fruits[1]);
        end
        if (fruits.exists("apricots")) begin
            $display("not found");
        end
        begin
            string f;
            if (fruits.first(f)) begin
                $display ("fruits_l0.first [%s] = %0d", f, fruits[f]);
            end
        end
        begin
        string f;
        if (fruits.last (f))
          $display ("fruits_l0.last [%s] = %0d", f, fruits[f]);
        end
        begin
        string f = "orange";
        if (fruits.prev (f))
          $display ("fruits_l0.prev [%s] = %0d", f, fruits[f]);
        end
        begin
        string f = "orange";
        if (fruits.next (f))
          $display ("fruits_l0.next [%s] = %0d", f, fruits[f]);
        end   
    end
endmodule