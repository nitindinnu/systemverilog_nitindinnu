class scoreboard;
    transaction ref_pkt,dut_pkt;
    mailbox #(transaction) im2s;
    mailbox #(transaction) om2s;

    function new(input mailbox #(transaction) im2s, input  mailbox #(transaction) om2s);
        this.im2s=im2s;
        this.om2s=om2s;
    endfunction

    task run();
        forever begin
            im2s.get(ref_pkt);//we are getting data out from mailbox, then  without memory for ref_pkt how we are storing data in it ????
            om2s.get(dut_pkt);//same as above cmnt
            $display(">>> SCOREBOARD <<<");
            $display("\n[scoreboard] ref_pkt.out=[%0d] ",ref_pkt.out);
            $display("[scoreboard] dut_pkt.out=[%0d] ",dut_pkt.out);
            //  @(dut_pkt.out,ref_pkt.out);
            if (ref_pkt.out == dut_pkt.out) begin
                $display("----------------------------- TEST PASSED--[at time=%0tns] -------------------------------------------",$time);
	            $display("[scoreboard] ref_pkt.out=[%0d] , dut_pkt.out=[%0d] ",ref_pkt.out,dut_pkt.out);
            end 
            else begin
                $display("----------------------------- TEST FAILED--[at time=%0tns] --------------------------------------------",$time);
	            $display("[scoreboard] ref_pkt.out=[%0d] ,  dut_pkt.out=[%0d]",ref_pkt.out,dut_pkt.out);
	            $display("----------------------------------------------------------------------------------------------");
            end
        end
    endtask
endclass