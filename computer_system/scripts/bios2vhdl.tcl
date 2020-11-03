#             HAL8080 Processor            #
# Dennis, Kasper, Tjeerd, Nick, Oussama 2020
#                bios2vhdl
# This script compiles the bios from bios.bin
# into memory/synthesis/bios.vhd. This is done because
# stupid quartus cannot used READLINE vhdl code
# This script makes easy editing of the bios
# possible.

package require cmdline

post_message "bios2vhdl.tcl"

set fp [open "bios.heks" r]
set file_data [read $fp]
close $fp
set data [split $file_data "\n"]

set filename memory/synthesis/bios.vhd

set date [clock format [clock seconds] -format { %a, %Y-%m-%d, %H:%M }]
set file [open $filename w]
set script [info script]

# Create the file PreAmble
puts $file "--             HAL8080 Processor           -"
puts $file "-- Dennis, Kasper, Tjeerd, Nick, Oussama"
puts $file "--              bios (SYNTHESIS)"
puts $file "-- This file contains the compiled bios in VHDL."
puts $file "-- NOTE: this file is generated on $date"
puts $file "-- by the bios2vhdl.tcl script."
puts $file "-- Compiled and used in synthesis."
puts $file ""
puts $file "library IEEE;"
puts $file "USE IEEE.std_logic_1164.ALL;"
puts $file "USE IEEE.numeric_std.ALL;"
puts $file "USE work.memory_utils.ALL;"
puts $file ""
puts $file "PACKAGE bios IS"
puts $file "    IMPURE FUNCTION get_bios_bin RETURN memory_table;"
puts $file "END PACKAGE bios;"
puts $file ""
puts $file "PACKAGE BODY bios IS"
puts $file ""
puts $file "    IMPURE FUNCTION get_bios_bin RETURN memory_table IS"
puts $file "        VARIABLE mem : memory_table(start_bios TO start_ram-1) := (OTHERS => (OTHERS => '-'));"
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
puts $file "    END get_bios_bin;"
puts $file ""
puts $file "END PACKAGE BODY bios;"
close $file