
import taillights_pkg::*;

module ucsbece152a_fsm (
  input logic clk,
  input logic rst_n,
  input logic left_i,
  input logic right_i,
  input logic hazard_i,
  output state_t state_o,
  output logic [5:0] pattern_o
);

state_t state_d, state_q = S000_000;
assign state_o = state_q;

assign bus_i = {left_i, right_i, hazard_i};
// TODO: Implement the FSM and drive `pattern_o`

always_comb begin
  state_d = S000_000;
  if(bus_i == 3'b000) begin
    case (state_d)
      S000_000: state_d = S000_000;
      S000_100: state_d = S000_000;
      S000_110: state_d = S000_000;
      S000_111: state_d = S000_000;
      S001_000: state_d = S000_000;
      S011_000: state_d = S000_000;
      S111_000: state_d = S000_000;
      S111_111: state_d = S000_000;
    endcase 
  end else if(bus_i == 3'b010) begin
    case (state_d)
      S000_000: state_d = S000_100;
      S000_100: state_d = S000_110;
      S000_110: state_d = S000_111;
      S000_111: state_d = S000_000;
      S001_000: state_d = S000_100;
      S011_000: state_d = S000_100;
      S111_000: state_d = S000_100;
      S111_111: state_d = S000_100;
    endcase 
  end else if(bus_i == 3'b100) begin
    case (state_d)
      S000_000: state_d = S000_100;
      S000_100: state_d = S000_110;
      S000_110: state_d = S000_111;
      S000_111: state_d = S000_000;
      S001_000: state_d = S000_100;
      S011_000: state_d = S000_100;
      S111_000: state_d = S000_100;
      S111_111: state_d = S000_100;
    endcase 
  end else if(bus_i == 3'b001 or bus_i == 3'b11 or bus_i == 3'b101 or bus_i == 3'b110 or bus_i = 3'b111) begin
    case (state_d)
      S000_000: state_d = S001_000;
      S000_100: state_d = S001_000;
      S000_110: state_d = S001_000;
      S000_111: state_d = S001_000;
      S001_000: state_d = S011_000
      S011_000: state_d = S111_000
      S111_000: state_d = S000_000;
      S111_111: state_d = S001_000;
    endcase

  end

end

always_ff @(posedege clk or posedge rst) begin
  if(rst) begin
    state_q <= S000_000; 
  end else begin
    state_q <= state_d;
  end

end
endmodule
