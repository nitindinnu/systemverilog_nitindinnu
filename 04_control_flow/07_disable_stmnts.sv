module disable_blocks(
);
    ////one type of named block
    initial begin : init_a
    disp_label:$display("inside initial block A");  
    disable:disp_label  ;
    end
    
    //one type of named block
    initial init_b: begin
        $display("inside initial block B"); 
        disable:init_b
    end
    //named block for a task
    task localtask();
        $display("Inside task");
    endtask:localtask
    //named block for a task
    function localfunc();
        $display("Inside function");
    endfunction:localfunc
endmodule
//https://vlsiverify.com/system-verilog/named-blocks-statement-labels