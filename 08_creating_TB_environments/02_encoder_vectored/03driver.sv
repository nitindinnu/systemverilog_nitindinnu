class driver_encoder;
    transaction_encoder trnx;
    mailbox #(transaction_encoder) g2d;
    virtual interface_encoder.tb interr;
    event e;

    function new(input mailbox #(transaction_encoder) g2d,input virtual interface_encoder interr,input event e);
        this.g2d=g2d;
        this.interr=interr;
        this.e = e;
    endfunction

    task run();
        #1;
        forever begin
            g2d.get(trnx);
            display_driverclass("DRIVER-CLASS");
            interr.i[0]=trnx.i[0];
            interr.i[1]=trnx.i[1];
            interr.i[2]=trnx.i[2];
            interr.i[3]=trnx.i[3];
            display_interface_data("driver-interface");
        end
        ->e;
    endtask

    function void display_driverclass(string a);
        $display(">>>%0s<<<",a);
        $display("[driver] : Data sent from mailbox to driver");
        $display("[mailbox to driver]: Data collected by driver is i[0],i[1],i[2]=i[3]=[%0p] \\ y[0],y[1]=[%0p]",trnx.i,trnx.y);
    endfunction

    function void display_interface_data(string a);
        $display("\n[%0s]: Data collected by interface is is i[0],i[1],i[2]=i[3]=[%0p] \\ y[0],y[1]=[%0p]",a,interr.i,interr.y);
        $display("----------------------------------------------------------------------------------------------");
    endfunction
    
endclass

//--------------------------------

// class driver_encoder;
//     transaction_encoder trnx;
//     mailbox #(transaction_encoder) g2d;
//     virtual interface interface_encoder.tb interr;
//     // event e;

//     function new(input mailbox #(transaction_encoder) g2d,input virtual interface interface_encoder.tb interr/*,input event e*/);
//         this.g2d=g2d;
//         this.interr=interr;
//         // this.e = e;
//     endfunction

//     task run();
//         forever begin
//             g2d.get(trnx);
//             $display(">>>DRIVER CLASS<<<");
//             $display("\n [driver] : Data sent from mailbox to driver");
//             $display("[mailbox to driver]: Data collected by driver is i[0]=%0d,i[1]=%0d,i[1]=%0d,i[2]=%0d,y[0]=%0d,y[1]=%0d",trnx.i[0],trnx.i[1],trnx.i[2],trnx.i[3],trnx.y[0],trnx.y[1]);
//             interr.i=trnx.i;
//             // interr.i[0]=trnx.i[0];
//             // interr.i[1]=trnx.i[1];
//             // interr.i[2]=trnx.i[2];
//             // interr.i[3]=trnx.i[3];
//             //
//             $display("[driver interface]: Data collected by interface is is i[0]=%0d,i[1]=%0d,sel=%0d,out=%0d",interr.i[0],interr.i[1],interr.i[2],interr.i[3],interr.y[0],interr.y[1]);
//             $display("----------------------------------------------------------------------------------------------");
//         end
//         // ->e;
//     endtask
    
// endclass