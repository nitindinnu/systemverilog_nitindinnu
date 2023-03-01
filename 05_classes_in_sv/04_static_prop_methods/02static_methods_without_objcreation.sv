class tranx;
    static int a; //static property
    static function void increase_a(); //static function :can acess only static properties
        a++;
        // b++; 
        // this.b=b++;
//!# ** Error: 01static_methods.sv(7): (vlog-2888) Illegal to access non-static property 'b' from a static method.
    endfunction
endclass

class trnx2 extends tranx;
    int b; //non static property
    function void increase_b(); //non static func :can acess both static and non static propertioes
        this.a=a++;
        this.b=b++;
    endfunction
endclass

module static_methods02( 
    );
        
        initial begin
            $display("after increase_a function call - acess static function with class handle ");
            acess_static_function_with_class_handle;
            $display("after increase_a function call - acess static function without class handle using scope resolution operator  ");
            acess_static_function_without_class_handle;
            $display("using extended class trnx2 and using static and noon static vars"); 
            acess_static_function_without_class_handle_trnx2;   
        end

        function void acess_static_function_with_class_handle();
            tranx tr;
            tr.increase_a(); //acess static function with class handle
            $display("value of static var a is %0d using tr handle ",tr.a);
        endfunction

        function void acess_static_function_without_class_handle();
            tranx::increase_a();  //access static func without class handle
            $display("value of static var a is %0d using scope resolution operator ",tranx::a);
        endfunction

        function void acess_static_function_without_class_handle_trnx2();
            trnx2::increase_b();  //access static func without class handle
            $display("value of static var a is %0d using scope resolution operator ",trnx2::a);
            $display("value of static var b is %0d using scope resolution operator ",trnx2::b);
        endfunction
endmodule