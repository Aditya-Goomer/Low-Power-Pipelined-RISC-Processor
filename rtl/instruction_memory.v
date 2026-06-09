`timescale 1ns/1ps

module instruction_memory(

    input [3:0] address,
    output [15:0] instruction

);

reg [15:0] mem [0:15];

assign instruction = mem[address];

initial begin

    // ADD R0,R1,R2
    mem[0] = 16'b0000_00_01_10_000000;

    // SUB R1,R2,R3
    mem[1] = 16'b0001_01_10_11_000000;

    // MAC
    mem[2] = 16'b0111_00_01_10_000000;

    // SLEEP
    mem[3] = 16'b1001_000000000000;

    // NOP
    mem[4] = 16'b1111_000000000000;

end

endmodule
