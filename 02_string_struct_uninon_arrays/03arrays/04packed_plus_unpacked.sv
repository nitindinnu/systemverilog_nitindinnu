module packed_plus_unpacked(
);
    bit [3:0][7:0] 	dd [2][4]; 		// 2 rows, 4 cols
	
	initial begin
		// Assign random values to each slot of the dd
		foreach (dd[i])
          foreach (dd[i][j]) begin
            dd[i][j] = $random;
            // $display ("dd[%0d][%0d] = 0x%0h", i, j, dd[i][j]);
            $display ("dd[%0d][%0d] = %0d", i, j, dd[i][j]);
			end
		
		// Print contents of the dd
		$display ("dd = %p", dd);
		
		// Print content of a given index
        // $display("dd[0][0][2] = 0x%0h", dd[0][0][2]);
        $display("dd[0][0][2] = %0d", dd[0][0][2]);

/*
# Loading work.packed_plus_unpacked(fast)
# dd[0][0] = 303379748
# dd[0][1] = 3230228097
# dd[0][2] = 2223298057
# dd[0][3] = 2985317987
# dd[1][0] = 112818957
# dd[1][1] = 1189058957
# dd[1][2] = 2999092325
# dd[1][3] = 2302104082
# dd = 
'{
    '{'{18, 21, 53, 36}, '{192, 137, 94, 129}, '{132, 132, 214, 9}, '{177, 240, 86, 99}     }, 
    '{'{6, 185, 123, 13}, '{70,223, 153, 141}, '{178, 194, 132, 101}, '{137, 55, 82, 18}    }
}
# dd[0][0][2] = 21
*/
    end
endmodule