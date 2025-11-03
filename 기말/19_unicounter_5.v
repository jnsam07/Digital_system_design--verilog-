module U_bin_counter (q_reg,rstb,clkb,clrb,ldb,hdb,upb,d);

output...
input...

reg [7:0] q_next_reg, q_next_next;

always@(negedge clk , negedge rstb)
begin
    if(!rsb)
    q_next_reg <= 0;

    else
    q_next_reg <= q_next_next;
end


always@*
begin
    q_next = q_reg;
    else if(!clrb)
    q_next = 0;
    else if(!ldb)
    q_next = d;
    else if(!hdb)
    q_next = q_next_reg
    else if(!upb)
    q_next = q_next_reg+1;
    else
    q_next = q_next_reg-1;


end
assign q_next = q_next_reg;
endmodule