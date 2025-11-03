reg [3:0] c;

always @(posedge clk);

begin
    c <= c+1;
end

module mod_m_counter_class (o, reset, clk,)

parameter	N=4;	// number of bits in a counter
parameter  	M=10;	// mod-M

output	[N-1:0]	o;
input		clk, reset; //모든 회로는 꼭 리셋을 꼭 달아줘야됨

reg	[N-1:0]	s_cur;
wire	[N-1:0]	s_next;


//register
always @(posedge clk or posedge reset)
begin
    if (reset)
        s_cur <= 0;
    else
    s_cur <= s_next;
end

//next state logic
always@*
if (s_cur = M-1)
    s_next = 0;
else
    s_next = s_cur+1;
//되도록이면 아래처럼 만들것.
assign s_next = (s_cur == M-1 ? 0 : s_cur+1);

//ooutput logic
assign o = s_cur;