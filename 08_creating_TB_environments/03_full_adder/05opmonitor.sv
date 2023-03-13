class opmonitor_fa;
    transaction_fa tranxfa ;
    mailbox #(transaction_fa) om2s;
    virtual fa_interface.tb inter;
    event e;

    function new(mailbox #(transaction_fa) om2s,virtual fa_interface.tb inter,event e);
        this.om2s=om2s;
        this.inter=inter;
        this.e=e;
    endfunction

    task run();
        tranxfa = new();
        forever begin
            //@(inter.sum,inter.carry)
            wait(e)
            tranxfa.sum=inter.sum;
            tranxfa.carry=inter.carry;
            
            om2s.put(tranxfa);
            
        end
    endtask
endclass