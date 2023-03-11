class transaction;
  rand bit [7:0] a, b;
  rand bit cin;
  bit [7:0] sum;
  bit cout;
  constraint c1 { sum == (a + b + cin); }
  constraint c2 { cout == ((a + b + cin) > 255); }
endclass

class test_sequence;
  rand int unsigned num_transactions;
  transaction trans;
  function void pre_randomize();
    num_transactions = 10;
  endfunction
endclass

class driver;
  virtual interface full_adder_if intf;
  task run();
    test_sequence ts;
    repeat (ts.num_transactions) begin
      assert(intf.write(trans)); // Send transaction to interface
      // Wait for response from monitor
      repeat (10) begin
        if (intf.ack()) break;
        #1;
      end
      trans = intf.read(); // Get transaction from interface
    end
  endtask
endclass

class monitor;
  virtual interface full_adder_if intf;
  task run();
    transaction trans;
    repeat (20) begin
      trans = intf.read(); // Wait for transaction on interface
      // Check transaction for errors or violations
      if (trans.sum != (trans.a + trans.b + trans.cin)) $error("Incorrect sum");
      if (trans.cout != ((trans.a + trans.b + trans.cin) > 255)) $error("Incorrect carry-out");
      intf.write(trans); // Send transaction back to driver
    end
  endtask
endclass

class scoreboard;
  virtual interface full_adder_if intf;
  task run();
    transaction trans;
    repeat (10) begin
      trans = intf.read(); // Wait for transaction on interface
      // Check transaction for errors or violations
      if (trans.sum != (trans.a + trans.b + trans.cin)) $error("Incorrect sum");
      if (trans.cout != ((trans.a + trans.b + trans.cin) > 255)) $error("Incorrect carry-out");
      // Score the test
      if ($error_count) $display("Test %0d: FAIL", $test_num);
      else $display("Test %0d: PASS", $test_num);
      $finish; // End the simulation
    end
  endtask
endclass

class top;
  full_adder_if intf;
  test_sequence ts;
  driver drv;
  monitor mon;
  scoreboard sb;
  initial begin
    intf = new();
    drv = new();
    mon = new();
    sb = new();
    drv.intf = intf;
    mon.intf = intf;
    sb.intf = intf;
    ts = new();
    // Generate and run the test sequence
    ts.randomize();
    drv.run();
    mon.run();
    sb.run();
  end
endclass

interface full_adder_if;
    logic [7:0] a;
    logic [7:0] b;
    logic cin;
    logic [7:0] sum;
    logic cout;
    
    // Methods for driving and capturing transactions
    virtual task write(input logic [7:0] a, input logic [7:0] b, input logic cin);
      $fatal("write method not implemented in interface");
    endtask
    virtual function logic ack();
      $fatal("ack method not implemented in interface");
    endfunction
    virtual function automatic logic [7:0] read();
      $fatal("read method not implemented in interface");
    endfunction
endinterface
  

module testbench;
  top tb;
  initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(0, testbench);
    #100 $finish;
  end
endmodule

module full_adder (
    input logic [7:0] a,
    input logic [7:0] b,
    input logic cin,
    output logic [7:0] sum,
    output logic cout
  );
    // Logic for computing the sum and carry-out
    assign {cout, sum} = a + b + cin;
endmodule
  
