module disable_fork_01(
);//? all active threads that have been kicked off from a fork-join block can be killed by calling disable fork
    initial begin
    $display("stmnt 1 starts at %0d th unit time",$time);
    #2 $display("stmnt 2 starts at %0d th unit time",$time);
    $display("-----entering fork join in next line--------");
    fork
        p1:begin
        #2 $display("p1 stmnt 3 starts at %0d th unit time",$time);
        #4 $display("p1 stmnt 4 starts at %0d th unit time",$time);
        end

        p2:begin
        $display("p2 stmnt 5 starts at %0d th unit time",$time);
        end
    // join
    join_any
    // join_none
    disable fork;
    $display("-----exiting fork join from previous line--------");
    #5 $display("stmnt 6 starts at %0d th unit time",$time);
    
end
endmodule

/*
? join
# stmnt 1 starts at 0 th unit time
# stmnt 2 starts at 2 th unit time
# -----entering fork join in next line--------
# p2 stmnt 5 starts at 2 th unit time
# p1 stmnt 3 starts at 4 th unit time
# p1 stmnt 4 starts at 8 th unit time 
# -----exiting fork join from previous line--------
# stmnt 6 starts at 13 th unit time //?stmnt4 nothing is missing here disable killed none
? join_any
 stmnt 1 starts at 0 th unit time
# stmnt 2 starts at 2 th unit time
# -----entering fork join in next line--------
# p2 stmnt 5 starts at 2 th unit time
# -----exiting fork join from previous line--------//?stmnt 4 missing here disable killed it
# p1 stmnt 3 starts at 4 th unit time
# stmnt 6 starts at 7 th unit time
? join_none
# stmnt 1 starts at 0 th unit time
# stmnt 2 starts at 2 th unit time
# -----entering fork join in next line--------
# -----exiting fork join from previous line--------
# p2 stmnt 5 starts at 2 th unit time
# p1 stmnt 3 starts at 4 th unit time //?stmnt 4 missing here disable killed it
# stmnt 6 starts at 7 th unit time
*/