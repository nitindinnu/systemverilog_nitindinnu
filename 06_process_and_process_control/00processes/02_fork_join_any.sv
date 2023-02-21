module fork_joinn_any(
);
    //fork join will start all the processes inside it parallely and wait for the completion of all the processes
    initial begin
        $display("stmnt 1 starts at %0d th unit time",$time);
        #2 $display("stmnt 2 starts at %0d th unit time",$time);
        $display("-----entering fork join_any in next line--------");
        fork
            begin:p1
            #2 $display("p1 stmnt 3 starts at %0d th unit time",$time);
            #4 $display("p1 stmnt 4 starts at %0d th unit time",$time);
            end:p1

            begin:p2
            $display("p2 stmnt 5 starts at %0d th unit time",$time);
            end:p2
        join_any
        $display("-----exiting fork join_any from previous line--------");
        $display("stmnt 6 starts at %0d th unit time",$time);
    end
endmodule
/*
 Loading work.fork_joinn_any(fast)
# stmnt 1 starts at 0 th unit time
# stmnt 2 starts at 2 th unit time
# -----entering fork join_any in next line--------
# p2 stmnt 5 starts at 2 th unit time 
/*>>>> here after a single execution compiler jumps out of fork join_any block and other processes are running in background 
# -----exiting fork join_any from previous line--------
# stmnt 6 starts at 2 th unit time
# p1 stmnt 3 starts at 4 th unit time
# p1 stmnt 4 starts at 8 th unit time
*/