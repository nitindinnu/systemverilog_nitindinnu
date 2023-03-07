// class trnx;
    
// endclass


module casting00(
);
    int as;
    real bs;
    initial begin
        bs=real'(5*7);
        $display("real value is %0f",bs);
        $display("int value is %0d",as);
        as=int'(5*7);
        $display("real value is %0f",bs);
        $display("int value is %0d",as);
    end
    
endmodule