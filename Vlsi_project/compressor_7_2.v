//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       Rakesh Yarra 
// 
// Create Date:    
// Design Name: 
// Module Name:    compress_7_2
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
module compressor_7_2(X1,X2,X3,X4,X5,X6,X7,cin1,
                      cin2,sum,carry,cout1,cout2);
					  
// Port Declaration
input 	X1,X2,X3,X4,X5,X6,X7,cin1,cin2;
output  sum,carry,cout1,cout2;

// Data Type


// Code Starts
assign s1 = X2 ^ X3;
assign s3 = X4 ^ s1;
assign c1 = s1 ? X4 : X3;

assign s2 = X5 ^ X6;
assign s4 = X7 ^ s2;
assign c2 = s2 ? X7 : X5; 

assign c3 = c1 ^ c2;
assign s5 = s3 ^ s4;

assign s6 = X1 ^ s5;
assign c4 = s5 ? X1 : s3;

assign cout1 = c3 ^ c4;
assign cout2 = c3 ? c4 : c1;

assign s7 = cin2 ^ s6;
assign sum = cin1 ^ s7;
assign carry = s7 ? cin1 : s6;

endmodule // compressor_7_2
