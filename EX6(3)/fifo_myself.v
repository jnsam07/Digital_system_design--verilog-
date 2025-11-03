module		FIFO (rd_data, empty, full, wr_data, clk, reset, rd, wr);

parameter B = 8;
parameter W = 4;
// i/0
output [B-1:0] rd_data;
output empty, full;
input [B-1:0] wr_data;
input clk, reset, rd, wr;

//registers
reg [B-1:0] array_reg[2**W-1:0];
reg [W-1:0] rd_ptr_reg, rd_ptr_next;
reg [W-1:0] wr_ptr_reg, wr_ptr_next;
reg full_reg, full_next;
reg empty_reg, empty_next;


//state register
always @(posedge clk, posedge reset)
    if(reset)
        begin
            array_reg <= 0;
            rd_ptr_reg, rd_ptr_next <= 0;
            wr_ptr_reg, wr_ptr_next <= 0;
            full_reg <= 0;
            full_next <= 0;
            empty_reg <= 0;
            empty_next <= 0;
        end
    else
        begin
            rd_ptr_reg <= rd_ptr_next;
            wr_ptr_reg <= wr_ptr_next;
            full_reg <= full_next;
            empty_reg <= empty_next;

        end

    


//write operation
always @(posedge clk)
    if(wr&(~full_reg))
    array_reg[wr_ptr_reg] <= wr_data [B-1:0]


//read operation
    assign rd_data = array_reg[rd_ptr_reg];


//state operation
always@*
    begin
        rd_ptr_next = rd_ptr_reg;
        wr_ptr_next = wr_ptr_reg;
        empty_next = empty_reg;
        full_next = full_reg;

        case({wr,rd})
        
        2'b01:  //read only
        if(~empty_reg)
            begin
                rd_ptr_next = rd_ptr_reg + 1;
                full_next = 1'b0;
                if (rd_ptr_next == rd_ptr_reg)
                empty_next = 1'b1;
            end

        2'b10: //write only
        if(~full_reg)
            begin
                wr_ptr_next = wr_ptr_reg + 1;
                empty_next = 1'b0;
                if (rd_ptr_next == rd_ptr_reg)
                full_next = 1'b1;
            end

        2'b11: // read & write
        begin
            rd_ptr_next = rd_ptr_reg + 1;
            wr_ptr_next = wr_ptr_reg + 1;
        end

        default:
        ;

        endcase
    end

assign full = full_reg;

assign empty = empty_reg;

endmodule