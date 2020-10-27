--             HAL8080 Processor           --
-- Dennis, Kasper, Tjeerd, Nick, Oussama 2020
--                memory
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
        reset : IN std_logic; -- Async reset

        -- CONTROL
        address_bus  :  IN std_logic_vector(15 DOWNTO 0); -- Address bus
        data_bus_in  :  IN std_logic_vector(15 DOWNTO 0); -- Data bus
        do_read      :  IN std_logic; -- Wether we should read
        do_write     :  IN std_logic; -- Wether we should write
        data_bus_out : OUT std_logic_vector(15 DOWNTO 0); -- Data bus

        -- INPUT / OUTPUT
        o_seg0, o_seg1 : OUT std_logic_vector(6 DOWNTO 0); -- first segment display pair
        o_seg2, o_seg3 : OUT std_logic_vector(6 DOWNTO 0); -- second segment display piar
        o_seg4, o_seg5 : OUT std_logic_vector(6 DOWNTO 0); -- third segment display piar
        o_leds         : OUT std_logic_vector(9 DOWNTO 0); -- leds
        i_switches     :  IN std_logic_vector(9 DOWNTO 0); -- user switches
        i_buttons      :  IN std_logic_vector(3 DOWNTO 0)  -- user buttons
    );
END ENTITY memory;

ARCHITECTURE bhv OF memory IS

    -- MEMORY ENDPOINTS
    ATTRIBUTE ram_init_file : string;
    -- bios     - Initialised with the contents of the bios_file.
    CONSTANT bios   : memory_table(start_bios TO start_ram-1) := get_bios_bin;
    -- ram      - Initialised with the contents of the ram_file.
    SIGNAL ram      : memory_table(start_ram TO start_display-1) := get_ram_bin;
    -- display  - Initialised with FFFF, which makes the segments turned off.
    SIGNAL display  : memory_table(start_display TO start_leds-1)     := (x"FF", x"FF", x"FF", x"FF", x"FF", x"FF");
    -- leds     - Initialised with 0000, which makes the leds turned off.
    SIGNAL leds     : memory_table(start_leds TO start_switches-1)    := (x"00", x"00");
    -- switches - Initialised with 0000, is updated async.
    SIGNAL switches : memory_table(start_switches TO start_buttons-1) := (x"00", x"00");
    -- buttons  - Initialised with 0000, is updated async.
    SIGNAL buttons  : memory_table(start_buttons TO size_total-1)     := (x"00", x"00");

BEGIN

    -- Update IO asyncly based on the values in fake 'memory'.
    o_seg0 <= bios(start_bios+0)(6 DOWNTO 0); --LOL Test bios!
    o_seg1 <= ram(start_ram+0)(6 DOWNTO 0);
    o_seg2 <= display(start_display+2)(6 DOWNTO 0);
    o_seg3 <= display(start_display+3)(6 DOWNTO 0);
    o_seg4 <= display(start_display+4)(6 DOWNTO 0);
    o_seg5 <= display(start_display+5)(6 DOWNTO 0);
    -- buttons(start_buttons) <= i_buttons & x"0";

END bhv;