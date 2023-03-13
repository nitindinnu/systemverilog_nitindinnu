module encoder_dut(interface_encoder.dut interr);
    always_comb
    begin
      case(interr.i)
        4'b0001 : interr.y=2'b00; //y<=i[0];
        4'b0010 : interr.y=2'b01; //y<=i[1];
        4'b0100 : interr.y=2'b10; //y<=i[2];
        4'b1000 : interr.y=2'b11; //y<=i[3];
        default interr.y=2'bxx;
      endcase
      //or
    // interr.y = (interr.i==4'b0001)? 2'b00 : (interr.i==4'b0010)?2'b01 :(interr.i==4'b0100)? 2'b10 : 2'b11;
      //or
    // interr.y[1]=interr.i[3]|interr.i[2];
    // interr.y[0]=interr.i[3]|interr.i[1];
    display_dut_values();
    end

    function void display_dut_values();
      $display(">>> DUT <<<"); 
      $display("[DUT] output for 2x1mux inter.y0,inter.y1=[%0p]",interr.y);
      $display("-------------------------------------------------------------------------------");
    endfunction 
endmodule