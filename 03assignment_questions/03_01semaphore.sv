module semaphore01(
);
/*
! 01.three processes with 4 keys but available only 2 keys to processes
*/

    semaphore nitin=new(4);
    initial begin
        fork
            begin:p1
                nitin.get(2);
                #5 $display("at p1",$time);
                nitin.put(2);
            end
            begin:p2
                nitin.get(2);
                #5 $display("at p2",$time);
                nitin.put(2);
            end
            begin:p3
                nitin.get(2);
                #5 $display("at p3",$time);
                nitin.put(2);
            end
        join
    end
/*
# at p1                   5
# at p2                   5
# at p3                  10*/
endmodule

module semaphore02(
    );
    /*
    ! 02.write only one key control the 4 processes
    */
    
        semaphore nitin=new(1);
        initial begin
            fork
                begin:p1
                    nitin.get(1);
                    #3 $display("at p1",$time);
                    nitin.put(1);
                end
                begin:p2
                    nitin.get(1);
                    #1 $display("at p2",$time);
                    nitin.put(1);
                end
                begin:p3
                    nitin.get(1);
                    #0 $display("at p3",$time);
                    nitin.put(1);
                end
                begin:p4
                    nitin.get(1);
                    #2 $display("at p4",$time);
                    nitin.put(1);
                end
            join
        end
/*
# at p1                   3
# at p2                   4
# at p3                   4
# at p4                   6   
*/
endmodule

module semaphore03(
);
  //! 03. semaphore keys with two processes use try_get

    semaphore nitin=new();
        initial begin
            fork
            begin:p1
                nitin.get();
                #3 $display("at p1",$time);
                nitin.put();
                // nitin.try_put();//!error
            end
            begin:p2
                nitin.try_get();
                #1 $display("at p2",$time);
                nitin.put();
                // nitin.put();//!error
            end
            join
        end
/*
at p2                   1
# at p1                   4        */
endmodule

module semaphore04(
);
//! using one semaphore variable exchange the data b/w the 4 processes in looping
endmodule

