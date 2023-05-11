// MÓDULOS PARA ÉTAPA IF/ID

module If_Id
#
(
	parameter N =32
)
(
	input if_id_write,
	input reset,
	input clk,
	
	input [N-1:0] pc_4,
	input [N-1:0] pc,
	input [N-1:0] instruction,
	
	output reg [N-1:0] pc_4_o,
	output reg [N-1:0] pc_o,
	output reg [N-1:0] instruction_o
);

always@(negedge reset or negedge clk) begin
    if(reset==0) begin
		  pc_4_o <= 0;
		  pc_o <= 0;
		  instruction_o <= 0;
	 end
    else begin
		  pc_4_o <= pc_4;
		  pc_o <= pc;
		  instruction_o <= instruction;
		   if(if_id_write) begin
				pc_4_o <= pc_4;
				pc_o <= pc;
				instruction_o <= 0;
			end
	end
end


endmodule
