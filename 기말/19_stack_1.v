module stack (pop_data, empty,full,push_data, clk, reset, pop, push);

parameter B = 8;
parameter W = 4;

output [B-1:0] pop_data;
output empty, full;
input [B-1:0] push_data;
input clk, reset, pop, push;

reg [B-1:0] array_reg [2**W-1:0];   reg [2**W-1:0] stack_array [B-1:0] 이거 아닙니다
reg [W-1:0] stack_ptr_reg; stack_ptr_next;
reg full_reg, full_next;
reg empty_reg, empty_next;

//operation and reset

always@(posedge clk , posedge empty)
begin
    if(reset)
    stack_array <= 0;
    else
    begin
    stack_ptr_reg <= stack_ptr_next;
    full
    empty
    end
end

always@(posedge clk)
begin
//write operation
if(push&~full_reg)
    array_reg[stack_ptr_reg] = push_data;


//read operation
if(pop&~empty_reg)
    pop_data =( array[stack_ptr_reg-1]);
else array_reg[2**W-1];

end

always@*
stack_ptr_next = stack_ptr_reg;
full_next = full_reg;
empty_next = empty_reg;
begin
    case({push,pop})
    2'b10:
        if(~full_reg)
        begin
        stack_ptr_next = stack_ptr_reg + 1;
        empty_next = 1'b0;
        end
        else if(stack_ptr_next==(2**W-1))
        full_next = 1'b1;
    2'b01:
        if(~empty_reg)
        begin
        stack_ptr_next = stack_ptr_reg - 1;
        full_next = 1'b0;
        end
        else if(stack_ptr_next==0)
        empty_next = 1'b1;


    endcase


assign full = full_reg;
assign empty = empty_reg;
end


endmodule