module mailbox01(
);
    mailbox mbx01 = new(3); //!creating a mailbox

    initial begin
        fork
            process_B_GET();
            process_A_PUT(); //!calling two processes parallely using fork join
        join
    end

    task process_A_PUT(); //! put data into mailbox 
        static int value=5,z =10;
        static string name ="Nitindinnu";
        mbx01.put(value);
        mbx01.put(name);
        mbx01.put(z);
        $display("put data [value] = %0d",value);
        $display("put data [z] = %0d",z);
        $display("put data [name] = %0s",name);
    endtask

    task process_B_GET(); //! get data from mailbox
        int value;
        int z;
        string name;
        static string  name1="avinash";
        static int value1=8;
        static int z1 =3;
        mbx01.get(value);
        mbx01.get(name);
        mbx01.get(z);
        $display("get data [value] = %0d",value);
        $display("get data [z] = %0d",z);
        $display("get data [name] = %0s",name);
        
        mbx01.put(name1);//! adding put into mbx01 after getting 
        mbx01.put(value1);
        mbx01.put(z1);
        $display("put data [name] = %0s",name1);
        $display("put data [value] = %0d",value1);
        $display("put data [z] = %0d",z1);
/*
 put data [value] = 5
# put data [z] = 10
# put data v[name] = Nitindinnu
# get data [value] = 5
# get data [z] = 0 //! 29 line commented i.e mbx01.get(z)
# get data v[name] = Nitindinnu 
------------
# put data [value] = 5
# put data [z] = 10
# put data v[name] = Nitindinnu
# get data [value] = 5
# get data [z] = 10  //! 29 line uncommented i.e mbx01.get(z)
# get data v[name] = Nitindinnu
! put get can be executed only once ,if we wish to read/get data from mailbox after 1st read it wont be working
# put data [value] = 5
# put data [z] = 10
# put data [name] = Nitindinnu
# get data [value] = 5
# get data [z] = 10
# get data [name] = Nitindinnu
# put data [name] = avinash
# put data [value] = 8
# put data [z] = 3
*/
    endtask
endmodule