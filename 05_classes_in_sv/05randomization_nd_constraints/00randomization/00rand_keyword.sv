class randd;
    rand byte a,b;
endclass

module rand_method(
);
   initial begin
        $display("==============================");
        print_disable_randomize;
        $display("==============================");
        print_disable_randomize_properties;
        $display("==============================");
        print_enable_randomize;
   end 

   function void print_disable_randomize();
    static randd kk = new();
    $display("a.rand_mode() =%0b \t b.rand_mode()=%0b",kk.a.rand_mode(),kk.a.rand_mode());
    //!disable rand mode of object \\we can also disable properties i.e vars
    kk.rand_mode(0);
    $display("randomize disabled for whole object");
    //!calling randomize method;
    $display("a.rand_mode() =%0b \t b.rand_mode()=%0b",kk.a.rand_mode(),kk.a.rand_mode());
    repeat(10)begin
        kk.randomize();
        $display("a=%0d \t b=%0d",kk.a,kk.b);
    end
   endfunction

   function void print_disable_randomize_properties();
    static randd kk = new();
    $display("a.rand_mode() =%0b \t b.rand_mode()=%0b",kk.a.rand_mode(),kk.a.rand_mode());
    //!disable rand mode of object \\we can also disable properties i.e vars
    kk.b.rand_mode(0);
    $display("randomize disabled for whole object");
    //!calling randomize method;
    $display("a.rand_mode() =%0b \t b.rand_mode()=%0b",kk.a.rand_mode(),kk.a.rand_mode());
    repeat(10)begin
        kk.randomize();
        $display("a=%0d \t b=%0d",kk.a,kk.b);
    end
   endfunction

   function void print_enable_randomize();
    static randd kk = new();
    $display("a.rand_mode() =%0b \t b.rand_mode()=%0b",kk.a.rand_mode(),kk.a.rand_mode());
    //!enable rand mode of object 
    kk.rand_mode(1);
    $display("randomize enabled for whole object");
    //!calling randomize method;
    $display("a.rand_mode() =%0b \t b.rand_mode()=%0b",kk.a.rand_mode(),kk.a.rand_mode());
    repeat(10)begin
        kk.randomize();
        $display("a=%0d \t b=%0d",kk.a,kk.b);
    end
    
   endfunction
endmodule