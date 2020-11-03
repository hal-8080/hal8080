--             HAL8080 Processor           --
-- Kasper, Dennis, Tjeerd, Nick, Oussama 2020
--                memoryio
-- This file describes the hardware end-point
-- for the memory. This system is also in charge
-- of controlling and reading the IO
-- (As Memory Mapped IO is used).

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE std.textio.ALL;
USE work.memory_utils.ALL;
-- Include them as constants.
-- In analysis they are loaded in from /memory/analysis
-- Which will dynamically load in the bin files.
-- In synthesis they are loaded in from /memory/synthesis
-- Which will be compiled at the start of synthesis.
USE work.bios.ALL;
USE work.ram.ALL;

ENTITY memory IS
    PORT (
        -- INTERNALS
        clk : IN std_logic; -- 50 Mhz Clock
        -- CONTROL
        address_bus  :  IN std_logic_vector(15 DOWNTO 0); -- Address bus
        data_bus_in  :  IN std_logic_vector( 7 DOWNTO 0); -- Data bus
        do_write     :  IN std_logic; -- Whether we should write
        data_bus_out : OUT std_logic_vector( 7 DOWNTO 0)  -- Data bus
    );
END ENTITY memory;

ARCHITECTURE bhv OF memory IS

    SIGNAL read_address : std_logic_vector(15 DOWNTO 0);
    -- MEMORY ENDPOINTS
    SIGNAL memory : memory_table(0 TO start_display-1) :=
    -- bios     - Initialised with the contents of the bios_file.
    get_bios_bin &
    -- ram      - Initialised with the contents of the ram_file.
    get_ram_bin;
    -- Specify as M10K block. Because we don't have enough LABs :-)
    ATTRIBUTE ramstyle : string;
    ATTRIBUTE ramstyle of memory : signal is "M10K";

BEGIN

    -- Synchronous read / write.
    PROCESS(clk)
    BEGIN
        IF rising_edge(clk) THEN
            -- If write and we are allowed to do; write to memory.
            IF do_write='1' THEN --AND (address >= start_ram OR mmio(start_debug) = x"01") THEN
                -- write_mem_a(mmio, address_bus, data_bus_in);
                memory(to_integer(unsigned(address_bus))) <= data_bus_in;
            END IF;
            read_address <= address_bus;
        END IF; 
    END PROCESS;
    data_bus_out <= memory(to_integer(unsigned(read_address)));

END bhv;