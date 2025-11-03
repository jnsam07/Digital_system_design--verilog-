module test_shifter (o,i,c,s,clk);

reg [7:0] i;
reg [1:0] c;
reg [2:0] s;
reg clk;
wire [7:0] o;



shifter UUT(o,i,c,s,clk);

always //pulse
    begin
        #0 clk = 0;
        #50 clk = 1;
        #50 ;
    end

initial
    begin
        #0 i = 8'b10101010; c = 2'b11; s = 3'b010
        #100 c = 2'b01;
        #100 
    end

initial
    #1200 $finish;


initial
begin
$monitor ("time=%2d i=%8b c=%2b s=%3b o=%8b",$time,i,c,s,o)
end

endmodule
