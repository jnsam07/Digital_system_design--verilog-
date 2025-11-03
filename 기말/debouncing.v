module debounce (db, clk,reset,sw)

o
i
reg db;
reg state_reg, state_next;
reg q_reg, q_next;

parameter N = 19;

reg [N-1:0] q_reg;
wire [N-1:0] q_next;
wire m_tick;

always@(posedge clk)
    q_reg <= q_next;


assign q_next = q_reg +1;
assign m_tick = ((q_reg == 0 ) ? 1'b1 : 0'b0)


