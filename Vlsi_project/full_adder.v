`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       Rakesh Yarra 
// 
// Create Date:    
// Design Name: 
// Module Name:    full_adder
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

module full_adder(i_x1,i_x2,i_cin,o_sum,o_carry);
 
// Port Declaration  
  input  i_x1;               // First input 
  input  i_x2;               // Second input 
  input  i_cin;            // Third input carry in
  output o_sum;
  output o_carry;
 
// internal variables
  wire   w_WIRE_1;
  wire   w_WIRE_2;
  wire   w_WIRE_3;
       
// Code Starts 
  assign w_WIRE_1 =  i_x1 ^ i_x2;
  assign w_WIRE_2 =   w_WIRE_1  & i_cin;
  assign w_WIRE_3 = (!w_WIRE_1) & i_x1;
  
  assign o_sum   =  w_WIRE_1 ^ i_cin;
  assign o_carry =  w_WIRE_2 | w_WIRE_3;
 
endmodule // full_adder
