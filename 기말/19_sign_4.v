module sign (s,a,b);

parameter N = 4

output [N-1:0] s;
input [N-1:0] a, b;

reg [N-1] sign_a, sign_b, sign_s;
reg [N-2:0] mag_a, mag_b, mag_1, mag_2, mag_s;

always @(*)
begin
    mag_a = a[N-2:0];
    mag_b = b[N-2:0];
    sign_a = a[N-1]; sign_b = b[N-1];

    if(mag_a>mag_b) begin
    mag_1 = mag_a; mag_2 = mag_b; sign_s = sign_a;
    else
    mag_1 = mag_b; mag_2 = mag_a; sign_s = sign_b;
    end

    if(sign_a==sign_b) begin
        mag_s = mag_1 + mag_2;
    end
    else
        mag_s = mag_1 - mag_2;


end

assign s = {sign_s,mag_s};

endmodule