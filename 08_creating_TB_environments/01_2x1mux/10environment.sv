`include "00transaction.sv"
`include "01generator.sv"
`include "02driver.sv"
`include "03ipmonitor.sv"
`include "04opmonitor.sv"
`include "05scoreboard.sv"

class environment;
    generator gen;
    driver drv ;        
    ipmonitor ipmn;   
    opmonitor opmn ;     
    scoreboard scbd;
    // event e;
    virtual interface mux_2x1_intf.tb inter;    // created handle for interface

    mailbox #(transaction) g2d;
	mailbox #(transaction) im2s;
	mailbox #(transaction) om2s;

    function new(virtual interface mux_2x1_intf.tb inter);  // why we used constructor in environment????
        this.inter=inter;                        // from where this constructor get formal arguments data{where are actual arguments????}
    endfunction

    function void build();
        g2d=new();
        im2s=new();
        om2s=new();

        gen  =new(g2d);

        drv  =new(g2d,inter);
        ipmn =new(im2s,inter);
        opmn =new(om2s,inter);

        scbd =new(im2s,om2s);
    endfunction

    task run();
        build(); //calling above function method
        fork
            gen.run();
	        drv.run();
	        ipmn.run();
	        opmn.run();
	        scbd.run();
        join_any
    endtask
endclass