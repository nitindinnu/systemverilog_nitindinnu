class class_1; //! first class
    int aa,ab;
endclass

class class_2; //! second class
    int ac,ad;
    class_1 nest_class_1; //!created handle for first class
endclass

module shallow_cp_nested(
); 

    class_2 na=new(); //! creating memory for first class,but here we dont have first class
    class_2 nb=new();//!creating two handles for second class
        
    initial begin
        na.nest_class_1=new();
        na.ac=15;
        na.ad=25;
        na.nest_class_1.aa=10;
        na.nest_class_1.ab=55;
        displayy1("updating aa,bb,cc,dd");
        copyy();
        displayy1("copying na handle of class 2 to nb handle using a function and printing");
        nb.nest_class_1.aa=33;
        nb.nest_class_1.ab=26;
        displayy2("printing nb.nest_class_1");
        displayy1("printing na.nest_class_1");
    end
    
    task displayy1(string a);
        $display("----------%0s------------------",a);
        $display("ac =%0d",na.ac);
        $display("ad =%0d",na.ad);
        $display("aa =%0d",na.nest_class_1.aa);
        $display("ab =%0d",na.nest_class_1.ab);
        $display("----------%0s------------------",a);
    endtask 

    task displayy2(string a);
        $display("----------%0s------------------",a);
        $display("ac =%0d",nb.ac);
        $display("ad =%0d",nb.ad);
        $display("aa =%0d",nb.nest_class_1.aa);
        $display("ab =%0d",nb.nest_class_1.ab);
        $display("----------%0s------------------",a);
    endtask 

    function void copyy();
        nb.nest_class_1=new();
        nb.ac=na.ac;
        nb.ad=na.ad;
        nb.nest_class_1=na.nest_class_1;
        //! or
        // nb = new na;
    endfunction
endmodule