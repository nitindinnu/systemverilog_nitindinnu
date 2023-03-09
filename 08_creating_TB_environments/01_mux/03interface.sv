interface mux2x1_intf;
    logic[3:0] i0,i1;
    logic sel;
    logic[3:0] out;

    modport dut (
    input i0,i1,sel,
    output out
    );

    modport tb (
    input out,
    output i0,i1,sel
    );

    //interface is just a bunch of wires we can write display statements
endinterface