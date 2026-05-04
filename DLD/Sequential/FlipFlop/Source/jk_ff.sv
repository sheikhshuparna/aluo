//////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   Module      : JK Flip-Flop (jk_ff)
//   Last Update  : May 04, 2026
//
//   Description : Implements a synchronous JK flip-flop with active-low synchronous reset.
//                  On each rising edge of clk_i, the output q_o updates based on J and K inputs:
//                  - J=0, K=0 : Hold previous state
//                  - J=0, K=1 : Reset output to 0
//                  - J=1, K=0 : Set output to 1
//                  - J=1, K=1 : Toggle output
//
//   The reset (rst_ni) is synchronous and active-low. When asserted (0), q_o is cleared.
//
//   Author      : Shuparna Haque (sheikhshuparna3108@gmail.com)
//
//////////////////////////////////////////////////////////////////////////////////////////////////////

module jk_ff (
    input   logic j,
    input   logic k,
    input   logic clk_i,  
    input   logic rst_ni, // synchronous active low reset
    output  logic q_o
    );

    always_ff@ (posedge clk_i ) begin
        if (!rst_ni) begin
            q_o <= 1'b0;
        end
       else if (j==1'b1 && k==1'b0) begin
            q_o <= 1'b1;
        end
        else if (j==1'b0 && k==1'b1) begin
            q_o <= 1'b0;
        end
        else if (j==1'b1 && k==1'b1) begin
            q_o <= ~q_o;
        end
        else begin
            q_o <= q_o;
        end
    end

endmodule