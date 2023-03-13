class scoreboard_fa;
    transaction_fa ref_out=new(),dut_out=new();
    mailbox #(transaction_fa) im2s;
    mailbox #(transaction_fa) om2s;
    function new(mailbox #(transaction_fa) im2s,mailbox #(transaction_fa)  om2s);
        this.im2s=im2s;
        this.om2s=om2s;
    endfunction

    task run();

        forever begin
            im2s.get(ref_out);
            om2s.get(dut_out);

            if(ref_out.sum==dut_out.sum && ref_out.carry == dut_out.carry)begin
                test_passed_failed("PASSED");
            end
            else begin
                test_passed_failed("FAILED");                
            end
        end
    endtask
    
    function void test_passed_failed(string z);
        $display("----------------------------- TEST %0s--[at time=%0tns] -------------------------------------------",z,$time);
        $display("[scoreboard] ref_out.sum=[%0d],dut_out.sum[%0d] , ref_out.carry=[%0d],dut_out.carry[%0d] ",ref_out.sum,dut_out.sum,ref_out.carry,dut_out.carry);
    endfunction
endclass