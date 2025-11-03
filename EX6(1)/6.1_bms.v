module fp_adder (signout, expout, fracout, sign1, exp1, frac1, sign2, exp2, frac2);

// inputs and outputs
input		sign1, sign2;
input 	[3:0]	exp1, exp2;
input 	[7:0]	frac1, frac2;
output 		signout;
output 	[3:0]	expout;
output	[7:0]	fracout;

reg signout;
reg [3:0] expout;
reg [7:0] fracout;

//working variables
reg sign_b, sign_s;
reg [3:0] exp_b, exp_s, expdiff, expn;
reg [7:0] fracb, fracs, fraca, sumnorm, fracn;
reg [8:0] sum;
reg [2:0] lead0;

//sort
always @(*)
begin
    if({exp1,frac1}>{exp2,frac2}) begin
    exp_b = exp1; exp_s = exp2;
    fracb = frac1; fracs = frac2;
    sign_b = sign1; sign_s = sign2;
    end
    else begin
    exp_b = exp2; exp_s = exp1;
    fracb = frac2; fracs = frac1;
    sign_b = sign2; sign_s = sign1;
    end



    //align
    expdiff = exp_b - exp_s;
    fraca = fracs >> expdiff;


    //add
    if(sign_b == sign_s)
    sum = fracb + fraca;
    else
    sum = fracb - fraca;

    //normalize
begin
    if (sum[7]) lead0 = 3'o0;
    else if (sum[6]) lead0 = 3'o1;
    else if (sum[5]) lead0 = 3'o2;
    else if (sum[4]) lead0 = 3'o3;
    else if (sum[3]) lead0 = 3'o4;
    else if (sum[2]) lead0 = 3'o5;
    else if (sum[1]) lead0 = 3'o6;
    else             lead0 = 3'o7;
end

//fracn
sumnorm = sum << lead0;

begin
    if(sum[8])
    begin
    fracn = sum[8:1];
    expn = exp_b + 1;
    end

    else if(sum<lead0) begin
    fracn = 0;
    fracn = 0;
    end

    else begin
        fracn = sumnorm;
        expn = exp_b - lead0;
    end

assign    expout = expn;
assign    fracout = fracn;
assign  signout = signb;

end

    //jisu jisusame add,sub normalize
end
endmodule