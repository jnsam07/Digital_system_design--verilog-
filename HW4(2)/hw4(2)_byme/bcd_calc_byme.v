module BCD_Add_Calc (l0,l1,l2,l3,l4,a0,a1,a2,a3);

input [3:0] a0,a1,a2,a3;
input [3:0] b0,b1,b2,b3;
output [6:0] l0,l1,l2,l3;
output L4;

supply0 logic0;
wire c0,c1,c2;
wire [3:0] d0,d1,d2,d3;

BCD_Add_4 ADD1 (co,d0,logic0,a0,b0);
BCD_Add_4 ADD2 (co,d0,logic0,a0,b0);
BCD_Add_4 ADD3 (co,d0,logic0,a0,b0);
BCD_Add_4 ADD4 (co,d0,logic0,a0,b0);

BCD_LED_7 LED1 (l0,d0[0],d0[1],d0[2],d0[3]);
BCD_LED_7 LED1 (d0,l0);
BCD_LED_7 LED1 (d0,l0);
BCD_LED_7 LED1 (d0,l0);

endmodule