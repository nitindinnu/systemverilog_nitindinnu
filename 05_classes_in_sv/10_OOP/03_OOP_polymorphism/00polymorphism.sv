/*
SystemVerilog Polymorphism is a fundamental concept in every Object Oriented Programming language that
 allows the same code to behave differently depending on the kind of Object with which it is dealing.
  Polymorphism in SystemVerilog means having many forms, and a base class handle can invoke methods
   of its child class which has the same name, allowing an object to take on many form
*/
// base class 
class base_class;
    virtual function void display(); //! abstract method
      $display("Inside base class");
    endfunction
endclass
  
  // extended class 1
class ext_class_1 extends base_class;
    function void display();
      $display("Inside extended class 1");
    endfunction
endclass
  
  // extended class 2
class ext_class_2 extends base_class;
    function void display();
      $display("Inside extended class 2");
    endfunction
endclass
  
  // extended class 3
class ext_class_3 extends base_class;
    function void display();
      $display("Inside extended class 3");
    endfunction
endclass
  
  // module
module class_polymorphism;
  
    //declare and create extended class
    ext_class_1 ec_1 = new();
    ext_class_2 ec_2 = new();
    ext_class_3 ec_3 = new();
    
    //base class handle
    base_class b_c[3];

    initial begin 
        //assigning extended class to base class
        b_c[0] = ec_1;
        b_c[1] = ec_2;
        b_c[2] = ec_3;
        
      //accessing extended class methods using base class handle
      b_c[0].display();
      b_c[1].display();
      b_c[2].display();
    end
  
endmodule