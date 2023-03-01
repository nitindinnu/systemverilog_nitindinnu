class staticc;
    static int a;
    int b;
    function new();
        a++;
        b++;
    endfunction
endclass

module static_prop01(
);
    staticc ab[5];
    initial begin
        foreach (ab[i]) begin
            ab[i]=new();
            $display("value of static var a is [%0d] and non-static var b is [%0d] ",ab[i].a,ab[i].b);
        end
    end
    //!static updates from prev/shared mem
    //!but non static doesnt updates from prev/shared mem
endmodule