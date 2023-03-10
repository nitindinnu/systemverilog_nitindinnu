class generator;
    transaction trnx;
    //mailbox  g2d =  new();
    mailbox #(transaction) g2d;

    function new(input mailbox #(transaction) g2d);
        this.g2d=g2d;
    endfunction

    task run();
        #1
        trnx=new();
        repeat(10) begin
            trnx.randomize();
            trnx.display();
            g2d.put(trnx);
            $display(">>>GENERATOR CLASS<<<");
            $display("\n [generator]:input values are randomized and sent to mailbox");
            $display("[generator to mail box] data stored inside mailbox is i[0]=%0d,i[1]=%0d,sel=%0d",trnx.i0,trnx.i1,trnx.sel);
            #1; 
        end
    endtask
endclass