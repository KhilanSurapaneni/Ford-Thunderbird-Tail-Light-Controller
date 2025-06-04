/*
* Copyright (c) 2023, University of California; Santa Barbara
* Distribution prohibited. All rights reserved.
*
* File: ucsbece152a_taillights.sv
* Description: Starter code for taillights.
*/
module ucsbece152a_taillights (
  input logic clk,
  input logic rst_n,
  input logic clk_dimmer_i,
  input logic left_i,
  input logic right_i,
  input logic hazard_i,
  input logic brake_i,
  input logic runlights_i,
  output logic [5:0] lights_o
);

logic [5:0] fsm_pattern;
ucsbece152a_fsm fsm (
.clk(clk),
.rst_n(rst_n),
.left_i(left_i),
.right_i(right_i),
.hazard_i(hazard_i),
.pattern_o(fsm_pattern)
);

logic [5:0] base = 6'b000000;
always_comb begin
  base = fsm_pattern;
  if(brake_i) begin
    if(left_i) begin
      base[2:0] = 3'b111;  
    end else if(right_i) begin
      base[5:3] = 3'b111;  
    end else begin
      base= 6'b111111;
    end
  end
  
  if(runlights_i) begin
    for (int i = 0; i < 6; i++) begin
      if (base[i]) begin
        lights_o[i] = 1;  // lit
      end else begin
        lights_o[i] = clk_dimmer_i;  // dim blinking
      end
    end
  end else begin
    lights_o = base;
  end
end

// TODO: Convert `fsm_pattern` into `lights_o`
endmodule

