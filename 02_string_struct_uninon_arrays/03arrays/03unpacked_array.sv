module unpacked_array_1D(
);
    byte stackk[8]; //depth=8,wigth =1byte wide variable
    initial begin
      $display("stack = %p",stackk);
      //op here is stack = '{0, 0, 0, 0, 0, 0, 0, 0}
      foreach (stackk[i]) begin
        stackk[i]=$random;
        $display ("Assign %0d to index %0d", stackk[i], i);
      end
      $display("stack = %p",stackk);

    end
    
endmodule

module unpacked_array_2D(
);
    byte stt[2][4] ; //rows:2,cols:4

    initial begin
        $display("%p",stt);
        //op here : '{'{0, 0, 0, 0}, '{0, 0, 0, 0}}

        foreach (stt[i])
          foreach (stt[i][j]) begin
            stt[i][j] = $random;
            // $display ("stack[%0d][%0d] = 0x%0h", i, j, stt[i][j]);
            $display ("stack[%0d][%0d] = %0d", i, j, stt[i][j]);
			end
		
		// Print contents of the stack
		$display ("stt = %p", stt);
        /*op here is :
        # stack[0][0] = 36
        # stack[0][1] = -127
        # stack[0][2] = 9
        # stack[0][3] = 99
        # stack[1][0] = 13
        # stack[1][1] = -115
        # stack[1][2] = 101
        # stack[1][3] = 18
        # stt = '{'{36, -127, 9, 99}, '{13, -115, 101, 18}}
*/
    end
endmodule
