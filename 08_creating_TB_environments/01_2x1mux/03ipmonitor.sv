class ipmonitor;
    transaction trnx;
    //mailbox im2s;
    mailbox #(transaction) im2s;
    virtual interface mux_2x1_intf.tb inter;

    function new(input mailbox #(transaction) im2s,input virtual interface mux_2x1_intf.tb inter);
        this.im2s=im2s;
        this.inter=inter;
    endfunction

    task run();
        trnx=new();
        forever begin
            @(inter.i0 | inter.i1 | inter.sel);
            trnx.i0=inter.i0;
            trnx.i1=inter.i1;
            trnx.sel=inter.sel;
            $display(">>> INPUT MONITOR<<<");	
            $display("[i/p monitor]: stored data in i/p monitor as packet data is  i0=[%0d],i1=[%0d],sel=[%0d]", trnx.i0,trnx.i1,trnx.sel);    
        

        //BFM
        // case (trnx.sel)
        //     1'b0:trnx.out=trnx.i0;
        //     1'b1:trnx.out=trnx.i1;
        //     default:trnx.out=4'bxxxx;
        // endcase
        trnx.out = trnx.sel?trnx.i1:trnx.i0;

        $display("[BFM]:trnx.out=[%0d]", trnx.out);

        im2s.put(trnx);
        $display("[i/p monitor to mailbox] data sent from i/p monitor to mailbox is pkt.out=[%0d]",trnx.out);
        $display("----------------------------------------------------------------------------------------------");
    end
    endtask

    
endclass