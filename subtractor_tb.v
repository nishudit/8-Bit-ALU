`timescale 1ns/1ns
`include "subtractor.v"



module Testbench;
  reg [7:0] operandA;
  reg [7:0] operandB;
  reg select;
  wire [7:0] result;
  wire carryOut;

  AdderSubtractor addsub(
    .operandA(operandA),
    .operandB(operandB),
    .select(select),
    .result(result),
    .carryOut(carryOut)
  );

  initial begin
    $dumpfile("addsub_tb.vcd");
    $dumpvars(0, Testbench);
    
    // Initialize inputs
    operandA = 8'b10101010;
    operandB = 8'b01010101;
    select = 1'b0;

    #10;

    // Change inputs for subtraction
    operandA = 8'b01110000;
    operandB = 8'b00000001;
    select = 1'b1;
    #10;

    // Change inputs for addition
    operandA = 8'd31;
    operandB = 8'd31;
    select = 1'b1;
    #10;

    // Change inputs for addition
    operandA = 8'd67;
    operandB = 8'd45;
    select = 1'b1;
    #10;

    // Change inputs for addition
    operandA = 8'd98;
    operandB = 8'd31;
    select = 1'b1;
    #10;

    // Change inputs for addition
    operandA = 8'hF0;
    operandB = 8'h0F;
    select = 1'b1;

    // Wait for some time to observe the outputs
    #10;

    // End simulation
    $finish;
  end
endmodule
