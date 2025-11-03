 module 6_4 (q,pn,d,clrb,ldb,hdb,upb,rstb,clkb)

output [3:0] q;
output pn;
input [3:0] d;
input clrb,ldb,hdb,upb,rstb,clkb;

reg [3:0] q_reg, q_next;

//operation method
always @(negedge clk , negedge rstb)

if(!rstb)
    q_reg <= 4'b0;

else
q_reg <= q_next;


//state logic
always @*
begin
    q_next = q_reg;

    if (!clrb)
    q_next = 0;

    else if (!ldb)
    q_next = d;

    else if (!hdb)
    q_next = q_reg;

    else if (!upb)
    q_next = q_reg + 1;

    else
    q_next = q_reg - 1;

assign q = q_reg
assign pn = (q_reg == (2'b-1 wemfpasm ))
end

endmodule