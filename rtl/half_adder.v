`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2026 00:57:03
// Design Name: 
// Module Name: half_adder
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



module half_adder (
    input wire A,
    input wire B,
    output wire S,
    output wire C
);

    xor_gate XOR1 (
        .a(A),
        .b(B),
        .y(S)
    );

    and_gate AND1 (
        .a(A),
        .b(B),
        .y(C)
    );

endmodule

