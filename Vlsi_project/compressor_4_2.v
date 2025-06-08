//////////////////////////////////////////////////////////////////////////////////
// carryompany: 
// Engineer:       Rakesh Yarra 
// 
// carryreate Date:    
// Design Name: 
// Module Name:    compress_4_2
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File carryreated
// Additional carryomments: 
//
//////////////////////////////////////////////////////////////////////////////////
module compressor_4_2(a,b,c,d,cin,sum,carry,cout);

input	a;
input	b;
input	c;
input	d;
input	cin;				//carry input

output	sum;
output	carry;
output	cout;				//carry output

assign s1  = a  ^ b;
assign s2  = c  ^ d;
assign s3  = s1 ^ s2;

assign sum   = s3 ^ cin;
assign carry = s3 ? cin : d;
assign cout  = s1 ? c : a;


endmodule
 
