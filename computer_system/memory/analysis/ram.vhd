--             HAL8080 Processor  
-- Dennis, Kasper, Tjeerd, Nick, Oussama
--              ram (ANALYSIS)
-- This file contains the dynamic referenced RAM
-- NOTE: this file is only used in analysis.
-- In here the contents are read directly from
-- the ram.bin file using READLINE.

library IEEE;
USE IEEE.std_logic_1164.ALL;
USE work.memory_utils.ALL;

PACKAGE ram IS
    IMPURE FUNCTION get_ram_bin RETURN memory_table;
END PACKAGE ram;

PACKAGE BODY ram IS

    IMPURE FUNCTION get_ram_bin RETURN memory_table IS
    BEGIN
        RETURN fill_memory_table(ram_file, start_ram, start_display-1);
    END get_ram_bin;

END PACKAGE BODY ram;