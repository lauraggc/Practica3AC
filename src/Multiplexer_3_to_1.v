module Multiplexer_3_to_1
#(
	parameter NBits = 32
)
(
	input [1:0] Selector_i,
	input [NBits-1:0] Register_File,
	input [NBits-1:0] Prior_ALU,
	input [NBits-1:0] Data_Memory,
	
	output reg [NBits-1:0] Mux_Output_o

);

	always@(Selector_i or Register_File or Register_File or Data_Memory) begin // ,
		if(Selector_i == 2'b00)
			Mux_Output_o = Register_File;
		if(Selector_i == 2'b01)
			Mux_Output_o = Data_Memory;
		if(Selector_i == 2'b10)
			Mux_Output_o = Prior_ALU;
	end

endmodule