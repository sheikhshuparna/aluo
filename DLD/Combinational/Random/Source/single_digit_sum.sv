module single_digit_sum (
    input logic [9:0] num_i,
    output logic [3:0] sum
);
logic [3:0] digit_1, digit_2, digit_3;
logic [9:0] temp_sum;
    always_comb begin
        temp_sum = num_i;
        while (temp_sum>9) begin
            digit_1 = (temp_sum/100)%10;
            digit_2 = (temp_sum/10) % 10;
            digit_3 = temp_sum % 10;
        temp_sum = digit_1 + digit_2 + digit_3;
        end
            sum = temp_sum;
    end
endmodule