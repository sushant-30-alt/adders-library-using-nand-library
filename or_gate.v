`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2026 22:56:29
// Design Name: 
// Module Name: or_gate
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module or_gate(
    input a,
    input b,
    output y
);

    wire na;
    wire nb;

    not_gate n1 (
        .a(a),
        .y(na)
    );

    not_gate n2 (
        .a(b),
        .y(nb)
    );

    nand_gate n3 (
        .a(na),
        .b(nb),
        .y(y)
    );

endmodule
