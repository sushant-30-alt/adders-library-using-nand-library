# Adders Library — NAND-Based Digital Design in Verilog

## Overview

This repository presents a modular digital design library developed using **Verilog HDL and Xilinx Vivado 2025.2**. It demonstrates hierarchical RTL design by constructing arithmetic circuits using reusable logic modules and evaluating their implementation through simulation and FPGA synthesis.

The library includes a Half Adder, Full Adder, 4-bit Ripple Carry Adder (RCA), 4-bit Carry Lookahead Adder (CLA), and a 4-bit Subtractor with an 8-bit signed output.

The designs emphasize reusable RTL, exhaustive functional verification, synthesized logic analysis, and a comparison of ripple-carry and carry-lookahead architectures.

## Objectives

- Develop reusable NAND-based digital logic modules.
- Implement Half Adder and Full Adder circuits using hierarchical RTL.
- Design and verify a 4-bit Ripple Carry Adder.
- Implement a 4-bit Carry Lookahead Adder using generate and propagate logic.
- Design a 4-bit subtractor with an 8-bit signed two's-complement output.
- Verify functionality using self-checking Verilog testbenches.
- Examine synthesized schematics, LUT INIT values, and timing results in Vivado.
- Compare RCA and CLA architectures using recorded synthesis results.

## Repository Structure

```text
adders-library/
├── rtl/
│   ├── half_adder.v
│   ├── full_adder.v
│   ├── ripple_carry_adder_4bit.v
│   ├── carry_lookahead_adder_4bit.v
│   └── subtractor_4bit.v
├── tb/
│   ├── tb_half_adder.v
│   ├── tb_full_adder.v
│   ├── tb_ripple_carry_adder_4bit.v
│   ├── tb_carry_lookahead_adder_4bit.v
│   └── tb_subtractor_4bit.v
├── reports/
│   └── ADDER USING NAND library.docx
└── README.md
```

*Note: The repository structure shown above should match the actual committed filenames and directories.*

## Implemented Designs

### 1. Half Adder

A Half Adder adds two single-bit inputs, `A` and `B`, producing a Sum (`S`) and Carry (`C`).

**Boolean equations**

- Sum: `S = A XOR B`
- Carry: `C = A AND B`

The implementation uses custom XOR and AND gate modules constructed from the NAND-based logic library.

### 2. Full Adder

A Full Adder adds three single-bit inputs: `A`, `B`, and carry-in (`Cin`). It produces Sum (`S`) and carry-out (`Cout`).

**Boolean equations**

- Sum: `S = A XOR B XOR Cin`
- Carry-out: `Cout = (A AND B) OR (Cin AND (A XOR B))`

The design uses two Half Adder instances and an OR gate.

### 3. 4-Bit Ripple Carry Adder (RCA)

The RCA adds two 4-bit binary operands, `A` and `B`, with an input carry (`Cin`). It produces a 4-bit Sum and a final carry-out (`Cout`), representing a 5-bit arithmetic result.

Each stage passes its carry to the next stage.

For each bit \(i\):

- Propagate: `P[i] = A[i] XOR B[i]`
- Generate: `G[i] = A[i] AND B[i]`
- Sum: `Sum[i] = P[i] XOR C[i]`
- Carry: `C[i+1] = G[i] OR (P[i] AND C[i])`

The architecture is simple and modular, but its carry propagation delay can increase with the number of bits.

### 4. 4-Bit Carry Lookahead Adder (CLA)

The CLA computes carry signals using expanded generate and propagate equations rather than relying exclusively on sequential carry propagation.

For this implementation:

- Generate: `G[i] = A[i] AND B[i]`
- Propagate: `P[i] = A[i] OR B[i]`

The expanded carry equations calculate the carry signals in advance, and the sum is obtained using the corresponding carry-in for each bit.

The CLA and RCA are compared using their recorded functional verification and synthesis results.

### 5. 4-Bit Subtractor with 8-Bit Signed Output

The subtractor computes the difference between two unsigned 4-bit inputs and represents the result using an 8-bit two's-complement value.

Subtraction is based on:

`A - B = A + (~B) + 1`

The implementation reuses the 4-bit Ripple Carry Adder. It handles negative differences by calculating the magnitude and representing the negative result in two's-complement notation.

The supported difference range is −15 to +15.

## Functional Verification

The accompanying report records the following self-checking simulation results in Xilinx Vivado.

| Design | Test cases | Recorded result |
|---|---:|---|
| Half Adder | 4 input combinations | Verified |
| Full Adder | 8 input combinations | Verified |
| 4-bit RCA | 512 | 512/512 passed |
| 4-bit CLA | 512 | 512/512 passed |
| 4-bit Subtractor | 256 | 256/256 passed |

The RCA and CLA testbenches cover all combinations of the two 4-bit operands and the input carry. The subtractor testbench covers all pairs of 4-bit input operands.

## RCA vs CLA: Recorded Synthesis Comparison

The report documents synthesis results for the Spartan-7 target `xc7s50csga324-1`.

| Parameter | Ripple Carry Adder | Carry Lookahead Adder |
|---|---:|---:|
| Functional test cases passed | 512/512 | 512/512 |
| LUT cells | 6 | 6 |
| Total cells | 20 | 20 |
| Reported worst-path delay | 5.814 ns | 5.814 ns |

In the recorded synthesis run, both architectures produced the same reported LUT count, total cell count, and worst-path delay. The report notes that timing constraints were not specified, so these results do not establish a universal performance equivalence between RCA and CLA architectures.

## LUT INIT Analysis

The report includes recorded LUT INIT values extracted from the Vivado Tcl Console for the Half Adder, Full Adder, RCA, CLA, and Subtractor.

These values describe the truth-table configurations of the mapped LUTs for the recorded synthesis run. They may vary with the target FPGA, synthesis settings, RTL structure, and LUT input mapping.

## Tools Used

- Verilog HDL
- Xilinx Vivado 2025.2
- RTL behavioral simulation
- Self-checking testbenches
- FPGA synthesis and schematic inspection
- LUT INIT analysis

## Project Report

The detailed report is available in the `reports/` directory:

**`ADDER USING NAND library.docx`**

It documents the objectives, theory, Boolean equations, truth tables, simulation waveforms, synthesized schematics, LUT INIT values, verification results, and RCA-versus-CLA comparison.

## Related Repository

**NAND-Based Logic Gates Library:**  
https://github.com/sushant-30-alt/nand-based-logic-gates

This library provides the custom NAND-based gate modules reused in the arithmetic designs.

## Future Work

- Extend the library to wider arithmetic circuits.
- Compare additional adder architectures and FPGA implementations.
- Evaluate timing under explicitly defined synthesis and timing constraints.
- Reuse the arithmetic modules in multiplier and calculator designs.

## Author

Sushant

*An educational digital design project focused on modular RTL development, arithmetic circuits, functional verification, and FPGA synthesis.*
