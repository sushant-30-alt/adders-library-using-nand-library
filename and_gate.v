`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2026 22:27:57
// Design Name: 
// Module Name: and_gate
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


module and_gate(
    input a,
    input b,
    output y
);

    wire n;

    nand_gate n1 (
        .a(a),
        .b(b),
        .y(n)
    );

    not_gate n2 (
        .a(n),
        .y(y)
    );

endmodule
