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
    CONSTANT bios_file      : string := "bios.bin"; -- Bin file to populate BIOS rom (Address 0-8191)
    CONSTANT ram_file       : string := "ram.bin"; -- Bin file to populate user RAM (Address 8192-57343)
    -- MMIO ADDRESSES
    CONSTANT start_bios     : natural :=     0;
    CONSTANT start_ram      : natural :=  8192;
    CONSTANT start_display  : natural := 57344;
    CONSTANT start_leds     : natural := 57350;
    CONSTANT start_switches : natural := 57352;
    CONSTANT start_buttons  : natural := 57354;
    CONSTANT start_millis   : natural := 57356;
    CONSTANT start_debug    : natural := 57358;
    -- SIZES
    CONSTANT size_total     : natural := 57360;

    -- mbyte consists of size bits
    SUBTYPE mbyte IS std_logic_vector(mem_width-1 DOWNTO 0);
    -- Words consist of two bytes
    SUBTYPE  word IS std_logic_vector(adr_width-1 DOWNTO 0);
    -- All IO and memory are accessed as memory tables. Which are arrays of arbitrary length of logic vectors.
    TYPE memory_table IS ARRAY (natural range <>) OF mbyte;

    -- str2num Converts a string to a (natural) number.
    -- Inspired by hex2dec from ARC (E. Molenkamp)
    -- @param inp  : string - The input string to convert.
    -- @return res : natural
    FUNCTION str2num(inp:string) RETURN natural;

    -- str2ulv Converts a string to an unsigned number -> logic vector.
    -- @param inp  : string - The input string to convert.
    -- @return res : std_logic_vector
    FUNCTION str2ulv(inp: string; size: natural) RETURN std_logic_vector;

    -- write_mem Writes a word to a certain address in a specified memory table.
    -- @param mem     : memory_table - The memory to write to.
    -- @param address : natural      - The address to write to.
    -- @param value   : word         - The word to write.
    PROCEDURE write_mem(SIGNAL mem: INOUT memory_table; address: IN natural; value: IN word);

    -- write_mem_a Writes a word to a certain address_bus in a specified memory table.
    -- @param mem         : memory_table - The memory to write to.
    -- @param address_bus : word         - The address to write to.
    -- @param value       : word         - The word to write.
    PROCEDURE write_mem_a(SIGNAL mem: INOUT memory_table; address_bus: IN word; value: IN word);

    -- read_mem Reads a word from a certain address in a specified memory table.
    -- @param mem     : memory_table - The memory to read from.
    -- @param address : natural      - The address to read from.
    -- @return value  : word         - The read word.
    FUNCTION read_mem(mem: memory_table; address: natural) RETURN word;

    -- read_mem_a Reads a word with a certain address_bus in a specified memory table.
    -- @param mem         : memory_table - The memory to read from.
    -- @param address_bus : word         - The address to read from.
    -- @return value      : word         - The read word.
    FUNCTION read_mem_a(mem: memory_table; address_bus: word) RETURN word;

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

    PROCEDURE write_mem(SIGNAL mem: INOUT memory_table; address: IN natural; value: IN word) IS
    BEGIN
        mem(address+1) <= value(adr_width-1 DOWNTO mem_width);
        mem(address)   <= value(mem_width-1 DOWNTO 0);
    END write_mem;

    PROCEDURE write_mem_a(SIGNAL mem: INOUT memory_table; address_bus: IN word; value: IN word) IS
    BEGIN
        write_mem(mem, to_integer(unsigned(address_bus)), value);
    END write_mem_a;

    FUNCTION read_mem(mem: memory_table; address: natural) RETURN word IS
        VARIABLE ret_val: word := (OTHERS => '-');
    BEGIN
        ret_val(adr_width-1 DOWNTO mem_width) := mem(address+1);
        ret_val(mem_width-1 DOWNTO 0)         := mem(address);
        RETURN ret_val;
    END read_mem;

    FUNCTION read_mem_a(mem: memory_table; address_bus: word) RETURN word IS 
    BEGIN
        RETURN read_mem(mem, to_integer(unsigned(address_bus)));
    END read_mem_a;

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