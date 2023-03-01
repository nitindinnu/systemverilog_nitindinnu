class trnc;
    randc bit[3:0]addr;
    string add_rangee;
    constraint nn;
endclass

// constraint trnc::nn{(add_rangee == "small") -> (addr>=8);}  //!implication constraint normal
constraint trnc::nn{if(add_rangee == "small")addr>=8 ;else addr<8;}  //!implication constraint if=else

module constraint_implicaion(
);
    trnc ab =new();
    initial begin
        $display("-----------------------------");
        ab.add_rangee="small";
        repeat(4) begin 
            ab.randomize();
            $display("addr_range=[%0s]\tadddr=%0d",ab.add_rangee,ab.addr);
            $display("-----------------------------");
        end
        ab.add_rangee="other";
        $display("--------passing other condition addr>=8 constraint is not considere from here----");
        repeat(4) begin 
            ab.randomize();
            $display("addr_range=[%0s]\tadddr=%0d",ab.add_rangee,ab.addr);
            $display("-----------------------------");
        end
    end
endmodule