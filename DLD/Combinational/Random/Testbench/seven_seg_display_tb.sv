module seven_seg_display_tb ();

logic [3:0] digit; // 4-bit BCD input
logic [6:0] seg_o; // 7-segment display output
logic [6:0] expected_seg_o; // Expected output for verification

seven_seg_display dut (
    .digit(digit),
    .seg_o(seg_o)
);
initial begin
    for (int i=0;i<10;i++) begin
        digit = i;
        #10;
        $display("Time: %0t, Input digit: %b, Output seg_o: %b", $time, digit, seg_o);
    end
    #10 $finish;
end
always_comb begin
    case (digit) 
        4'b0000: expected_seg_o = 7'b1000000; // Display '0'
        4'b0001: expected_seg_o = 7'b1111001; // Display '1'
        4'b0010: expected_seg_o = 7'b0100100; // Display '2'
        4'b0011: expected_seg_o = 7'b0110000; // Display '3'
        4'b0100: expected_seg_o = 7'b0011001; // Display '4'
        4'b0101: expected_seg_o = 7'b0010010; // Display '5'
        4'b0110: expected_seg_o = 7'b0000010; // Display '6'
        4'b0111: expected_seg_o = 7'b1111000; // Display '7'
        4'b1000: expected_seg_o = 7'b0000000; // Display '8'
        4'b1001: expected_seg_o = 7'b0010000; // Display '9'
    
    default: expected_seg_o = 7'b1111111; // All segments off for invalid input
    endcase
end

always @ (posedge digit) begin
    assert (seg_o == expected_seg_o) else begin
        $display("Test failed at time %0t: digit=%b, seg_o=%b, expected_seg_o=%b", 
                 $time, digit, seg_o, expected_seg_o);
    end
end

 initial begin
    $dumpfile("seven_seg_display.vcd");
    $dumpvars(0, seven_seg_display_tb);
    end


endmodule