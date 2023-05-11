/******************************************************************
* Description
*	This is the top-level of a RISC-V Microprocessor that can execute the next set of instructions:
*		add
*		addi
* This processor is written Verilog-HDL. It is synthesizabled into hardware.
* Parameter MEMORY_DEPTH configures the program memory to allocate the program to
* be executed. If the size of the program changes, thus, MEMORY_DEPTH must change.
* This processor was made for computer organization class at ITESO.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/

module RISC_V_Single_Cycle
#(
	parameter PROGRAM_MEMORY_DEPTH = 256,
	parameter DATA_MEMORY_DEPTH = 256
)

(
	// Inputs
	input clk,
	input reset,
	output [3:0] alu_operation_output,
	output [31:0] pc_output

);
//******************************************************************/
//******************************************************************/

//******************************************************************/
//******************************************************************/
/* Signals to connect modules*/
wire [31:0] mux_3_1_a;
wire [31:0] mux_3_1_b;

wire [1:0] forward_a_w;
wire [1:0] forward_b_w;

wire [31:0] instruction_pw;
wire [31:0] pc_pw;
wire [31:0] pc_4_pw;

// HAZARD DETECTION UNIT
wire if_id_write_hw; 
wire pc_write_hw;
wire mux_hazard_selector_hw;

wire auipc_hw;
wire jal_hw;
wire jalr_hw;
wire branch_hw;
wire mem_read_hw;
wire mem_to_reg_hw;
wire mem_write_hw;
wire alu_src_hw;
wire reg_write_hw;
wire [2:0] alu_op_hw;


wire [31:0] pc_pw2;
wire [31:0] pc_4_pw2;
wire [31:0] read_data_1_pw2;
wire [31:0] read_data_2_pw2;
wire [31:0] imm_pw2;
wire auipc_pw2;
wire reg_write_pw2;
wire branch_pw2;
wire jal_pw2;
wire jalr_pw2;
wire mem_read_pw2;
wire mem_write_pw2;
wire mem_to_reg_pw2;
wire alu_src_pw2;
wire [2:0] alu_op_pw2;
wire funct_7_pw2;
wire [2:0] funct_3_pw2;
wire [4:0] write_register_pw2;
wire [31:0] instruction_pw2;

// Wires for jal and jalr connections
wire [31:0]ra_jalr_w;
wire [31:0]ra_jal_w;
wire [31:0]ra_or_mem_w;
wire [31:0]ra_or_pc_w;



wire reg_write_pw3;
wire branch_pw3;
wire jal_pw3;
wire jalr_pw3;
wire mem_read_pw3;
wire mem_write_pw3;
wire mem_to_reg_pw3;
wire [31:0] read_data_1_pw3;
wire [31:0] read_data_2_pw3;
wire [31:0] alu_result_pw3;
wire [4:0] write_register_pw3;
wire [31:0] pc_imm_pw3;
wire [31:0] pc_4_pw3;

wire [31:0] pc_4_pw4; 
wire mem_to_reg_pw4;
wire reg_write_pw4;
wire jalr_pw4;
wire [4:0] write_register_pw4;
wire [31:0] alu_result_pw4;
wire [31:0] read_mem_data_pw4;

wire [31:0] mux_pc_4;

/**Control**/
wire auipc_w;
wire jal_w;
wire jalr_w;
wire branch_ctrl_w;
wire alu_src_w;
wire reg_write_w;
wire mem_to_reg_w;
wire mem_write_w;
wire mem_read_w;
wire [2:0] alu_op_w;

/** Program Counter**/
wire [31:0] pc_plus_4_w;
wire [31:0] pc_w;


/**Register File**/
wire [31:0] read_data_1_w;
wire [31:0] read_data_2_w;

/**Inmmediate Unit**/
wire [31:0] inmmediate_data_w;

/**ALU**/
wire [31:0] alu_result_w;

//new
wire [31:0] read_data_mem_w;

// mux for data mem
wire [31:0] mux_mem_data_w;

// mux for branch
wire [31:0] mux_branch_w;

/**Multiplexer MUX_DATA_OR_IMM_FOR_ALU**/
wire [31:0] read_data_2_or_imm_w;

/**ALU Control**/
wire [3:0] alu_operation_w;

/**Instruction Bus**/	
wire [31:0] instruction_bus_w;

wire [31:0] auipc_mux_hw;


