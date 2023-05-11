// MÓDULOS PARA ÉTAPA EX/MEM

module Ex_Mem
#
(
	parameter N =32
)
(
	input reset,
	input clk,
	
	input [N-1:0] pc_imm,
	input [N-1:0] pc_4,
	
	input [N-1: 0] read_data_1,
	input [N-1: 0] read_data_2,
	
	input [N-1:0] alu_result,
	
	input [4:0] write_register,
	
	// CONTROL UNITS
	input reg_write,
	input branch,
	input jal,
	input jalr,
	input mem_read,
	input mem_write,
	input mem_to_reg,
	
	// OUTPUTS
	output reg reg_write_o,
	output reg branch_o,
	output reg jal_o,
	output reg jalr_o,
	output reg mem_read_o,
	output reg mem_write_o,
	output reg mem_to_reg_o,
	
	output reg [N-1: 0] read_data_1_o,
	output reg [N-1: 0] read_data_2_o,
	
	output reg [N-1:0] alu_result_o,
	
	output reg [4:0] write_register_o,
	
	output reg [N-1:0] pc_imm_o,
	output reg [N-1:0] pc_4_o
);



always@(negedge reset or negedge clk) begin
    if(reset==0) begin
		  pc_imm_o <= 0;
			pc_4_o <= 0;

			read_data_1_o <= 0;
			read_data_2_o <= 0;

			alu_result_o <= 0;

			write_register_o <= 0;

			reg_write_o <= 0;
			branch_o <= 0;
			jal_o <= 0;
			jalr_o <= 0;
			mem_read_o <= 0;
			mem_write_o <= 0;
			mem_to_reg_o <= 0;
	 end
    else begin
        pc_imm_o <= pc_imm;
			pc_4_o <= pc_4;

			read_data_1_o <= read_data_1;
			read_data_2_o <= read_data_2;

			alu_result_o <= alu_result;

			write_register_o <= write_register;

			reg_write_o <= reg_write;
			branch_o <= branch;
			jal_o <= jal;
			jalr_o <= jalr;
			mem_read_o <= mem_read;
			mem_write_o <= mem_write;
			mem_to_reg_o <= mem_to_reg;
	end
end



endmodule