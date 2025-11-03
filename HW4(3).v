module add_4 (CO, C, A,B,CI);

out CO;
output [3:0] C;
input [3:0] A,B;
input CI;
//reg CO;
//reg [3:0] C;

assign {C0,C} = A + B + CI ;

endmodule

