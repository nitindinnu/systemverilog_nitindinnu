module struct_example1(
);
  struct{
    string dd;
    bit [3:0] data;
    integer address;
  }  mem;

    initial begin
      $display("default memory = %0p",mem);
      mem.data = 4'd15;
      $display("default memory = %0p",mem);
      mem.address = 10;
      $display("default memory = %0p",mem);
      // intialis=zing the whole struct
      mem = '{"nitin",4'd12,32'd55};
      $display("default memory = %0p",mem);
      // mem = {"nitin",4'd11,32'd54};
      // $display("default memory = %0p",mem); -----> vlog fails
      mem = '{"niti",4'd11,32'd5};
      $display("default memory = %0p",mem);

    end
endmodule

module struct_example02( // struct and union are almostly same
);
    typedef union {
    // string dd; ----> not allowed in union
    bit [15:0] addr;
    integer data;
    }  memory;

    initial begin
      memory mem;
      $display("default memory = %0p",mem);
      mem.addr = 15;
      $display("address updated for memory = %0p",mem);
      mem.data = 30;
      $display("data updated memory = %0p",mem);
    //   // intialis=zing the whole struct
    //   mem = '{"nitin",4'd12,32'd55};
    //   $display("default memory = %0p",mem);
    //   // mem = {"nitin",4'd11,32'd54};
    //   // $display("default memory = %0p",mem); -----> vlog fails
    //   mem = '{"niti",4'd11,32'd45};
    //   $display("default memory = %0p",mem);
    end
endmodule