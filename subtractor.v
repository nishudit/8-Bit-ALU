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

/*
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

*/