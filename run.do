vsim work.hal8080
add wave -position end  sim:/hal8080/clk
add wave -position end  sim:/hal8080/processor/datapath/regs/reg
add wave -position end  sim:/hal8080/processor/control/mstore/address
add wave -position end  sim:/hal8080/processor/control/micro_instr_out
add wave -position end  sim:/hal8080/memory/do_read
add wave -position end  sim:/hal8080/memory/do_write
add wave -position end  sim:/hal8080/data_bus_from_mem
add wave -position end  sim:/hal8080/data_bus_to_mem
add wave -position end  sim:/hal8080/address_bus
add wave -position end  sim:/hal8080/seg0
add wave -position end  sim:/hal8080/seg1
add wave -position end  sim:/hal8080/seg2
add wave -position end  sim:/hal8080/seg3
add wave -position end  sim:/hal8080/seg4
add wave -position end  sim:/hal8080/seg5
add wave -position end  sim:/hal8080/leds
add wave -position end  sim:/hal8080/buttons

force clk 0 10ps, 1 20ps -repeat 20ps
force buttons "1110"
force switches "0000100010"
run 5000