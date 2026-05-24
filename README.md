# 8-Bit Arithmetic Logic Unit (ALU) in VHDL

8-bit Arithmetic Logic Unit (ALU) in VHDL. The ALU is capable of performing various arithmetic and bitwise logical operations.

## Features

- Processes two unsigned 8-bit inputs (`A` and `B`)
- Desired operation is selected via a 4-bit `Opcode`
- **Status Flags:** 
  - `Zero Flag (Z)`: Indicates the result is zero
  - `Carry Flag (C)`: Indicates arithmetic carries, overflows, and underflows

## Operation Set (Opcodes)

| Opcode | Operation | Zero Flag (Z) | Carry Flag (C) |
| :---: | :--- | :---: | :---: |
| `0000` | Addition (A + B) | Active | Active |
| `0001` | Subtraction (A - B) | Active | Active |
| `0010` | Logical AND (A • B) | Active | `0` |
| `0011` | Logical OR (A + B) | Active | `0` |
| `0100` | Logical XOR (A ⊕ B) | Active | `0` |
| `0101` | Logical NOT (~A) | Active | `0` |
| `0110` | Increment (A + 1) | Active | Active |
| `0111` | Decrement (A - 1) | Active | Active |

## Recommended Tools and Usage

To compile, simulate, and view the waveforms of the ALU:
- [GHDL](https://github.com/ghdl/ghdl) - An open-source VHDL simulator
- [GTKWave](https://github.com/gtkwave/gtkwave) - A fully featured wave viewer

**1. Analyze the VHDL files:**
```bash
ghdl -a alu.vhd
ghdl -a alu_tb.vhd
```

**2. Elaborate the top-level entity (Testbench):**
```bash
ghdl -e alu_tb
```

**3. Run the simulation and generate the waveform file (VCD):**
```bash
ghdl -r alu_tb --vcd=alu_waveform.vcd
```

**4. View the results in GTKWave:**
```bash
gtkwave alu_waveform.vcd
```
