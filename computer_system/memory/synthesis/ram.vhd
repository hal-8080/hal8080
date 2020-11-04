--             HAL8080 Processor           -
-- Dennis, Kasper, Tjeerd, Nick, Oussama
--              ram (SYNTHESIS)
-- This file contains the compiled user RAM in VHDL.
-- NOTE: this file is generated on Wed, 2020-11-04, 11:22 
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
        RETURN mem;
    END get_ram_bin;

END PACKAGE BODY ram;
