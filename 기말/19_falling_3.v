module falling (tick,clk,level)

output tick;
input level, tick;
reg tick
reg [1:0] state_reg, state_next;

parameter zero = 2'b00, edg = 2'b01 one = 2'b10

always@(posedge clk)
begin
    if(reset)
    state_reg <= zero;
    else
    state_reg <= state_next;
end

always@(*)
state_next = state_reg;
tick = 0;
begin
    case(state_reg)
    zero:
        if(level)
        state_next = one;
    edg:
        tick = 1;
        if(level)
        state_next = one;
        else
        state_nexy = zero;
    one:
        if(~level)
        state_next = edg;

    endcase
end

endmodule