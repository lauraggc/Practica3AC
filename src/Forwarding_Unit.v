// FORWARDING UNIT

module Forwarding_Unit
#
(
	parameter N =32
)
(
	input hazard_selector,
	input [2:0] alu_op,
	input EX_MEM_RegWrite,
	input MEM_WB_RegWrite,
	input [4:0] MEM_WB_Register_Rd,
	input [4:0] EX_MEM_Register_Rd,
	input [4:0] ID_EX_Register_Rs1,
	input [4:0] ID_EX_Register_Rs2,
	
	output reg [1:0] ForwardA,
	output reg [1:0] ForwardB

);

always@(ID_EX_Register_Rs1 or ID_EX_Register_Rs2 or EX_MEM_Register_Rd or MEM_WB_Register_Rd or EX_MEM_RegWrite or MEM_WB_RegWrite) 
	begin
		ForwardA = 2'b00;
		ForwardB = 2'b00;
		
		if((EX_MEM_RegWrite) && (EX_MEM_Register_Rd!=0) && (EX_MEM_Register_Rd == ID_EX_Register_Rs1))begin
			ForwardA = 2'b10;
		end
		if((EX_MEM_RegWrite) && (EX_MEM_Register_Rd!=0) && (EX_MEM_Register_Rd == ID_EX_Register_Rs2))begin
			ForwardB = 2'b10;
		end
		if((MEM_WB_RegWrite) && (MEM_WB_Register_Rd!=0) && (EX_MEM_Register_Rd != ID_EX_Register_Rs1) && (MEM_WB_Register_Rd == ID_EX_Register_Rs1))begin
			ForwardA = 2'b01;
		end
		if((MEM_WB_RegWrite) && (MEM_WB_Register_Rd!=0) && (EX_MEM_Register_Rd != ID_EX_Register_Rs2) && (MEM_WB_Register_Rd == ID_EX_Register_Rs2))begin
			ForwardB = 2'b01;
		end
		if(hazard_selector)begin
			ForwardA = 2'b00;
			ForwardB = 2'b00;
		end
	end


endmodule
