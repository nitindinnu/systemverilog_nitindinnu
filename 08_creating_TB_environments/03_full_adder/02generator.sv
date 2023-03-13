
class generator_fa;
    transaction_fa tranxfa;
    mailbox #(transaction_fa) g2d;

    function new(input mailbox #(transaction_fa) g2d); //connect to handle of environment
        this.g2d=g2d;
    endfunction

    task run();
        #1;
        tranxfa = new();
        
        // forever begin
             repeat(25) begin
            tranxfa.randomize();
            tranxfa.fa_display();
            g2d.put(tranxfa);
            $display(">>>GENERATOR CLASS<<<");
            $display("\n [generator]:input values are randomized and sent to mailbox");
            $display("[generator to mail box] data stored inside mailbox is a,b,cin =[%0d,%0d,%0d]",tranxfa.a,tranxfa.b,tranxfa.cin);
            #1; 
            end
        // end
    endtask
endclass