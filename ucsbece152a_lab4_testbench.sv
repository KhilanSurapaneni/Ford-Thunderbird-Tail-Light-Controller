module ucsbece152a_lab4_testbench;
  logic clk;
  logic rst_n;
  logic clk_dimmer_i;
  logic left_i;
  logic right_i;
  logic hazard_i;
  logic brake_i;
  logic runlights_i;
  logic [5:0] lights_o_t;

  ucsbece152a_taillights dut (
    .clk(clk),
    .rst_n(rst_n),
    .clk_dimmer_i(clk_dimmer_i),
    .left_i(left_i),
    .right_i(right_i),
    .hazard_i(hazard_i),
    .brake_i(brake_i),
    .runlights_i(runlights_i),
    .lights_o(lights_o_t)
  );

  // Clock generation (100 MHz)
  initial clk = 0;
  always #5 clk = ~clk;

  // Dimmer clock generation (100 Hz)
  initial clk_dimmer_i = 0;
  always #5000 clk_dimmer_i = ~clk_dimmer_i;  // 10ms half-period = 100Hz


  initial begin
    rst_n = 0;
    left_i = 0;
    right_i = 0;
    hazard_i = 0;
    brake_i = 0;
    runlights_i = 0;

    #20;
    rst_n = 1;
   
    /*#50;
    for (int i = 0; i < 8; i++) begin
      {left_i, right_i, hazard_i} = i;  // bus ordering: hazard:right:left
      #200;  // wait some time (200ns)
    end*/
    
    #200;
    left_i = 1; 
    brake_i = 1;
    
    #50;
    left_i = 0; 
    right_i = 1; 
    brake_i = 1;
    $finish;
  end

endmodule
