class transaction_03;
    string a;
    function void name();
        $display("String a=[%0s]",a);
    endfunction
endclass

module nitin(
);
    transaction_03 nn =new(); //! one ways of object creation
    initial begin
        nn.a="nitin_dinnu";
        nn.name();
    end 
endmodule

// module nitin(
//     );
//     initial begin
//             transaction_03 nn =new(); //! one ways of object creation
//             nn.a="nitin_dinnu";
//             nn.name();
//         end 
//     endmodule

// module nitin(
//     );
//     transaction_03 nn;
//         initial begin
//             nn =new(); //! one ways of object creation
//             nn.a="nitin_dinnu";
//             nn.name();
//         end 
// endmodule

// module nitin(
//     );
//     transaction_03 nn ;
//     nn=new(); //! one ways of object creation but wont work throws error>>>>>
//         initial begin     
//             nn.a="nitin_dinnu";
//             nn.name();
//         end 
// endmodule