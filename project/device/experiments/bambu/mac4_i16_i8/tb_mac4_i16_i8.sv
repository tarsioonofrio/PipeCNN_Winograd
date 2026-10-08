module tb_mac4_i16_i8;
  logic clock = 1'b0;
  logic reset = 1'b0;
  logic start_port = 1'b0;
  logic [15:0] a0, a1, a2, a3;
  logic [7:0] b0, b1, b2, b3;
  wire done_port;
  wire [31:0] return_port;

  mac4_i16_i8 dut (.*);

  always #5 clock = ~clock;

  task automatic run_case(
      input logic signed [15:0] x0, input logic signed [7:0] y0,
      input logic signed [15:0] x1, input logic signed [7:0] y1,
      input logic signed [15:0] x2, input logic signed [7:0] y2,
      input logic signed [15:0] x3, input logic signed [7:0] y3,
      input integer case_number);
    longint signed p0, p1, p2, p3, expected;
    integer cycles;
    begin
      p0 = {{48{x0[15]}}, x0}; p0 = p0 * y0;
      p1 = {{48{x1[15]}}, x1}; p1 = p1 * y1;
      p2 = {{48{x2[15]}}, x2}; p2 = p2 * y2;
      p3 = {{48{x3[15]}}, x3}; p3 = p3 * y3;
      expected = p0 + p1 + p2 + p3;

      @(negedge clock);
      a0 = x0; b0 = y0;
      a1 = x1; b1 = y1;
      a2 = x2; b2 = y2;
      a3 = x3; b3 = y3;
      start_port = 1'b1;

      cycles = 0;
      do begin
        @(posedge clock);
        #1;
        cycles = cycles + 1;
      end while (!done_port && cycles < 10);

      if (!done_port)
        $fatal(1, "case %0d timed out", case_number);
      if ($signed(return_port) !== expected[31:0])
        $fatal(1, "case %0d: got %0d expected %0d", case_number,
               $signed(return_port), expected);

      @(negedge clock);
      start_port = 1'b0;
      $display("case %0d passed in %0d cycle(s): %0d", case_number,
               cycles, $signed(return_port));
    end
  endtask

  initial begin : test
    logic signed [15:0] ra0, ra1, ra2, ra3;
    logic signed [7:0] rb0, rb1, rb2, rb3;

    repeat (3) @(posedge clock);
    reset = 1'b1;

    run_case(-16'sd32768, -8'sd128,
             -16'sd32768, -8'sd128,
             -16'sd32768, -8'sd128,
             -16'sd32768, -8'sd128, 0);
    run_case(16'sd32767, 8'sd127,
              16'sd32767, 8'sd127,
              16'sd32767, 8'sd127,
              16'sd32767, 8'sd127, 1);
    run_case(-16'sd32768, 8'sd127,
              16'sd32767, -8'sd128,
             -16'sd12345, 8'sd67,
              16'sd23456, -8'sd89, 2);
    run_case(0, -8'sd128, -1, 8'sd127, 1, -8'sd1, 16'sd42, 0, 3);

    for (int i = 0; i < 32; i++) begin
      ra0 = 16'($urandom); rb0 = 8'($urandom);
      ra1 = 16'($urandom); rb1 = 8'($urandom);
      ra2 = 16'($urandom); rb2 = 8'($urandom);
      ra3 = 16'($urandom); rb3 = 8'($urandom);
      run_case(ra0, rb0, ra1, rb1, ra2, rb2, ra3, rb3, i + 4);
    end

    $display("PASS: 36 directed/random MAC vectors");
    $finish;
  end
endmodule
