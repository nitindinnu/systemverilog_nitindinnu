class class_assg;
    //! both can access same memory
    //! one update the values,both get updated
    bit[31:0]a,b,c;
    //bit[31:0]c;
    //bit[31:0]data;
    function new(bit [7:0] data);
        this.a=data;
        this.b=a;
        this.c=b;
    endfunction
endclass
    
module module_assign;
    class_assg tr1,tr2;
    initial begin
        tr1=new();
        // tr2=new();
        // class_assg.new()
        $display("value is %0d",tr1.c);
    end
endmodule