--             HAL8080 Processor  
-- Dennis, Kasper, Tjeerd, Nick, Oussama
--              bios (ANALYSIS)
-- This file contains the dynamic referenced BIOS
-- NOTE: this file is only used in analysis.
-- In here the contents are read directly from
-- the bios.bin file using READLINE.

library IEEE;
USE IEEE.std_logic_1164.ALL;
USE work.memory_utils.ALL;

PACKAGE bios IS
    IMPURE FUNCTION get_bios_bin RETURN memory_table;
END PACKAGE bios;

PACKAGE BODY bios IS

    IMPURE FUNCTION get_bios_bin RETURN memory_table IS
    BEGIN
        RETURN fill_memory_table(bios_file, start_bios, start_ram-1);
    END get_bios_bin;

END PACKAGE BODY bios;