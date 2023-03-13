`include "10environment.sv"

class test;

    environment_fa env ;
    virtual fa_interface inter;

    function new(virtual fa_interface inter);
        this.inter=inter;
    endfunction

    task run();
        begin
            env=new(inter);
            env.run();
        end
    endtask
endclass