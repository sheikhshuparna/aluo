module jk_ff_tb;
    logic j;
    logic k;
    logic clk_i;
    logic rst_ni;
    logic q_o;
    logic expected_q;

// Instantiate the JK flip-flop

    jk_ff dut (
    .j(j),
    .k(k),
    .clk_i(clk_i),
    .rst_ni(rst_ni),
    .q_o(q_o)
 );
  // Clock generation
    initial begin
        clk_i = 0;
        forever #5 clk_i = ~clk_i; // 10 time units period
    end

    always_ff @ (posedge clk_i) begin
        if (!rst_ni) begin
            expected_q <= 1'b0; // Reset state
        end
        else if (j==1'b1 && k==1'b0) begin
            expected_q <= 1'b1; // Set
        end
        else if (j==1'b0 && k==1'b1) begin
            expected_q <= 1'b0; // Reset
        end
        else if (j==1'b1 && k==1'b1) begin
            expected_q <= ~expected_q; // Toggle
        end
    end

    always@ (posedge clk_i) begin
        assert (q_o == expected_q) 
        else begin
            $display("Test failed at time %0t: j=%b, k=%b, rst_ni=%b, q_o=%b, expected_q=%b", 
                     $time, j, k, rst_ni, q_o, expected_q);
        end
    end

    // Test Sequence or Stimulus

    initial begin
        rst_ni = 0; // Apply reset
        #10; rst_ni = 1; // Release reset
        #10 j=0; k=0;
        #10; j=0; k=1;
        #10; j=1; k=0;
        #10; j=1; k=1;
        #10; j=0; k=0;
        #10; j=0; k=1;
        #10; j=1; k=0;
        #10; j=1; k=1;
        #10; rst_ni = 0; // Apply reset
        #10; rst_ni = 1; // Release reset   
        #10; j=0; k=0;
        #10; j=0; k=1;
        #10; j=1; k=0;
        #10; j=1; k=1;
        #10; $finish;
    end

    initial begin
    $dumpfile("jk_ff.vcd");
    $dumpvars(0, jk_ff_tb);
    end




endmodule