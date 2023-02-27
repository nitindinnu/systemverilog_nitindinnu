module event01(//! wait / @ simulation times less than event triggers -> / -->
);
    event e1;
    initial begin
        fork
            begin:p1
                $display("p1 block event execution started at %0d",$time);
            end
            
            #10 ->e1; //! trigger an event

            begin:p2
                #10  wait(e1); //! line 13 i.e after wait stmnt waiting for event e1 to trigger and complete its executions
                $display("time %0d waiting for event e1 to trigger",$time); 
            end
        join
    end
//! # p1 block event execution started at 0
//! # time 10 waiting for event e1 to trigger
endmodule
/*
->   : Used to trigger an event that unblocks all waiting processes due to this event. It is an instantaneous event.
->>  :This operator is used to trigger non-blocking events.
@    : The @ operator is used to block the process till an event is triggered. This is an edge-sensitive operator. Hence, waiting for an event should be executed before triggering an event to avoid blocking the waiting process.
wait :The wait() construct is similar to @ operator except it will unblock the process even if triggering an event and waiting for an event to happen at the same time.
*/

// module event02(
//     input logic clk;
//     input logic [7:0]a,b;
//     output logic [7:0]out;
// );
//     event e2;
//     always @(posedge clk ) begin
//        out = a| b; 
//     end
    
//     if (a==8'hff || b==8'hff) begin
//         ->e2
//     end
// endmodule
//-------------------------
//! Type A: An event is triggered after waiting for the event trigger
//! (-> have more delay than @) / (@ have less delay than ->) which makes sure event e1 triggers after waiting for an event trigger
//! wait - @ executes first at 0ns and triggers event e1 at 10ns after trigger completes whole execution later stmnts followed by @ will be executed
module event03( //!Event is triggered using -> and waiting for SystemVerilog event to be triggered via the @ operator
);
event e1;

    task process_A();
        #10 $display("@%0t: Before triggering event e1", $time);
        ->e1;
        $display("@%0t: After triggering event e1", $time);
    endtask

    task process_B();
        $display("@%0t: waiting for the event e1", $time);
        @e1;
        $display("@%0t: event e1 is triggered", $time);
    endtask
    
    initial begin
        fork
          process_A();
          process_B();
        join
    end    
/*
# @0: waiting for the event e1
# @10: Before triggering event e1
# @10: After triggering event e1
# @10: event e1 is triggered
*/
endmodule


//----------------
//!Type B: An event is triggered before waiting for event trigger
//! (-> have less delay than @) / (@ have more delay than ->)  which makes sure event e1 triggers before waiting for an event trigger
module event04(
);
//!The wait for the event to be triggered via @ operator will be blocked since the e1 event is triggered before. 
//! Hence, statements after waiting for the trigger (with @ operator) will not be executed.
event e1;

    task process_A();
        $display("@%0t: Before triggering event e1", $time);
        ->e1;
        $display("@%0t: After triggering event e1", $time);
    endtask

    task process_B();
        #10 $display("@%0t: waiting for the event e1", $time);
        @e1;
        $display("@%0t: event e1 is triggered", $time);
    endtask
    
    initial begin
        fork
          process_A();
          process_B();
        join
    end    
/*
# @0: Before triggering event e1
# @0: After triggering event e1
# @10: waiting for the event e1
*/
endmodule

//----------------
//! Type C: An event is triggered at the same time as waiting for the event trigger
module event05(
);
event e1;

task process_A();
    $display("@%0t: Before triggering event e1", $time);
    ->e1;
    $display("@%0t: After triggering event e1", $time);
endtask

task process_B();
    $display("@%0t: waiting for the event e1", $time);
    @e1;
    $display("@%0t: event e1 is triggered", $time);
endtask

initial begin
    fork
      process_A();
      process_B();
    join
end  
/*
# @0: Before triggering event e1
# @0: After triggering event e1
# @0: waiting for the event e1
*/ 
endmodule
//------------------------
//!Type A: An event is triggered after waiting for the event trigger.
module event06(
);
event e1;
  
task process_A();
  #10;
  $display("@%0t: Before triggering event e1", $time);
  ->e1;
  $display("@%0t: After triggering event e1", $time);
endtask

task process_B();
  $display("@%0t: waiting for the event e1", $time);
  wait(e1.triggered);
  $display("@%0t: event e1 is triggered", $time);
endtask

initial begin
  fork
    process_A();
    process_B();
  join
end
/*
# @0: waiting for the event e1
# @10: Before triggering event e1
# @10: After triggering event e1
# @10: event e1 is triggered
*/
endmodule

//---------------
//!Type B: An event is triggered before waiting for event trigger
module event07(
);
event e1;
  
task process_A();
  $display("@%0t: Before triggering event e1", $time);
  ->e1;
  $display("@%0t: After triggering event e1", $time);
endtask

task process_B();
  #10;
  $display("@%0t: waiting for the event e1", $time);
  wait(e1.triggered);
  $display("@%0t: event e1 is triggered", $time);
endtask

initial begin
  fork
    process_A();
    process_B();
  join
end  
/*
# @0: Before triggering event e1
# @0: After triggering event e1
# @10: waiting for the event e1
*/
endmodule
//------------------
//!Type C: An event is triggered at the same time as waiting for the event trigger.
module event08(
);
event e1;
  
task process_A();
  $display("@%0t: Before triggering event e1", $time);
  ->e1;
  $display("@%0t: After triggering event e1", $time);
endtask

task process_B();
  $display("@%0t: waiting for the event e1", $time);
  wait(e1.triggered);
  $display("@%0t: event e1 is triggered", $time);
endtask

initial begin
  fork
    process_A();
    process_B();
  join
end
/*
# @0: Before triggering event e1
# @0: After triggering event e1
# @0: waiting for the event e1
# @0: event e1 is triggered
*/
endmodule
