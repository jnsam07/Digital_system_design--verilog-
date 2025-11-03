module rising_edge_detector(tick, clk, reset, level);

output        tick;
input         clk, reset, level;
reg           tick;
reg     [1:0] state_reg, state_next;

parameter     zero = 2'b00, edg = 2'b01, one = 2'b10;

always@(posedge clk, posedge reset)
  begin
    if (reset) //a==b이면, a==1이면 빼기 연산 그냥 리셋이면 트루폴스인지 계산
      state_reg <= zero;
    else
      state_reg <= state_next;
  end
  
always@*
  begin
    state_next = state_reg;
    if (state reg == zero)
        if(level) state_next = edg;
        else state_next = zero;
    else if (state_reg == edg)
        if(level) state_next = one;
        else state_next = zero;
    else
        if(level) state_next = one;
        else state_next = zero;
  end

  assign tick = ((state_reg ==edg) ? 1:0 );


//state register: state_reg <= f(state_next, inputs)

// next state logic: state_next = f(state_reg, inputs)
always@*
begin
  ////state_next = state_reg, zero
  case(state_reg)
  zero:
    tick = 0; // 밑에 아웃풋 로직 안쓰고 여기다 써도 됨.
    if (level) state_next = edg;
    else state_next = zero;
    edg:
    tick = 1; // 밑에 아웃풋 로직 안쓰고 여기다 써도 됨.
    if (level) state_next = one;
    else state_next = zero;
    one:
    tick = 0; // 밑에 아웃풋 로직 안쓰고 여기다 써도 됨.
    if (level) state_next = one;
    else state_next = zero;
  endcase
end

//output logic
always@*
begin
  tick = 0;
  case(state_reg)
  zero: tick = 0;
  edg: tikc = 1;
  one: tick = 0;
end
endmodule