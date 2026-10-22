`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2026 01:18:52
// Design Name: 
// Module Name: full_adder
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


module full_adder (
    input wire A,
    input wire B,
    input wire Cin,
    output wire S,
    output wire Cout
);

    wire S1, C1, C2;

    half_adder HA1 (
        .A(A),
        .B(B),
        .S(S1),
        .C(C1)
    );

    half_adder HA2 (
        .A(S1),
        .B(Cin),
        .S(S),
        .C(C2)
    );

    or_gate OR1 (
        .a(C1),
        .b(C2),
        .y(Cout)
    );

endmodule

