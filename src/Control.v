/******************************************************************
* Description
*	This is control unit for the RISC-V Microprocessor. The control unit is 
*	in charge of generation of the control signals. Its only input 
*	corresponds to opcode from the instruction bus.
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/
module Control
(
	input [6:0]OP_i,
	
	output auipc,
	output Jal_o,
	output Jalr_o,
	output Branch_o,
	output Mem_Read_o,
	output Mem_to_Reg_o,
	output Mem_Write_o,
	output ALU_Src_o,
	output Reg_Write_o,
	output [2:0]ALU_Op_o
);

// Tipos de instrucción con su opcode
localparam R_Type 		= 7'h33;
localparam I_Type_Logic = 7'h13;
localparam U_Type       = 7'h37;
localparam LW_Type 		= 7'h03;
localparam SW_Type 		= 7'h23;
localparam B_Type			= 7'h63;
localparam J_Type			= 7'h6F;
localparam I_Type_JALR  = 7'h67;
localparam U_Type_AUIPC = 7'h17;

reg [11:0] control_values;

always@(OP_i) begin
	// Variables de control dependiendo del tipo de instrucción
	case(OP_i)//                          109 876_54_3_210
		R_Type: 			control_values = 12'b0_00_001_00_0_000;
		I_Type_Logic:  control_values	= 12'b0_00_001_00_1_001;
		U_Type:  		control_values	= 12'b0_00_001_10_1_010;
		LW_Type:			control_values = 12'b0_00_011_10_1_011;
		SW_Type:			control_values = 12'b0_00_000_01_1_101;
		B_Type:			control_values = 12'b0_00_100_00_0_100;
		J_Type:			control_values = 12'b0_01_101_00_1_101;
		I_Type_JALR:   control_values = 12'b0_10_101_00_1_110;
		U_Type_AUIPC:  control_values = 12'b1_00_001_00_1_111;
		default:
			control_values= 11'b00_000_00_0_000;
		endcase
end

assign auipc = control_values[11];
// Se enciende si es jalr la instrucción
assign Jalr_o = control_values[10];

// Se enciende si es jal la instrucción
assign Jal_o = control_values[9];	

assign Branch_o = control_values[8];

assign Mem_to_Reg_o = control_values[7];

assign Reg_Write_o = control_values[6];

assign Mem_Read_o = control_values[5];

assign Mem_Write_o = control_values[4];

assign ALU_Src_o = control_values[3]; // inmediato o no

assign ALU_Op_o = control_values[2:0];	

endmodule


