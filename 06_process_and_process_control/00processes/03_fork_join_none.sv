module fork_joinn_none01(
);
    //fork join will start all the processes inside it parallely and wait for the completion of all the processes
    initial begin
        $display("stmnt 1 starts at %0d th unit time",$time);
        #2 $display("stmnt 2 starts at %0d th unit time",$time);
        $display("-----entering fork join_none in next line--------");
        fork
            begin:p1
            #2 $display("p1 stmnt 3 starts at %0d th unit time",$time);
            #4 $display("p1 stmnt 4 starts at %0d th unit time",$time);
            end:p1

            begin:p2
            $display("p2 stmnt 5 starts at %0d th unit time",$time);
            end:p2
        join_none
        $display("-----exiting fork join_none from previous line--------");
        $display("stmnt 6 starts at %0d th unit time",$time);
    end
endmodule
/*
# Loading work.fork_joinn_none01(fast)
# stmnt 1 starts at 0 th unit time
# stmnt 2 starts at 2 th unit time
# -----entering fork join_none in next line--------
# -----exiting fork join_none from previous line--------
# stmnt 6 starts at 2 th unit time
# p2 stmnt 5 starts at 2 th unit time
# p1 stmnt 3 starts at 4 th unit time
# p1 stmnt 4 starts at 8 th unit time
*/