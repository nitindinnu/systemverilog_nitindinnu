`include "01transaction.sv"
`include "02generator.sv"
`include "03driver.sv"
`include "04ipmonitor.sv"
`include "05opmonitor.sv"
`include "06scoreboard.sv"

class environment_fa;
    
    generator_fa gen;
    driver_fa drv;
    ipmonitor_fa ipmn;
    opmonitor_fa opmn;
    scoreboard_fa scbd;
    event e;

    virtual fa_interface inter;

    mailbox #(transaction_fa) g2d,im2s,om2s;

    function new(virtual fa_interface.tb inter);
        this.inter=inter;
    endfunction

    function build();
        g2d=new();
        im2s=new();
        om2s=new();

        gen=new(g2d);
        drv=new(g2d,inter,e);
        ipmn = new(im2s,inter,e);
        opmn = new(om2s,inter,e);
        scbd=new(im2s,om2s);

    endfunction

    task run();
        build();
        fork
            gen.run();
            drv.run();
            ipmn.run();
            opmn.run();
            scbd.run();
        join_any
    endtask
endclass