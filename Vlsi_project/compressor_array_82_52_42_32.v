`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Coutmpany: 
// Engineer:       Praveen Bohra
// Create Date:    11:22:49 26/02/2024 
// Design Name: 
// Module Name:    compressor_array_82_52_42_32 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    Compressor_arry_8_2 using 4_2
// Dependencies: 
// Revision: 
// Revision 0.01 - File Created
// Additional Coutmments: 
//
//////////////////////////////////////////////////////////////////////////////////
module compressor_array_82_52_42_32(P0,P1,P2,P3,P4,P5,P6,P7,Sum);

input	[7:0] P0,P1,P2,P3,P4,P5,P6,P7;
output	[10:0] Sum;

wire    [7:0]  S,Carry,Cout0,Cout1,Cout2,Cout3,Cout4;
wire    [10:0] C;
wire    [2:0]  c_sum;
  
//##################### compressor_8_2_array ######################/
 
 //compressor for 0		
 compressor_82_52_42_32 COMPRESSOR_82_52_42_32(
								      .A(P0[0]),
								      .B(P1[0]),
								      .C(P2[0]),
								      .D(P3[0]),
								      .E(P4[0]),
								      .F(P5[0]),
								      .G(P6[0]),
									  .H(P7[0]),
								      .Cin0(1'b0),
								      .Cin1(1'b0),
								      .Cin2(1'b0),
								      .Cin3(1'b0),
								      .Cin4(1'b0),
								      .Sum(S[0]),
								      .Carry(Carry[0]),
								      .Cout0(Cout0[0]),
								      .Cout1(Cout1[0]),
								      .Cout2(Cout2[0]),
								      .Cout3(Cout3[0]),
								      .Cout4(Cout4[0])
								    );

genvar i;
generate
begin
 	for(i=1; i<=7; i=i+1) begin 
		//compressor for 1 to 7
	compressor_82_52_42_32 COMPRESSOR_82_52_42_32(
  							            .A(P0[i]),
								        .B(P1[i]),
								        .C(P2[i]),
								        .D(P3[i]),
										.E(P4[i]),
										.F(P5[i]),
										.G(P6[i]),
										.H(P7[i]),
										.Cin0(Cout0[i-1]),
										.Cin1(Cout1[i-1]),
										.Cin2(Cout2[i-1]),
										.Cin3(Cout3[i-1]),
										.Cin4(Cout4[i-1]),
										.Sum(S[i]),
										.Carry(Carry[i]),
										.Cout0(Cout0[i]),
										.Cout1(Cout1[i]),
										.Cout2(Cout2[i]),
										.Cout3(Cout3[i]),
										.Cout4(Cout4[i])
										);
	end
end	
endgenerate

// Instansiation of FUll Adder
 
full_adder FULL_ADDER_0(
						.i_x1		(Carry[0]),
						.i_x2		(S[1]),
						.i_cin		(1'b0),
						.o_sum		(Sum[1]),
						.o_carry	(C[0])
					   ); 

full_adder FULL_ADDER_1(
						.i_x1		(Carry[1]),
						.i_x2		(S[2]),
						.i_cin		(C[0]),
						.o_sum		(Sum[2]),
						.o_carry	(C[1])
					   );

full_adder FULL_ADDER_2(
						.i_x1		(Carry[2]),
						.i_x2		(S[3]),
						.i_cin		(C[1]),
						.o_sum		(Sum[3]),
						.o_carry	(C[2])
					   );

full_adder FULL_ADDER_3(
						.i_x1		(Carry[3]),
						.i_x2		(S[4]),
						.i_cin		(C[2]),
						.o_sum		(Sum[4]),
						.o_carry	(C[3])
					   );

full_adder FULL_ADDER_4(
						.i_x1		(Carry[4]),
						.i_x2		(S[5]),
						.i_cin		(C[3]),
						.o_sum		(Sum[5]),
						.o_carry	(C[4])
					   );

full_adder FULL_ADDER_5(
						.i_x1		(Carry[5]),
						.i_x2		(S[6]),
						.i_cin		(C[4]),
						.o_sum		(Sum[6]),
						.o_carry	(C[5])
					   );

full_adder FULL_ADDER_6(
						.i_x1		(Carry[6]),
						.i_x2		(S[7]),
						.i_cin		(C[5]),
						.o_sum		(Sum[7]),
						.o_carry	(C[6])
					   ); 

full_adder FULL_ADDER_8(
						.i_x1		(C[6]),
						.i_x2		(Cout0[7]),
						.i_cin		(Cout1[7]),
						.o_sum		(c_sum[0]),
						.o_carry	(C[7])
					   );

full_adder FULL_ADDER_9(
						.i_x1		(Cout2[7]),
						.i_x2		(Cout3[7]),
						.i_cin		(Cout4[7]),
						.o_sum		(c_sum[1]),
						.o_carry	(C[8])
					   );

full_adder FULL_ADDER_10(
						.i_x1		(c_sum[0]),
						.i_x2		(c_sum[1]),
						.i_cin		(Carry[7]),
						.o_sum		(Sum[8]),
						.o_carry	(C[9])
					   );
					   
full_adder FULL_ADDER_11(
						.i_x1		(C[7]),
						.i_x2		(C[9]),
						.i_cin		(C[8]),
						.o_sum		(c_sum[2]),
						.o_carry	(C[10])
					   );
					   
					   
assign Sum[9]  = c_sum[2];
assign Sum[10] = C[10];
assign Sum[0]  = S[0];

endmodule //compressor_array_82_52_42_32