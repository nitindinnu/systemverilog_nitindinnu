module wait_fork_joinnone01(
);
    initial begin
    $display("stmnt 1 starts at %0d th unit time",$time);
    #2 $display("stmnt 2 starts at %0d th unit time",$time);
    $display("-----entering fork join in next line--------");
    fork
        begin:p1
        #2 $display("p1 stmnt 3 starts at %0d th unit time",$time);
        #4 $display("p1 stmnt 4 starts at %0d th unit time",$time);
        end:p1

        begin:p2
        $display("p2 stmnt 5 starts at %0d th unit time",$time);
        end:p2
    join_none
    $display("-----exiting fork join from previous line--------");
    #5 $display("stmnt 6 starts at %0d th unit time",$time);
    wait fork;//! waiting for the completion of active fork threads     
end
endmodule
/*
# Loading work.wait_fork_joinnone01(fast)
# stmnt 1 starts at 0 th unit time
# stmnt 2 starts at 2 th unit time
# -----entering fork join in next line--------
# -----exiting fork join from previous line--------
# p2 stmnt 5 starts at 2 th unit time
# p1 stmnt 3 starts at 4 th unit time
# stmnt 6 starts at 7 th unit time
# p1 stmnt 4 starts at 8 th unit time
*/