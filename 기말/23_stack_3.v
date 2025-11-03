module stack (stack_empty, stack_full, data_out, clk, reset, enable, push_pop, data_in);


    output reg stack_empty;  // 스택이 비어있을 때 1
    output reg stack_full;   // 스택이 가득 찼을 때 1
    output [7:0] data_out;
    input clk;               // 클럭
    input reset;             // 리셋 신호
    input enable;            // reset = 0이고 enable =1 이면 push 또는 pop하고, 아니면 아무동작안함
    input push_pop;          // 1이면 Push, 0이면 Pop
    input [7:0] data_in;      // Push할 데이터


    reg [7:0] stack_array [7:0]; // 8개의 8비트 데이터를 저장
    reg [2:0] stack_ptr_reg, stack_ptr_next;     // 스택 포인터 (3비트: 0~7)
    reg empty_reg, empty_next;
    reg full_reg, full_next;

    always@(posedge clk , posedge reset)
    begin
        if(reset)
        begin
            stack_ptr_reg <= 0;
            full_reg <= 0;
            empty_reg <= 1;
        end
        else
            begin
                stack_ptr_reg <=...
            end
    end

    //write oper
    always@(posedge clk)
    if(~reset & enable & push_pop & ~full_reg)
        stack_array[stack_ptr_reg] <= data_in;
    if(stack_ptr_reg == 0)
        full
 

    //read oper

    if(~reset & enable & push_pop ~& ~empty_reg)
    data_out <= stack_array[stack_ptr_reg-1]
    else if(stack_ptr_reg == 0)
    data_out <= stack_array[2**W-1]


    