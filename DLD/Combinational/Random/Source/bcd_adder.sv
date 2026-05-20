//////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   Module       : Parameterizable BCD Adder (bcd_adder)
//   Last Update  : May 20, 2026
//
//   Description  : Performs multi-digit Binary Coded Decimal (BCD) addition on two inputs.
//                  The module processes inputs ripple-style from right to left (least to 
//                  most significant digit) and applies a +6 correction whenever an individual 
//                  digit addition exceeds 9.
//
//                  Generics / Parameters:
//                  - digit: Specifies the total number of 4-bit BCD digits (default is 4)
//
//                  Input Encoding:
//                  - a[(digit*4)-1:0]: First BCD multi-digit number packed into 4-bit chunks
//                  - b[(digit*4)-1:0]: Second BCD multi-digit number packed into 4-bit chunks
//
//                  Output Encoding:
//                  - sum[digit*4:0]: The resulting BCD sum. The most significant bit, 
//                                    sum[digit*4], acts as the final overflow carry-out bit.
//
//                  Behavior:
//                  - Adds corresponding 4-bit chunks along with the previous chunk's carry.
//                  - Corrects binary sums > 9 by adding 6 to skip the invalid hex states (A-F).
//
//   Author       : Shuparna Haque (sheikhshuparna3108@gmail.com)
//
//////////////////////////////////////////////////////////////////////////////////////////////////////

module bcd_adder #(
    parameter digit = 4                 // Number of BCD digits (4 bits per digit)
)(  
    input logic [digit*4-1:0] a, b,     // Two BCD numbers to be added
    output logic [digit*4:0] sum        // Output sum (one extra bit for carry)
    
);
    logic carry; // Carry bit for addition
    logic [4:0] temp_sum; // Temporary variable to hold the sum before adjustment
    always_comb begin
        carry = 1'b0;
        sum = 0;
        for (integer i=0; i<digit; i++) begin
            temp_sum = a[i*4+3:i*4] + b[i*4+3:i*4] + carry; // Add corresponding BCD digits and carry
        if (temp_sum > 9) begin
            temp_sum = temp_sum + 5'd6; // Adjust for BCD if sum exceeds 9
                carry = 1'b1; // Set carry for the next digit
        end else begin
            carry = 1'b0; // No carry needed
        end
        sum[i*4+3:i*4] = temp_sum[3:0]; // Store the result in the sum output
        sum[digit*4] = carry; // Store the final carry in the most significant bit of the sum
    end
end
endmodule