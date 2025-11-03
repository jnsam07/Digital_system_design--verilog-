module shifter (o,l,c,s,clk)

input clk;
input [7:0] i;
input [1:0] c;
input [2:0] s;
output [7:0] o;

reg [7:0] o;
reg [7:0] o_t;
reg [2:0] t;

always @(posedge clk)
    begin
        case (c)
                2'b00 : #20 o <= o;

                2'b01 : #20 // o=o<<s
                begin
                    o_t <= o;
                    for(t=0;t<s;t=t+1)
                        o_t = {o[6:0],1'b0};
                    o <= o_t;
                end

                2'b10 : #20 // o=0>>s
                begin
                    o_t <= o;
                    for(t=0;t<s;t=t+1)
                        o_t = {1'b0,o[7:1]};
                    o <= o_t;
                end
                2'b11 : #20 o <= i;
            default : o <= 8'bx
        endcase

    end