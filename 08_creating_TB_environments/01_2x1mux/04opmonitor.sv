class opmonitor;
    transaction trnx;
   // mailbox om2s;
    mailbox #(transaction) om2s;
    virtual interface mux_2x1_intf.tb inter;
    // event e;

    function new(input mailbox #(transaction) om2s,input virtual interface mux_2x1_intf.tb inter);
        this.om2s=om2s;
        this.inter=inter;
        // this.e=e;
    endfunction

    task run();
        trnx=new();
        forever begin
            @(inter.out);
            begin
                trnx.out=inter.out;
                $display(">>> OUTPUT MONITOR<<<");
	            $display("[O/P monitor] :stored data in o/p monitor as packet data  = [%0d]",trnx.out);
            end
            om2s.put(trnx);
            $display("[O/P monitor to mail box] :data sent from o/p monitor to mailbox  = [%0d]",trnx.out);
            $display("----------------------------------------------------------------------------------------------");
        end
        // ->e;
    endtask
    
endclass