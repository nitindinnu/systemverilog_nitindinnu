/*
!write an svcode to demonstrate the fork-joi,join_any,join_none
*/
module fork_join01(
);
    initial begin
        $display("enetering fork-join");
        fork
            begin:p1
                $display("inside fork join p1 block time %0d ",$time);
                #5 $display("inside fork join p1 block time %0d ",$time);
            end
            begin:p2
                $display("inside fork join p2 block time %0d ",$time);
                $display("inside fork join p2 block time %0d ",$time);
            end
            begin:p3
                 $display("inside fork join p3 block time %0d ",$time);
                #2 $display("inside fork join p3 block time %0d ",$time);
            end
        // join
        // join_any
        join_none
        $display("exiting fork join");
        #5 $display("outside fork join time %0d ",$time);
        #6 $display("outside fork join time %0d ",$time);
    end
endmodule
/*
!FORK JOIN
# inside fork join p1 block time 0 
# inside fork join p2 block time 0 
# inside fork join p2 block time 0 
# inside fork join p3 block time 0 
# inside fork join p3 block time 2 
# inside fork join p1 block time 5
! FORK JOIN_ANY
# inside fork join p1 block time 0 
# inside fork join p2 block time 0 
# inside fork join p2 block time 0 
# exiting fork join
# inside fork join p3 block time 0 
# inside fork join p3 block time 2 
# inside fork join p1 block time 5 
# outside fork join time 5 
# outside fork join time 11 
! FORK JOIN_NONE
# enetering fork-join
# exiting fork join
# inside fork join p1 block time 0 
# inside fork join p2 block time 0 
# inside fork join p2 block time 0 
# inside fork join p3 block time 0 
# inside fork join p3 block time 2 
# outside fork join time 5 
# inside fork join p1 block time 5 
# outside fork join time 11 
*/