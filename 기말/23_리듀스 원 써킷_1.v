module reduce_moore (out, in, reset, clk);
output out;
input in;
input reset;
input clk;

reg [1:0] state_reg, state_next;
reg out;

parameter zero = 2'b00, one1 = 2'b01 two1s = 2'b10

always @(posedge clk , posedge resset)
begin
if (reset)
begin
    state_reg <= zero;
end
else
state_reg <= state_next;
end


always @(*)
state_next = state_reg; out = 0;
begin
    case(state_reg)
    zero:
        if(in)
        next_state = one1;
    one1:
        if(~in)
        next_state = zero;
        else
        next_stae = two1s;
    two1s:
    begin
        out = 1;
        if(~in)
        next_state = zero;
    end
    endcase

end

endmodule





module reduce_mealy (out, in, reset, clk);
output out;
input in;
input reset;
input clk;

reg state_reg, state_next;
reg out;

parameter zero = 1'b0, one1 = 1'b1

always@(posedge clk , posedge reset)
begin
    if(reset)
    state_reg <= zero;
    else
    state_reg <= state_next;

end

always@(*)
begin
    state_next=state_reg;
    out = 0;
    case(state_reg)
    zero:
        if(in)
        next_state = one1;
    one1:
        if(in)
        out = 1;
        else
        next_state = zero;
    default:
    state_next = zero;
    endcase
end

endmodule