/******************************************************************
* Description
*	ra adder - módulo no usado al final pero creado para llevar un registro del registro ra.
*	1.0
* Author:
*	Laura y jaz
* Date:
*	16/08/2021
******************************************************************/

module Ra_Adder
#(
	parameter NBits = 32
)
(
	input Selector_i,
	input [NBits-1:0] Data,
	input [NBits-1:0] ra_current,
	input [4:0] rg_num,
	
	output reg [NBits-1:0] Ra_jalr, // antes
	output reg [NBits-1:0] Ra

);
	always@(Selector_i or Data) begin // ,
		if(Selector_i)
				Ra = Data + 32'h4;
		if(rg_num == 1)
			Ra_jalr = ra_current;

		
	end

endmodule