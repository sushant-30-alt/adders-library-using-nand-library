`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2026 16:40:07
// Design Name: 
// Module Name: tb_subtractor_4bit
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




`timescale 1ns / 1ps

module tb_subtractor_4bit;

    reg  [3:0] A;
    reg  [3:0] B;
    wire signed [7:0] Difference;

    reg signed [7:0] expected;
    integer i, j;
    integer errors;

    subtractor_4bit DUT (
        .A(A),
        .B(B),
        .Difference(Difference)
    );

    initial begin
        A = 0;
        B = 0;
        errors = 0;

        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                A = i;
                B = j;
                expected = i - j;

                #10;

                if (Difference !== expected) begin
                    $display(
                        "FAIL: A=%0d B=%0d | Got signed=%0d, binary=%b | Expected=%0d, binary=%b",
                        A, B, $signed(Difference), Difference,
                        expected, expected
                    );
                    errors = errors + 1;
                end
            end
        end

        if (errors == 0)
            $display("PASS: All 256 signed subtraction test cases passed!");
        else
            $display("FAIL: %0d test cases failed.", errors);

        $finish;
    end

endmodule

