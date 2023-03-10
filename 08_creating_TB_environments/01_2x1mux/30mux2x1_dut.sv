module mux2x1_dut(
    mux_2x1_intf.dut inter
);
   always_comb 
    begin
    //    case (inter.sel)
    //         1'b0:inter.out=inter.i0;
    //         1'b1:inter.out=inter.i1;
    //         default:inter.out=4'bxxxx;
    //    endcase
    inter.out = inter.sel?inter.i1:inter.i0;
    
       $display(">>> DUT <<<"); 
       $display("\n [DUT] output for 2x1mux inter.out=[%0d]",inter.out);
       $display("------------------------------------------------------");
    end
endmodule