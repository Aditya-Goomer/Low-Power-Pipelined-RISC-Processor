`timescale 1ns/1ps

module alu(
    input [7:0] A,
    input [7:0] B,
    input [3:0] opcode,

    output reg [7:0] result,
    output reg zero
);

always @(*) begin

    case(opcode)

        4'b0000: result = A + B;     // ADD
        4'b0001: result = A - B;     // SUB
        4'b0010: result = A & B;     // AND
        4'b0011: result = A | B;     // OR
        4'b0100: result = A ^ B;     // XOR

        default: result = 8'd0;

    endcase

    zero = (result == 8'd0);

end

endmodule
