class transaction_05_01;
    byte arr[];
    function void disp();
        arr = new[3]; //op [0 0 0]
        $display("values of array = [%0p]",arr);
    endfunction
endclass

class transaction_05_02;
    byte arr1[];
    function void disp();
        // arr = new[3]; //op [0 0 0]
        byte arr2[] = new[3](arr1); //op [7 5 4]
        $display("values of array2 = [%0p]",arr2);
    endfunction
endclass

module nitin(
);
  transaction_05_01 wee = new();
  transaction_05_02 wee1 = new();
  initial begin
    wee.arr='{2,3,4};
    wee.disp();
    wee1.arr1='{7,5,4};
    wee1.disp();
  end  
endmodule