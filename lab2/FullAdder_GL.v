//========================================================================
// FullAdder_GL
//========================================================================

`ifndef FULL_ADDER_GL_V
`define FULL_ADDER_GL_V

`include "ece2300/ece2300-misc.v"

module FullAdder_GL
(
  (* keep=1 *) input  wire in0, // keep=1 means that we want this to remain in the interface no matter what
  (* keep=1 *) input  wire in1,
  (* keep=1 *) input  wire cin,
  (* keep=1 *) output wire cout,
  (* keep=1 *) output wire sum
);

  //''' ACTIVITY '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  // Implement full adder w/ explicit gate-level modeling
  //''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

  // sum gate-level
  wire xorins;
  xor(xorins, in1, in0);
  xor(sum, xorins, cin);

  // cout gate-level
  wire andins1, andins2, andins3, orins1;
  and(andins1, in1, cin);
  and(andins2, in0, cin);
  and(andins3, in0, in1);
  or(orins1, andins1, andins2);
  or(cout, orins1, andins3);

  // boolean equation implementation (faster way)
  //assign sum = in0 ^ in1 ^ cin;
  //assign cout = (in0 & in1) | (in1 & cin) | (in0 & cin);

endmodule

`endif /* FULL_ADDER_GL_V */

