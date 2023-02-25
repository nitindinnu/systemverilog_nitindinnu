/*
!write an svcode where ther are 5 processes running parallely using semaphore,make sure that all proceses are executed
*/
module semaphoree(
);
    semaphore nd = new(5);
    initial begin
        begin:p1
            nd.get(2);
            $display("p1 block executed at time %0d",$time);
            nd.put(10);
        end
        begin:p2
            nd.get(2);
            $display("p2 block executed at time %0d",$time);
            nd.put(2);
        end
        begin:p3
            nd.get(5);
            $display("p3 block executed at time %0d",$time);
            nd.put(5);
        end
        begin:p4
            nd.get(2);
            $display("p4 block executed at time %0d",$time);
            nd.put(2);
        end
        begin:p5
            nd.get(1);
            $display("p5 block executed at time %0d",$time);
            nd.put(1);
        end
        
    end
endmodule