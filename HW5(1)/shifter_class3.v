module			Barrel_shifter (o, i, s, c, clk);

output	[7:0]	o;
input	[7:0]	i;
input	[2:0]	s;
input	[1:0]	c;
input			clk;

reg		[7:0]	o;
reg		[7:0]	o_t;
reg		[2:0]	t;

always@(posedge clk)
    begin
        case(c)
            2'b00:	#20 o <= o;
            //케이스 두번써서 for 문 안쓸수도 있음
            2'b01:	#20 //o <= o << s
                begin
                     
                    if(s[2]) o = o<<4;//always posedge 안에서는 <= , begin end 안에서는 =.
                    if(s[1]) o = o<<2;
                    if(s[0]) o = o<<1;
                end
            2'b10:	#20 //o <= o >> s
                begin
                    if(s[2]) o = o>>4;
                    if(s[1]) o = o>>2;
                    if(s[0]) o = o>>1;
                end
            2'b11:	#20 o <= i;
            default:	#20 o <= 8'bx;
        endcase
    end

endmodule