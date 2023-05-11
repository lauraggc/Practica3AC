/******************************************************************
* Description
*	This the basic register that is used in the register file
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/
module Register
#(
	parameter N = 32
)
(
	input clk,
	input reset,
	input enable,
	input [N-1:0] initial_value, // variable agregada
	input [N-1:0] DataInput,
	
	
	output reg [N-1:0] DataOutput
);

always@(negedge reset or posedge clk) begin
	if(reset==0)
		DataOutput <= initial_value; // Se pasa el dato de inicialización. Es 0 en todos los casos, solo cambia en el registro del sp.
	else	
		if(enable==1)
			DataOutput<=DataInput;
end

endmodule