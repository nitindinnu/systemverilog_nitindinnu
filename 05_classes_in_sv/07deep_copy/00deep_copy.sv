class class_1;
    int aa,ab;
    string y;
endclass

class class_2;
    int ac,ad;
    string z;
    class_1 nest_class_1;

    function  copy(class_2 p); //!custom method, copy is keyword
        this.ac=p.ac;
        this.ad=p.ad;
        this.z=p.z;

        this.nest_class_1.aa=nest_class_1.aa;
        this.nest_class_1.ab=nest_class_1.ab;
        this.nest_class_1.y=nest_class_1.y;
    endfunction

    function void dispp_class_2(string hh);
        $display("%0s ** aa=[%0d]\t,ab=[%0d]\t,y=[%0s]\t,ac=[%0d]\t,ad=[%0d]\t,z=[%0s]\t",hh, nest_class_1.aa, nest_class_1.ab, nest_class_1.y ,ac,ad,z);
    endfunction
endclass

module deep_coopy( //! code for deep copy
);
    class_2 g2=new(),h2=new();

    initial begin
        //
        g2.nest_class_1=new(); //!seperate memory for nest_class1,ehich can only accessed by g2
        g2.ac=222;
        g2.ad=322;
        g2.z="nitin01";
        g2.dispp_class_2("printing clas_2 g2 handle"); //!here default values of aa,ab,y and updated values of ac,ad,z will be displayed
        g2.nest_class_1.aa=111;
        g2.nest_class_1.ab=114;
        g2.nest_class_1.y="nitin02";
        g2.dispp_class_2("printing clas_2 g2 handle");

        //!
        h2.nest_class_1=new();
        h2.ac=0;
        h2.ad=0;
        h2.z="oo";
        h2.dispp_class_2("printing clas_2 h2 handle"); //!
        h2.nest_class_1.aa=0;
        h2.nest_class_1.ab=0;
        h2.nest_class_1.y="hubble";
        h2.dispp_class_2("printing clas_2 h2 handle");

        //!copying
        h2.copy(g2);
        h2.dispp_class_2("printing h2:a copy of g2");

        //!
        h2.nest_class_1.aa=2500;
        h2.dispp_class_2("displaying h2");
        g2.dispp_class_2("displaying g2");
    end
endmodule