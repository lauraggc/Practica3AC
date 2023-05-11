// MÓDULOS PARA ÉTAPA MEM/WB

module Mem_Wb
#
(
	parameter N =32
)
(
	input reset,
	input clk,
	
	input [N-1:0] pc_4,
	
	input mem_to_reg,
	input reg_write,
	
	input jalr,
	input [4:0] write_register,
	input [N-1:0] alu_result,
	input [N-1: 0] read_mem_data,
	
	// OUTPUTS
	output reg [N-1:0] pc_4_o,
	
	output reg mem_to_reg_o,
	output reg reg_write_o,
	
	output reg jalr_o,
	output reg [4:0] write_register_o,
	output reg [N-1:0] alu_result_o,
	output reg [N-1: 0] read_mem_data_o	
);



always@(negedge reset or negedge clk) begin
    if(reset==0) begin
		  pc_4_o <= 0;
			mem_to_reg_o <= 0;
			reg_write_o <= 0;

			jalr_o <= 0;
			write_register_o <= 0;
			alu_result_o <= 0;
			read_mem_data_o <= 0;
	 end
    else begin
        pc_4_o <= pc_4;
			mem_to_reg_o <= mem_to_reg;
			reg_write_o <= reg_write;

			jalr_o <= jalr;
			write_register_o <= write_register;
			alu_result_o <= alu_result;
			read_mem_data_o <= read_mem_data;
	end
end



endmodule