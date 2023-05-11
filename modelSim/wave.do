onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /RISC_V_Single_Cycle_TB/clk_tb
add wave -noupdate /RISC_V_Single_Cycle_TB/reset_tb
add wave -noupdate /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/ALU_Operation_i
add wave -noupdate -radix decimal /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/A_i
add wave -noupdate -radix decimal /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/B_i
add wave -noupdate -radix decimal /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/ALU_Result_o
add wave -noupdate -expand -group PC -radix decimal /RISC_V_Single_Cycle_TB/DUV/PC_REGISTER/PC_Value
add wave -noupdate -expand -group PC -radix decimal /RISC_V_Single_Cycle_TB/DUV/PC_REGISTER/Next_PC
add wave -noupdate -expand -group Reg -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Write_Register_i
add wave -noupdate -expand -group Reg -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Write_Data_i
add wave -noupdate -expand -group MEMORY -color {Violet Red} -radix decimal /RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/Address_i
add wave -noupdate -expand -group MEMORY -radix decimal /RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/Read_Data_o
add wave -noupdate -expand -group MEMORY -color {Violet Red} -radix decimal /RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/Write_Data_i
add wave -noupdate -expand -group MEMORY -radix decimal /RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/read_data_aux
add wave -noupdate -group {MUX BRANCH} -radix decimal /RISC_V_Single_Cycle_TB/DUV/MUX_FOR_BRANCH/Selector_i
add wave -noupdate -group {MUX BRANCH} -radix decimal /RISC_V_Single_Cycle_TB/DUV/MUX_FOR_BRANCH/Mux_Data_0_i
add wave -noupdate -group {MUX BRANCH} -radix decimal /RISC_V_Single_Cycle_TB/DUV/MUX_FOR_BRANCH/Mux_Data_1_i
add wave -noupdate -group {MUX BRANCH} -radix decimal /RISC_V_Single_Cycle_TB/DUV/MUX_FOR_BRANCH/Mux_Output_o
add wave -noupdate -expand -group DIR -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[2]}
add wave -noupdate -expand -group DIR -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[1]}
add wave -noupdate -expand -group DIR -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[0]}
add wave -noupdate -expand -group {TORRE A} -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[5]}
add wave -noupdate -expand -group {TORRE A} -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[4]}
add wave -noupdate -expand -group {TORRE A} -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[3]}
add wave -noupdate -expand -group {TORRE B} -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[8]}
add wave -noupdate -expand -group {TORRE B} -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[7]}
add wave -noupdate -expand -group {TORRE B} -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[6]}
add wave -noupdate -expand -group {TORRE C} -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[11]}
add wave -noupdate -expand -group {TORRE C} -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[10]}
add wave -noupdate -expand -group {TORRE C} -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[9]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1156 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {1043 ps} {1106 ps}
