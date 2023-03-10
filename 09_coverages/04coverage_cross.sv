// !explicit bins
class transaction_win;
    rand bit[4:0] ff,ee;
    rand bit[4:0] dd,gg;
endclass

module coverages_04(
);
    bit clk;
    transaction_win t1= new();
    // cg01 po = new();//! cant declare here

    //  Covergroup: cg01
    covergroup cg01 () @(posedge clk);

        //  Coverpoint: cp_01
        cp_01: coverpoint t1.dd iff (1) {
            bins b1 =(22=>20);
        }
        //  Coverpoint: cp_02
        cp_02: coverpoint t1.ee iff (1){
            ignore_bins b5 = {10,20,30};
        }

        //Coverpoint: cp_03
        cp_03: coverpoint t1.ff iff (1){
            bins b1 =(22=>20);
        }
        cp_04: coverpoint t1.gg iff (1){
            bins b1 =(22=>20);
        }

        cp_05: coverpoint t1.gg iff (1){
            bins b1 ={10,20,30};
        }
        cp_06: coverpoint t1.gg iff (1){
            bins b1 ={10,20,30};
        }

        //! crosscoverage by variable
        cp_01Xcp_02 : cross cp_01,cp_02 ;  //!cp01 : transition/order ,cp02:values
        cp_03Xcp_04 : cross cp_03,cp_04 ;  //! doesnt work >>> cp03 : transition/order ,cp04:transition/order
        cp_05Xcp_06 : cross cp_05,cp_06 ;  //! cp05 : values ,cp06:values


    endgroup: cg01

    initial begin
        cg01 po = new();     
        clk=0;
        // cg01 po = new(); //! cant declare here too    
        repeat(16) begin
            t1.randomize() with {dd inside {22,20};};
            $display("time[%0d],dd[%0d],ee[%0d],ff[%0d],gg=[%0d]",$time,t1.dd,t1.ee,t1.ff,t1.gg);
            po.sample();
        end
        $stop;
    end

    always #5 begin
        clk=~clk;
    end
endmodule