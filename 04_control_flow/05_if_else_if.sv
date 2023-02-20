//unique if else 
module if_else_if_unique(
);
  
    shortint a=5;

    initial begin
        unique if (a==4) begin
        $display("a is %0d",a);
        end 
        else if (a==6) begin
        $display("a is %0d",a);
        end
        else begin
            $display("a is niether 4 nor 6");
        end
    // here error is not reported and compiler throws an error coz there is an else stmnt
    //in the next block we write unique without a else condition
        unique if (a==4) begin $display("a is %0d",a);end
               else if (a==6) begin $display("a is %0d",a);end
/*
# Loading work.if_else_if_unique(fast)
# a is niether 4 nor 6
# ** Warning: (vsim-8315)-->>>>>>> No condition is true in the unique/priority if/case statement.
#    Time: 0 ns  Iteration: 0  Process: /if_else_if_unique/#INITIAL#6 File: 05_if_else_if.sv Line: 18
*/
    end
endmodule

module if_else_unique01(
);
    //variables declaration
    int a,b,c;

    initial begin
     //initialization
     a=10;
     b=20;
     c=40;

     unique if ( a < b ) $display("\t a is less than b");
     else   if ( a < c ) $display("\t a is less than c");
     else                $display("\t a is greater than b and c");
/*
# Loading sv_std.std
# Loading work.if_else_unique01(fast)
# ** Warning: (vsim-8360) --->>>>>The if/case statement is not unique.
#    Time: 0 ns  Iteration: 0  Process: /if_else_unique01/#INITIAL#34 File: 05_if_else_if.sv Line: 40
# 	 a is less than b
*/
    end
endmodule

//priority if

module priority_if_01(
);
    //variables declaration
  int a,b,c;
  
  initial begin
     //initialization
     a=50;
     b=20;
     c=40;
  
     priority if ( a < b ) $display("\t a is less than b");
     else     if ( a < c ) $display("\t a is less than c");
  end
/*
# ** Warning: 05_if_else_if.sv(67): (vopt-2589) No condition is true in the unique/priority if statement
# Loading sv_std.std
# Loading work.priority_if_01(fast)
# ** Warning: (vsim-8315) No condition is true in the unique/priority if/case statement.
#    Time: 0 ns  Iteration: 0  Process: /priority_if_01/<anonymous> File: 05_if_else_if.sv Line: 67
*/
endmodule