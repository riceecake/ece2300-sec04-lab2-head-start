//========================================================================
// AdderRippleCarry_4b_GL
//========================================================================

`ifndef ADDER_RIPPLE_CARRY_4B_GL_V
`define ADDER_RIPPLE_CARRY_4B_GL_V

`include "ece2300/ece2300-misc.v"
`include "lab2/FullAdder_GL.v"

module AdderRippleCarry_4b_GL
(
  (* keep=1 *) input  wire [3:0] in0,
  (* keep=1 *) input  wire [3:0] in1,
  (* keep=1 *) input  wire       cin,
  (* keep=1 *) output wire       cout,
  (* keep=1 *) output wire [3:0] sum
);

  //''' LAB ASSIGNMENT '''''''''''''''''''''''''''''''''''''''''''''''''''
  // Implement 4-bit ripple carry adder using FullAdder_GL module
  //''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

  wire cout0, cout1, cout2;

  FullAdder_GL fa0
  (
    .in0 (in0[0]),
    .in1 (in1[0]),
    .cin (cin),
    .cout (cout0),
    .sum (sum[0])
  );

  FullAdder_GL fa1
  (
    .in0 (in0[1]),
    .in1 (in1[1]),
    .cin (cout0),
    .cout (cout1),
    .sum (sum[1])
  );

  FullAdder_GL fa2
  (
    .in0 (in0[2]),
    .in1 (in1[2]),
    .cin (cout1),
    .cout (cout2),
    .sum (sum[2])
  );
  
  FullAdder_GL fa3
  (
    .in0 (in0[3]),
    .in1 (in1[3]),
    .cin (cout2),
    .cout (cout),
    .sum (sum[3])
  );

endmodule

`endif /* ADDER_RIPPLE_CARRY_4B_GL_V */

