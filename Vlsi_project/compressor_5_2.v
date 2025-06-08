//////////////////////////////////////////////////////////////////////////////////
// company: 
// engineer:       Rakesh Yarra  
// 
// create date:    
// design Name: 
// Module Name:    compress_5_2
// Project Name: 
// Target devices: 
// Tool versions: 
// description: 
//
// dependencies: 
//
// Revision: 
// Revision 0.01 - File created
// additional comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module compress_5_2(a,b,c,d,e,ci1,ci2,sum,carry,co1,co2);

input	a;
input	b;
input	c;
input	d;
input	e;
input	ci1;				//carry input
input	ci2;				//carry input

output	sum;
output	carry;
output	co1;				//carry output
output	co2;				//carry output


assign s1 = b  ^ c;
assign s2 = d  ^ e;
assign s3 = a  ^ ci1;
assign s4 = s1 ^ s2;
assign s5 = s3 ^ s4;
 
assign sum     =  s5 ^ ci2;
assign carry   =  s5 ? ci2 : a;
assign co1     =  s2 ? b : d;
assign co2     =  s4 ? ci1 : c;
 
endmodule
