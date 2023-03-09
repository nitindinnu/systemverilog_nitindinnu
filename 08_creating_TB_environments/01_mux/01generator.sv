class generator_mux;
    transaction trnx;
    mailbox g2d =  new();

    function new(mailbox g2d);
        this.g2d=g2d;
    endfunction

    task run();
        #1;
        trnx = new()
        repeat(10) begin
            trnx.randomize();
            trnx.display();
            g2d.put(trnx);
            $display(">>>>GENERATOR CLASS >>>>>>>>");
            $display("\n [generator]:input values are randomized and sent to mailbox");
            $display("{generator to mail box} data stored inside mailbox is i[0]=[%0d],i[1]=,i[1]=[%0d],sel=[%0d]",i[0],i[1],sel);
            #1; 
        end
    endtask
endclass