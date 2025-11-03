module test_bcd_add_4;



bcd_add_4 M1 (C_OUT,X,Y,Z,C_IN);

initial
begin
    #10 x=1;y=2;
    #10 x=7;y=3;
    #10 x=8;y=5;
    #10 x=9;y=9;
    #10 $finish;
end

initial
// Response monitor
initial
    begin
        $monitor("time=%2d	X=%4b	Y=%4b X+Y=%5b", $time, x, y, {c_out, z});
        //%1%4 하면 각각따로 내보내겠다는 뜻
    end

endmodule