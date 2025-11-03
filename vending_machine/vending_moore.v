module vending_machinge (open, N, D, reset, clk);

output open;
input N, d, reset, clk;
reg open;
reg [1:0] state_reg, state_next;
localparam 0c =2'b00, 5c = 2'b01, 10c = 2'b10 15c = 2'b11;

always @(posedge clk or posedge reset)
begin
    if ((~N)&(~D)&reset) // (~N)&(~D) 이렇게 해주는 이유는 중간에 동전이 들어오면 이렇게 해줘야 되기 때문이다.
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
            state_next = 15c;
    10c:
        if (N|D)
            state_next = 15c;
    15c:
        open = 1;
        if (reset)
            state_next = 0c;

    endcase
end



endmodule



5. 아래는 Vending Machine에 대한 설명입니다. (그림 13)은 이 Vending Machine의 입출력입니다. 이 Vending Machine의 ASM Chart 또는 State Diagram을 그리세요.
(그림 12)
(그림 13)
- 나오는 물건은 2천원짜리 콜라, 투입 금액이 가격을 넘으면 바로 투출
module vending (open, cl, cs,
콜라 투출은 open = 1
ml, m5, m10, reset, cik);
- 투입 지폐는 1천원, 5천원, 1만원 3종, 투입은 한 번에 한 장씩만
output open;
1천원 입력 신호는 ml = 1, 5천원 입력 신호는 m5 1
output cl;
1만원 입력 신호는 m10 = 1
output c5;
- 거스름돈 지폐는 1천원, 5천원 2종, 투출은 한 클록에 한 장씩만
input ml;
1천원 출력 신호는 CI = 1, 5천원 출력 신호는 C5 = 1
input m5;
즉 1천원권 4장 거스름은 네 클록 동안 CI = 1
input m10;
- 콜라 투출> 1천원 거스름돈-> 5천원 거스름돈 순서로 진행
input reset;
즉 open 신호> cl 신호> C5 신호 순서로 발생
input clk;


(그림 12)


아래는 Vending Machine에 대한 설명입니다.
- 나오는 물건은 2천원짜리 콜라, 투입 금액이 가격을 넘으면 바로 투출

콜라 투출은 open = 1

- 투입 지폐는 1천원, 5천원, 1만원 3종, 투입은 한 번에 한 장씩만 1천원 입력 신호는 m1 = 1, 5천원 입력 신호는 m5 = 1, 1만원 입력 신호는 m10 = 1

- 거스름돈 지폐는 1천원, 5천원 2종, 투출은 한 클록에 한 장씩만
1천원 출력 신호는 c1= 1, 5천원 출력 신호는 c5 = 1
즉 1천원권 4장 거스름은 네 클록 동안 c1 = 1

- 콜라 투출 -> 1천원 거스름돈 -> 5천원 거스름돈 순서로 진행
즉 open 신호 -> c1 신호> c5 신호 순서로 발생


아래는 이 Vending Machine의 입출력입니다.

module vending (open, c1, c5, m1, m5, m10, reset, clk);
output open;
output c1;
output c5;
input m1;
input m5;
input m10;
input reset;
input clk;

이 Vending Machine의 State Diagram을 그리시오