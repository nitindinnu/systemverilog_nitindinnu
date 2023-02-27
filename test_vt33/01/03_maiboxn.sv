/*
!write an svcode for mailbox and use all datatypes for put and get methods of mailbix
*/
module maiboxn();

    mailbox mbx = new(3);
    initial begin
        fork
            geta();
            puta();
        join
    end

    task automatic puta();
        int a=5;
        string b="nitin_dinnu";
        real c=5.2;
        bit d=1;
        mbx.put(a);
        mbx.put(b);
        mbx.put(c);
        mbx.put(d);
        disp_put(a,b,c,d);
        // $display("put int ",a);
        // $display("put string ",b);
        // $display("put real ",c);
        // $display("put bit ",d);
    endtask

    task geta();
        int a;
        string b;
        real c;
        bit d;
        mbx.get(a);
        mbx.get(b);
        mbx.get(c);
        mbx.get(d);
        disp_get(a,b,c,d);
        // $display("get int ",a);
        // $display("get string ",b);
        // $display("get real ",c);
        // $display("get bit ",d);
    endtask

    task disp_put(input int a,string b, real c,bit d);
        $display("put int ",a);
        $display("put string ",b);
        $display("put real ",c);
        $display("put bit ",d);
    endtask

    task disp_get(input int a,string b, real c,bit d);
        $display("get int ",a);
        $display("get string ",b);
        $display("get real ",c);
        $display("get bit ",d);
    endtask
endmodule