onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_FirCM/UUT/clk
add wave -noupdate -format Logic /tb_FirCM/UUT/rst
add wave -noupdate -format Logic /tb_FirCM/UUT/rdy_to_ld
add wave -noupdate -format Literal -radix decimal /tb_FirCM/UUT/data_in
add wave -noupdate -format Logic /tb_FirCM/UUT/done
add wave -noupdate -format Literal -radix decimal /tb_FirCM/UUT/fir_result
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 245
configure wave -valuecolwidth 39
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
