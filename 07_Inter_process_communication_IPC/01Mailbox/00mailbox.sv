/*
!bounded mailbox :A bounded mailbox is with the size defined
!unbounded mailbox  :Unbounded mailboxes are with unlimited size.
!generic mailbox :The default mailbox is (type-less). that is, a single mailbox can send and receive data of any type
            !mailbox mailbox_name;
!parameterized mailbox :Parameterized mailbox is used to transfer a data of particular type.
            ! mailbox#(type) mailbox_name;
*/
module mailbox01_generic(
);
    mailbox mbx01 = new(3); //!creating a generic mailbox

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
        //!get vars declaration
        int value;
        int z;
        string name;
        //!put vars declaration
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

module mailbox2_param(
);
mailbox #(string) mbx01 = new(3); //!creating a generic mailbox bounded

initial begin
    fork
        process_B_GET();
        process_A_PUT(); //!calling two processes parallely using fork join
    join
end

task automatic process_A_PUT(); //! put data into mailbox 
    int value=5,z =10;
    string name ="Nitindinnu";
    string batch ="vt33";
    string place = "vlsi_first";

    // mbx01.put(value);
    // mbx01.put(z);
    mbx01.put(name);
    mbx01.put(batch);
    mbx01.put(place);
    $display("put data [value] = %0d",value);
    $display("put data [z] = %0d",z);
    $display("put data [name] = %0s",name);
    $display("put data [name] = %0s",batch);
    $display("put data [name] = %0s",place);
endtask

task process_B_GET(); //! get data from mailbox
    
    static string name;
    static string batch;
    static string place;
    /*
    static string value;
    static string z;
    $display("put data [value] = %0d",value);
    $display("put data [z] = %0d",z);
    mbx01.get(value);
    mbx01.get(z);
    !if we use datatype other than specified parameterized datatype then the block doesn't get execcuted totally
    */
    mbx01.get(name);
    mbx01.get(batch);
    mbx01.get(place);
    
    $display("get data [name] = %0s",name);
    $display("get data [name] = %0s",batch);
    $display("get data [name] = %0s",place);
/*
# put data [value] = 5
# put data [z] = 10
# put data [name] = Nitindinnu
# put data [name] = vt33
# put data [name] = vlsi_first
# get data [name] = Nitindinnu
# get data [name] = vt33
# get data [name] = vlsi_first    
    */
endtask
endmodule