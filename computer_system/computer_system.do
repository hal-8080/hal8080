vsim work.computer_system

add wave -position end  sim:/computer_system/switches
add wave -position end  sim:/computer_system/buttons

add wave -color Blue -position end  sim:/computer_system/clk
add wave -color Cyan -position end  sim:/computer_system/micro_instr
add wave -color Cyan -position end  sim:/computer_system/statusD

add wave -Hex -position end  sim:/computer_system/mmI
add wave -Hex -position end  sim:/computer_system/mmAdress
add wave -Hex -position end  sim:/computer_system/mmData

add wave -color Yellow -position end  sim:/computer_system/seg0
add wave -color Yellow -position end  sim:/computer_system/seg1
add wave -color Yellow -position end  sim:/computer_system/seg2
add wave -color Yellow -position end  sim:/computer_system/seg3
add wave -color Yellow -position end  sim:/computer_system/seg4
add wave -color Yellow -position end  sim:/computer_system/seg5

add wave -unsigned -position end  sim:/computer_system/processor/cs/control/address

add wave -color Pink -position end  sim:/computer_system/processor/cs/control/statusZ
add wave -color Pink -position end  sim:/computer_system/processor/cs/control/statusN
add wave -color Pink -position end  sim:/computer_system/processor/cs/control/statusZD
add wave -color Pink -position end  sim:/computer_system/processor/cs/control/statusND

add wave -Hex -color Magenta -position end  sim:/computer_system/processor/dp/reg

add wave -unsigned -color Yellow -position end  sim:/computer_system/processor/dp/micro_addrA
add wave -unsigned -color Yellow -position end  sim:/computer_system/processor/dp/micro_addrB
add wave -color Yellow -position end  sim:/computer_system/processor/dp/muxA
add wave -color Yellow -position end  sim:/computer_system/processor/dp/muxB
add wave -color Yellow -position end  sim:/computer_system/processor/dp/muxC
add wave -color Yellow -position end  sim:/computer_system/processor/dp/rd
add wave -color Yellow -position end  sim:/computer_system/processor/dp/wr
add wave -Hex -color Yellow -position end  sim:/computer_system/processor/dp/ALU

add wave -Hex -color Cyan -position end  sim:/computer_system/processor/dp/Abus
add wave -Hex -color Cyan -position end  sim:/computer_system/processor/dp/Bbus
add wave -Hex -color Cyan -position end  sim:/computer_system/processor/dp/Cbus
add wave -Hex -color Cyan -position end  sim:/computer_system/processor/dp/ALUout

#do stuff
force clk 1 0, 0 10ns -r 20ns
force switches 0000000000
force buttons 0000 0, 0100 15000ns
run 1000ns
wave zoom full



