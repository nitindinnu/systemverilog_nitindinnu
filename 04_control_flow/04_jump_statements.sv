module jump_break_continue(
);
    reg[3:0] count=0;
    initial begin
        for (int i=0 ;i<13 ;i++ ) begin
            if (i==6) continue;
            $display("iteration number %0d",i);
            if (i==10) break;
        end
        
    end
endmodule
/*
# Loading work.jump_break_continue(fast)
# iteration number 0
# iteration number 1
# iteration number 2
# iteration number 3
# iteration number 4
# iteration number 5
# iteration number 7
# iteration number 8
# iteration number 9
# iteration number 10
*/