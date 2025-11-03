module ring_counter (q,clk,start)
output [3:0] q;
input clk;
input start;

reg [3:0] q;

always @(posedge clk, posedge start)
begin
    if (start)
    q <= 4'b0001;
    else
    q <= {q[2:0],q[3]};
end
endmodule



module Johnson_counter (q,clk,start)

output [3:0] q;
input clk;
input start;

reg [3:0] q;

always @(posedge clk, posedge start)
begin
    if (start)
    q <= 4'b0000;
    else
    q <= {q[2:0],~q[3]};
end

endmodule