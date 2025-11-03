module add_4 (C_OUT,z,x,y,C_IN);

input C_IN;
input [3:0] x, y;
output C_OUT;
output [3:0] z;

assign {C_OUT,z} = x + y + C_IN;

endmodule