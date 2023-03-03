class tranxv;
    rand bit[3:0]a,b,c;
    // randc bit[3:0]a,b,c; // //!doesnt work randc with unique
    constraint c_name { unique {a,b,c};}
endclass

module constraint_unique(
);
   tranxv pw = new();
   initial begin
    repeat(20) begin
        pw.randomize();
        $display("value of a=%0d \t b=%0d \t c=%0d",pw.a,pw.b,pw.c);
    end
   end 
endmodule