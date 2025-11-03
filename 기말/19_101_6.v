module reduce101 (out, in, clk, reset)

....
reg[1:0] state_reg, state_next;
reg out;

parameter s0 = 2'b00, s1 = 2'b01, s10 = 2'b10, s101 = 2'b11; 

//working and rst
always@(posedge clk, posedge reset)
begin
    if(reset)
    state_reg <= s0;
    else
    state_reg <= state_next;
end

always@*
begin
    state_next=state_reg;
    out=0;
    case(state_reg)
    s0:
        if(in)
        next_state = s1;
    s1:
        out = 1;
        if(~in)
        next_state = s10;
    s10:
        if(in)
        next_state = s101
        else
        next_state = s0;
    s101:
        if(in)
        next_state = s1;
        else if(~in)
        next_state = s0;
    default: s0;

    endcase
end

endmodule