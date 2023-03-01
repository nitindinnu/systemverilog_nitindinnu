class transaction;
    // randc bit[3:0]a,b;
    // randc bit sel;
    rand bit[3:0]a,b;
    rand bit sel;
    bit [3:0] mux_out;
    function void priint();
        $display("a=%0d\t,b=%0d\t,sel=%0d\t,mux_out=%0d\t",a,b,sel,mux_out);
    endfunction
endclass

class generator;
    transaction ee = new();
    
    task run_gen();
        repeat(20)begin
            // ee.b.rand_mode(0); //!stopping randominzing b var
            // ee.rand_mode(0); //!stopping randominzing for all rand properties
            // ee.rand_mode(1); //!enabling randominzing for all rand properties
            ee.randomize();
            ee.priint();
        end
    endtask
endclass

module top_mux2x1(
);
    generator gen_a = new();
    initial begin
        gen_a.run_gen();
    end
endmodule