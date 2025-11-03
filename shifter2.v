module			Barrel_shifter (o, i, s, c, clk);

output	[7:0]	o;
input	[7:0]	i;
input	[2:0]	s;
input	[1:0]	c;
input			clk;

reg		[7:0]	o;
reg		[2:0]	t;

always@(posedge clk)
    begin
        case(c)
            2'b00:	#20 o <= o;
            2'b01:	#20 //o <= o << s
                begin
                    case(s)
						3'b000: o <= o;
						3'b001: o <= o<<1; // o <= {o[6:0], 1'b0};
						3'b010: o <= o<<2; // o <= {o[5:0], 2'b00};
						3'b011: o <= o<<3; // o <= {o[4:0], 3'b000};
						3'b100: o <= o<<4; // o <= {o[3:0], 4'b0000};
						3'b101: o <= o<<5; // o <= {o[2:0], 5'b00000};
						3'b110: o <= o<<6; // o <= {o[1:0], 6'b000000};
						3'b111: o <= o<<7; // o <= {o[0]  , 7'b0000000};
						default: o <= o;
					endcase
                end
            2'b10:	#20 //o <= o >> s
                begin
				    case(s)
 						3'b000: o <= o;
						3'b001: o <= o>>1; // o <= {1'b0, o[7:1]};
						3'b010: o <= o>>2; // o <= {2'b00, o[7:2]};
						3'b011: o <= o>>3; // o <= {3'b000, o[7:3]};
						3'b100: o <= o>>4; // o <= {4'b0000, o[7:4]};
						3'b101: o <= o>>5; // o <= {5'b00000, o[7:5]};
						3'b110: o <= o>>6; // o <= {6'b000000, o[7:6]};
						3'b111: o <= o>>7; // o <= {7'b0000000, o[7]};
						default: o <= o;
					endcase	
                end
            2'b11:	#20 o <= i;
            default:	#20 o <= 8'bx;
        endcase
    end

endmodule