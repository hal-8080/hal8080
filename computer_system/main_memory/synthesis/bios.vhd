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
	mem(str2num("0000")) := str2ulv("19", mem_width);
        mem(str2num("0001")) := str2ulv("E5", mem_width);
	mem(str2num("0002")) := str2ulv("18", mem_width);
	mem(str2num("0003")) := str2ulv("E4", mem_width);
	mem(str2num("0004")) := str2ulv("03", mem_width);
	mem(str2num("0005")) := str2ulv("E7", mem_width);
	mem(str2num("0006")) := str2ulv("18", mem_width);
	mem(str2num("0007")) := str2ulv("E6", mem_width);
	mem(str2num("0008")) := str2ulv("C2", mem_width);
	mem(str2num("0009")) := str2ulv("09", mem_width);
	mem(str2num("000A")) := str2ulv("43", mem_width);
	mem(str2num("000B")) := str2ulv("08", mem_width);
	mem(str2num("000C")) := str2ulv("C2", mem_width);
	mem(str2num("000D")) := str2ulv("0B", mem_width);
	mem(str2num("000E")) := str2ulv("03", mem_width);
	mem(str2num("000F")) := str2ulv("0A", mem_width);
	mem(str2num("0010")) := str2ulv("C2", mem_width);
	mem(str2num("0011")) := str2ulv("0D", mem_width);
	mem(str2num("0012")) := str2ulv("23", mem_width);
	mem(str2num("0013")) := str2ulv("0C", mem_width);
	mem(str2num("0014")) := str2ulv("C2", mem_width);
	mem(str2num("0015")) := str2ulv("0F", mem_width);
	mem(str2num("0016")) := str2ulv("63", mem_width);
	mem(str2num("0017")) := str2ulv("0E", mem_width);
	mem(str2num("0018")) := str2ulv("C2", mem_width);
	mem(str2num("0019")) := str2ulv("11", mem_width);
	mem(str2num("001A")) := str2ulv("E3", mem_width);
	mem(str2num("001B")) := str2ulv("10", mem_width);
	mem(str2num("001C")) := str2ulv("42", mem_width);
	mem(str2num("001D")) := str2ulv("13", mem_width);
	mem(str2num("001E")) := str2ulv("E0", mem_width);
	mem(str2num("001F")) := str2ulv("15", mem_width);
        RETURN mem;
    END get_bios_bin;

END PACKAGE BODY bios;
