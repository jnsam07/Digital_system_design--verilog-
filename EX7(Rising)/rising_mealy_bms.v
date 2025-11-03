module rising_edge_detector(tick, clk, reset, level);

output        tick;
input         clk, reset, level;

reg [1:0] state_reg, state_next;
reg tick;

parameter zero = 1'b0, one = 1'b1;

///rst and dongjak
always @(posedge clk posedge reset)
begin
    if (reset)
    state_reg <= zero;
    else
    state_reg <= state_next;
end

always @*
begin
//chogihwa
state_next = state_reg;
tick = 0;

begin
    case (state_reg)
    zero:
        if(level)
        begin
            tick = 1;
            next_state = one;
        end
    one:
        if(~level)
        next_state = zero;
    
    default: state_reg = zero;
    endcase

end


end
endmodule