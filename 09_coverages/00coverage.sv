class transaction_win;
    rand bit[4:0] dd,ee;
    rand bit[4:0] ff;
endclass

module coverages_00(
);
    bit clk;
    transaction_win t1= new();

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
    endgroup: cg01

    always #5 begin
        clk=~clk;
    end

    initial begin
        cg01 po = new();
        clk=0;
        repeat(64) begin
            // t1.randomize() with {dd>=0&&dd<32;ee>=0&&ee<32;ff>=0&&ff<32;};
            t1.randomize() with {dd inside {[0:31]};ee inside {[0:31]};ff inside {[0:31]};};
            $display("time[%0d],dd[%0d],ee[%0d],ff[%0d]",$time,t1.dd,t1.ee,t1.ff);
            po.sample();
        end
        $stop;
    end
endmodule