//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
Control
CONTROL_UNIT
(
	/****/
	.OP_i(instruction_pw[6:0]),
	/** outputs**/
	.auipc(auipc_w),
	.Jal_o(jal_w), // bandera en caso de que la instrucción sea jal
	.Jalr_o(jalr_w), // bandera en caso de que la instrucción sea jalr
	.Branch_o(branch_ctrl_w),
	.ALU_Op_o(alu_op_w),
	.ALU_Src_o(alu_src_w),
	.Reg_Write_o(reg_write_w),
	.Mem_to_Reg_o(mem_to_reg_w),
	.Mem_Read_o(mem_read_w),
	.Mem_Write_o(mem_write_w)
);



Program_Memory
#(
	.MEMORY_DEPTH(PROGRAM_MEMORY_DEPTH)
)
PROGRAM_MEMORY
(
	.Address_i(pc_w),
	.Instruction_o(instruction_bus_w)
);

// Instancia del pC register
Adder_32_Bits
#(
	 .NBits(32)
)
PC_PLUS_4
(
	.Data0(pc_w),
	.Data1(4),
	
	.Result(pc_plus_4_w)
);

PC_Register
#(
	 .N(32)
)
PC_REGISTER
(
	 .pc_write(pc_write_hw),
	 .clk(clk),
	 .reset(reset),
	 .Next_PC(mux_pc_4),
	 .PC_Value(pc_w)
);

	
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/



Register_File
REGISTER_FILE_UNIT
(
	.clk(clk),
	.reset(reset),
	.Reg_Write_i(reg_write_pw4),
	.Write_Register_i(write_register_pw4),
	.Read_Register_1_i(instruction_pw[19:15]),
	.Read_Register_2_i(instruction_pw[24:20]),
	.Write_Data_i(ra_or_mem_w),
	.Read_Data_1_o(read_data_1_w),
	.Read_Data_2_o(read_data_2_w)
);

Data_Memory
#(
	.DATA_WIDTH(32),//8
	.MEMORY_DEPTH(256)
)
DATA_MEMORY_UNIT
(
	.clk(clk),
	.Mem_Write_i(mem_write_pw3),
	.Mem_Read_i(mem_read_pw3),
	.Write_Data_i(read_data_2_pw3),//creo que lo que le tengo que pasar es otra cosa -- SW
	.Address_i(alu_result_pw3),

	.Read_Data_o(read_data_mem_w)
);

// Mux para ver si el valor pasará por memoria
Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_FOR_MEMORY
(
	.Selector_i(mem_to_reg_pw4), // El selector es la bandera de control que indica si se va a usar la memoria o no
	.Mux_Data_0_i(alu_result_pw4), // Si no está encendida se pasa directamente el resultado del ALU
	.Mux_Data_1_i(read_mem_data_pw4), // Si está encendida se pasa el resultado que se lee de la memoria
	
	.Mux_Output_o(mux_mem_data_w) // El resultado se pasa al siguiente mux

);


Immediate_Unit
IMM_UNIT
(  .op_i(instruction_pw[6:0]),
   .Instruction_bus_i(instruction_pw),
   .Immediate_o(inmmediate_data_w)
);



Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_DATA_OR_IMM_FOR_ALU
(
	.Selector_i(alu_src_pw2),
	.Mux_Data_0_i(read_data_2_pw2),
	.Mux_Data_1_i(imm_pw2),
	
	.Mux_Output_o(read_data_2_or_imm_w)

);


ALU_Control
ALU_CONTROL_UNIT
(
	.funct7_i(funct_7_pw2),
	.ALU_Op_i(alu_op_pw2),
	.funct3_i(funct_3_pw2),
	.ALU_Operation_o(alu_operation_w)
);



ALU
ALU_UNIT
(
	.ALU_Operation_i(alu_operation_w),
	.A_i(mux_3_1_a),
	.B_i(mux_3_1_b),
	.ALU_Result_o(alu_result_w)
);

Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_PC_OR_A
(
	.Selector_i(auipc_pw2),
	.Mux_Data_0_i(read_data_1_pw2),
	.Mux_Data_1_i(pc_pw2),
	
	.Mux_Output_o(auipc_mux_hw)
);


/* FOR JAL AND JALR*/
// Mux para definir si la instrucción es jal o jalr
Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_WRITE_REG_RA
(
	.Selector_i(jalr_pw4), // Si es jal o jalr el selector está encendido
	.Mux_Data_0_i(mux_mem_data_w), // Si no se pasa el resultado del mux pasado
	.Mux_Data_1_i(pc_4_pw4), // Si sí se pasa el pc actual más 4
	
	.Mux_Output_o(ra_or_mem_w) // El resultado se pasa para ser escrito en el registro correspondiente

);

