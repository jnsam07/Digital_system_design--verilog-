module rising_edge_detector(tick, clk, reset, level);

output        tick;
input         clk, reset, level;

//reg zero, edg, one
reg [1:0] state_reg, state_next
reg tick;

parameter zero = 2'b00, edg = 2'b01 one = 2'b10

//rst and working
always @(posedge clk , posedge reset)
begin
    if(reset)
    state_reg <= zero;
    else
    state_reg <= state_next;
end


//next_logic
always @(*)
begin
    state_next = state_reg; tick = 0;
    case (state_reg)
    zero:
        if(level)
        state_next = edg;

    edg:
    begin
        tick = 1;
        if(~level)
        state_next = zero;
        else
        state_next = one;
    end

    one:
        if(~level)
        state_next = zero;

    default: state_next = zero;

    endcase
end


endmodule