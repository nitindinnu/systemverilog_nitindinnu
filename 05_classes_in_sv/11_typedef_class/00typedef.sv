typedef class c2;   //! by commenting this line we get an error

//class-1
class c1;
  c2 c;    //using class c2 handle before declaring it.
endclass

//class-2
class c2;
  c1 c;
endclass
 
module typedef_class;
  initial begin
    c1 class1;
    c2 class2;
    $display("Inside typedef_class");
  end
endmodule