// Si la bandera de branch está encendida y el resultado del ALU es 0 indica que es branch y la condición se cumple
Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_FOR_BRANCH
(
	.Selector_i(branch_pw3 & (!alu_result_pw3)),
	.Mux_Data_0_i(pc_4_pw3), // Si no se cumple el selector se agrega 4 al pc actual
	.Mux_Data_1_i(pc_imm_pw3), // Si se cumple el selector se agrega el inmediato al pc actual
	
	.Mux_Output_o(mux_branch_w) // Se pasa al siguiente mux

);

// Mux para definir si se pasa el valor del PC o el valor del RA
Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_PC_OR_RA
(
	.Selector_i(jalr_pw3), // El selector es si la instrucción es jalr o no, acorde a la bandera de jalr
	.Mux_Data_0_i(mux_branch_w), // Si no es jalr se pasa el resultado del mux anterior
	.Mux_Data_1_i(read_data_1_pw3), // Si es jalr se pasa la lectura del registro que se indicó en la instrucción (ra)
	
	.Mux_Output_o(ra_or_pc_w) // El resultado se pasa como el valor del siguiente pc

);

assign alu_operation_output = alu_operation_w;
assign pc_output = pc_w;

// PIPELINE
// Mux para ver si el valor pasará por memoria
Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_PC_2
(
	.Selector_i(branch_pw3 & (!alu_result_pw3)),
	.Mux_Data_0_i(pc_plus_4_w), 
	.Mux_Data_1_i(ra_or_pc_w),
	
	.Mux_Output_o(mux_pc_4) 

);

// ETAPAS PIPELINE
If_Id
#
(
	.N(32)
)
IF_ID
(
	.if_id_write(if_id_write_hw),
	.reset(reset),
	.clk(clk),
	.pc_4(pc_plus_4_w),
	.pc(pc_w),
	.instruction(instruction_bus_w),
	
	.pc_4_o(pc_4_pw),
	.pc_o(pc_pw),
	.instruction_o(instruction_pw)
);

Id_Ex
#
(
	.N(32)
)
ID_EX
(
	.reset(reset),
	.clk(clk),
	.pc_4(pc_4_pw),
	.pc(pc_pw),
	
	// REGISTERS
	.read_data_1(read_data_1_w),
	.read_data_2(read_data_2_w),
	.imm(inmmediate_data_w),
	.instruction(instruction_pw),
	
	// CONTROL UNITS
	.auipc(auipc_hw),
	.reg_write(reg_write_hw),
	.branch(branch_hw),
	.jal(jal_hw),
	.jalr(jalr_hw),
	.mem_read(mem_read_hw),
	.mem_write(mem_write_hw),
	.mem_to_reg(mem_to_reg_hw),
	.alu_src(alu_src_hw),
	.alu_op(alu_op_hw),
	
	// OUTPUTS
	.pc_4_o(pc_4_pw2),
	.pc_o(pc_pw2),
	
	.read_data_1_o(read_data_1_pw2),
	.read_data_2_o(read_data_2_pw2),
	.imm_o(imm_pw2),
	
	.auipc_o(auipc_pw2),
	.reg_write_o(reg_write_pw2),
	.branch_o(branch_pw2),
	.jal_o(jal_pw2),
	.jalr_o(jalr_pw2),
	.mem_read_o(mem_read_pw2),
	.mem_write_o(mem_write_pw2),
	.mem_to_reg_o(mem_to_reg_pw2),
	.alu_src_o(alu_src_pw2),
	.alu_op_o(alu_op_pw2),
	
	// INSTRUCTION
	.funct_7(funct_7_pw2),
	.funct_3(funct_3_pw2),
	.write_register(write_register_pw2),
	.instruction_o(instruction_pw2)
);

Ex_Mem
#
(
	.N(32)
)
EX_MEM
(
	 .clk(clk),
	 .reset(reset),
	 
	.pc_imm(pc_pw2 + imm_pw2),
	.pc_4(pc_4_pw2),
	
	.read_data_1(read_data_1_pw2),
	.read_data_2(read_data_2_pw2),
	
	.alu_result(alu_result_w),
	
	.write_register(write_register_pw2),
	
	// CONTROL UNITS
	.reg_write(reg_write_pw2),
	.branch(branch_pw2),
	.jal(jal_pw2),
	.jalr(jalr_pw2),
	.mem_read(mem_read_pw2),
	.mem_write(mem_write_pw2),
	.mem_to_reg(mem_to_reg_pw2),

	// OUTPUTS
	.reg_write_o(reg_write_pw3),
	.branch_o(branch_pw3),//
	.jal_o(jal_pw3),//
	.jalr_o(jalr_pw3),//
	.mem_read_o(mem_read_pw3),//
	.mem_write_o(mem_write_pw3),//
	.mem_to_reg_o(mem_to_reg_pw3),
	
	.read_data_1_o(read_data_1_pw3),
	.read_data_2_o(read_data_2_pw3),
	
	.alu_result_o(alu_result_pw3),
	
	.write_register_o(write_register_pw3),
	
	.pc_imm_o(pc_imm_pw3),
	.pc_4_o(pc_4_pw3)
);

