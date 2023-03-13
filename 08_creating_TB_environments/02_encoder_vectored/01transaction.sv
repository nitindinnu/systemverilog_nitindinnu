class transaction_encoder;
    rand bit [3:0][7:0]i;
    bit [1:0][7:0]y;
   
    function void dispp(string a);
        $display("%0s",a);
        $display("input of decoder values ar i[0],i[1],i[2],i[3]  = [%0p]",i);
        $display("out puts of decoder are y0,y1 =[%0p]",y);
    endfunction
    
endclass  