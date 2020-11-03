--             HAL8080 Processor           -
-- Dennis, Kasper, Tjeerd, Nick, Oussama
--              bios (SYNTHESIS)
-- This file contains the compiled bios in VHDL.
-- NOTE: this file is generated on  Tue, 2020-11-03, 17:18 
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
        mem(str2num("0000")) := str2ulv("00 ", mem_width);
        mem(str2num("0001")) := str2ulv("F4", mem_width);
        mem(str2num("0002")) := str2ulv("06", mem_width);
        mem(str2num("0003")) := str2ulv("F5", mem_width);
        mem(str2num("0004")) := str2ulv("8A", mem_width);
        mem(str2num("0005")) := str2ulv("C0", mem_width);
        mem(str2num("0006")) := str2ulv("4B", mem_width);
        mem(str2num("0007")) := str2ulv("B1", mem_width);
        mem(str2num("0008")) := str2ulv("00", mem_width);
        mem(str2num("0009")) := str2ulv("F4", mem_width);
        mem(str2num("000A")) := str2ulv("08", mem_width);
        mem(str2num("000B")) := str2ulv("F5", mem_width);
        mem(str2num("000C")) := str2ulv("8A", mem_width);
        mem(str2num("000D")) := str2ulv("C0", mem_width);
        RETURN mem;
    END get_bios_bin;

END PACKAGE BODY bios;
