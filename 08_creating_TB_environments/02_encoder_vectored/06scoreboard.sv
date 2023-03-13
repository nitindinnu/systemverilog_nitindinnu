class scoreboard_encoder;
    transaction_encoder ref_pkt=new(),dut_pkt=new();
    mailbox #(transaction_encoder) im2s,om2s;

    function new(mailbox #(transaction_encoder) im2s,mailbox #(transaction_encoder) om2s);
        this.im2s=im2s;
        this.om2s=om2s;
    endfunction

    task run();
        forever begin
            im2s.get(ref_pkt);
            om2s.get(dut_pkt);
            display_scoreboard();
            if (ref_pkt==dut_pkt) begin
                test_passed_failed("PASSED");
            end else begin
                test_passed_failed("FAILED");
            end
        end
    endtask

    function void display_scoreboard();
        $display(">>> SCOREBOARD <<<");
        $display("[scoreboard] ref_pkt.y0,y1=[%0p] ",ref_pkt.y);
        $display("[scoreboard] dut_pkt.y0,y1=[%0p] ",dut_pkt.y);
    endfunction

    function void test_passed_failed(string z);
        $display("----------------------------- TEST %0s--[at time=%0tns] -------------------------------------------",z,$time);
	    $display("[scoreboard] ref_pkt.y0,y1=[%0p] , dut_pkt.y0,y1=[%0p] ",ref_pkt.y,dut_pkt.y);
    endfunction
endclass