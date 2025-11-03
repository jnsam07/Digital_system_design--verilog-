module decoder2(
    in, out, EN
    );
    input wire [1:0] in;
    input wire EN;
    output reg [3:0] out;
 
    always @(in or EN)
    case({EN, in})
        3'b100:
        out = 4'b0001;
        3'b101:
        out = 4'b0010;
        3'b110:
        out = 4'b0100;
        3'b111:
        out = 4'b1000;
        default:
        out = 4'b0000;
    endcase
endmodule