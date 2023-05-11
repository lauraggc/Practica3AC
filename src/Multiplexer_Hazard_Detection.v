module Multiplexer_Hazard_Detection
#(
	parameter NBits = 32
)
(
	input Selector_i,
	
	input auipc,
	input Jal,
	input Jalr,
	input Branch,
	input Mem_Read,
	input Mem_to_Reg,
	input Mem_Write,
	input ALU_Src,
	input Reg_Write,
	input [2:0]ALU_Op,
	
	
	output reg auipc_o,
	output reg Jal_o,
	output reg Jalr_o,
	output reg Branch_o,
	output reg Mem_Read_o,
	output reg Mem_to_Reg_o,
	output reg Mem_Write_o,
	output reg ALU_Src_o,
	output reg Reg_Write_o,
	output reg [2:0]ALU_Op_o

);

	always@(Selector_i or auipc or Jal or Jalr or Branch or Mem_Read or Mem_to_Reg or Mem_Write or ALU_Src or Reg_Write or ALU_Op ) 
	begin // ,
		auipc_o = auipc;
		Jal_o = Jal;
		Jalr_o = Jalr;
		Branch_o = Branch;
		Mem_Read_o = Mem_Read;
		Mem_to_Reg_o = Mem_to_Reg ;
		Mem_Write_o = Mem_Write;
		ALU_Src_o = ALU_Src;
		Reg_Write_o = Reg_Write ;
		ALU_Op_o = ALU_Op;
		if(Selector_i)
		begin
			auipc_o = 0;
			Jal_o = 0;
			Jalr_o = 0;
			Branch_o = 0;
			Mem_Read_o = 0;
			Mem_to_Reg_o = 0;
			Mem_Write_o = 0;
			ALU_Src_o = 0;
			//Reg_Write_o = 0;
			ALU_Op_o = 3'b000;
		end
	end

endmodule