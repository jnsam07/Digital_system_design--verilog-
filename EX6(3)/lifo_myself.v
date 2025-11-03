module stack (stack_empty, stack_full, data_out, clk, reset, enable, push_pop, data_in);


    output reg stack_empty;  // 스택이 비어있을 때 1
    output reg stack_full;   // 스택이 가득 찼을 때 1
    output [7:0] data_out;   // Pop된 데이터 출력
    input clk;               // 클럭
    input reset;             // 리셋 신호
    input enable;            // 동작 활성화 신호
    input push_pop;          // 1이면 Push, 0이면 Pop
    input [7:0] data_in;      // Push할 데이터


    reg [7:0] stack_array [7:0]; // 8개의 8비트 데이터를 저장
    reg [2:0] stack_ptr_reg, stack_ptr_next;     // 스택 포인터 (3비트: 0~7)
    reg empty_reg, empty_next;
    reg full_reg, full_next;

//rst
always @(posedge clk , posedge reset)
begin
    if(reset)
        stack_array = 0;
        empty_reg <= 1'b1;

    for(i=0;i<8;i++)
        stack_array[i] <= 1'b0;
    else
        begin
            stack_ptr_reg <= stack_ptr_next;
            empty_reg <= empty_next;
            full_reg <= full_next;
        end

    //push operation
    if(~reset & enable & push_pop & ~full_reg)
    stack_array[stack_ptr_reg] <= data_in;
    else if(~reset & enable & ~push_pop & ~full_reg)
    assign data_out <= stack_array[stack_ptr_reg];
    else ;

    //pop operation
end

//state logic

always @(*)
begin
stack_ptr_next = stack_ptr_reg;
full_next = full_reg;
empty_next = empty_reg;

    case({enable,push_pop})
    2'b11:
        if(~full_reg)
        stack_ptr_next = stack_ptr_reg + 1;
        empty_next = 0;
        else if(stack_ptr_reg = 3'b111)
        full_next = 1'b1;

    2'b10:
        if(~empty_reg)
        stack_ptr_next = stack_ptr_reg-1;
        full_next = 1'b0
        else if(stack_ptr_reg = 3'b0)
        empty_next = 1'b1

    default ;

    endcase

assign full_reg = full_next
assign empty_reg = empty_next


end

endmodule