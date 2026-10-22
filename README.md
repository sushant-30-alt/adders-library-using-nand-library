# Adders Library Using NAND-Based Logic Gates

## Overview

This repository contains the **Half Adder (HA)** and **Full Adder (FA)** implemented in Verilog HDL using a custom NAND-based logic gate library. The designs are simulated and synthesized using Xilinx Vivado.

The project demonstrates hierarchical digital design by constructing arithmetic circuits from reusable logic gate modules.

## Objectives

- Design a Half Adder using custom XOR and AND gate modules.
- Design a Full Adder using two Half Adders and an OR gate.
- Reuse a custom NAND-based logic gate library.
- Verify functionality through Verilog testbenches and simulation.
- Examine synthesized logic and LUT INIT values in Vivado.

## Repository Structure

```text
adders-library-using-nand-library/
├── rtl/
│   ├── nand_gate.v
│   ├── not_gate.v
│   ├── and_gate.v
│   ├── or_gate.v
│   ├── xor_gate.v
│   ├── half_adder.v
│   └── full_adder.v
├── tb/
│   ├── tb_half_adder.v
│   └── tb_full_adder.v
└── reports/
    └── HALF ADDER USING NAND library.docx
```

## 1. Half Adder

A Half Adder adds two single-bit binary inputs, `A` and `B`, and produces a Sum (`S`) and Carry (`C`).

### Boolean Equations

- **Sum:** `S = A XOR B`
- **Carry:** `C = A AND B`

### Truth Table

| A | B | Sum (S) | Carry (C) |
|---|---|---------|-----------|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 |

## 2. Full Adder

A Full Adder adds three single-bit inputs: `A`, `B`, and carry-in (`Cin`). It produces Sum (`S`) and carry-out (`Cout`).

### Boolean Equations

- **Sum:** `S = A XOR B XOR Cin`
- **Carry-out:** `Cout = (A AND B) OR (Cin AND (A XOR B))`

### Truth Table

| A | B | Cin | Sum (S) | Carry-out (Cout) |
|---|---|-----|---------|------------------|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | 0 |
| 0 | 1 | 0 | 1 | 0 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 | 0 |
| 1 | 0 | 1 | 0 | 1 |
| 1 | 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 1 | 1 |

## Design Hierarchy

- The NAND gate is the fundamental building block of the custom logic library.
- Other logic gates are constructed from NAND-based logic.
- The Half Adder uses the XOR and AND modules.
- The Full Adder uses two Half Adder instances and an OR gate.

## Verification and Synthesis

Both designs were verified using Verilog testbenches in Xilinx Vivado.

- Half Adder: all 4 input combinations tested.
- Full Adder: all 8 input combinations tested.

Recorded synthesized LUT INIT values:

| Design | Output | LUT INIT |
|---|---|---|
| Half Adder | Sum (`S`) | `4'h6` |
| Half Adder | Carry (`C`) | `4'h8` |
| Full Adder | Sum (`S`) | `8'h96` |
| Full Adder | Carry-out (`Cout`) | `8'hE8` |

These values are from the recorded Vivado synthesis results for this project.

## Tools Used

- Verilog HDL
- Xilinx Vivado
- RTL simulation and synthesis

## Project Report

The combined Half Adder and Full Adder report is available in the [`reports/`](reports/) directory. It documents the design equations, simulation results, waveforms, synthesized schematics, and LUT INIT values.

## Related Repository

**NAND-Based Logic Gates Library:**  
https://github.com/sushant-30-alt/nand-based-logic-gates

This repository provides the custom logic gate library reused in the adder designs.

## Future Work

- Implement a Ripple Carry Adder.
- Extend the library to larger arithmetic circuits.
- Reuse the adder modules in binary multiplier designs.

## Author

Sushant

*Educational digital design project focused on modular RTL development, simulation, and FPGA synthesis.*
