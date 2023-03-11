/*class MyClass;
    int array[];
  
    function new(int size);
      array = new[size];
    endfunction
  
    function void display();
      $display("Array: %p", array);
    endfunction
  
    function MyClass clone();
      // Shallow copy
      MyClass copy = this;
    
      // Deep copy
    //   MyClass copy = new(this.array.size());
    //   for(int i=0; i<this.array.size(); i++) begin
        // copy.array[i] = this.array[i];
    //   end
      
      return copy;
    endfunction
  endclass
  
  module top;
    initial begin
        MyClass obj1 = new(5);

        for(int i=0; i<obj1.array.size(); i++) begin 
            obj1.array[i] = i+1;
        end

        obj1.display();
        
        MyClass obj2 = obj1.clone();

        obj2.array[0] = 10;

        obj2.display();
        obj1.display();
    end
  endmodule*/
  /*
In the above example, the MyClass class has an integer array array[] and two methods - display() to print the contents of the array, and clone() to create a copy of the object.

By default, the clone() method performs a shallow copy, which means that it simply creates a new object with the same values of its members. In the code above, the line MyClass copy = this; performs the shallow copy.

To perform a deep copy, we need to create a new object with a new array and then copy the values from the original array to the new array. This is done in the code above by the lines MyClass copy = new(this.array.size()); and the for loop that copies the values.

In the top module, we create an object obj1 of MyClass with an array of size 5 and initialize its values to 1,2,3,4,5. We then create a clone of obj1 called obj2. We change the first value of obj2.array[] to 10 and print the contents of both objects.

If the copy performed is a shallow copy, then changing obj2.array[0] to 10 should also change the value of obj1.array[0]. However, since we have performed a deep copy, the two objects are independent of each other and changing one does not affect the other.
  */

class MyClass;
    int data;
    int dynamic_data[];
  
    // Shallow copy constructor
    function MyClass(MyClass obj);
      this.obj = obj;
    endfunction
  
    // Deep copy constructor
    function new();
    endfunction
  
    // deep copy method
    function void deep_copy(MyClass obj);
      this = new();
      data = obj.data;
      foreach (obj.dynamic_data[i])
        dynamic_data.push_back(obj.dynamic_data[i]);
    endfunction
  
    // Shallow copy method
    function void shallow_copy(ref MyClass obj);
      this.obj = obj;
    endfunction
  
    // Display method
    function void display();
      $display("Data: %0d", data);
      $display("Dynamic Data:");
      foreach (dynamic_data[i])
        $display("%0d", dynamic_data[i]);
    endfunction
endclass
  
module top;
    initial begin
      MyClass obj1 = new();
      obj1.data = 10;
      obj1.dynamic_data.push_back(20);
      obj1.dynamic_data.push_back(30);
      obj1.display();
  
      // Shallow copy
      MyClass obj2 = obj1;
      obj2.display();
  
      // Deep copy
      MyClass obj3 = new();
      obj3.deep_copy(obj1);
      obj3.display();
  
      // Update original object to verify shallow vs. deep copy
      obj1.data = 50;
      obj1.dynamic_data[1] = 40;
  
      $display("After Update:");
      obj1.display();
      obj2.display();
      obj3.display();
    end
endmodule
  