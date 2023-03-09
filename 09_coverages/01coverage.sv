class transaction_win;
    randc bit[3:0] dd,ee;
    randc bit[3:0] ff;
endclass

module coverages_01(
);
    bit clk;
    transaction_win t1= new();
    // cg01 po = new();//! cant declare here

    //  Covergroup: cg01
    covergroup cg01 () @(posedge clk);
        //  Coverpoint: cp_01
        cp_01: coverpoint t1.dd iff (1) {
            bins b1={2,3,4};
            bins b2={[12:20]};
            bins b3=default;
        
        }
        //  Coverpoint: cp_02
        cp_02: coverpoint t1.ee iff (1){}
        //  Coverpoint: cp_03
        cp_03: coverpoint t1.ff iff (1){}

        cover
    endgroup: cg01

    initial begin
        cg01 po = new();     
        clk=0;
        // cg01 po = new(); //! cant declare here too    
        repeat(16) begin
            t1.randomize(); //with {dd>=0&&dd<32;ee>=0&&ee<32;ff>=0&&ff<32;};
            $display("time[%0d],dd[%0d],ee[%0d],ff[%0d]",$time,t1.dd,t1.ee,t1.ff);
            po.sample();
        end
        $stop;
    end

    always #5 begin
        clk=~clk;
    end
endmodule