module #6 (f,a,b,s);

output [7:0] f;
input [7:0] a,b;
input [1:0] s;
reg f;

always @*
    begin
        if (s[4])
            if(s[3])
            case (s[2:0])
            3'b000 : f = a;
            3'b001 : f = a+b;
            3'b..

            endcase
            else f=0; //reset


        else
            case (s[3:2])
            3'b00 : f = a << (s[1:0]);
            3'b01 : f = a >> (s[1:0]);
            3'b10 : f = {a[7],a[6:0] << (s[1:0])};
            3'b11 : f = {a[7],a[7:1] >> (s[1:0])};
    end

endmodule