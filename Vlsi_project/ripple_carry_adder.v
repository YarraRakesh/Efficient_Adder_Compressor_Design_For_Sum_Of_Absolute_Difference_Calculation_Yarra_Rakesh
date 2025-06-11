`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       Rakesh Yarra 
// 
// Create Date:    
// Design Name: 
// Module Name:    ripple_carry_adder
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
 
module ripple_carry_adder 
  #(parameter WIDTH = 2)
  (
   input [WIDTH-1:0] i_add_term1,
   input [WIDTH-1:0] i_add_term2,
   input                      i_carry_in,
   output [WIDTH:0]  o_result
   );
     
  wire [WIDTH:0]     w_CARRY;
  wire [WIDTH-1:0]   w_SUM;
   
  // No carry input on first full adder  
  //assign w_CARRY[0] = 1'b0;        
   assign w_CARRY[0] = i_carry_in;
   
  genvar             ii;
  generate 
    for (ii=0; ii<WIDTH; ii=ii+1) 
      begin
        full_adder FA_rca( 
                          .i_x1     (i_add_term1[ii]),
                          .i_x2     (i_add_term2[ii]),
                          .i_cin    (w_CARRY[ii]),
                          .o_sum    (w_SUM[ii]),
                          .o_carry  (w_CARRY[ii+1])
                         );
      end
  endgenerate
   
  assign o_result = {w_CARRY[WIDTH], w_SUM};   // Verilog Concatenation
 
endmodule // ripple_carry_adder
