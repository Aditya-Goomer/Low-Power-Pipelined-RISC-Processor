`timescale 1ns/1ps

module hazard_detection(

    input [1:0] rs1,
    input [1:0] rs2,

    input [1:0] ex_rd,
    input ex_regwrite,

    output reg stall

);

always @(*) begin

    stall = 0;

    if(ex_regwrite &&
      ((rs1 == ex_rd) || (rs2 == ex_rd)))
        stall = 1;

end

endmodule
