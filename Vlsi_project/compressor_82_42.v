`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:       Praveen Bohra
// Create Date:    11:22:49 26/02/2024 
// Design Name: 
// Module Name:    compressor_82_42 
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
module compressor_82_42(A,B,C,D,E,F,G,H,Cin0,Cin1,Cin2,Cin3,Cin4,
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
 
 
compressor_4_2	COMP_4_2_0(
                           .a			(E),
                           .b			(F),
                           .c			(G),
                           .d			(H),
                           .cin		    (Cin0),
                           .sum			(Sum_4_2_0),
                           .carry		(Cout3),
                           .cout		(Cout2)
                          );
 
compressor_4_2	COMP_4_2_1(
                           .a			(A),
                           .b			(B),
                           .c			(C),
                           .d			(D),
                           .cin		    (Cin1),
                           .sum			(Sum_4_2_1),
                           .carry		(Cout1),
                           .cout		(Cout0)
                          );
						  
compressor_4_2	COMP_4_2_2(
                           .a			(Cin2),
                           .b			(Sum_4_2_1),
                           .c			(Cin3),
                           .d			(Sum_4_2_0),
                           .cin		    (Cin4),
                           .sum			(Sum),
                           .carry		(Carry),
                           .cout		(Cout4)
                          );						  
 
endmodule //compressor_82_42