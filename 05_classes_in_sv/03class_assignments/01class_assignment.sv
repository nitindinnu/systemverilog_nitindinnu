class trnxm;
    //! both can access same memory
    //! one update the values,both get updated
    int data;
endclass

module topp1();
    trnxm h1=new(),h2;

    initial begin
        
        h1.data=5;
        h2=h1;
        $display("h1 data at topp1 %0d",h1.data);
        $display("h2 data at topp1 %0d",h2.data);
        h2.data=10;
        $display("h1 data at topp1 %0d",h1.data);
        $display("h2 data at topp1 %0d",h2.data);
        
    end
    // # h1 data at topp1 5
    // # h2 data at topp1 5
    // # h1 data at topp1 10
    // # h2 data at topp1 10
    
endmodule

module topp2();
    trnxm h1=new();
    trnxm h2=new();
    //or
    //! cant use trnxm h1,h2=new();
    initial begin
        h1.data=5;
        $display("h1 data at topp2 %0d",h1.data);
        $display("h2 data at topp2 %0d",h2.data);
        h2.data=10;
        $display("h1 data at topp2 %0d",h1.data);
        $display("h2 data at topp2 %0d",h2.data);
        
    end
// # h1 data at topp1 5
// # h2 data at topp1 5
// # h1 data at topp1 10
// # h2 data at topp1 10
endmodule