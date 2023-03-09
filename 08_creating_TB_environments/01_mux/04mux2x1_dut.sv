module mux2x1_dut(
    mux2x1_intf.dut inter
);
    always @(*) begin
       case (inter.sel)
            1'b0:inter.out=inter.i0;
            1'b1:inter.out=inter.i1;
            default:inter.out=4'bxxxx;
       endcase
       $display(">>>>>DUT>>>>>"); 
       $display("\n [DUT] output for 2x1mux inter.out=[%od]",inter.out);
       $display("------------------------------------------------------");
    end
endmodule