`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       Rakesh Yarra
// Create Date:     
// Design Name: 
// Module Name:    compressor_82_72_32 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    Compressor_8_2 using 7_2 and 3_2
// Dependencies: 
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module compressor_82_72_32(A,B,C,D,E,F,G,H,Cin0,Cin1,Cin2,
                           Sum,Carry,Cout0,Cout1,Cout2);

 input	A;
 input	B;
 input	C;
 input	D;
 input	E;
 input	F;
 input	G;
 input	H;
 input	Cin0;				//carry input
 input	Cin1;				//carry input
 input	Cin2;				//carry input
 
 output	Sum;
 output	Carry;
 output	Cout0;				//carry output
 output	Cout1;				//carry output
 output	Cout2;				//carry output
 
 
compressor_7_2 COMP_7_2(
					   .X1		(A),
					   .X2		(B),
					   .X3		(C),
					   .X4		(D),
					   .X5		(E),
					   .X6		(F),
					   .X7		(G),
					   .cin1	(Cin0),
                       .cin2	(Cin1),
					   .sum	    (SUM_7_2),
					   .carry	(Cout2),
					   .cout1	(Cout0),
					   .cout2	(Cout1)
					  ); 

compressor_3_2 COMP_3_2(
					    .a		(SUM_7_2),
					    .b		(Cin2),
					    .c		(H),
					    .sum	(Sum),
					    .carry	(Carry)
					   );

endmodule //compressor_82_72_32
