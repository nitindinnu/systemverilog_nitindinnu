class class_a; //!
    bit[3:0] var_1,var_2;

    function void dispp();
        $display("var_1 is [%0d],var_2 is [%0d]",var_1,var_2);
    endfunction
endclass

module shallow_cp_normal(
);
    class_a dg01= new(),dg02 = new dg01; //! creating memory and handle of dg01 and shallow copying dg01 to dg02
    initial begin
        dg01.var_1=4'd13;
        dg01.var_2=4'd12;
        disp_dg01("initial");
        disp_dg02("initial");
        dg02.var_1=4'd1;
        dg02.var_2=4'd2;
        disp_dg01("dg02 modified is not reflected in dg01//");
        disp_dg02("modified dg02//");
        dg01.var_1=4'd7;
        disp_dg01("modified dg01 var1//");
        disp_dg02("dg02 modified is not reflected in dg01//");
    end

    function void disp_dg01(string a);
        $display("==== [%0s] dg01-start-----------",a);
        dg01.dispp();
        $display("==== [%0s] dg01-end-------------",a);
    endfunction

    function void disp_dg02(string a);
        $display("==== [%0s] dg02-start-----------",a);
        dg02.dispp();
        $display("==== [%0s] dg02-end-------------",a);
    endfunction
endmodule