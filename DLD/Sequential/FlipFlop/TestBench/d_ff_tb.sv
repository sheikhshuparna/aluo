//////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   Module       : D Flip-Flop Testbench (d_ff_tb)
//   Last Update  : May 05, 2026
//
//   Description  : Testbench for verifying the functionality of the D flip-flop (d_ff).
//                  It generates a clock, applies reset and stimulus to input d, and
//                  checks correctness using assertion-based verification.
//
//                  Key Features:
//                  - Generates a periodic clock signal
//                  - Applies synchronous active-high reset
//                  - Drives different values on input d
//                  - Computes expected output (expected_q) based on design behavior
//                  - Uses assertions to automatically verify DUT output (q_o)
//
//                  Verification Strategy:
//                  - On each rising edge of clk:
//                      * If rst = 1 → expected_q = 0
//                      * If rst = 0 → expected_q follows d
//                  - Assertion checks q == expected_q and reports mismatch
//
//   Author       : Shuparna Haque (sheikhshuparna3108@gmail.com)
//
//////////////////////////////////////////////////////////////////////////////////////////////////////


module d_ff_tb;
logic clk;
logic rst;
logic d;
logic q;
logic expected_q;

// Instantiate the D flip-flop
d_ff dut(
    .clk(clk),
    .rst(rst),
    .d(d),
    .q_o(q)
);

// Clock generation
always begin
    #5 clk = ~clk;
end

initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    d = 0;

    // Apply reset
    #10 rst = 1; // Assert reset
    #10 rst = 0; // Deassert reset

    // Test sequence
    #10 d = 1; // Set d to 1
    #10 d = 0; // Set d to 0
    #10 d = 1; // Set d to 1
    #10 d = 0; // Set d to 0

    // Finish simulation
    #10 $finish;
end
// Expected output logic
always_ff @ (posedge clk) begin
    if (rst) begin
        expected_q <= 0; // Reset state
    end else begin
        expected_q <= d; // Follow input d
    end
end
// Assertion to check if the output matches expected value
always @ (posedge clk) begin
    assert (q == expected_q) else begin
        $display("Test failed at time %0t: rst=%b, d=%b, q=%b, expected_q=%b", 
                 $time, rst, d, q, expected_q);
    end 
end

endmodule
