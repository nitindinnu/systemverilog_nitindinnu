`include "10environment.sv"

class test;
    environment_encoder env ;
    virtual  interface_encoder interr;

    function new(virtual interface_encoder interr);
        this.interr=interr;
    endfunction

    task run();
        begin
            env=new(interr);
            env.run();
        end
    endtask
endclass