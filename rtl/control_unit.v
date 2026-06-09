`timescale 1ns/1ps

module control_unit(

    input [3:0] opcode,

    output reg reg_write,
    output reg mem_read,
    output reg mem_write,
    output reg alu_src,
    output reg sleep

);

always @(*) begin

    reg_write = 0;
    mem_read  = 0;
    mem_write = 0;
    alu_src   = 0;
    sleep     = 0;

    case(opcode)

        4'b0000: reg_write = 1; // ADD
        4'b0001: reg_write = 1; // SUB
        4'b0010: reg_write = 1; // AND
        4'b0011: reg_write = 1; // OR
        4'b0100: reg_write = 1; // XOR

        4'b0101: begin
            mem_read  = 1;
            reg_write = 1;
        end

        4'b0110:
            mem_write = 1;

        4'b0111:
            reg_write = 1; // MAC

        4'b1001:
            sleep = 1;

    endcase

end

endmodule
