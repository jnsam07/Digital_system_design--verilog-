module tb_BCD_Add4 (cout,z,x,y,cin);

wire cout
wire [3:0] z;
reg [3:0] x,y
reg cin;

BCD_Add_4   UUT(cout,z,x,y,cin);

initial
    begin
        #10 x=1; y=2;
        #10
        #10
    end

initial
    begin
        #50 $finish;
    end

//response monitor
initial
    begin
        $monitor("time=%2d  x=%4b y=%4b x+y=%5b",$time,x,y{cout,z},);
    end