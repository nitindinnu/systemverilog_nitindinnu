class transaction;
    byte unsigned a,b,cin;
    byte sum,carry;
endclass

class generator extends transaction;
    rand byte unsigned a,b,cin;
    function dispp();
        $display("a=[%0d],b=[%0d],cin=[%0d],==== sum=[%0d],carry[%0d]",a,b,cin,sum,carry);
    endfunction
endclass

module top(
);
    generator gd = new();
    initial begin
        repeat(3)begin
            gd.randomize();
            gd.dispp();
        end
    end
endmodule