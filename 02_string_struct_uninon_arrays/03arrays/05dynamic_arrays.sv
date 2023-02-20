module dyanamic_array1(
);
    int dyn_array[];
    initial begin
        dyn_array=new[5];
        $display("%p",dyn_array);
        dyn_array='{418,421,423,424,440};
        $display("%p",dyn_array);
    end
endmodule

module dynamicarray_methods(
);
    string names[];
    initial begin
        names=new[5];
        $display("%p",names);
        names={"sr","nv","sha","nit","pha"}; //no tick written before flower bracket
        $display("%p",names);
        $display("names.size=%0d",names.size());
        names='{"sr","nv","sha","nit","pha"}; //tick written before flower bracket
        $display("%p",names);
        $display("names.size=%0d",names.size());
    end
    initial begin
        names= '{"sr","nv","sha","nit","pha","hk","bal"}; //checking dynamic nature
        $display("%p",names);
        $display("names.size=%0d",names.size());
        names.delete();
        $display("%p",names);
        $display("names.size=%0d",names.size());
    end
/*
# Loading work.dynamicarray_methods(fast)
# '{"", "", "", "", ""}
# '{"sr", "nv", "sha", "nit", "pha"}
# names.size=5
# '{"sr", "nv", "sha", "nit", "pha"}
# names.size=5
# '{"sr", "nv", "sha", "nit", "pha", "hk", "bal"}
# names.size=7
# '{}
# names.size=0
*/
endmodule

module dynamic_array_copymethod(
);
    int d[];
    int copyy[];

    initial begin
        d=new[5];
        d='{1,2,3,4,5};
        $display("contents of d are = %0p",d);
        copyy=d;     
        $display("contents of copyy copied from d are %0p",copyy);
        copyy= new[copyy.size + 1](copyy); // grow size by 1 and copy existing contents
        copyy[d.size()]=7; // assign value 7 to newly added index 5
        $display("new copyy contents are =%0p",copyy);  
        $display("d.size = %0d , copyy.size() = %0d",d.size(),copyy.size());      
/*
# Loading work.dynamic_array_copymethod(fast)
# contents of d are = 1 2 3 4 5
# contents of copyy copied from d are 1 2 3 4 5
# new copyy contents are =1 2 3 4 5 7
# d.size = 5 , copyy.size() = 6
*/
    end
endmodule