module fa_dut(fa_interface.dut intf);
    always@(*) begin
        {intf.sum,intf.carry} = intf.a+intf.b+intf.cin;
        
        // intf.sum = intf.a ^ intf.b ^ intf.cin;
        // intf.carry = (intf.a & intf.b) | (intf.b & intf.cin) | (intf.cin & intf.a);
        $display("at ///DUT/// sum =%0d,carry=%0d",intf.sum,intf.carry);
    end

    
endmodule