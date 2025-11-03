`timescale 1ns / 1ps
module tb_decoder2(
    in, out, EN
    );
    input wire [3:0] out;
    output reg [1:0] in;
    output reg EN;
 
    decoder2 decoder2(.in(in), .out(out), .EN(EN));
 
        initial begin
                $dumpfile("output.vcd");
                $dumpvars(0, tb_decoder2);
             #10 EN=1;
        #10 in = 2'b00;
        #10 in = 2'b01;
        #10 in = 2'b10;
        #10 in = 2'b11;
                #10 EN = 0;
        end
endmodule