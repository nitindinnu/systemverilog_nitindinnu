class tkt #(parameter  type T = int,
                        type Y=bit, //pass a datatype to a class
                        byte ADDR_WID=8,
                        byte DATA_WID=4); //parameterized classes                        
    Y [ADDR_WID-1] addr;
    T data;

    function void multiplyy(Y[ADDR_WID-1] addr);
        data=addr*addr;
        $display("data=%0d",data);
    endfunction
endclass

class tkt2 #(parameter int ADDR_WID=32,DATA_WID=32);
  
    bit [ADDR_WID-1:0] addr;
    bit [DATA_WID-1:0] data;
    
    function new(bit [ADDR_WID-1:0] addr,bit [DATA_WID-1:0] data);
        this.addr=addr;
        this.data=data; //!try using this
        // addr=addr;
        // data=data;   //! try without this
    endfunction
    
endclass

module parami(
);
    tkt io = new();
    tkt2  #(3,3) io3 =new(8,5) ;
    tkt2 io2=new(7,5) ;
    initial begin
        io.multiplyy(10);
        $display("addr=%0d,data=%0d",io2.addr,io2.data);
        $display("addr=%0d,data=%0d",io3.addr,io3.data);
    end
    
endmodule