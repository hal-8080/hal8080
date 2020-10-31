--             HAL8080 Processor           --
-- Kasper, Dennis, Tjeerd, Nick, Oussama 2020
--         Main entity discription.
-- This file should just be used to map ports
-- to specific subparts of the processor.

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY hal8080 IS
    PORT (
        -- INTERNALS
        clk : IN std_logic; -- 50 Mhz Clock
        -- OUTPUT
        seg0, seg1 : OUT std_logic_vector(6 DOWNTO 0); -- first segment display pair
        seg2, seg3 : OUT std_logic_vector(6 DOWNTO 0); -- second segment display piar
        seg4, seg5 : OUT std_logic_vector(6 DOWNTO 0); -- third segment display piar
        leds       : OUT std_logic_vector(9 DOWNTO 0); -- leds
        -- INPUT
        switches : IN std_logic_vector(9 DOWNTO 0); -- user switches
        buttons : IN std_logic_vector(3 DOWNTO 0)   -- user buttons
    );
END ENTITY hal8080;

ARCHITECTURE structure OF hal8080 IS
    -- INTERNALS
    SIGNAL   reset : std_logic := '1';
    -- MEMORY CONTROLL
    SIGNAL address_bus       : std_logic_vector(15 DOWNTO 0) := x"0000";
    SIGNAL data_bus_to_mem   : std_logic_vector(15 DOWNTO 0) := x"0000";
    SIGNAL data_bus_from_mem : std_logic_vector(15 DOWNTO 0) := x"0000";
    SIGNAL do_read           : std_logic := '0';
    SIGNAL do_write          : std_logic := '0';
    SIGNAL in_debug          : std_logic := '0';
    -- TIMER CONTROLL
    CONSTANT a_timer0        : std_logic := '1'; -- Activation of timer 0 (Clock) always on!
    SIGNAL a_timer1          : std_logic := '0'; -- Activation of timer 1
    SIGNAL a_timer2          : std_logic := '0'; -- Activation of timer 2
    SIGNAL o_timer0          : std_logic_vector(15 DOWNTO 0); -- Data of timer 0 (Millis Clock)
    SIGNAL o_timer1          : std_logic_vector(15 DOWNTO 0); -- Data of timer 1
    SIGNAL o_timer2          : std_logic_vector(15 DOWNTO 0); -- Data of timer 2
BEGIN

    -- setup, used to burn the main memory and setup.
    -- Currently used to test the setup.
    -- TODO REFACTOR / REMOVE
    -- setup: ENTITY work.setup PORT MAP(
    --     clk => clk,
    --     reset => reset,
    --     address_bus => address_bus,
    --     data_bus_out => data_bus_to_mem,
    --     data_bus_in => data_bus_from_mem,
    --     do_write => do_write,
    --     do_read => do_read
    -- );
    -- memory, the main memory and mapped IO.
    memory:ENTITY work.memory PORT MAP(
        -- INTERNALS
        clk => clk,
        reset => reset,
        -- CONTROL
        address_bus  => address_bus,
        data_bus_in  => data_bus_to_mem,
        do_read      => do_read,
        do_write     => do_write,
        data_bus_out => data_bus_from_mem,
        -- INPUT / OUTPUT
        o_seg0 => seg0, o_seg1 => seg1,
        o_seg2 => seg2, o_seg3 => seg3,
        o_seg4 => seg4, o_seg5 => seg5,
        o_leds => leds,
        o_timer1 => a_timer1, o_timer2 => a_timer2,
        i_switches => switches,
        i_buttons => buttons,
        i_timer0 => o_timer0,
        i_timer1 => o_timer1,
        i_timer2 => o_timer2,
        debug_out => in_debug
    );
    -- timer0, the millis clock.
    timer0:ENTITY work.timer PORT MAP(
        clk => clk,
        reset => reset,
        activate => a_timer0,
        output => o_timer0
    );
    -- timer1
    timer1:ENTITY work.timer PORT MAP(
        clk => clk,
        reset => reset,
        activate => a_timer1,
        output => o_timer1
    );
    -- timer2
    timer2:ENTITY work.timer PORT MAP(
        clk => clk,
        reset => reset,
        activate => a_timer2,
        output => o_timer2
    );
    -- processor, the alu and stuff inside the processor.
    processor: ENTITY work.processor PORT MAP(
        -- INTERNALS
        clk => clk,
        reset => reset,
        -- CONTROLL
        address_bus  => address_bus,
        data_bus_out => data_bus_to_mem,
        do_read      => do_read,
        do_write     => do_write,
        data_bus_in  => data_bus_from_mem,
        in_debug     => in_debug
    );

    -- Async reset when all buttons are pressed at once.
    reset <= '0' WHEN buttons = "0000" ELSE '1';

END structure;