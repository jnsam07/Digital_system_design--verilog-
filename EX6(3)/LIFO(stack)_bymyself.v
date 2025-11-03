module stack (
    output reg stack_empty,  // 스택이 비어있을 때 1
    output reg stack_full,   // 스택이 가득 찼을 때 1
    output [7:0] data_out,   // Pop된 데이터 출력
    input clk,               // 클럭
    input reset,             // 리셋 신호
    input enable,            // 동작 활성화 신호
    input push_pop,          // 1이면 Push, 0이면 Pop
    input [7:0] data_in      // Push할 데이터
);

    reg [7:0] stack_array [7:0]; // 8개의 8비트 데이터를 저장
    reg [2:0] stack_pointer;     // 스택 포인터 (3비트: 0~7)

    always @(posedge clk posedge reset)
    if (reset)
    begin
        stack_array = 8'b0
        stack_pointer = 3'b0
        stack_empty = 1'b0
        stack_full = 1'b0
    end

    else if(enable)
        if (push_pop) //push
            if(~stack_full)
            stack_array[stack_pointer] <= data_in



endmodule