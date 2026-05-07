//////////////////////////////////////////////////////////////////////////////////////////////////////
//
//   Module       : Blocking vs Non-Blocking Assignment Demo (blocking_non_blocking)
//   Last Update  : May 07, 2026
//
//   Description  : Demonstrates the fundamental difference between Blocking (=) 
//                  and Non-blocking (<=) assignments in the SystemVerilog scheduler.
//
//                  Key Concepts:
//                  - Blocking assignments update the LHS immediately.
//                  - Non-blocking assignments schedule the update for the NBA region.
//                  - To observe Non-blocking updates within the same time step, 
//                    a small delay (e.g., #0 or #1) is required to allow the 
//                    scheduler to process the NBA queue.
//
//   Author       : Shuparna Haque (sheikhshuparna3108@gmail.com)
//
//////////////////////////////////////////////////////////////////////////////////////////////////////

module blocking_non_blocking;
int a,b;
initial begin
    a = 10;
    b = 15;
    $display ("\tBefore Assignment :: VAlue of a is  %0d",a); //Before Assignment :: VAlue of a is  10
    $display ("\tBefore Assignment :: VAlue of b is  %0d",b); //Before Assignment :: VAlue of b is  15
    a<= b; 
    b<= 20; 
    $display ("\tAfter Assignment :: VAlue of a is  %0d",a);  //After Assignment :: VAlue of a is  10
    $display ("\tAfter Assignment :: VAlue of b is  %0d",b);  //After Assignment :: VAlue of b is  15
end 
 
final begin 
    $display("\tEnd of Simulation :: Value of a is %d",a);    //End of Simulation :: Value of a is 15
    $display("\tEnd of Simulation :: Value of b is %d",b);    //End of Simulation :: Value of b is 20
end
endmodule

