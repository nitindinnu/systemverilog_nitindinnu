interface interface_encoder;
    logic [3:0][7:0]i;
    logic [1:0][7:0]y;
    // logic byte [3:0]i;
    // logic byte [1:0]y;

    modport dut (
    input i,output y
    );

    modport tb (
    input y,output i
    );
endinterface