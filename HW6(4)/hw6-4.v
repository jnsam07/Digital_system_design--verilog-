module u_b_counter (q,pn,clrb,ldb,hdb,upb,rstb,clkb,d)

output [3:0] q;
output pn;
input [3:0] d;
input clrb,ldb,hdb,upb,rstb,clkb;

always@ (negedge clkb)
    begin
        q_
    end

always@*
    begin
        if (rstb == 0)
            q = 0;
        else

    end

always@(negedge clkb)
        assign pn = ((q==2 || q==3 || q==5 || q==7 || q==11 || q==13 || q==15) ? 1:0);