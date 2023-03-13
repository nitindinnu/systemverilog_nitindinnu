interface fa_interface;
    logic [3:0] a,b;
    logic cin=0;
    logic [3:0] sum,carry;

    modport dut (
    input a,b,cin,
    output sum,carry
    );

    modport tb (
    input sum,carry,
    output a,b,cin
    );
endinterface