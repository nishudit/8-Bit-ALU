`timescale 1ns/1ns
`include "adder.v"

module testbench;
  reg [7:0] operandA;
  reg [7:0] operandB;
  reg carryIn;
  wire [7:0] sum;
  wire carryOut;

  RippleCarryAdder adder(
    .operandA(operandA),
    .operandB(operandB),
    .carryIn(carryIn),
    .sum(sum),
    .carryOut(carryOut)
  );

  initial begin
    $dumpfile("adder_tb.vcd");
    $dumpvars(0, testbench);
    
    // Initialize inputs
    operandA = 8'b10101010;
    operandB = 8'b01010101;
    carryIn = 1'b0;

    #10;

    // Change inputs
    operandA = 8'b00001111;
    operandB = 8'b00000001;
    carryIn = 1'b0;

    #10;

    // Change inputs
    operandA = 8'd25;
    operandB = 8'd31;
    carryIn = 1'b0;

    // Wait for some time to observe the outputs
    #10;

    // End simulation
    $finish;
  end
endmodule
