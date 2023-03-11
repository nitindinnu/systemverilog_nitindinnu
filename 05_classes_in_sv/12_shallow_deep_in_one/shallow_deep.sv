class AnotherClass;
    int data;
endclass

class ExampleClass;
    int data;
    AnotherClass pointer;
endclass

module top;
    ExampleClass obj1;
    AnotherClass ptr = new();

    initial begin
        obj1 = new();
        obj1.data = 1;
        obj1.pointer = ptr;

        ExampleClass obj2 = obj1; // Shallow copy

        $display("Before modification: obj1.data = %0d, obj2.data = %0d", obj1.data, obj2.data);

        obj1.data = 2;
        obj1.pointer.data = 3;

        $display("After modification: obj1.data = %0d, obj2.data = %0d", obj1.data, obj2.data);
        $display("After modification: obj1.pointer.data = %0d, obj2.pointer.data = %0d", obj1.pointer.data, obj2.pointer.data);
    end

    initial begin
        ExampleClass obj3;
        AnotherClass ptr2 = new();

        obj3 = new();
        obj3.data = 4;
        obj3.pointer = new(ptr2); // Deep copy

        ExampleClass obj4 = new(obj3); // Deep copy using constructor

        $display("Before modification: obj3.data = %0d, obj4.data = %0d", obj3.data, obj4.data);

        obj3.data = 5;
        obj3.pointer.data = 6;

        $display("After modification: obj3.data = %0d, obj4.data = %0d", obj3.data, obj4.data);
        $display("After modification: obj3.pointer.data = %0d, obj4.pointer.data = %0d", obj3.pointer.data, obj4.pointer.data);
    end
endmodule