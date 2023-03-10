class packet;
  
  
    //rand bit Clear_in;
    
    //rand bit WClk;
    randc bit WriteEn_in;
    rand bit  [31:0] Data_in;
    bit [31:0] p_data_in;
    //rand bit RClk;
    randc bit ReadEn_in;
    
    
    
    constraint inc_Data_in; 
    constraint unic_Data_in; 
    constraint ts_const; 
  
    extern function void post_randomize ();
    
  endclass
    function void packet :: post_randomize();
    p_data_in=Data_in;
    endfunction
  
  
  ///writing constraint outside 
    constraint packet::inc_Data_in {Data_in inside {[10:0]};}
    constraint packet::unic_Data_in {unique {Data_in} ;}
    // constraint packet::post_const{Data_in!=p_data_in;}
  
  
  
  
  module fifo_coverage;
  bit clk;
  packet pkt=new();
                  
  ///////////////// fifo dummuy coverage ????????????????????????????????
      covergroup cg @(posedge clk);
        // 1) automatic or implicit bins
        
            //c1:coverpoint pkt.Clear_in;
        
            //c2:coverpoint pkt.WClk;
            
            c3:coverpoint pkt.WriteEn_in;
            
            c4:coverpoint pkt.Data_in;
        
        
            //c5:coverpoint pkt.RClk;
            c6:coverpoint pkt.ReadEn_in;
        
        // 2) cross coverage 
            
            //c1Xc2:cross c3,c4,c6;
             
             
        // 3) explicit bins          
        
        /* c4:coverpoint pkt.Data_in {bins b1 ={0,[3:1]};
                        bins b2 ={4,5};
                        bins b3 ={8,9};
                        bins b4 =default;} */
      
      endgroup : cg
        
    always #5 clk=~clk;
    initial begin
        clk=0;
        cg c=new();
        repeat(5) begin
            pkt.randomize();
            c.sample();
        end
  endmodule