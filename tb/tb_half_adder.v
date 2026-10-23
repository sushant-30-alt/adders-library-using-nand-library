`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2026 01:00:46
// Design Name: 
// Module Name: tb_half_adder
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



 

module tb_half_adder;

    reg A;
    reg B;
    wire S;
    wire C;

    // Instantiate the half adder
    half_adder DUT (
        .A(A),
        .B(B),
        .S(S),
        .C(C)
    );

    initial begin
        A = 0; B = 0; #10;
        $display("A=%b B=%b S=%b C=%b", A, B, S, C);

        A = 0; B = 1; #10;
        $display("A=%b B=%b S=%b C=%b", A, B, S, C);

        A = 1; B = 0; #10;
        $display("A=%b B=%b S=%b C=%b", A, B, S, C);

        A = 1; B = 1; #10;
        $display("A=%b B=%b S=%b C=%b", A, B, S, C);

        $finish;
    end

endmodule

