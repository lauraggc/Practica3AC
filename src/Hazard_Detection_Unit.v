// HAZARD DETECTION UNIT

module Hazard_Detection_Unit
#
(
	parameter N =32
)
(
	input ID_EX_MemRead,
	input [4:0] ID_EX_Register_Rd,
	input [4:0] IF_ID_Register_Rs1,
	input [4:0] IF_ID_Register_Rs2,
	
	output reg IF_ID_Write_o,
	output reg PC_Write_o,
	output reg Mux_Hazard_Selector_o

);

always@(ID_EX_MemRead, ID_EX_Register_Rd, IF_ID_Register_Rs1, IF_ID_Register_Rs2) begin
		IF_ID_Write_o = 0;
		PC_Write_o = 0;
		Mux_Hazard_Selector_o = 0;
		if( ID_EX_MemRead && ((ID_EX_Register_Rd == IF_ID_Register_Rs1) || (ID_EX_Register_Rd == IF_ID_Register_Rs2)))begin
			PC_Write_o = 1;
			IF_ID_Write_o = 1;
			Mux_Hazard_Selector_o = 1;
		end
end


endmodule
