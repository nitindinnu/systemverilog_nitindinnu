class opmonitor_encoder;
    transaction_encoder trnx=new();
    mailbox #(transaction_encoder) om2s;
    virtual interface_encoder interr;
    event e;

    function new(mailbox #(transaction_encoder) om2s,virtual interface_encoder interr,event e);
        this.om2s=om2s;
        this.interr=interr;
        this.e=e;
    endfunction

    task run();
        forever begin
        // @(interr.y/*[0],interr.y[1]*/)
        wait(e)
        begin
            trnx.y=interr.y ;
        // trnx.y[0]=interr.y[0];
        // trnx.y[1]=interr.y[1];
            // $display(">>> OUTPUT MONITOR<<<");
	        // $display("[O/P monitor] :stored data in o/p monitor as packet data  = [%0p]",trnx.y);
        end
        om2s.put(trnx);
        // $display("[O/P monitor to mail box] :data sent from o/p monitor to mailbox  = [%0p]",trnx.y);
        // $display("----------------------------------------------------------------------------------------------");
        end
    endtask
endclass