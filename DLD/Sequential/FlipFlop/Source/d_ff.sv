//////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   Module       : D Flip-Flop (d_ff)
//   Last Update  : May 05, 2026
//
//   Description  : Implements a synchronous D flip-flop with active-high synchronous reset.
//                  On each rising edge of clk, the output q_o updates as follows:
//                  - rst = 1 : Output is reset to 0
//                  - rst = 0 : Output follows input d
//
//   The reset (rst) is synchronous and active-high. When asserted (1), q_o is cleared.
//   Otherwise, q_o captures the value of input d on the rising edge of clk.
//
//   Author       : Shuparna Haque (sheikhshuparna3108@gmail.com)
//
//////////////////////////////////////////////////////////////////////////////////////////////////////

module d_ff (
    input logic clk,
    input logic rst,  //Synchronous active-highreset
    input logic d,
    output logic q_o
);
always_ff @(posedge clk) 
begin
    if(!rst)
        q_o<=d;
    else
        q_o<=0;
end

endmodule
