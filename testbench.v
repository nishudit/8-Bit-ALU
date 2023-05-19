`timescale 1ns / 1ns
`include "design.v"

module rippleadder_b;

reg [7:0] a;

reg [7:0] b;

reg cin;

wire [7:0] sum;

wire cout;

ripplemod uut (.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout) );
  // Clock generation
  reg clk = 0;
  always #5 clk = ~clk;
initial begin
    $dumpfile("testbench.vcd"); // Set the VCD dump file name
    $dumpvars(0, rippleadder_b); // Dump all signals from the add instance

#10 a=8'b00000001;b=8'b00000001;cin=1'b0;

#10 a=8'b00000001;b=8'b00000001;cin=1'b1;

#10 a=8'b00000010;b=8'b00000011;cin=1'b0;

#10 a=8'b01000001;b=8'b10000001;cin=1'b0;

#10 a=8'b00011001;b=8'b00110001;cin=1'b0;

#10 a=8'b00000011;b=8'b00000011;cin=1'b1;

#10 a=8'b11111111;b=8'b00000001;cin=1'b0;

#10 a=8'b11111111;b=8'b00000000;cin=1'b1;

#10 a=8'b11111111;b=8'b11111111;cin=1'b0;

$finish;

end

endmodule

/*`timescale 1ns / 1ns
`include "design.v"
module adder_tb;


  // Inputs
  reg [7:0] operandA;
  reg [7:0] operandB;

  // Outputs
  wire [7:0] result;
  wire carry;

  // Instantiate the design under test
  add add_inst (
    .operandA(operandA),
    .operandB(operandB),
    .result(result),
    .carry(carry)
  );

  // Clock generation
  reg clk = 0;
  always #5 clk = ~clk;

  // Test stimulus
  initial begin
    $dumpfile("adder_tb.vcd"); // Set the VCD dump file name
    $dumpvars(0, add_inst); // Dump all signals from the add instance
    $display("Starting test");

    operandA = 8'h32;
    operandB = 8'h5;
    #10;

    operandA = 8'h7f;
    operandB = 8'h80;
    #10;

    operandA = 8'hff;
    operandB = 8'h01;
    #10;

    $display("Test complete");
    $finish;
  end

endmodule
*/