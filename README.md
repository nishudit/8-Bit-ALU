# 8-Bit Adder-Subtractor

This is an 8-bit adder-subtractor module implemented in Verilog. The module takes two 8-bit operands, `operandA` and `operandB`, and performs either addition or subtraction based on the `select` input. The result is provided in the `result` output, and the carry-out is indicated by the `carryOut` output.

## Usage

Instantiate the `AdderSubtractor` module in your Verilog design and connect the inputs and outputs as follows:

```verilog
AdderSubtractor addsub (
  .operandA(operandA),
  .operandB(operandB),
  .select(select),
  .result(result),
  .carryOut(carryOut)
);
