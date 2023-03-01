class trnx;
    bit[3:0] a,b;
    function void set_data(bit[3:0] a, b);
        // b=b;
        // a=a; 
        //! compiler can't recognize class variable and functionmethod vars coz mentioned with same name
        this.a=a;
        this.b=b; 
        //! by using this keyword we are indicatng the variable belongs to class so compiler recognizes the differences
    endfunction
endclass

module this_func00(
);
    trnx hij= new();
    
    initial begin
        hij.set_data(5,11); 
        $display("a %0d b %0d",hij.a,hij.b);
    end
endmodule