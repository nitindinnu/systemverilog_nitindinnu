class driver;
    transaction trnx;
    mailbox #(transaction) g2d;

    virtual interface mux_2x1_intf.tb inter; //take .tb not taking it will not be a problem
    // endinterface

    function new(input mailbox #(transaction) g2d,input virtual interface mux_2x1_intf.tb inter);
        this.g2d=g2d;
        this.inter=inter;
    endfunction

    task run();
        forever begin
            g2d.get(trnx);
            $display(">>>DRIVER CLASS<<<");
            $display("\n [driver] : Data sent from mailbox to driver");
            $display("[mailbox to driver]: Data collected by driver is i[0]=%0d,i[1]=%0d,sel=%0d,out=%0d",trnx.i0,trnx.i1,trnx.sel,trnx.out);
            inter.i0=trnx.i0;
            inter.i1=trnx.i1;
            inter.sel=trnx.sel;
            //
            $display("[driver interface]: Data collected by driver is i[0]=%0d,i[1]=%0d,sel=%0d,out=%0d",inter.i0,inter.i1,inter.sel,inter.out);
            $display("----------------------------------------------------------------------------------------------");
        end
    endtask
endclass