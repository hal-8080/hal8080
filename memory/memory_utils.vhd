--             HAL8080 Processor           --
-- Dennis, Kasper, Tjeerd, Nick, Oussama 2020
--               memory_utils
-- This file describes some utilities required
-- to construct memory tables.

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE std.textio.ALL;

PACKAGE memory_utils IS

    CONSTANT mem_width      : natural :=  8; -- Memory width: 8 bits.
    CONSTANT adr_width      : natural := 16; -- Address width: 16 bits.
    -- INITIAL VALUES     
    CONSTANT bios_file      : string := "bios.mif"; -- Bin file to populate BIOS rom (Address 0-8191)
    CONSTANT ram_file       : string := "program.mif"; -- Bin file to populate user RAM (Address 8192-57343)
    -- MMIO ADDRESSES
    CONSTANT start_bios     : natural :=     0;
    CONSTANT start_ram      : natural :=  8192;
    CONSTANT start_display  : natural := 57344;
    CONSTANT start_leds     : natural := 57350;
    CONSTANT start_switches : natural := 57352;
    CONSTANT start_buttons  : natural := 57354;
    -- SIZES
    CONSTANT size_total     : natural := 57356;

    -- All IO and memory are accessed as memory tables. Which are arrays of arbitrary length of logic vectors.
    TYPE memory_table IS ARRAY (natural range <>) OF std_logic_vector(7 DOWNTO 0);

    -- str2num Converts a string to a (natural) number.
    -- Inspired by hex2dec from ARC (E. Molenkamp)
    -- @param inp  : string - The input string to convert.
    -- @return res : natural
    FUNCTION str2num(inp:string) RETURN natural;

    -- str2ulv Converts a string to an unsigned number -> logic vector.
    -- @param inp  : string - The input string to convert.
    -- @return res : std_logic_vector
    FUNCTION str2ulv(inp: string; size: natural) RETURN std_logic_vector;

    -- fill_memory_table Fills a memory table with contents of a file.
    -- Inspired by fill_memory from ARC (E. Molenkamp)
    -- @param filename      : string  - Tells the filename from which to read into the memory table.
    -- @param start_address : natural - Tells the start address of the memory to construct.
    -- @param end_address   : natural - Tells the end address of the memory to construct.
    -- @return mem          : memory_table
    IMPURE FUNCTION fill_memory_table(filename: string; start_address: natural; end_address: natural) RETURN memory_table;

END PACKAGE memory_utils;

PACKAGE BODY memory_utils IS

    FUNCTION str2num(inp: string) RETURN natural IS
        VARIABLE res : natural := 0;
    BEGIN
        FOR i IN inp'RANGE LOOP
            res := res * 16;
            CASE inp(i) IS
                WHEN '0'    => res := res +  0;
                WHEN '1'    => res := res +  1;        
                WHEN '2'    => res := res +  2;
                WHEN '3'    => res := res +  3;
                WHEN '4'    => res := res +  4;
                WHEN '5'    => res := res +  5;        
                WHEN '6'    => res := res +  6;
                WHEN '7'    => res := res +  7;
                WHEN '8'    => res := res +  8;
                WHEN '9'    => res := res +  9;        
                WHEN 'A'|'a'=> res := res + 10;
                WHEN 'B'|'b'=> res := res + 11;
                WHEN 'C'|'c'=> res := res + 12;
                WHEN 'D'|'d'=> res := res + 13;        
                WHEN 'E'|'e'=> res := res + 14;
                WHEN 'F'|'f'=> res := res + 15;                        
                WHEN OTHERS => REPORT "unexpected character in hex2dec" SEVERITY warning;
            END CASE;
        END LOOP;
        RETURN res;
    END str2num;

    FUNCTION str2ulv(inp: string; size: natural) RETURN std_logic_vector IS
    BEGIN
        RETURN std_logic_vector(to_unsigned(str2num(inp), size));
    END str2ulv;

    -- ANALYSIS ONLY FUNCTION!
    IMPURE FUNCTION fill_memory_table(filename: string; start_address: natural; end_address: natural) RETURN memory_table IS
        VARIABLE mem : memory_table(start_address TO end_address) := (OTHERS => (OTHERS => '-')); -- Init a don't care memory.
        FILE current_file : text OPEN read_mode IS filename; -- The file to read from.
        VARIABLE current_line    : line;                     -- Current reading file line reference.
        VARIABLE current_add_str : string(1 TO adr_width/4); -- Currently reading address string.
        VARIABLE current_val_str : string(1 TO mem_width/4); -- Currently reading value string.
        VARIABLE current_address : natural;                  -- Currently read memory address.
        VARIABLE current_char    : character;                -- Dummy to read character.
    BEGIN
        -- Start reading to skip the preamble.
        WHILE NOT endfile(current_file) LOOP
            READLINE(current_file, current_line);     -- Read newline.
            READ(current_line, current_char);         -- Read 1st character.
            IF current_char /= '#' THEN EXIT; END IF; -- Read until no more #'s
        END LOOP;
        WHILE NOT endfile(current_file) LOOP
            READLINE(current_file, current_line);        -- Read newline.
            READ(current_line, current_add_str);         -- Read the address.
            current_address := str2num(current_add_str); -- Transform to natural.
            READ(current_line, current_char);            -- Read seperator char.
            IF current_char /= '-' THEN EXIT; END IF;    -- Seperator should be good.
            READ(current_line, current_val_str);         -- Read the value.
            ASSERT start_address <= current_address AND current_address <= end_address 
                REPORT "Address in file is out of specified range! Hex:" & current_add_str SEVERITY error;
            -- Store the read value into the read address.
            mem(current_address) := str2ulv(current_val_str, mem_width);
        END LOOP;
        RETURN mem;
    END fill_memory_table;

END PACKAGE BODY memory_utils;