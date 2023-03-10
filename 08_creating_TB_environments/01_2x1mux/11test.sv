`include "10environment.sv"

class test;
    environment env;
    virtual interface mux_2x1_intf.tb inter;

    function new(virtual interface mux_2x1_intf.tb inter);
        this.inter=inter;
    endfunction

    task run();
        begin
            env=new(inter);
            env.run();
        end
    endtask
endclass