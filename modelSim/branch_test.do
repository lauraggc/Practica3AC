onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /RISC_V_Single_Cycle_TB/reset_tb
add wave -noupdate -radix decimal /RISC_V_Single_Cycle_TB/clk_tb
add wave -noupdate -radix decimal /RISC_V_Single_Cycle_TB/reset_tb
add wave -noupdate -radix decimal /RISC_V_Single_Cycle_TB/DUV/PC_REGISTER/PC_Value
add wave -noupdate -expand -group If_id -radix decimal /RISC_V_Single_Cycle_TB/DUV/IF_ID/pc
add wave -noupdate -expand -group Id_ex -radix decimal /RISC_V_Single_Cycle_TB/DUV/ID_EX/pc
add wave -noupdate -color Turquoise -radix decimal /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/ALU_Operation_i
add wave -noupdate -color Red -radix decimal /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/A_i
add wave -noupdate -color Red -radix decimal /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/B_i
add wave -noupdate -color Salmon -radix decimal /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/ALU_Result_o
add wave -noupdate -expand -group Ex_mem -radix decimal /RISC_V_Single_Cycle_TB/DUV/EX_MEM/pc_imm
add wave -noupdate -expand -group Mem_wb -radix decimal /RISC_V_Single_Cycle_TB/DUV/MEM_WB/pc_4
add wave -noupdate -expand -group {Forwarding Unit} -radix binary /RISC_V_Single_Cycle_TB/DUV/FORWARDING_UNIT/ForwardA
add wave -noupdate -expand -group {Forwarding Unit} -radix binary /RISC_V_Single_Cycle_TB/DUV/FORWARDING_UNIT/ForwardB
add wave -noupdate -expand -group MUX_A -radix decimal /RISC_V_Single_Cycle_TB/DUV/MULTIPLEXER_3_TO_1_A/Register_File
add wave -noupdate -expand -group MUX_A -radix decimal /RISC_V_Single_Cycle_TB/DUV/MULTIPLEXER_3_TO_1_A/Prior_ALU
add wave -noupdate -expand -group MUX_A -radix decimal /RISC_V_Single_Cycle_TB/DUV/MULTIPLEXER_3_TO_1_A/Data_Memory
add wave -noupdate -expand -group MUX_B -radix decimal /RISC_V_Single_Cycle_TB/DUV/MULTIPLEXER_3_TO_1_B/Register_File
add wave -noupdate -expand -group MUX_B -radix decimal /RISC_V_Single_Cycle_TB/DUV/MULTIPLEXER_3_TO_1_B/Prior_ALU
add wave -noupdate -expand -group MUX_B -radix decimal /RISC_V_Single_Cycle_TB/DUV/MULTIPLEXER_3_TO_1_B/Data_Memory
add wave -noupdate -expand -group Registers -color Orchid -label t0 -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t0/DataOutput
add wave -noupdate -expand -group Registers -color Orchid -label t1 -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t1/DataOutput
add wave -noupdate -expand -group Registers -color Orchid -label t2 -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t2/DataOutput
add wave -noupdate -expand -group Registers -label t3 -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t3/DataOutput
add wave -noupdate -expand -group Registers -color Orchid -label t4 -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t4/DataOutput
add wave -noupdate -expand -group Registers -color Orchid -label t5 -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t5/DataOutput
add wave -noupdate -expand -group Registers -label t6 -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_t6/DataOutput
add wave -noupdate -expand -group Registers -label s0 -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s0_fp/DataOutput
add wave -noupdate -expand -group Registers -color Pink -label s1 -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s1/DataOutput
add wave -noupdate -expand -group Registers -label s2 -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s2/DataOutput
add wave -noupdate -expand -group Registers -label s3 -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_s3/DataOutput
add wave -noupdate -expand -group Registers -label a0 -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_a0/DataOutput
add wave -noupdate -expand -group Registers -label a1 -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_a1/DataOutput
add wave -noupdate -expand -group Registers -label a2 -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_a2/DataOutput
add wave -noupdate -expand -group Registers -label a4 -radix decimal /RISC_V_Single_Cycle_TB/DUV/REGISTER_FILE_UNIT/Register_a4/DataOutput
add wave -noupdate -childformat {{{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[24]} -radix decimal} {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[21]} -radix decimal} {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[20]} -radix decimal} {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[19]} -radix decimal} {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[18]} -radix decimal} {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[17]} -radix decimal} {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[16]} -radix decimal} {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[15]} -radix decimal} {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[14]} -radix decimal} {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[13]} -radix decimal} {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[12]} -radix decimal} {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[11]} -radix decimal} {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[10]} -radix decimal} {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[9]} -radix decimal} {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[8]} -radix decimal} {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[7]} -radix decimal} {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[6]} -radix decimal} {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[5]} -radix decimal} {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[4]} -radix decimal} {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[3]} -radix decimal} {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[2]} -radix decimal} {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[1]} -radix decimal} {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[0]} -radix decimal}} -subitemconfig {{/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[24]} {-height 15 -radix decimal} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[21]} {-height 15 -radix decimal} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[20]} {-height 15 -radix decimal} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[19]} {-height 15 -radix decimal} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[18]} {-height 15 -radix decimal} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[17]} {-height 15 -radix decimal} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[16]} {-height 15 -radix decimal} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[15]} {-height 15 -radix decimal} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[14]} {-height 15 -radix decimal} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[13]} {-height 15 -radix decimal} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[12]} {-height 15 -radix decimal} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[11]} {-height 15 -radix decimal} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[10]} {-height 15 -radix decimal} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[9]} {-height 15 -radix decimal} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[8]} {-height 15 -radix decimal} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[7]} {-height 15 -radix decimal} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[6]} {-height 15 -radix decimal} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[5]} {-height 15 -radix decimal} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[4]} {-height 15 -radix decimal} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[3]} {-height 15 -radix decimal} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[2]} {-height 15 -radix decimal} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[1]} {-height 15 -radix decimal} {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[0]} {-height 15 -radix decimal}} /RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram
add wave -noupdate -expand -group Torre_C -height 15 -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[11]}
add wave -noupdate -expand -group Torre_C -height 15 -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[10]}
add wave -noupdate -expand -group Torre_C -height 15 -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[9]}
add wave -noupdate -expand -group Torre_B -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[8]}
add wave -noupdate -expand -group Torre_B -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[7]}
add wave -noupdate -expand -group Torre_B -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[6]}
add wave -noupdate -expand -group Torre_A -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[5]}
add wave -noupdate -expand -group Torre_A -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[4]}
add wave -noupdate -expand -group Torre_A -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[3]}
add wave -noupdate -expand -group Address -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[2]}
add wave -noupdate -expand -group Address -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[1]}
add wave -noupdate -expand -group Address -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[0]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {162 ps} 0} {{Cursor 2} {22 ps} 0}
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
WaveRestoreZoom {1018 ps} {1038 ps}
