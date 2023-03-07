class base;
    virtual function void my_task ();
        $display ("This is base_class");
    endfunction
endclass

class ext_class extends base;
    function void my_task ();
        $display ("This is extended class");
    endfunction
endclass

module top ();
   
    
    base bs_hand=new();
    ext_class es_hand=new();
    
    initial begin
        bs_hand.my_task (); //!same as line26

        $display ("\n Applying polymorphism : Overriding base-class method by extended class \n");

        bs_hand = es_hand; // Here polymorphism is done.

        bs_hand.my_task ();
    end
    
    endmodule