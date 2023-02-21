module named_blocks_and_statement_labels(
);
    ////one type of named block
    initial begin : init_a
    disp_label:$display("inside initial block A");    
    end
    //one type of named block
    initial init_b: begin
        $display("inside initial block B"); 
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

/*syntax:
begin: <block_name>
…
end

<label_name>: <statement>;

When in comes to begin/end or fork/join blocks, there is absolutely no difference between the two forms.

Statement labels in SystemVerilog are supposed to replace block names in Verilog. But it is extremely hard to remove anything from an existing standard.

Statement labels are useful in reporting and debugging so that you have a label associated with a single statement instead of a filename/line number without having to wrap it in a begin/end block. It also gives your code visibility into the variables declared inside a for/foreach loop.

label: statement
is equivalent to
begin: label statement end : label
except in the case where that statement happens to be a begin/end or fork/join, there is no need for the compiler to insert an extra begin/end.
*/
