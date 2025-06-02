`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Coutmpany: 
// Engineer:       Praveen Bohra
// Create Date:    11:22:49 26/02/2024 
// Design Name: 
// Module Name:    sad_8_2_arch2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:    sun of difference arch using
//                 compressor_arry_8_2 using 
//                 three 3_2 and one 4_2
// Dependencies: 
// Revision: 
// Revision 0.01 - File Created
// Additional Coutmments: 
//
//////////////////////////////////////////////////////////////////////////////////
module sad_8_2_arch2(clk,reset,org0,org1,org2,org3,org4,org5,org6,org7,
                               ref0,ref1,ref2,ref3,ref4,ref5,ref6,ref7,final_sum);

input          clk,reset; 
input	[7:0]  ref0,ref1,ref2,ref3,ref4,ref5,ref6,ref7;
input	[7:0]  org0,org1,org2,org3,org4,org5,org6,org7;
output	[15:0] final_sum;

wire	[10:0] sad_sum;

wire    [15:0]  rca_sum;
reg     [15:0]  sum_reg;
reg     [7:0]   sad_0,sad_1,sad_2,sad_3,sad_4,sad_5,sad_6,sad_7;

//  Registering the absolute difference of original and reference  
always @(posedge clk)
begin
  if(reset)
	sad_0 <= 8'd0;  
  else if (org0 > ref0)
	sad_0 <= org0 - ref0;
  else  
	sad_0 <= ref0 - org0;
end      

always @(posedge clk)
begin
  if(reset)
	sad_1 <= 8'd0;  
  else if (org1 > ref1)
	sad_1 <= org1 - ref1;
  else  
	sad_1 <= ref1 - org1;
end      

always @(posedge clk)
begin
  if(reset)
	sad_2 <= 8'd0;  
  else if (org2 > ref2)
	sad_2 <= org2 - ref2;
  else  
	sad_2 <= ref2 - org2;
end      

always @(posedge clk)
begin
  if(reset)
	sad_3 <= 8'd0;  
  else if (org3 > ref3)
	sad_3 <= org3 - ref3;
  else  
	sad_3 <= ref3 - org3;
end      

always @(posedge clk)
begin
  if(reset)
	sad_4 <= 8'd0;  
  else if (org4 > ref4)
	sad_4 <= org4 - ref4;
  else  
	sad_4 <= ref4 - org4;
end      

always @(posedge clk)
begin
  if(reset)
	sad_5 <= 8'd0;  
  else if (org5 > ref5)
	sad_5 <= org5 - ref5;
  else  
	sad_5 <= ref5 - org5;
end      

always @(posedge clk)
begin
  if(reset)
	sad_6 <= 8'd0;  
  else if (org6 > ref6)
	sad_6 <= org6 - ref6;
  else  
	sad_6 <= ref6 - org6;
end      

always @(posedge clk)
begin
  if(reset)
	sad_7 <= 8'd0;  
  else if (org7 > ref7)
	sad_7 <= org7 - ref7;
  else  
	sad_7 <= ref7 - org7;
end    
  
// Instansiation of compressor_8_2_array
compressor_array_82_32_42 COMPRESSOR_ARRAY_82_32_42(
											        .P0		(sad_0),
											        .P1		(sad_1),
											        .P2		(sad_2),
											        .P3		(sad_3),
													.P4		(sad_4),
													.P5		(sad_5),
													.P6		(sad_6),
													.P7		(sad_7),
													.Sum	(sad_sum)
													); 

// Instansiation of Ripple Carry Adder
ripple_carry_adder #(.WIDTH(15)) RCA_inst_1_1(
                                              .i_add_term1   ({4'd0,sad_sum}),
                                              .i_add_term2   (sum_reg[14:0]),
   											  .i_carry_in    (1'b0),  // change accordingly
                                              .o_result      (rca_sum)
                                             );	

reg reset_l;											 

always @ (posedge clk)
begin
	reset_l <= reset;
end
	
always @(posedge clk)
begin
	if(reset_l)
		sum_reg <= 16'd0;
	else
		sum_reg <= rca_sum[15:0];
end
		
assign final_sum = sum_reg[15:0];
		
endmodule //sad_8_2_arch2