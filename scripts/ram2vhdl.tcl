#             HAL8080 Processor            #
# Dennis, Kasper, Tjeerd, Nick, Oussama 2020
#                ram2vhdl
# This script compiles the user RAM from ram.bin
# into memory/synthesis/ram.vhd. This is done because
# stupid quartus cannot used READLINE vhdl code
# This script makes easy editing of the bios
# possible.

package require cmdline

post_message "ram2vhdl.tcl"

set fp [open "ram.bin" r]
set file_data [read $fp]
close $fp
set data [split $file_data "\n"]

set filename memory/synthesis/ram.vhd

set date [clock format [clock seconds] -format { %a, %Y-%m-%d, %H:%M }]
set file [open $filename w]
set script [info script]

# Create the file PreAmble
puts $file "--             HAL8080 Processor           -"
puts $file "-- Dennis, Kasper, Tjeerd, Nick, Oussama"
puts $file "--              ram (SYNTHESIS)"
puts $file "-- This file contains the compiled user RAM in VHDL."
puts $file "-- NOTE: this file is generated on$date"
puts $file "-- by the ram2vhdl.tcl script."
puts $file "-- Compiled and used in synthesis."
puts $file ""
puts $file "library IEEE;"
puts $file "USE IEEE.std_logic_1164.ALL;"
puts $file "USE IEEE.numeric_std.ALL;"
puts $file "USE work.memory_utils.ALL;"
puts $file ""
puts $file "PACKAGE ram IS"
puts $file "    IMPURE FUNCTION get_ram_bin RETURN memory_table;"
puts $file "END PACKAGE ram;"
puts $file ""
puts $file "PACKAGE BODY ram IS"
puts $file ""
puts $file "    IMPURE FUNCTION get_ram_bin RETURN memory_table IS"
puts $file "        VARIABLE mem : memory_table(start_ram TO start_display-1) := (OTHERS => (OTHERS => '-'));"
puts $file "    BEGIN"
foreach line $data {
    # Unless reading the preamble, load the address -> value pairs into memory.
    if {![string match {[=#]*} $line]} {
        # Split the "address-value" into address (0) and value (2).
        set addr_val [split $line "-"]
        # Put this in the vhdl file.
puts $file "        mem(str2num(\"[lindex $addr_val 0]\")) := str2ulv(\"[lindex $addr_val 1]\", mem_width);"
    }
}
puts $file "        RETURN mem;"
puts $file "    END get_ram_bin;"
puts $file ""
puts $file "END PACKAGE BODY ram;"
close $file