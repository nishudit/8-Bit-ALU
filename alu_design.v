module FullAdder(
  input operandA,
  input operandB,
  input carryIn,
  input subtract,
  output sum,
  output carryOut
);
  wire a;
  wire b;
  wire cin;
  wire cout;
  
  assign a = operandA ;
  assign b = operandB ^ subtract;
  assign cin = carryIn;
  
  assign sum = a ^ b ^ cin;
  assign carryOut = (a & b) | (cin & (a ^ b)) | (subtract & operandA & b);
endmodule

module AdderSubtractor(
  input [7:0] operandA,
  input [7:0] operandB,
  input select,
  output [7:0] result,
  output carryOut
);
  wire [7:0] carry;
  wire [7:0] sum;

  FullAdder fa[7:0](
    .operandA(operandA[0]),
    .operandB(operandB[0]),
    .carryIn(select),
    .subtract(select),
    .sum(sum[0]),
    .carryOut(carry[0])
  );
  
  generate
    genvar i;
    for (i = 1; i < 8; i = i + 1) begin : gen
      FullAdder inst(
        .operandA(operandA[i]),
        .operandB(operandB[i]),
        .carryIn(carry[i - 1]),
        .subtract(select),
        .sum(sum[i]),
        .carryOut(carry[i])
      );
    end
  endgenerate

  assign result = sum;
  assign carryOut = carry[7];
endmodule

module ALU(
  input [7:0] operandA,
  input [7:0] operandB,
  input [3:0] opCode,
  output reg [7:0] result,
  output reg carryOut
);

  wire [7:0] addsubResult;
  wire addsubCarryOut;
  
  AdderSubtractor addsub (
    .operandA(operandA),
    .operandB(operandB),
    .select(opCode[0]),
    .result(addsubResult),
    .carryOut(addsubCarryOut)
  );

  always @(*) begin
    case (opCode)
      4'b0000: result = addsubResult; // Addition (ADD)
      4'b0001: result = addsubResult; // Subtraction (SUB)
      4'b0010: result = operandA * operandB; // Multiply (MUL)
      4'b0011: result = operandA / operandB; // Divide (DIV)
      4'b0100: result = operandA + 1; // Increment (INC)
      4'b0101: result = operandA - 1; // Decrement (DEC)
      4'b0110: result = operandA & operandB; // AND (AND)
      4'b0111: result = operandA | operandB; // OR (OR)
      4'b1000: result = ~operandA; // NOT (NOT)
      4'b1001: result = operandA ^ operandB; // XOR (XOR)
      4'b1010: result = operandA << operandB; // Logical Shift Left (LSL)
      4'b1011: result = operandA >> operandB; // Logical Shift Right (LSR)
      4'b1100: result = {operandA[6:0], operandA[7]}; // Circular Shift Left (CSL)
      4'b1101: result = {operandA[0], operandA[7:1]}; // Circular Shift Right (CSR)
      default: result = 8'b0;
    endcase
  end

  always @(addsubCarryOut) begin
    case (opCode)
      4'b0000: carryOut = addsubCarryOut; // Carry-out from addition
      4'b0001: carryOut = addsubCarryOut; // Borrow from subtraction
      default: carryOut = 1'b0;
    endcase
  end

endmodule
