module bcd_add_4 (cout,z,x,y,cin);

input cin;
input [3:0] x,y;
output [3:0] z;
output cout;

wire n0,n1,n2,n3,k,l,m,o;
supply0 logic0;

add_4       add1(k,{n0,n1,n2,n3},cin,x,y);
add_4       add2(z,o,{logic0,cout,cout,logic0},{n0,n1,n2,n3},logic0);
AND         andL(l,n1,n3);
AND         andM(m,n2,n3);
OR          or1(cout,k,l,m);

endmodule