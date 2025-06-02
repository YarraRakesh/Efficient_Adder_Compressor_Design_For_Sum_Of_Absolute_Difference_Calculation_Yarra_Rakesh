`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       Praveen Bohra
// Create Date:    11:22:49 26/02/2024 
// Design Name: 
// Module Name:    compressor_82_52_42_32 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    Compressor_8_2 using 4_2
// Dependencies: 
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module compressor_82_52_42_32(A,B,C,D,E,F,G,H,Cin0,Cin1,Cin2,Cin3,Cin4,
                              Sum,Carry,Cout0,Cout1,Cout2,Cout3,Cout4);

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
 input	Cin3;				//carry input
 input	Cin4;				//carry input
 
 output	Sum;
 output	Carry;
 output	Cout0;				//carry output
 output	Cout1;				//carry output
 output	Cout2;				//carry output
 output	Cout3;				//carry output
 output	Cout4;				//carry output  
 
 
compress_5_2 COMP_5_2(
					  .a		(A),
					  .b		(B),
					  .c		(C),
					  .d		(D),
					  .e		(E),
					  .ci1	    (Cin0),
					  .ci2	    (Cin1),
					  .sum	    (Sum_5_2),
					  .carry	(Cout2),
					  .co1		(Cout0),
					  .co2		(Cout1)
					);
						
compressor_4_2	COMP_4_2(
                         .a			(F),
                         .b			(G),
                         .c			(H),
                         .d			(Cin2),
                         .cin		(Cin3),
                         .sum		(Sum_4_2),
                         .carry		(Cout4),
                         .cout		(Cout3)
                        );
						  
compressor_3_2 COMP_3_2(
					    .a		(Sum_5_2),
					    .b		(Sum_4_2),
					    .c		(Cin4),
					    .sum	(Sum),
					    .carry	(Carry)
					   );
 
endmodule //compressor_82_52_42_32