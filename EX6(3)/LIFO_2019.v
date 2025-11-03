module stack (pop_data, empty, full, push_data, clk, reset, pop, push);
//parameters
parameter B = 8; // number of bits in a word
parameter W = 4; // number of address bits
// inputs and outputs
output [B-1:0] pop_data;
output empty, full;
input [B-1:0] push_data;
input clk, reset;
input pop, push;
// registers, arrays, pointers, status flags
reg [B-1:0] array_reg [2**W-1:0];
reg [W-1:0] stack_ptr_reg, stack_ptr_next;
reg full_reg, full_next;
reg empty_reg, empty_next;

// state register always@(posedge clk, posedge reset)
if (reset)
    begin
        stack_ptr_reg <= 0;
        full_reg <= 1'b0;
        empty_reg <= 1'b1; // initial state is empty
    end
else
begin 
    stack_ptr_reg <= stack_ptr_next;
    full_reg <= full_next;
    empty_reg <= empty_next;
end
// write operation always@(posedge clk)

if (push&(~full_reg)) // write enabled, stack not full
array_reg[stack_ptr_reg] <= push_data;

// read operation
assign pop_data = ((stack_ptr_reg == 0) ? array_reg[2**W-1] : array_reg[stack_ptr_reg-1]);

// next-state logic
always@*
begin // default values stack_ptr_next = stack_ptr_reg;
full_next = full_reg;
empty_next = empty_reg;

// read or write
case({push,pop}) 2'b01: // pop
    if (~empty_reg) // if stack not empty
    begin
        stack_ptr_next = stack_ptr_reg - 1;
        full_next = 1'b0; // after pop, stack is not full
        if (stack_ptr_next == 0) // when stack pointer reaches bottom
        empty_next = 1'b1;
    end 2'b10: // push
    if (~full_reg) // if stack not full
    begin
        stack_ptr_next = stack_ptr_reg + 1;
        empty_next = 1'b0; // after push, stack is not empty
        if (stack_ptr_next == 0) // when stack pointer reaches top
        full_next = 1'b1;
    end
2'b11: // pop and push
; // stack pointer remains unchanged
default: // default
; // stack pointer remains unchanged
endcase
end
// output logic
// rd_data is already described in ищ
assign full = full_reg;
assign empty = empty_reg;
endmodule