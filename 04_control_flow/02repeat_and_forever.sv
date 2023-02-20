module repeatt_and_forever(
);
   initial begin
    repeat(20) begin
        $display(" verilog repeat system");
    end
   end 

   initial begin
    forever begin
        #5; $display("forever initial");
    end
   end

    always begin //as here no sensitivity list always will be executing parallely with initial block
        forever begin
            #5; $display("forever always");
        end
    end

   initial #200 $stop;
endmodule