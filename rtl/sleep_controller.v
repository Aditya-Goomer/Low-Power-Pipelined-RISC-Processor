`timescale 1ns/1ps

module sleep_controller(

    input clk,
    input rst,

    input sleep_instruction,
    input wake_up,

    output reg sleep_mode

);

always @(posedge clk or posedge rst)
begin

    if(rst)
        sleep_mode <= 0;

    else if(wake_up)
        sleep_mode <= 0;

    else if(sleep_instruction)
        sleep_mode <= 1;

end

endmodule
