--             HAL8080 Processor           -
-- Dennis, Kasper, Tjeerd, Nick, Oussama
--              bios (SYNTHESIS)
-- This file contains the compiled bios in VHDL.
-- NOTE: this file is generated on  Tue, 2020-10-27, 23:57 
-- by the bios2vhdl.tcl script.
-- Compiled and used in synthesis.

library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.memory_utils.ALL;

PACKAGE bios IS
    IMPURE FUNCTION get_bios_bin RETURN memory_table;
END PACKAGE bios;

PACKAGE BODY bios IS

    IMPURE FUNCTION get_bios_bin RETURN memory_table IS
        VARIABLE mem : memory_table(start_bios TO start_ram-1) := (OTHERS => (OTHERS => '-'));
    BEGIN
        mem(str2num("0000")) := str2ulv("05", mem_width);
        mem(str2num("0001")) := str2ulv("C1", mem_width);
        mem(str2num("0002")) := str2ulv("04", mem_width);
        mem(str2num("0003")) := str2ulv("85", mem_width);
		  mem(str2num("0004")) := str2ulv("F5", mem_width);
		  mem(str2num("0005")) := str2ulv("E0", mem_width);
		  mem(str2num("0006")) := str2ulv("F4", mem_width);
		  mem(str2num("0007")) := str2ulv("06", mem_width);
		  mem(str2num("0008")) := str2ulv("45", mem_width);
		  mem(str2num("0009")) := str2ulv("0A", mem_width);
        RETURN mem;
    END get_bios_bin;

END PACKAGE BODY bios;
