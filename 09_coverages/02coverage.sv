// !explicit bins
class transaction_win;
    randc bit[3:0] ff,ee;
    randc bit[7:0] dd;
endclass

module coverages_02(
);
    bit clk;
    transaction_win t1= new();
    // cg01 po = new();//! cant declare here

    //  Covergroup: cg01
    covergroup cg01 () @(posedge clk);

        //  Coverpoint: cp_01
        cp_01: coverpoint t1.dd iff (1) {
            //!addr
            bins b1 = {1, 10, 12};//Constructs single bin for 1, 10, 12 value. 
            bins b2[] = {[2:9], 11};//Constructs 2 bins ie.b2[0] = 2~9, b2[1] = 11.
            bins b3[4] = {[0:7]}; //Constructs 4 bins with possible values as b3[0] = 0 ~1,b3[2] = 3~4,b3[3] = 5~7,
            
        }
        //  Coverpoint: cp_02
        cp_02: coverpoint t1.ee iff (1){
            //! data
            // bins b4 = {$,4}; //Constructs single bin for 4~7
            bins b4 = {2,4}; //Constructs single bin for 4~7
            bins b5[] = {2, 3, 6};//Constructs 3 bins as b5[0] = 2,b5[1] = 3,b5[2] = 6
        }
        //  Coverpoint: cp_03
        cp_03: coverpoint t1.ff iff (1){
            //!en
            bins b6 = {1};//Constructs single bin for value = 1
        }
        
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