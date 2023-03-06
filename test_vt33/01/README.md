# Questions practical
1. [write an svcode for an array in ascending and descending order without usng any inbuilt methodds](<00asc_desc_noinbuilt.sv>)
2. [write an svcode for dynamic array and implement all array reduction methods in it](<01array_reduction_method.sv>)
3. [write an svcode to demonstrate the fork-join,join_any,join_none](<02_fork_join.sv>)
4. [write an svcode for mailbox and use all datatypes for put and get methods of mailbox](03_maiboxn.sv)
5. [write an svcode where ther are 5 processes running parallely using semaphore,make sure that all proceses are executed](04_semphoree.sv)
# questions Theory
1. What is Testbench ? write about any three types of testbenches with examples
2. Q
	1. what are features of sv
	2. difference b/w verilog and sv
3. Explain TB architecture
4. analyze the code and expect the output
```
module test(
);
    string street[$];
    initial begin
        street ={"Tejon","Bijou","Boulder"};
        $display("street[0] =%0s",street[0]);
        street.insert(2,"Platte");
        $display("street[2] =%0s",street[2]);
        street.push_front("st.vrain");
        $display("street[2] =%0s",street[2]);
        $display("pop_back=%0s",street.pop_back);
        $display("street.size=%0d",street.size);

    end
endmodule
```
5. write about 
	1. union and structure
	2. unique_if and priority_if
	3. while and do-while
	4. repeat and forever
	5. enhaced for loop