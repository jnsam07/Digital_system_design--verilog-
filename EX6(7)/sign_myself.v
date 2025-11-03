module sign_mag_adder (s,a,b)

//para
parameter N = 4

output [N-1:0] s;
input [N-1:0] a,b;

//regi
reg sign_a, sign_b, sign_s;
reg [N-2:0] mag_a, mag_b, mag_1, mag_2, mag_s

always @*
begin
sign_a = a[N-1];
sign_b = b[N-1];
mag_a = a[N-2:0];
mag_b = b[N-2:0];

if(mag_a > mag_b)
begin
mag_1 = mag_a; mag_2 = mag_b; sign_s = sign_a;
end
else
begin
mag_1 = mag_b; mag_2 = mag_a; sign_s = sign_b;
end

if(sign_a == sign_b)
mag_s = mag_1 + mag_2;
else
mag_s = mag_1 - mag_2;

s = {sign_s,mag_s};
end
endmodule