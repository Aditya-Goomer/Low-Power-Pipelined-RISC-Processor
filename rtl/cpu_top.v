`timescale 1ns/1ps

module cpu_top(

    input clk,
    input rst,
    input wake_up

);

wire [3:0] pc_out;
wire [15:0] instruction;

wire stall;
wire sleep_mode;

wire reg_write;
wire mem_read;
wire mem_write;
wire sleep;

wire [3:0] opcode;

assign opcode = instruction[15:12];

// PC
pc pc0(
    .clk(clk),
    .rst(rst),
    .stall(stall),
    .sleep_mode(sleep_mode),
    .pc_out(pc_out)
);

// Instruction Memory
instruction_memory imem(
    .address(pc_out),
    .instruction(instruction)
);

// Control Unit
control_unit cu(
    .opcode(opcode),
    .reg_write(reg_write),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .alu_src(),
    .sleep(sleep)
);

// Sleep Controller
sleep_controller sc(
    .clk(clk),
    .rst(rst),
    .sleep_instruction(sleep),
    .wake_up(wake_up),
    .sleep_mode(sleep_mode)
);

endmodule
