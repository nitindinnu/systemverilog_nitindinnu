module enhanced_for_loop01(
);
    initial begin
        //enhanced for loop
        for(int j=0,i=7;j<8;j++,i--)begin //int i=0,j=0  ;i<7,j<3 ;i++,j++ -->cant use in this way
            // arr[i][j]=$random;
            $display("i = %0d,j= %0d",i,j);
/*
# Loading work.enhanced_for_loop01(fast)
# i = 7,j= 0
# i = 6,j= 1
# i = 5,j= 2
# i = 4,j= 3
# i = 3,j= 4
# i = 2,j= 5
# i = 1,j= 6
# i = 0,j= 7
*/            
        end
        $display("--------------");
        for (int i=0,j=0 ;i<7 ;i++,j++) begin
           $display("i = %0d,j= %0d",i,j); 
        end
/*
# i = 0,j= 0
# i = 1,j= 1
# i = 2,j= 2
# i = 3,j= 3
# i = 4,j= 4
# i = 5,j= 5
# i = 6,j= 6
*/
    end
    
endmodule