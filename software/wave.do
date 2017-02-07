onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /poets_system_streaming_tb/poets_system_streaming_inst/jtag_uart/clk
add wave -noupdate /poets_system_streaming_tb/poets_system_streaming_inst/jtag_uart/rst_n
add wave -noupdate /poets_system_streaming_tb/poets_system_streaming_inst/jtag_uart/av_irq
add wave -noupdate /poets_system_streaming_tb/poets_system_streaming_inst/jtag_uart/av_address
add wave -noupdate /poets_system_streaming_tb/poets_system_streaming_inst/jtag_uart/av_chipselect
add wave -noupdate /poets_system_streaming_tb/poets_system_streaming_inst/jtag_uart/av_waitrequest
add wave -noupdate /poets_system_streaming_tb/poets_system_streaming_inst/jtag_uart/av_write_n
add wave -noupdate -radix ascii /poets_system_streaming_tb/poets_system_streaming_inst/jtag_uart/av_writedata
add wave -noupdate /poets_system_streaming_tb/poets_system_streaming_inst/jtag_uart/av_read_n
add wave -noupdate -radix ascii /poets_system_streaming_tb/poets_system_streaming_inst/jtag_uart/av_readdata
add wave -noupdate /poets_system_streaming_tb/poets_system_streaming_inst/jtag_uart/dataavailable
add wave -noupdate /poets_system_streaming_tb/poets_system_streaming_inst/jtag_uart/readyfordata
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {1999999050 ps} {2000000050 ps}
