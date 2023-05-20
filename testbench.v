`timescale 1ns/1ns
`include "alu_design.v"

module ALU_Testbench;
  reg [7:0] operandA;
  reg [7:0] operandB;
  reg [3:0] opCode;
  wire [7:0] result;
  wire carryOut;

  ALU alu (
    .operandA(operandA),
    .operandB(operandB),
    .opCode(opCode),
    .result(result),
    .carryOut(carryOut)
  );

  initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(0, ALU_Testbench);
    // Test case 1: Addition (ADD)
    operandA = 8'b00110011;
    operandB = 8'b01010101;
    opCode = 4'b0000; // ADD
    #10;

    // Test case 2: Subtraction (SUB)
    operandA = 8'b01010101;
    operandB = 8'b00110011;
    opCode = 4'b0001; // SUB
    #10;

    // Test case 3: Multiplication (MUL)
    operandA = 8'b00001111;
    operandB = 8'b00000010;
    opCode = 4'b0010; // MUL
    #10;

    // Test case 4: Division (DIV)
    operandA = 8'b01111110;
    operandB = 8'b00000011;
    opCode = 4'b0011; // DIV
    #10;

    // Test case 5: Increment (INC)
    operandA = 8'b01010101;
    operandB = 8'b00000000;
    opCode = 4'b0100; // INC
    #10;

    // Test case 6: Decrement (DEC)
    operandA = 8'b10101010;
    operandB = 8'b00000000;
    opCode = 4'b0101; // DEC
    #10;

    // Test case 7: AND (AND)
    operandA = 8'b10101010;
    operandB = 8'b11001100;
    opCode = 4'b0110; // AND
    #10;

    // Test case 8: OR (OR)
    operandA = 8'b10101010;
    operandB = 8'b11001100;
    opCode = 4'b0111; // OR
    #10;

    // Test case 9: NOT (NOT)
    operandA = 8'b10101010;
    operandB = 8'b00000000;
    opCode = 4'b1000; // NOT
    #10;

    // Test case 10: XOR (XOR)
    operandA = 8'b10101010;
    operandB = 8'b11001100;
    opCode = 4'b1001; // XOR
    #10;

    // Test case 11: Logical Shift Left (LSL)
    operandA = 8'b01010101;
    operandB = 8'b00000010;
    opCode = 4'b1010; // LSL
    #10;

    // Test case 12: Logical Shift Right (LSR)
    operandA = 8'b01010101;
    operandB = 8'b00000010;
    opCode = 4'b1011; // LSR
    #10;

    // Test case 13: Circular Shift Left (CSL)
    operandA = 8'b01010101;
    operandB = 8'b00000000;
    opCode = 4'b1100; // CSL
    #10;

    // Test case 14: Circular Shift Right (CSR)
    operandA = 8'b01010101;
    operandB = 8'b00000000;
    opCode = 4'b1101; // CSR
    #10;

    $finish;
  end

endmodule
