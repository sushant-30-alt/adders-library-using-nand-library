`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2026 00:09:11
// Design Name: 
// Module Name: xor_gate
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


module xor_gate(
    input a,
    input b,
    output y
);

    wire n1;
    wire n2;
    wire n3;

    nand_gate g1 (
        .a(a),
        .b(b),
        .y(n1)
    );

    nand_gate g2 (
        .a(a),
        .b(n1),
        .y(n2)
    );

    nand_gate g3 (
        .a(b),
        .b(n1),
        .y(n3)
    );

    nand_gate g4 (
        .a(n2),
        .b(n3),
        .y(y)
    );

endmodule
