`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2026 13:41:41
// Design Name: 
// Module Name: tb_ripple_carry_adder_4bit
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




module tb_ripple_carry_adder_4bit;

    reg  [3:0] A;
    reg  [3:0] B;
    reg        Cin;

    wire [3:0] Sum;
    wire       Cout;

    reg  [4:0] expected;
    integer i, j, k;
    integer errors;

    ripple_carry_adder_4bit DUT (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        A = 0;
        B = 0;
        Cin = 0;
        errors = 0;

        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                for (k = 0; k < 2; k = k + 1) begin
                    A = i;
                    B = j;
                    Cin = k;
                    expected = i + j + k;

                    #10;

                    if ({Cout, Sum} !== expected) begin
                        $display(
                            "FAIL: A=%b B=%b Cin=%b | Got=%b_%b Expected=%b",
                            A, B, Cin, Cout, Sum, expected
                        );
                        errors = errors + 1;
                    end
                end
            end
        end

        if (errors == 0)
            $display("PASS: All 512 test cases passed!");
        else
            $display("FAIL: %0d test cases failed.", errors);

        $finish;
    end

endmodule

