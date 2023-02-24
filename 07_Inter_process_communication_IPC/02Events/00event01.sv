module event01(//! wait / @ simulation times less than event triggers -> / -->
);
    event e1;
    initial begin
        fork
            begin:p1
                $display("p1 block event execution started at %0d",$time);
            end
            #10 ->e1; //trigger an event

            begin:p2
                wait(e1); //! line 13 i.e after wait stmnt waiting for event e1 to trigger and complete its executions
                    $display("time %0d waiting for event e1 to trigger",$time); 
            end
        join
    end
//! # p1 block event execution started at 0
//! # time 10 waiting for event e1 to trigger

endmodule

module event02(
    input logic clk;
    input logic [7:0]a,b;
    output logic [7:0]out;
);
    event e2;
    always @(posedge clk ) begin
       out = a| b; 
    end
    
    if (a==8'hff || b==8'hff) begin
        ->e2
    end
endmodule

