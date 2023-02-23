module semaphore01(
//!Semaphore is a SystemVerilog built-in class, used for access control to shared resources, 
    //! and for basic synchronization. may be acting as a FIFO

);
    //! declaring semaphore
    semaphore nn ;
    initial begin
        nn = new(3); //! creating a key with range 3
        fork
            begin:p1
                nn.get(2);
                #2 $display("p1 block got required keys at time %0d",$time);
                nn.put(2);
            end:p1
            begin:p2
                nn.get(1);
                #5 $display("p2 block got required keys at time %0d",$time);
                nn.put(1);
            end:p2
        join
    end
/*
# Loading work.semaphore01(fast)
# p1 block got required keys at time 2
# p2 block got required keys at time 5
*/
endmodule
    

module semaphore2(
);
semaphore nn ;
initial begin
    nn = new(2); //! creating a key with range 2
    fork
        begin:p1
            nn.get(2);
            #2 $display("p1 block got required keys at time %0d",$time);
            nn.put(2);
        end:p1
        begin:p2
            nn.get(1);
            #5 $display("p2 block got required keys at time %0d",$time);
            nn.put(1);
        end:p2
    join
end
/*
# Loading work.semaphore2(fast)
# p1 block got required keys at time 2
# p2 block got required keys at time 7 //----->>>observe
*/
endmodule

module semaphore3(
    );
    semaphore nn ;
    initial begin
        nn = new(1); //! creating a key with range 2
        fork
            begin:p1
                nn.get(2);
                #2 $display("p1 block got required keys at time %0d",$time);
                nn.put(2);
            end:p1
            begin:p2
                nn.get(1);
                #5 $display("p2 block got required keys at time %0d",$time);
                nn.put(1);
            end:p2
            
        join
    end
/*
# Loading work.semaphore3(fast)
# p2 block got required keys at time 5    */
endmodule

module semaphore4(
    );
    semaphore nn ;
    initial begin
        nn = new(1); //! creating a key with range 2
        fork
            begin:p1
                nn.get(2);
                #2 $display("p1 block got required keys at time %0d",$time);
                // nn.put(10);
            end:p1
            begin:p2
                nn.get(1);
                #5 $display("p2 block got required keys at time %0d",$time);
                // nn.put(10); 
                /* 
                ! with single key in semaphore nn, p2 block got that single key executed its processes in sequence and at end 
                ! if  nn.put(10) then 10 keys are available in that 10 keys p1 and p2 take 2 keys each and execute
                ! if nn.put(2) then that 2 keys are taken by p1 and not put back so only p1 only executes leaving p3 */
                nn.put(2);
            end:p2
            begin:p3
                nn.get(2);
                #2 $display("p3 block got required keys at time %0d",$time);
                nn.put(2);
            end:p3
        join
    end
/*
 Loading work.semaphore4(fast)
! with nn.put(2);
# p2 block got required keys at time 5
# p1 block got required keys at time 7
! with nn.put(10);
 Loading work.semaphore4(fast)
# p2 block got required keys at time 5
# p1 block got required keys at time 7
# p3 block got required keys at time 7
   */
endmodule

module semaphore_with_more_delays(
);
semaphore nn ;
initial begin
    nn = new(3); //! creating a key with range 3
    fork
        begin:p1
            nn.get(2);
            #2 $display("p1 block got required keys at time %0d",$time);
            nn.put(10);
            // nn.put(2);
        end:p1
        begin:p2
            nn.get(8);
            #5 $display("p2 block got required keys at time %0d",$time);
            nn.put(8);
        end:p2
        begin:p3
            nn.get(4);
            #4 $display("p3 block got required keys at time %0d",$time);
            nn.put(1);
        end:p3
        begin:p4
            nn.get(2);
            #6 $display("p4 block got required keys at time %0d",$time);
            nn.put(1);
        end:p4
        begin:p5
            // nn.get(3);
            nn.get(1);
            #7 $display("p5 block got required keys at time %0d",$time);
            nn.put(1);
        end:p5
    join
end
/*
# p1 block got required keys at time 2
# p5 block got required keys at time 7
# p2 block got required keys at time 7
# p3 block got required keys at time 11
# p4 block got required keys at time 13
! nn.get(3); at p5
# p1 block got required keys at time 2
# p2 block got required keys at time 7
# p3 block got required keys at time 11
# p4 block got required keys at time 13
# p5 block got required keys at time 14
! nn.put(2) at p1
# p1 block got required keys at time 2
*/
endmodule

module semaphore5(
);
semaphore sema=new(4); //creating sema with '4' keys
    initial begin
    fork
      display(); //process-1
      display(); //process-2
     display(); //process-3
    join
  end
/*
  ! here initialy 4 keys are distributed for process1 and process2 then 
  !processes3 also waiting for two keys but at 0th unit time its not available
  ! either process 1 or 2 putting two keys at 30th simulation time at that instance 
  !process 3 getting executed
  */
  //display method
  task automatic display();
    sema.get(2); //getting '2' keys from sema
    $display($time,"\tCurrent Simulation Time");
    #30;
    sema.put(2); //putting '2' keys to sema
  endtask
endmodule

module semaphore6(
    );
    semaphore sema=new(4); //creating sema with '4' keys
        initial begin
        fork
          display(1); //process-1
          display(2); //process-2
         display(3); //process-3
        join
      end
    
      //display method
      task automatic display(int i);
        sema.get(i); //getting '2' keys from sema
        $display($time,"\tCurrent Simulation Time,Got %0d keys",key);
        #30;
        sema.put(i*2); //putting '2' keys to sema
      endtask
    endmodule

module semaphore7( //! breaking of process found here b/w p1 and p3
);
    semaphore a = new(3);

    initial begin
        fork
            begin:p1
                a.get(3);
                #3 $display("p1 block got required keys at time",$time);
                a.put(4);
            end
            begin:p2
                a.get(5);
                #2 $display("p2 block got required keys at time",$time);
                a.put(4);
            end
            begin:p3
                a.get(3);
                #4 $display("p3 block got required keys at time",$time);
                a.put(3);
            end
        join
    end
    //! p1 block got required keys at time  3
endmodule

module semaphore7_01( //! using try_get method in semaphore and not declaring key range in new()
);
semaphore a = new();

initial begin
    fork
        begin:p1
            a.get(3);
            #3 $display("p1 block got required keys at time",$time);
            a.put(5);
        end
        begin:p2
            a.get(5);
            #2 $display("p2 block got required keys at time",$time);
            a.put(4);
        end
        begin:p3
            a.try_get(3); 
            #4 $display("p3 block got required keys at time",$time);
            a.put(3);
        end
    join
end
/*
# p3 block got required keys at time 	                   4
# p1 block got required keys at time 	                   7
# p2 block got required keys at time 	                   9*/
endmodule

