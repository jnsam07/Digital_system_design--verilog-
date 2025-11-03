module test_bcd_calc (l0,l1,l2,l3,l4,a0,a1,a2,a3,b0,b1,b2,b3)

reg ()

initial
    begin
        #10 a3 = 1; a2=2; a1=3; a0=4; b3=4; b2=3; b1=2; b0=1;
        #10
        #10
        #10
    end

initial
        #50 $finish;


initial
    begin
        $monitor ("time=%2d A=%1d%1d%1d%1d B=%4d L=%1b %7b %7b %7b %7b",
        $time, a3, a2, a1, a0, b3, b2, b1, b0, l4, l3, l2, l1, l0);
    end

endmodule
