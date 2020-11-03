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

ENTITY memory_io IS
    PORT (
        -- INTERNALS
        clk : IN std_logic; -- 50 Mhz Clock
        reset : IN std_logic; -- Async reset

        -- CONTROL
        address_bus  :  IN std_logic_vector(15 DOWNTO 0); -- Address bus
        data_bus_in  :  IN std_logic_vector(15 DOWNTO 0); -- Data bus
        do_read      :  IN std_logic; -- Whether we should read
        do_write     :  IN std_logic; -- Whether we should write
        data_bus_out : OUT std_logic_vector(15 DOWNTO 0); -- Data bus
        debug_out    : OUT std_logic; -- Whether we are in debug mode.

        -- INPUT / OUTPUT
        o_seg0, o_seg1 : OUT std_logic_vector(6 DOWNTO 0); -- first segment display pair
        o_seg2, o_seg3 : OUT std_logic_vector(6 DOWNTO 0); -- second segment display piar
        o_seg4, o_seg5 : OUT std_logic_vector(6 DOWNTO 0); -- third segment display piar
        o_leds         : OUT std_logic_vector(9 DOWNTO 0); -- leds
        o_timer1       : OUT std_logic; -- Activation of timer 1
        o_timer2       : OUT std_logic; -- Activation of timer 2
        i_timer0       :  IN std_logic_vector(15 DOWNTO 0); -- Data of timer 0 (millis clock)
        i_timer1       :  IN std_logic_vector(15 DOWNTO 0); -- Data of timer 1
        i_timer2       :  IN std_logic_vector(15 DOWNTO 0); -- Data of timer 2
        i_switches     :  IN std_logic_vector(9 DOWNTO 0); -- user switches
        i_buttons      :  IN std_logic_vector(3 DOWNTO 0)  -- user buttons
    );
END ENTITY memory_io;

ARCHITECTURE bhv OF memory_io IS

    -- MEMORYIO ENDPOINTS
    SIGNAL mmio : memory_table(start_display TO size_total-1) :=
    -- display  - Initialised with FFFF, which makes the segments turned off.
    memory_table'(x"FF", x"FF", x"FF", x"FF", x"FF", x"FF") &
    -- leds     - Initialised with 0000, which makes the leds turned off.
    memory_table'(x"00", x"00") &
    -- switches - Initialised with 0000, is updated sync.
    memory_table'(x"00", x"00") &
    -- buttons  - Initialised with 0000, is updated sync.
    memory_table'(x"00", x"00") &
    -- time     - Initialised with 0000, is updated sync with clock.
    memory_table'(x"00", x"00") &
    -- debug    - Initialised with 0000, which makes the debug mode turned off.
    memory_table'(x"00", x"00") &
    -- timer1   - Initialised with 00000000, is updated sync. (First address is write, second is read)
    memory_table'(x"00", x"00", x"00", x"00") &
    -- timer2   - Initialised with 00000000, is updated sync. (First address is write, second is read)
    memory_table'(x"00", x"00", x"00", x"00");

    SIGNAL aM1, aM2 : std_logic_vector(15 DOWNTO 0);
    SIGNAL dM1, dM2 : std_logic_vector( 7 DOWNTO 0);
    SIGNAL oM1, oM2 : std_logic_vector( 7 DOWNTO 0);
    SIGNAL wM       : std_logic;

BEGIN

    memory1:ENTITY work.memory PORT MAP(
        -- INTERNALS
        clk => clk, -- 50 MHz Clock
        -- CONTROLL
        address_bus  => aM1, -- Address bus
        data_bus_in  => dM1, -- Data bus
        do_write     => wM,  -- Whether we should write
        data_bus_out => oM1  -- Data bus
    );
    memory2:ENTITY work.memory PORT MAP(
        -- INTERNALS
        clk => clk, -- 50 MHz Clock
        -- CONTROLL
        address_bus  => aM2, -- Address bus
        data_bus_in  => dM2, -- Data bus
        do_write     => wM,  -- Whether we should write
        data_bus_out => oM2  -- Data bus
    );

    -- Synchronous write to MMIO
    PROCESS(clk)
        VARIABLE address : natural;
    BEGIN
        IF rising_edge(clk) THEN
            address := to_integer(unsigned(address_bus));
            IF address < size_total AND do_write='1' THEN  -- If we are in the MMIO part and want to write.
                write_mem_a(mmio, address_bus, data_bus_in);
            END IF;

            -- Update fake 'memory' syncly based on the signal values.
            mmio(start_switches+1) <= "000000" & i_switches(9 DOWNTO 8);
            mmio(start_switches) <= i_switches(7 DOWNTO 0);
            mmio(start_buttons) <= x"0" & (NOT i_buttons);
            mmio(start_millis+1) <= i_timer0(15 DOWNTO 8);
            mmio(start_millis)   <= i_timer0(7 DOWNTO 0);
            mmio(start_timer1+3) <= i_timer1(15 DOWNTO 8);
            mmio(start_timer1+2) <= i_timer1(7 DOWNTO 0);
            mmio(start_timer2+3) <= i_timer2(15 DOWNTO 8);
            mmio(start_timer2+2) <= i_timer2(7 DOWNTO 0);
        END IF; 
    END PROCESS;

    -- Either use M10K banks or MMIO to output data.
    PROCESS(address_bus, oM1, oM2, mmio, data_bus_in, do_write)
        VARIABLE address : natural;
    BEGIN
        address := to_integer(unsigned(address_bus));
        aM1 <= std_logic_vector(to_unsigned(start_ram-2, 16)); -- End of BIOS just in case
        aM1 <= std_logic_vector(to_unsigned(start_ram-2, 16)); -- End of BIOS just in case
        dM1 <= data_bus_in( 7 DOWNTO 0);
        dM2 <= data_bus_in(15 DOWNTO 8);
        wM <= '0'; -- Standard dont write to main memory.
        IF address < start_display THEN
            aM1 <= std_logic_vector(to_unsigned(address,   16));
            aM2 <= std_logic_vector(to_unsigned(address+1, 16));
            IF address >= start_ram OR mmio(start_debug) = x"01" THEN 
                wM <= do_write;
            END IF;
            data_bus_out <= oM1 & oM2;
        ELSIF address < size_total THEN
            -- Directly output from memory based on address_bus.
            data_bus_out <= read_mem(mmio, address);
        ELSE -- Out of range return don't care.
            data_bus_out <= "----------------";
        END IF;
    END PROCESS;

    -- Update outputs asyncly based on the values in fake 'memory'.
    o_seg0    <= mmio(start_display+0)(6 DOWNTO 0);
    o_seg1    <= mmio(start_display+1)(6 DOWNTO 0);
    o_seg2    <= mmio(start_display+2)(6 DOWNTO 0);
    o_seg3    <= mmio(start_display+3)(6 DOWNTO 0);
    o_seg4    <= mmio(start_display+4)(6 DOWNTO 0);
    o_seg5    <= mmio(start_display+5)(6 DOWNTO 0);
    o_leds    <= mmio(start_leds+1)(1 DOWNTO 0) & mmio(start_leds);
    o_timer1  <= mmio(start_timer1)(0);
    o_timer2  <= mmio(start_timer2)(0);
    debug_out <= mmio(start_debug)(0);

END bhv;