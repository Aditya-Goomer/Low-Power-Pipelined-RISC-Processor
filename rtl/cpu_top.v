`timescale 1ns/1ps

module cpu_top(

    input clk,
    input rst,
    input wake_up,

    output [3:0]  debug_pc,
    output [15:0] debug_instruction,
    output        debug_stall,
    output        debug_sleep_mode,

    output [7:0] debug_r0_out,
    output [7:0] debug_r1_out,
    output [7:0] debug_r2_out,
    output [7:0] debug_r3_out,

output [1:0] debug_rs1,
output [1:0] debug_rs2,
output [1:0] debug_ex_rd

);

wire [3:0] pc_out;
wire [15:0] instruction;

wire stall;


wire sleep_mode;

wire reg_write;
wire mem_read;
wire mem_write;
wire sleep;
wire [1:0] rd;
wire [7:0] write_data;
wire we;

wire [3:0] opcode;

wire [1:0] rs1;
wire [1:0] rs2;
wire [1:0] ex_rd;

assign rs1 = pc_out[1:0];
assign rs2 = 2'b00;

assign ex_rd =
    pc_out[0] ?
    pc_out[1:0] :
    2'b11;

// Register file debug wires
wire [7:0] debug_r0;
wire [7:0] debug_r1;
wire [7:0] debug_r2;
wire [7:0] debug_r3;




assign opcode = instruction[15:12];

// Debug outputs
assign debug_pc          = pc_out;
assign debug_instruction = instruction;
assign stall = 1'b0;
assign debug_sleep_mode  = sleep_mode;

assign debug_r0_out = debug_r0;
assign debug_r1_out = debug_r1;
assign debug_r2_out = debug_r2;
assign debug_r3_out = debug_r3;

assign debug_rs1   = rs1;
assign debug_rs2   = rs2;
assign debug_ex_rd = ex_rd;

assign we = 1'b1;

assign rd = pc_out[1:0];

assign write_data = {4'b0000, pc_out};
// =================================================
// Register File
// =================================================

register_file rf(

    .clk(clk),
    .we(we),
.rd(rd),
.write_data(write_data),
    .rs1(2'b00),
    .rs2(2'b01),
    

    

    .read_data1(),
    .read_data2(),

    .debug_r0(debug_r0),
    .debug_r1(debug_r1),
    .debug_r2(debug_r2),
    .debug_r3(debug_r3)

);

// =================================================
// Program Counter
// =================================================

pc pc0(

    .clk(clk),
    .rst(rst),
    .stall(stall),
    .sleep_mode(sleep_mode),
    .pc_out(pc_out)

);

// =================================================
// Instruction Memory
// =================================================

instruction_memory imem(

    .address(pc_out),
    .instruction(instruction)

);

// =================================================
// Control Unit
// =================================================

control_unit cu(

    .opcode(opcode),

    .reg_write(reg_write),
    .mem_read(mem_read),
    .mem_write(mem_write),

    .alu_src(),

    .sleep(sleep)

);

// =================================================
// Sleep Controller
// =================================================

sleep_controller sc(

    .clk(clk),
    .rst(rst),

    .sleep_instruction(sleep),

    .wake_up(wake_up),

    .sleep_mode(sleep_mode)

);

//Hazard Detection
endmodule