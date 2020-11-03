--             HAL8080 Processor           --
-- Kasper, Dennis, Tjeerd, Nick, Oussama 2020
--                processor
-- This file describes the hardware connections 
-- for the processor. Primarily lickage between
-- memory control and datapath.

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY processor IS
    PORT(
        -- INTERNALS
        clk   : IN std_logic; -- 50 Mhz Clock
        reset : IN std_logic; -- Async reset

        -- CONTROL (MEMORY)
        address_bus  :  IN std_logic_vector(15 DOWNTO 0); -- Address bus
        data_bus_in  :  IN std_logic_vector(15 DOWNTO 0); -- Data bus from memory.
        do_read      : OUT std_logic; -- Whether we should read
        do_write     : OUT std_logic; -- Whether we should write
        data_bus_out : OUT std_logic_vector(15 DOWNTO 0); -- Data bus to memory.
        in_debug     :  IN std_logic -- Whether we are in debug mode.
    );
END ENTITY processor;

ARCHITECTURE bhv OF processor IS
    SIGNAL micro_inst   : std_logic_vector(32 DOWNTO 0); -- The current microinstruction
    SIGNAL statusN		: std_logic := '0';              -- Negative status bit.
    SIGNAL statusZ		: std_logic := '0';              -- Zero status bit.
    SIGNAL ir			: std_logic_vector(15 DOWNTO 0); -- The current instruction register.
    SIGNAL statusND		: std_logic := '0';               -- Debug Negative status bit.
    SIGNAL statusZD		: std_logic := '0';              -- Debug Zero status bit.
BEGIN

    control:ENTITY work.control PORT MAP(
        -- INTERNALS
        clk => clk,
        reset => reset,
        -- CONTROL (CONTROL)
        ir => ir,
        micro_inst => micro_inst,
        statusN  => statusN,
        statusZ  => statusZ,
        statusND => statusND,
        statusZD => statusZD,
        in_debug => in_debug
    );

    datapath:ENTITY work.datapath PORT MAP(
        -- INTERNALS
        clk => clk,
        reset => reset,
        -- CONTROL (MEMORY)
        address_bus => address_bus,
        data_bus_in => data_bus_in,
        do_read =>  micro_inst(18), -- Read directly from microinstruction.
        do_write => micro_inst(19), -- Read directly from microinstruction.
        data_bus_out => data_bus_out,
        in_debug => in_debug,
        -- CONTROL (CONTROL)
        ir => ir,
        micro_inst => micro_inst,
        statusN  => statusN,
        statusZ  => statusZ,
        statusND => statusND,
        statusZD => statusZD
    );

END bhv;