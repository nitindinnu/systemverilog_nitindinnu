class generator_encoder;
    transaction_encoder trnx=new();
    mailbox #(transaction_encoder) g2d;

    function new(input mailbox #(transaction_encoder) g2d);
        this.g2d=g2d;
    endfunction

    task run();
        #1;
        repeat(1)begin
        // trnx.dispp(">>>> >>>TRANSACTION CLASS<<< <<<<<");
        // $display("------------------------------------------------------------------");
        trnx.randomize();
        trnx.dispp(">>>> after randomizing at generator class <<<<<");
        $display("------------------------------------------------------------------");
        g2d.put(trnx);
        $display(">>>GENERATOR CLASS<<<");
        $display("[generator]:input values are randomized and sent to mailbox");
        $display("[generator to mail box] data stored inside mailbox is i[0],i[1],i[2],i[3] =[%0p]",trnx.i);
        $display("------------------------------------------------------------------");
        #1;
        end
    endtask
endclass