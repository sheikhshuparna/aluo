//////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   Module       : Seven Segment Display Decoder (seven_seg_display)
//   Last Update  : May 05, 2026
//
//   Description  : Converts a 4-bit BCD input into a 7-segment display output.
//                  The module drives segments (a–g) to display decimal digits (0–9).
//
//                  Input Encoding:
//                  - digit[3:0] represents values from 0 to 9 (BCD)
//
//                  Output Encoding:
//                  - seg_o[6:0] corresponds to segments {a, b, c, d, e, f, g}
//                  - A '0' turns ON a segment, '1' turns OFF (common anode)
//
//                  Behavior:
//                  - For valid inputs (0–9): Displays corresponding digit
//                  - For invalid inputs: Turns OFF all segments (blank display)
//
//   Author       : Shuparna Haque (sheikhshuparna3108@gmail.com)
//
//////////////////////////////////////////////////////////////////////////////////////////////////////

module seven_seg_display (
    input logic [3:0] digit, // 4-bit BCD input to represent digits 0-9
    output logic [6:0] seg_o // 7-segment display output (a-g)
);
always_comb begin
    case (digit) 
    
        4'b0000: seg_o = 7'b1000000; // Display '0'
        4'b0001: seg_o = 7'b1111001; // Display '1'
        4'b0010: seg_o = 7'b0100100; // Display '2'
        4'b0011: seg_o = 7'b0110000; // Display '3'
        4'b0100: seg_o = 7'b0011001; // Display '4'
        4'b0101: seg_o = 7'b0010010; // Display '5'
        4'b0110: seg_o = 7'b0000010; // Display '6'
        4'b0111: seg_o = 7'b1111000; // Display '7'
        4'b1000: seg_o = 7'b0000000; // Display '8'
        4'b1001: seg_o = 7'b0010000; // Display '9'
    
    default: seg_o = 7'b1111111; // All segments off for invalid input
    endcase
end

endmodule