`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       Rakesh Yarra 
// 
// Create Date:    
// Design Name: 
// Module Name:    compress_3_2
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
module compressor_3_2(a,b,c,sum,carry);

input	a;
input	b;
input	c;
output	sum;
output	carry;
 
 
assign sum = a ^ b ^ c;
assign carry = (a ^ b) ? c : a;
 
endmodule //compress_3_2
 
