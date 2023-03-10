// !explicit bins
class transaction_win;
    rand bit[4:0] ff,ee;
    rand bit[4:0] dd;
endclass

module coverages_03(
);
    bit clk;
    transaction_win t1= new();
    // cg01 po = new();//! cant declare here

    //  Covergroup: cg01
    covergroup cg01 () @(posedge clk);

        //  Coverpoint: cp_01
        cp_01: coverpoint t1.dd iff (1) { 
            //! transition
            bins b1 =(22=>20);
            bins b2[]=(40=>50),(80=>90=>100=>120);//! doesnt create in covergroup
            bins b3 =(2,3=>4,5);
            bins b4 = (30=>20);
        }
        //  Coverpoint: cp_02
        cp_02: coverpoint t1.ee iff (1){
            //! ignore bins
            ignore_bins b5 = {10,20,30};
            ignore_bins b6 = (22=>20);
        }
        //  Coverpoint: cp_03
        cp_03: coverpoint t1.ff iff (1){
            //! illegal bins
            illegal_bins b7=(2=>4);
            illegal_bins b8=(22=>20);
        }
        
    endgroup: cg01

    initial begin
        cg01 po = new();     
        clk=0;
        // cg01 po = new(); //! cant declare here too    
        repeat(16) begin
            t1.randomize() with {dd inside {22,20};ee inside {22,20};ff inside {22,20};};
            $display("time[%0d],dd[%0d],ee[%0d],ff[%0d]",$time,t1.dd,t1.ee,t1.ff);
            po.sample();
        end
        $stop;
    end

    always #5 begin
        clk=~clk;
    end
endmodule