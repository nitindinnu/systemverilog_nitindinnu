class driver_fa;
    transaction_fa tranxfa ;
    mailbox #(transaction_fa) g2d;
    virtual fa_interface.tb inter;
    event e;

    function new(mailbox #(transaction_fa) g2d,virtual  fa_interface.tb inter,event e);
        this.g2d=g2d;
        this.inter=inter;
        this.e=e;
    endfunction

    task run();
        #1;
        forever begin
            g2d.get(tranxfa);
            $display("at driver data recieved from mailbox = [a=%0d,b=%0d,cin=%0d]",tranxfa.a,tranxfa.b,tranxfa.cin);
            inter.a=tranxfa.a;
            inter.b=tranxfa.b;
            inter.cin=tranxfa.cin;
            $display("");
            $display("at interface randomozed values through driver= [a=%0d,b=%0d,cin=%0d]",inter.a,inter.b,inter.cin);
            ->e;
        end
    endtask
endclass