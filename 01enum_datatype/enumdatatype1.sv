module enumdatatype_example1(
);
    enum  {highperfoance_cpu,dsp,mid_cpu,sharedmemory,dramcontroller,videocontroller,uart,usb,ethernet,adc_dac}soc;

    initial begin
        $display("Total no of elements",soc.num());
        $display("the First element's string is %s",soc.name());
        $display("First element is %0s and its value is %0d ",soc.first(),soc.first());//1
        $display("next element is %0s and its value is %0d ",soc.next(),soc.next());
        $display("Second next element is %0s and its value is %0d ",soc.next(2),soc.next(2));
        $display("previous element is %0s and its value is %0d ",soc.prev(),soc.prev());
        $display("next previous element is %0s and its value is %0d ",soc.prev(3),soc.prev(3));
        $display("Last element is %0s and its value is %0d ",soc.last(),soc.last());
    end
endmodule

module enum_using_typedef(
);
    typedef enum {good,bad} pkt;

    pkt a;
    pkt b;
    initial b= {ef,fg,gh,he};
    initial begin    
        for (int i =0 ;i<4 ;i++ ) begin
            $display("%p",a.next(i));
            $display("%p",b.next(i));
        end
    end
    
endmodule