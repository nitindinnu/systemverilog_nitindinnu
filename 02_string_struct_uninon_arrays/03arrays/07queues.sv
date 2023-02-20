module queues_01(
);
    string fruits[$] = { "orange", "apple", "lemon", "kiwi" };;

    initial begin
        //using for each to access individual elements
        foreach (fruits[i]) 
    		$display ("fruits[%0d] = %s", i, fruits[i]);

        // displaying all elements
        $display ("fruits = %p", fruits);

        // Select a subset of the queue
		$display ("subset citrus fruits = %p", fruits[1:2]);

        // Get elements from index 1 to end of queue
		$display ("index 1 to end fruits = %p", fruits[1:$]);

        // Add element to the end of queue
		fruits[$+1] = "pineapple";
		$display ("adding pineapple to fruits = %p", fruits);

        // Delete first element
		$display ("Remove orange, fruits = %p", fruits[1:$]);

        //deleting all elements
        fruits = {};
      	$display ("After deletion, fruits = %p", fruits);
        /*
Loading work.queues_01(fast)
# fruits[0] = orange
# fruits[1] = apple
# fruits[2] = lemon
# fruits[3] = kiwi
# fruits = '{"orange", "apple", "lemon", "kiwi"}
# subset citrus fruits = '{"apple", "lemon"}
# index 1 to end fruits = '{"apple", "lemon", "kiwi"}
# adding pineapple to fruits = '{"orange", "apple", "lemon", "kiwi", "pineapple"}
# Remove orange, fruits = '{"apple", "lemon", "kiwi", "pineapple"}
# After deletion, fruits = '{}
        */
    end
endmodule

module queues_methods(
);
    int nums[$] = {2,3,5,7,9};

    initial begin
        //get size
        $display("Number of nums %0d nums =%0p",nums.size(),nums);
        //insert a num at index 1
        nums.insert(1,1);
        $display("inserting 1 at 1st index, Number of nums %0d nums =%0p",nums.size(),nums);
        //delete at index 3
        nums.delete (3);
        $display("deleting 3rd index value Number of nums %0d nums =%0p",nums.size(),nums);
        //pop_front -pop out element at the front
        $display("poping from 0th index ,pop %d ,size %0d nums =%0p",nums.pop_front(),nums.size(),nums);
        //push front
        nums.push_front(0);
        $display("pushing 0 element from 0th index,Number of nums %0d nums =%0p",nums.size(),nums);
        //pop_back()
        $display("poping from last index ,pop %d ,size %0d nums =%0p",nums.pop_back(),nums.size(),nums);
        //push_back
        nums.push_back(9);
        $display("pushing 9 element at last index,Number of nums %0d nums =%0p",nums.size(),nums);
/*
# Loading work.queues_methods(fast)
# Number of nums 5 nums =2 3 5 7 9
# inserting 1 at 1st index, Number of nums 6 nums =2 1 3 5 7 9
# deleting 3rd index value Number of nums 5 nums =2 1 3 7 9
# poping from 0th index ,pop           2 ,size 4 nums =1 3 7 9
# pushing 0 element from 0th index,Number of nums 5 nums =0 1 3 7 9
# poping from last index ,pop           9 ,size 4 nums =0 1 3 7
# pushing 9 element at last index,Number of nums 5 nums =0 1 3 7 9
*/
    end
endmodule