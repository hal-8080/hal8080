--             HAL8080 Processor           --
-- Kasper, Dennis, Tjeerd, Nick, Oussama 2020
--                processor
-- This file describes the hardware for the processor.

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY processor IS
    PORT(
        -- INTERNALS
        clk   : IN std_logic; -- 50 Mhz Clock
        reset : IN std_logic; -- Async reset

        -- CONTROL
        address_bus  :  IN std_logic_vector(15 DOWNTO 0); -- Address bus
        data_bus_in  :  IN std_logic_vector(15 DOWNTO 0); -- Data bus from memory.
        do_read      : OUT std_logic; -- Whether we should read
        do_write     : OUT std_logic; -- Whether we should write
        data_bus_out : OUT std_logic_vector(15 DOWNTO 0); -- Data bus to memory.
        debug_in     :  IN std_logic; -- Whether we are in debug mode.
    );
END ENTITY processor;

ARCHITECTURE bhv OF processor IS
    SIGNAL micro_inst   : std_logic_vector(32 DOWNTO 0); -- The current microinstruction
    SIGNAL statusN		: std_logic := '0';              -- Negative status bit.
    SIGNAL statusZ		: std_logic := '0';              -- Zero status bit.
    SIGNAL ir			: std_logic_vector(15 DOWNTO 0); -- The current instruction register.
    SIGNAL statusND		: std_logic := '0'               -- Debug Negative status bit.
    SIGNAL statusZD		: std_logic := '0';              -- Debug Zero status bit.
BEGIN

    cs:ENTITY work.control PORT MAP(
        clk => clk,						--IN
        reset => reset, 				--IN
        ir => ir,						--IN
        statusN => statusN, 			--IN
        statusZ => statusZ, 			--IN
        statusND => statusND,		--IN
        statusZD => statusZD,		--IN
        micro_instr => micro_inst  --OUT
    );

    dp:ENTITY work.datapath PORT MAP(
        clk => clk,						--IN
        reset => reset,				--IN
        mmI => mmI,						--IN
        mmAdress => mmAdress,		--OUT
        mmData => mmData,				--OUT
        ir => ir,						--OUT
        micro_inst => micro_inst,	--IN
        statusD => statusD,			--IN
        statusN => statusN,			--OUT
        statusZ => statusZ,			--OUT
        statusND => statusND,		--OUT
        statusZD => statusZD			--OUT
    );

    

END;