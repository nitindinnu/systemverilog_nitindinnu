class condional_constr;
    rand bit[3:0] aa,cc;
    constraint aa_constraint {aa == bb(cc);}

    function bit[3:0] bb(bit[3:0] cc1);
        if (cc1<4)   bb=0; 
            else     bb=cc1-4;
        // $display("\tfunction constraint aa value =%0d,cc value =%0d",aa,cc);
    endfunction
    
endclass

module constraint_functional(
    );
    condional_constr yu = new();
    initial begin
        repeat(13)begin
            yu.randomize();
            $display("\tbb=%0d ,aa value =%0d function bb matching with var aa using constraint unidirectional,cc value =%0d",yu.bb(yu.cc),yu.aa,yu.cc);
        end
    end
endmodule