Mem_Wb
#
(
	.N(32)
)
MEM_WB
(
	 .clk(clk),
	 .reset(reset),
	 
	.pc_4(pc_4_pw3),
	
	.mem_to_reg(mem_to_reg_pw3),
	.reg_write(reg_write_pw3),
	
	.jalr(jal_pw3 | jalr_pw3),
	.write_register(write_register_pw3),
	.alu_result(alu_result_pw3),
	.read_mem_data(read_data_mem_w),
	
	// OUTPUTS
	.pc_4_o(pc_4_pw4),
	
	.mem_to_reg_o(mem_to_reg_pw4),
	.reg_write_o(reg_write_pw4),
	
	.jalr_o(jalr_pw4),
	.write_register_o(write_register_pw4),
	.alu_result_o(alu_result_pw4),
	.read_mem_data_o(read_mem_data_pw4)	
);


Forwarding_Unit
#
(
	.N(32)
)
FORWARDING_UNIT
(
	.hazard_selector(mem_write_pw2),
	.alu_op(alu_op_pw2),
	.EX_MEM_RegWrite(reg_write_pw3),
	.MEM_WB_RegWrite(reg_write_pw4),
	.MEM_WB_Register_Rd(write_register_pw4),
	.EX_MEM_Register_Rd(write_register_pw3),
	.ID_EX_Register_Rs1(instruction_pw2[19:15]),
	.ID_EX_Register_Rs2(instruction_pw2[24:20]),
	
	.ForwardA(forward_a_w),
	.ForwardB(forward_b_w)
);

Multiplexer_3_to_1
#(
	.NBits(32)
)
MULTIPLEXER_3_TO_1_A
(
	.Selector_i(forward_a_w),
	.Register_File(auipc_mux_hw),
	.Prior_ALU(alu_result_pw3),
	.Data_Memory(ra_or_mem_w),
	
	.Mux_Output_o(mux_3_1_a)
);


Multiplexer_3_to_1
#(
	.NBits(32)
)
MULTIPLEXER_3_TO_1_B
(
	.Selector_i(forward_b_w),
	.Register_File(read_data_2_or_imm_w),
	.Prior_ALU(alu_result_pw3),
	.Data_Memory(ra_or_mem_w),
	
	.Mux_Output_o(mux_3_1_b)
);

Hazard_Detection_Unit
#
(
	.N(32)
)
HAZARD_DETECTION_UNIT
(
	.ID_EX_MemRead(mem_read_pw2),
	.ID_EX_Register_Rd(write_register_pw2),
	.IF_ID_Register_Rs1(instruction_pw2[19:15]),
	.IF_ID_Register_Rs2(instruction_pw2[24:20]),
	
	.IF_ID_Write_o(if_id_write_hw),
	.PC_Write_o(pc_write_hw),
	.Mux_Hazard_Selector_o(mux_hazard_selector_hw)

);

Multiplexer_Hazard_Detection
#(
	.NBits(32)
)
MUX_HAZARD_DETECTION
(
	.Selector_i(mux_hazard_selector_hw),
	
	.auipc(auipc_w),
	.Jal(jal_w),
	.Jalr(jalr_w),
	.Branch(branch_ctrl_w),
	.Mem_Read(mem_read_w),
	.Mem_to_Reg(mem_to_reg_w),
	.Mem_Write(mem_write_w),
	.ALU_Src(alu_src_w),
	.Reg_Write(reg_write_w),
	.ALU_Op(alu_op_w),
	
	.auipc_o(auipc_hw),
	.Jal_o(jal_hw),
	.Jalr_o(jalr_hw),
	.Branch_o(branch_hw),
	.Mem_Read_o(mem_read_hw),
	.Mem_to_Reg_o(mem_to_reg_hw),
	.Mem_Write_o(mem_write_hw),
	.ALU_Src_o(alu_src_hw),
	.Reg_Write_o(reg_write_hw),
	.ALU_Op_o(alu_op_hw)

);

endmodule

