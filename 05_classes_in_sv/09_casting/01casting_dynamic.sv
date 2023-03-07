class class_01;
    bit[3:0]addr;
    function dispp(string a);
        $display("[%0s] Addr = %0d",a,addr);
    endfunction
endclass

class class_02 extends class_01;
    bit [3:0] data;
    function dispp(string a);
        super.dispp(a); 
        //at line 11 giving priority to class from which this sub-class was extended from super-class
        //i.e class_01 dispp method called displays addr 
        $display("[%0s] Data = %0d",a,data);
        //at line 13 a display is used which displays data
    endfunction
endclass

module cast_dynamic(
);
    class_01 ab =new();
    class_02 bc =new();
    class_02 bc1 =new();

    initial begin
        bc.addr=11;
        bc.data=05;
        legal_assignment_parent_to_child_class();
        illegal_assignment_parent_to_child_class();
    end

    function illegal_assignment_parent_to_child_class();
        // bc=ab;  
        //! illegal assigning parent handle to child handle Types are not assignment compatible.
        // ab=bc;
        // bc1=ab; 
        //! type check fails during compile time.
        ab=bc;
        $cast(bc1,ab);
        bc1.dispp("using $cast to copy into handle bc1"); //! using $cast
    endfunction

    function legal_assignment_parent_to_child_class();
        ab=bc; //! legal:assigning child class handle to parent class handle next refer line 33
        bc.dispp("copying parent handle to class handle");
    endfunction
/*
parent_class = child_class; //allowed
child_class  = parent_class; //not-allowed
------------------------
parent_class = child_class ;
child_class  = parent_class; //allowed because parent_class is pointing to child_class.
This we can over come by make use of $cast method, i.e, $cast(child_class,parent_class);
*/
endmodule