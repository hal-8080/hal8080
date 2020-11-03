#             HAL8080 Processor            #
# Dennis, Kasper, Tjeerd, Nick, Oussama 2020
#                preflow
# This script is run on synthesis by Quartus.
# This script makes sure the BIOS and RAM
# are always recompiled to VHDL based on the
# bin files.

source scripts/bios2vhdl.tcl
source scripts/ram2vhdl.tcl