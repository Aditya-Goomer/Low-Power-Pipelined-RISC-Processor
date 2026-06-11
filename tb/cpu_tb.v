`timescale 1ns/1ps

module cpu_tb;

reg clk;
reg rst;
reg wake_up;

cpu_top uut(
    .clk(clk),
    .rst(rst),
    .wake_up(wake_up)
);

// Clock
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// VCD
initial begin
    $dumpfile("cpu.vcd");
    $dumpvars(0,cpu_tb);
end

// Stimulus
initial begin

    rst = 1;
    wake_up = 0;

    #20;
    rst = 0;

    #100;

    wake_up = 1;
    #10;
    wake_up = 0;

    #200;

    $finish;

end

// Main Monitor
initial begin

$display("TIME\tPC\tINSTR\tSTALL\tSLEEP");

$monitor("%0t\t%0d\t%h\t%b\t%b",
         $time,
         uut.debug_pc,
         uut.debug_instruction,
         uut.debug_stall,
         uut.debug_sleep_mode);

end

// Register Monitor
always @(posedge clk)
begin

$display(
"T=%0t | R0=%0d R1=%0d R2=%0d R3=%0d ACC=%0d",
$time,

uut.debug_pc,
uut.debug_instruction,
uut.debug_stall,
uut.debug_sleep_mode,
uut.debug_pc,
uut.debug_rs1,
uut.debug_rs2,
uut.debug_ex_rd,
uut.debug_stall
);

end

endmodule