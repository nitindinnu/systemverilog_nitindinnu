class tranx;
    static int a; //static property
    int b; //non static property

    static function void increase_a(); //static function :can acess only static properties
        a++;
        // b++; 
        // this.b=b++;
//!# ** Error: 01static_methods.sv(7): (vlog-2888) Illegal to access non-static property 'b' from a static method.
    endfunction

    function void increase_b(); //non static func :can acess both static and non static propertioes
        a++;
        b++;
    endfunction
endclass

module static_methods01( 
);
    tranx tr[5];
    initial begin
        foreach (tr[i]) begin
            tr[i]=new();
            tr[i].increase_a();
            $display("on calling incr a : static method :value of a=%0d,id=%0d",tr[i].a,tr[i].b);
        end
        tr[0].a=0; //resetinng class variable a to 0
        foreach (tr[i]) begin
            tr[i].increase_b();
            $display("on calling incr b:non-static method :value of a=%0d,id=%0d",tr[i].a,tr[i].b);
        end
    end
endmodule