# Low-Power Hazard-Aware Pipelined 8-bit RISC Processor

## Overview

This project implements a custom 8-bit RISC processor in Verilog featuring a 3-stage pipeline, hazard detection, a DSP-oriented Multiply-Accumulate (MAC) instruction, and low-power sleep mode operation.

The processor was designed to explore concepts in computer architecture, digital design, RTL development, pipelining, hazard management, and power-aware system design.

---

## Key Features

### Pipelined Architecture

* 3-stage pipeline:

  * Instruction Fetch (IF)
  * Instruction Decode / Execute (ID/EX)
  * Write Back (WB)

### Custom DSP Instruction

* Multiply-Accumulate (MAC)
* Supports DSP-style arithmetic operations
* Useful for signal-processing workloads

### Hazard Detection Unit

* Detects register dependencies
* Inserts pipeline stalls when required
* Ensures correct instruction execution

### Low-Power Mode

* Sleep instruction support
* Pipeline and PC freeze during sleep
* Wake-up signal resumes execution

### Performance Monitoring

* Cycle counter
* Instruction counter
* Stall counter
* Sleep cycle counter

---

## Processor Architecture

The processor consists of:

* Program Counter (PC)
* Instruction Memory
* Register File
* ALU
* DSP MAC Unit
* Hazard Detection Unit
* Control Unit
* Pipeline Registers
* Sleep Controller
* Data Memory

Architecture Diagram:

[Insert architecture.png]

---

## Instruction Set Architecture (ISA)

| Opcode | Instruction | Description          |
| ------ | ----------- | -------------------- |
| 0000   | ADD         | Addition             |
| 0001   | SUB         | Subtraction          |
| 0010   | AND         | Bitwise AND          |
| 0011   | OR          | Bitwise OR           |
| 0100   | XOR         | Bitwise XOR          |
| 0101   | LOAD        | Load from memory     |
| 0110   | STORE       | Store to memory      |
| 0111   | MAC         | Multiply-Accumulate  |
| 1000   | BEQ         | Branch if Equal      |
| 1001   | SLEEP       | Enter Low-Power Mode |
| 1111   | NOP         | No Operation         |

---

## Pipeline Operation

The processor uses a 3-stage pipeline to improve throughput.

Instruction Flow:

IF → ID/EX → WB

The Hazard Detection Unit monitors data dependencies and inserts stalls whenever necessary.

---

## Low-Power Operation

When a SLEEP instruction is executed:

* Program Counter stops incrementing
* Pipeline registers stop updating
* Register write operations are disabled

Execution resumes when the wake_up signal becomes active.

---

## Verification

The design was verified using:

* Icarus Verilog
* GTKWave

Verification included:

* Arithmetic instruction testing
* Hazard detection validation
* MAC instruction testing
* Sleep mode functionality
* Pipeline timing analysis

---

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* VS Code
* Git & GitHub

---

## Future Improvements

* Forwarding Unit
* Branch Prediction
* Multi-stage Sleep Modes
* Cache Interface
* Pipelined MAC Unit
* Fixed-Point DSP Support

---

## Learning Outcomes

This project provided hands-on experience with:

* RTL Design
* Computer Architecture
* Pipeline Design
* Hazard Management
* DSP Hardware Concepts
* Low-Power Digital Design
* Functional Verification

---

## Author

Aditya Goomer

Electrical Engineering
Delhi Technological University (DTU)
