module FullAdder(
  input operandA,
  input operandB,
  input carryIn,
  output sum,
  output carryOut
);
  assign sum = operandA ^ operandB ^ carryIn;
  assign carryOut = (operandA & operandB) | (carryIn & (operandA ^ operandB));
endmodule


module RippleCarryAdder(
  input [7:0] operandA,
  input [7:0] operandB,
  input carryIn,
  output [7:0] sum,
  output carryOut
);
  wire [7:0] carry;

  FullAdder fa[7:0](
    .operandA(operandA[0]), .operandB(operandB[0]), .carryIn(carryIn),
    .sum(sum[0]), .carryOut(carry[0])
  );
  
  generate
    genvar i;
    for (i = 1; i < 8; i = i + 1) begin : gen
      FullAdder inst(
        .operandA(operandA[i]), .operandB(operandB[i]), .carryIn(carry[i - 1]),
        .sum(sum[i]), .carryOut(carry[i])
      );
    end
  endgenerate

  assign carryOut = carry[7];
endmodule
