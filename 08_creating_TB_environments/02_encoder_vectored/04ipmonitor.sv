class ipmonitor_encoder;
    transaction_encoder trnx;
    mailbox #(transaction_encoder) im2s;
    virtual interface_encoder.tb interr;
    event e;

    function new(mailbox #(transaction_encoder) im2s,virtual interface_encoder.tb interr,event e);
        this.im2s=im2s;
        this.interr=interr;
        this.e=e;
    endfunction

    task run();
        forever begin
        // @(interr.i/*[0],interr.i[1],interr.i[2],interr.i[3]*/)
        wait(e)
        trnx.i=interr.i;
        // trnx.i[0]=interr.i[0];
        // trnx.i[1]=interr.i[1];
        // trnx.i[2]=interr.i[2];
        // trnx.i[3]=interr.i[3];

        //BFM
        // trnx.y[0]=trnx.i[3]|trnx.i[1];
        // trnx.y[1]=trnx.i[3]|trnx.i[2];
        //or
        begin
        case(trnx.i)
            4'b0001 : trnx.y=2'b00; //y<=i[0];
            4'b0010 : trnx.y=2'b01; //y<=i[1];
            4'b0100 : trnx.y=2'b10; //y<=i[2];
            4'b1000 : trnx.y=2'b11; //y<=i[3];
            default trnx.y=2'bxx;
        endcase
        end
        //or
        // begin
        // trnx.y = (trnx.i==4'b0001)? 2'b00 : (trnx.i==4'b0010)?2'b01 :(trnx.i==4'b0100)? 2'b10 : 2'b11;
        // end
                /*
                # ** Error (suppressible): 04ipmonitor.sv(22): (vlog-2997) Case item comparison:  Cannot assign a packed type 'bit[1:0]' to an unpacked type 'byte $[1:0]'.
        # ** Error (suppressible): 04ipmonitor.sv(22): (vlog-2998) Case item comparison:  Cannot mix packed and unpacked types in this operation.
        # ** Error (suppressible): 04ipmonitor.sv(23): (vlog-2997) Case item comparison:  Cannot assign a packed type 'bit[1:0]' to an unpacked type 'byte $[1:0]'.
        # ** Error (suppressible): 04ipmonitor.sv(23): (vlog-2998) Case item comparison:  Cannot mix packed and unpacked types in this operation.
        # ** Error (suppressible): 04ipmonitor.sv(24): (vlog-2997) Case item comparison:  Cannot assign a packed type 'bit[1:0]' to an unpacked type 'byte $[1:0]'.
        # ** Error (suppressible): 04ipmonitor.sv(24): (vlog-2998) Case item comparison:  Cannot mix packed and unpacked types in this operation.
        # ** Error (suppressible): 04ipmonitor.sv(25): (vlog-2997) Case item comparison:  Cannot assign a packed type 'bit[1:0]' to an unpacked type 'byte $[1:0]'.
        # ** Error (suppressible): 04ipmonitor.sv(25): (vlog-2998) Case item comparison:  Cannot mix packed and unpacked types in this operation.
        # ** Error (suppressible): 04ipmonitor.sv(26): (vlog-2997) Case item comparison:  Cannot assign a packed type 'reg[1:0]' to an unpacked type 'byte $[1:0]'.
                */
                        
        // $display("[BFM]:trnx.out=[%0p]", trnx.y);
        
        im2s.put(trnx);
    end
    $display("[at ipmonitor]");
    endtask
endclass