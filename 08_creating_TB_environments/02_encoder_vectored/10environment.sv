`include "01transaction.sv"
`include "02generator.sv"
`include "03driver.sv"
`include "04ipmonitor.sv"
`include "05opmonitor.sv"
`include "06scoreboard.sv"

class environment_encoder;
    // transaction_encoder trnx;
    generator_encoder gen;
    driver_encoder dri;
    ipmonitor_encoder ipmn;
    opmonitor_encoder opmn;
    scoreboard_encoder scbd;
    event e;

    virtual  interface_encoder interr;

    mailbox #(transaction_encoder) g2d,im2s,om2s;


    function new(virtual interface_encoder.tb interr);
        this.interr=interr;
    endfunction

    function build();
        g2d=new();
        im2s=new();
        om2s=new();

        // trnx=new();
        gen=new(g2d);
        dri=new(g2d,interr,e);
        ipmn=new(im2s,interr,e);
        opmn=new(om2s,interr,e);

        scbd=new(im2s,om2s);
    endfunction
    
    task run();
        build();
        fork
            // trnx
            gen.run();
            dri.run();
            ipmn.run();
            opmn.run();
            scbd.run();
        join_any
    endtask
endclass