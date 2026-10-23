`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2026 01:22:17
// Design Name: 
// Module Name: tb_full_adder
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





module tb_full_adder;

    reg A;
    reg B;
    reg Cin;

    wire S;
    wire Cout;

    // Instantiate the full adder
    full_adder DUT (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        A = 0; B = 0; Cin = 0; #10;
        $display("A=%b B=%b Cin=%b S=%b Cout=%b",
                 A, B, Cin, S, Cout);

        A = 0; B = 0; Cin = 1; #10;
        $display("A=%b B=%b Cin=%b S=%b Cout=%b",
                 A, B, Cin, S, Cout);

        A = 0; B = 1; Cin = 0; #10;
        $display("A=%b B=%b Cin=%b S=%b Cout=%b",
                 A, B, Cin, S, Cout);

        A = 0; B = 1; Cin = 1; #10;
        $display("A=%b B=%b Cin=%b S=%b Cout=%b",
                 A, B, Cin, S, Cout);

        A = 1; B = 0; Cin = 0; #10;
        $display("A=%b B=%b Cin=%b S=%b Cout=%b",
                 A, B, Cin, S, Cout);

        A = 1; B = 0; Cin = 1; #10;
        $display("A=%b B=%b Cin=%b S=%b Cout=%b",
                 A, B, Cin, S, Cout);

        A = 1; B = 1; Cin = 0; #10;
        $display("A=%b B=%b Cin=%b S=%b Cout=%b",
                 A, B, Cin, S, Cout);

        A = 1; B = 1; Cin = 1; #10;
        $display("A=%b B=%b Cin=%b S=%b Cout=%b",
                 A, B, Cin, S, Cout);

        $finish;
    end

endmodule

