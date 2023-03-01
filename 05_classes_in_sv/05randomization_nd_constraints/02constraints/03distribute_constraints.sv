class const_dist;
    randc bit[3:0]addr;
    // rand bit[3:0]addr; //! check diff b/w rand and randc
    constraint nn;
endclass

constraint const_dist::nn{addr dist { 1:=5, 3:=8, 5:=12, [7:10]:=9} ; }  //!type 1 weight assignig
// constraint const_dist::nn{addr dist { 1:/5, 3:/8, 5:/12, [7:10]:/9} ; } //! type 2 weight dividing

module constraint_distributive_operator(
);
    const_dist yes = new();
    initial begin
        $display("---------------------------");
        repeat(20) begin
        yes.randomize();
        $display("addr=%0d",yes.addr);
        end
    end
endmodule