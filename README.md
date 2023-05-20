# 8-Bit ALU (Arithmetic Logic Unit)

The 8-bit ALU (Arithmetic Logic Unit) is a digital circuit that performs various arithmetic and logical operations on 8-bit binary numbers. It supports 14 different instructions, including addition, subtraction, multiplication, division, increment, decrement, logical AND, logical OR, logical NOT, logical XOR, logical shift left, logical shift right, circular shift left, and circular shift right.

## ALU Architecture

The ALU is designed to support the following instructions:

1. Addition (ADD)
2. Subtraction (SUB)
3. Multiplication (MUL)
4. Division (DIV)
5. Increment (INC)
6. Decrement (DEC)
7. Logical AND (AND)
8. Logical OR (OR)
9. Logical NOT (NOT)
10. Logical XOR (XOR)
11. Logical Shift Left (LSL)
12. Logical Shift Right (LSR)
13. Circular Shift Left (CSL)
14. Circular Shift Right (CSR)

The ALU consists of the following main components:

- **Control Unit**: The control unit determines which operation to perform based on the instruction opcode.
- **Operand A**: The first 8-bit operand for the operation.
- **Operand B**: The second 8-bit operand for the operation.
- **Result**: The output of the ALU operation, stored as an 8-bit value.
- **Carry Out**: The carry-out signal indicating overflow or borrow from the most significant bit during addition or subtraction operations.

## ALU Operation

The ALU operation is determined by the instruction opcode. Here is a brief explanation of each operation:

1. Addition (ADD): Performs binary addition on Operand A and Operand B.
2. Subtraction (SUB): Performs binary subtraction of Operand B from Operand A.
3. Multiplication (MUL): Multiplies Operand A and Operand B.
4. Division (DIV): Divides Operand A by Operand B.
5. Increment (INC): Increments Operand A by 1.
6. Decrement (DEC): Decrements Operand A by 1.
7. Logical AND (AND): Performs bitwise AND operation between Operand A and Operand B.
8. Logical OR (OR): Performs bitwise OR operation between Operand A and Operand B.
9. Logical NOT (NOT): Performs bitwise NOT operation on Operand A.
10. Logical XOR (XOR): Performs bitwise XOR operation between Operand A and Operand B.
11. Logical Shift Left (LSL): Performs logical left shift operation on Operand A by the number of positions specified by Operand B.
12. Logical Shift Right (LSR): Performs logical right shift operation on Operand A by the number of positions specified by Operand B.
13. Circular Shift Left (CSL): Performs circular left shift operation on Operand A by the number of positions specified by Operand B.
14. Circular Shift Right (CSR): Performs circular right shift operation on Operand A by the number of positions specified by Operand B.

## Instantiating the ALU

To use the 8-bit ALU, you can instantiate the ALU module in your Verilog design and connect the required inputs and outputs. The module provides inputs for Operand A, Operand B, instruction opcode, and outputs for the result and carry-out.

## Testing the ALU

To verify the functionality of the ALU, a testbench can be created. The testbench sets different input values for Operand A, Operand B, and the instruction opcode, and checks the output result and carry-out to ensure they match the expected values for each operation.

## Conclusion

The 8-bit ALU provides support for 14 instructions, allowing you to perform various arithmetic and logical operations on 8-bit binary numbers. By instantiating the ALU module and providing the appropriate inputs, you can easily incorporate the ALU functionality into your Verilog designs.

For a detailed implementation of the 8-bit ALU, please refer to the provided Verilog code.

