class iterr;
    rand byte addr[],data[];

    constraint addr_constr {foreach (addr[i]) addr[i] inside {4,8,12,14};}
    constraint data_constr {foreach (data[k]) data[k] > 4*k ;}
    
    constraint asize{addr.size<4 ;}
    constraint dsize{data.size == addr.size ;}
endclass

module constraint_iter(
    // port_list
);
  

  initial begin
    iterr ab = new();
    $display("---------------------------");
    repeat(5) begin
        ab.randomize();
        $display("\taddr-size = %0d data-size = %0d",ab.addr.size(),ab.data.size());
        
        foreach(ab.addr[i]) $display("\taddr = %0d data = %0d",ab.addr[i],ab.data[i]);
        $display("---------------------------");
    end
  end  
endmodule

// class packet;
//     rand byte addr [];
//     rand byte data [];
  
//     constraint avalues { foreach( addr[i] ) addr[i] inside {4,8,12,16}; }
//     constraint dvalues { foreach( data[j] ) data[j] > 4 * j; }
//     constraint asize   { addr.size < 4; }
//     constraint dsize   { data.size == addr.size; }
//   endclass
  
// module constraint_iter;
//     initial begin
//       packet pkt= new();
  
//       $display("------------------------------------");
//       repeat(2) begin
//         pkt.randomize();
//         $display("\taddr-size = %0d data-size = %0d",pkt.addr.size(),pkt.data.size());
//         foreach(pkt.addr[i]) $display("\taddr = %0d data = %0d",pkt.addr[i],pkt.data[i]);
//         $display("------------------------------------");
//       end
//     end
// endmodule