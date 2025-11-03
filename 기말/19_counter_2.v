module counter (q,clk,reset)

output [3:0] q;
input clk, reset;

reg [3:0] state_reg, state_next;

always @(posedge clk , posedge reset)
begin
if (reset)
    q <= 4'b0000;
else
    state_reg <= state_next;
end

always @(*)

begin
if(state_reg<0011)
state_next = state_reg + 1;
else if(state_reg==4'b0011)
state_next = 4'b1111;
else if(state_reg>4'b1100)
state_next = state_reg - 1;
else if(state_reg==4'b1100)
state_next = 4'b0000;
end
assign q = state_reg;
endmodule