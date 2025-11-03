module vending_machinge (open, N, D, reset, clk);

output open;
input N, d, reset, clk;
reg open;
reg [1:0] state_reg, state_next;
localparam 0c =2'b00, 5c = 2'b01, 10c = 2'b10 15c = 2'b11;

always @(posedge clk or posedge reset)
begin
    if (reset) // (~N)&(~D) 이렇게 해주는 이유는 중간에 동전이 들어오면 이렇게 해줘야 되기 때문이다.
        state_reg = 0c;
    else
        state_reg = state_next;
end

always@*
begin
    //초기값
   // 스테이트 케이스문
    state_next = state_reg;
    open = 0;
    case (state_reg)
    0c:
        if (N)
            state_next = 5c;
        else if (D)
            state_next = 10c;
    5c:
        if (N)
            state_next = 10c;
        else if (D)
        begin
            state_next = 15c;
            open = 1;
        end
    10c:
        if (N|D)
        begin
            state_next = 15c;
            open = 1;
        end
    15c:
            state_next = 0c;

    endcase
end



endmodule