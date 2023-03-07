class trnx;
    protected bit[3:0]a;

    function  new(bit[3:0]b);
        a = b+15;
    endfunction

    function void dispay();
        $display("a = %0d",a);
    endfunction
endclass

class trnx02 extends trnx;
    function new(bit[3:0] b);
        super.new(b);
    endfunction

    function void incr_addr();
        a++;
      endfunction 
endclass

module encapsulate_protected(
);
    
    
    initial begin
        illegal_access_to_protected_member(); //!ACCESSING A PROTECTED VARIABLE OUTSIDE THE CLASS ( NOT ALLOWED )
        llegal_access_to_protected_member(); //!ACCESSING A PROTECTED VARIABLE IN THE EXTENDED CLASS ( ALLOWED )
    end

    task illegal_access_to_protected_member();
        static trnx lo = new(5);
        static trnx02 lo1 = new(10);
        begin
            $display("--------illegal_access_to_protected_member TASK------");
            // lo.a=10; 
            // ! Illegal access to protected member a. 
            //!Full name of member: _01encapsulation_protected_sv_unit::trnx::
            //!Full name of calling scope: outside a class context
        
            lo.dispay();
            lo1.incr_addr();//! Accessing protected variable in extended class
            lo1.dispay();
        end
    endtask
    
    task llegal_access_to_protected_member();
        static trnx02 lo2 = new(15);
        begin
            $display("-------llegal_access_to_protected_member TASK----------");
            lo2.incr_addr(); //! Accessing protected variable in extended class
            lo2.dispay();
        end
        
    endtask
    
endmodule