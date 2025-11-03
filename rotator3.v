module			Barrel_rotator (o, i, s, c, clk);

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
            2'b01:	#20 //o <= o << s
                begin	
					if (s[2]) o = {o[3:0], o[7:4]};
					if (s[1]) o = {o[5:0], o[7:6]};
					if (s[0]) o = {o[6:0], o[7]};
                end
            2'b10:	#20 //o <= o >> s
                begin
					if (s[2]) o = {o[3:0], o[7:4]};
					if (s[1]) o = {o[1:0], o[7:2]};
					if (s[0]) o = {o[0],   o[7:1]};
                end
            2'b11:	#20 o <= i;
            default:	#20 o <= 8'bx;
        endcase
    end

endmodule