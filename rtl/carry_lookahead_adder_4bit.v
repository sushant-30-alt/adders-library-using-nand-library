`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2026 15:45:34
// Design Name: 
// Module Name: carry_lookahead_adder_4bit
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



module carry_lookahead_adder_4bit (
    input  wire [3:0] A,
    input  wire [3:0] B,
    input  wire       Cin,
    output wire [3:0] Sum,
    output wire       Cout
);

    wire [3:0] G;
    wire [3:0] P;
    wire [3:0] C;

    // Generate and Propagate
    assign G = A & B;
    assign P = A | B;

    // Carry Lookahead Equations
    assign C[0] = G[0] | (P[0] & Cin);

    assign C[1] = G[1]
                | (P[1] & G[0])
                | (P[1] & P[0] & Cin);

    assign C[2] = G[2]
                | (P[2] & G[1])
                | (P[2] & P[1] & G[0])
                | (P[2] & P[1] & P[0] & Cin);

    assign Cout = G[3]
                | (P[3] & G[2])
                | (P[3] & P[2] & G[1])
                | (P[3] & P[2] & P[1] & G[0])
                | (P[3] & P[2] & P[1] & P[0] & Cin);

    // Sum Equations
    assign Sum[0] = A[0] ^ B[0] ^ Cin;
    assign Sum[1] = A[1] ^ B[1] ^ C[0];
    assign Sum[2] = A[2] ^ B[2] ^ C[1];
    assign Sum[3] = A[3] ^ B[3] ^ C[2];

endmodule

