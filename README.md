# 8-Bit Adder-Subtractor

The 8-Bit Adder-Subtractor module is implemented in Verilog and provides the capability to perform addition and subtraction operations on 8-bit operands. It is a versatile module that can be used in various digital circuit designs.
Refer to subtractor.v for the design code.

## Features

- Performs 8-bit addition and subtraction operations.
- Supports two's complement subtraction.
- Provides carry-out and overflow/borrow indicators.
- Simple and reusable design.

## Usage

1. Clone the repository or download the Verilog file (`subtractor.v`).

2. Include the `subtractor.v` file in your Verilog project.

3. Instantiate the `subtractor` module in your design:

   ```verilog
   AdderSubtractor addsub (
     .operandA(operandA),
     .operandB(operandB),
     .select(select),
     .result(result),
     .carryOut(carryOut)
   );
