class ipmonitor_fa;
    transaction_fa tranxfa ;
    mailbox #(transaction_fa) im2s;
    virtual fa_interface.tb inter;
    event e;

    function new(mailbox #(transaction_fa) im2s,virtual fa_interface.tb inter,event e);
        this.im2s=im2s;
        this.inter=inter;
        this.e=e;
    endfunction

    task run();
        tranxfa = new();    
        forever begin
        //    @(inter.a,inter.b,inter.cin)
            wait(e)
            tranxfa.a=inter.a;
            tranxfa.b=inter.b;
            tranxfa.cin=inter.cin;

            //BFM
            begin
                // {tranxfa.sum,tranxfa.carry} = tranxfa.a+tranxfa.b+tranxfa.cin;
            tranxfa.sum = tranxfa.a ^ tranxfa.b ^ tranxfa.cin;
            tranxfa.carry = (tranxfa.a & tranxfa.b) | (tranxfa.b & tranxfa.cin) | (tranxfa.cin & tranxfa.a);
            end

            

            im2s.put(tranxfa);
            //->e;
        end
        $display("[at ipmonitor]");
    endtask
endclass