// MÓDULOS PARA ÉTAPA ID/EX

module Id_Ex
#
(
	parameter N =32
)
(
	input reset,
	input clk,
	
	input [N-1: 0] pc_4,
	input [N-1: 0] pc,
	
	// REGISTERS
	input [N-1: 0] read_data_1,
	input [N-1: 0] read_data_2,
	input [N-1: 0] imm,
	input [N-1: 0] instruction,
	
	// CONTROL UNITS
	input auipc,
	input reg_write,
	input branch,
	input jal,
	input jalr,
	input mem_read,
	input mem_write,
	input mem_to_reg,
	input alu_src,
	input [2:0] alu_op,
	
	// OUTPUTS
	output reg [N-1:0] pc_4_o,
	output reg [N-1:0] pc_o,
	
	output reg [N-1: 0] read_data_1_o,
	output reg [N-1: 0] read_data_2_o,
	output reg [N-1: 0] imm_o,
	
	output reg auipc_o,
	output reg reg_write_o,
	output reg branch_o,
	output reg jal_o,
	output reg jalr_o,
	output reg mem_read_o,
	output reg mem_write_o,
	output reg mem_to_reg_o,
	output reg alu_src_o,
	output reg [2:0] alu_op_o,
	
	// INSTRUCTION
	output reg funct_7,// 30
	output reg [2:0] funct_3, // 14:12	
	output reg [4:0] write_register, //11:7
	output reg [N-1: 0] instruction_o
);


always@(negedge reset or negedge clk) begin
    if(reset==0) begin
		   pc_4_o <= 0;
			 pc_o <= 0;

			 read_data_1_o <= 0;
			 read_data_2_o <= 0;
			 imm_o <= imm;
			
			 auipc_o <= 0;
			 reg_write_o <= 0;
			 branch_o <= 0;
			 jal_o <= 0;
			 jalr_o <= 0;
			 mem_read_o <= 0;
			 mem_write_o <= 0;
			 mem_to_reg_o <= 0;
			 alu_src_o <= 0;
			 alu_op_o <= 0;

			 funct_7 <= 0;
			 funct_3 <= 0;
			 write_register <= 0;
			 instruction_o <= 0;
	 end
    else begin
         pc_4_o <= pc_4;
			 pc_o <= pc;

			 read_data_1_o <= read_data_1;
			 read_data_2_o <= read_data_2;
			 imm_o <= imm;

			 auipc_o <= auipc;
			 reg_write_o <= reg_write;
			 branch_o <= branch;
			 jal_o <= jal;
			 jalr_o <= jalr;
			 mem_read_o <= mem_read;
			 mem_write_o <= mem_write;
			 mem_to_reg_o <= mem_to_reg;
			 alu_src_o <= alu_src;
			 alu_op_o <= alu_op;

			 funct_7 <= instruction[30];
			 funct_3 <= instruction[14:12];
			 write_register <= instruction[11:7];
			 instruction_o <= instruction;
	end
end


endmodule