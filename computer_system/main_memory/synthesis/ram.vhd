--             HAL8080 Processor           -
-- Dennis, Kasper, Tjeerd, Nick, Oussama
--              ram (SYNTHESIS)
-- This file contains the compiled user RAM in VHDL.
-- NOTE: this file is generated on Tue, 2020-10-27, 23:57 
-- by the ram2vhdl.tcl script.
-- Compiled and used in synthesis.

library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.memory_utils.ALL;

PACKAGE ram IS
    IMPURE FUNCTION get_ram_bin RETURN memory_table;
END PACKAGE ram;

PACKAGE BODY ram IS

    IMPURE FUNCTION get_ram_bin RETURN memory_table IS
        VARIABLE mem : memory_table(start_ram TO start_display-1) := (OTHERS => (OTHERS => '-'));
    BEGIN
        mem(str2num("2000")) := str2ulv("CC", mem_width);
        mem(str2num("2001")) := str2ulv("FF", mem_width);
        mem(str2num("2002")) := str2ulv("00", mem_width);
        mem(str2num("2003")) := str2ulv("00", mem_width);
        RETURN mem;
    END get_ram_bin;

END PACKAGE BODY ram;
