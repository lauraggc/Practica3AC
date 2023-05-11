/******************************************************************
* Description
*	This is an 32-bit arithetic logic unit that can execute the next set of operations:
*		add

* This ALU is written by using behavioral description.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/

module ALU 
(
	input [3:0] ALU_Operation_i,
	input signed [31:0] A_i,
	input signed [31:0] B_i,
	output reg Zero_o,
	output reg [31:0] ALU_Result_o
);

// Se igualan los códigos a la instrucción
localparam ADD = 4'b00_00;
localparam SUB = 4'b00_01;   
localparam OR  = 4'b00_10;
localparam AND = 4'b00_11;
localparam XOR = 4'b01_00;
localparam SLL = 4'b01_01;
localparam SRL = 4'b01_10;
localparam LUI = 4'b01_11;
localparam LW  = 4'b10_00; // también es sw
localparam BEQ = 4'b10_01;
localparam BNE = 4'b10_10;
localparam JAL = 4'b10_11;
localparam JALR= 4'b11_00;

localparam SLTI= 4'b11_01;
localparam SRAI= 4'b11_10;

localparam AUIPC=4'b11_11;


	
   always @ (A_i or B_i or ALU_Operation_i)
     begin
	  // Se hacen las operaciones de la ALU
		case(ALU_Operation_i)
			ADD: ALU_Result_o = A_i + B_i;
			SUB: ALU_Result_o = A_i - B_i;
			OR:  ALU_Result_o = A_i | B_i;
			AND: ALU_Result_o = A_i & B_i;
			XOR: ALU_Result_o = A_i ^ B_i;
			SLL: ALU_Result_o = A_i << B_i;
			SRL: ALU_Result_o = A_i >> B_i;
			LUI: ALU_Result_o = B_i << 4'b1100;
			LW:  ALU_Result_o = A_i + B_i;
			JAL: ALU_Result_o = 0;
			JALR:ALU_Result_o = A_i + B_i;
			SLTI:ALU_Result_o = (A_i < B_i)?1:0;
			SRAI:ALU_Result_o = A_i >> B_i;
			AUIPC: ALU_Result_o = A_i + (B_i << 4'b1100);
			BEQ: 
				begin 
					if(A_i == B_i) ALU_Result_o = 0;
					else ALU_Result_o = 1;
				end
			BNE:
				begin
					if(A_i != B_i) ALU_Result_o = 0;
					else ALU_Result_o = 1;
				end
			
		default: ALU_Result_o = 0;
		// lo tuve que comentar porque si no cuando el selector se volvía loco al final de la operación, agarraba
		// el valor de default y pues se sumaba
		endcase // case(control)
		
		Zero_o = (ALU_Result_o == 0) ? 1'b1 : 1'b0;
		
     end // always @ (A or B or control)
endmodule // ALU