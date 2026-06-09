`timescale 1ns/1ps

module register_file(

    input clk,

    input we,

    input [1:0] rs1,
    input [1:0] rs2,
    input [1:0] rd,

    input [7:0] write_data,

    output [7:0] read_data1,
    output [7:0] read_data2
);

reg [7:0] regfile [0:3];

assign read_data1 = regfile[rs1];
assign read_data2 = regfile[rs2];

always @(posedge clk)
begin

    if(we)
        regfile[rd] <= write_data;

end

initial begin
    regfile[0] = 8'd2;
    regfile[1] = 8'd3;
    regfile[2] = 8'd4;
    regfile[3] = 8'd5;
end

endmodule
