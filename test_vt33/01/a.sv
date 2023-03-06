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

/*
# street[0] =Tejon
# street[2] =Platte
# street[2] =Bijou
# pop_back=Boulder
# street.size=4
*/