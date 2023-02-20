module while_dowhile(
);
reg[3:0] count=0;

    initial begin
        //while
        while (count<3) begin
            $display("only while count =%0d",count);
            // count=count+1;
            count++;
            if (count==13) begin
                break; //jump stmnt
            end
        end
    end 
    initial begin
        //do-while
        #1;
        do begin
            $display("do while count =%0d",count);
            // count=count+1;
            count++;
        end
        while (count<5); //jump stmnt
    end
endmodule
/*
# Loading work.while_dowhile(fast)
# only while count =0
# only while count =1
# only while count =2
# do while count =3
# do while count =4
*/