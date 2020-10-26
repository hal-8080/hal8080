--             HAL8080 Processor           --
-- Dennis, Kasper, Tjeerd, Nick, Oussama 2020
--                processor
-- This file describes the hardware for the processor.

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY processor IS
    PORT(
        clk : IN std_logic -- Main (50Mhz) clock.
    );
END ENTITY processor;

ARCHITECTURE bhv OF processor IS
BEGIN

    control:ENTITY work.control PORT MAP(
    	clk => clk
    );

    datapath:ENTITY work.datapath PORT MAP(
        clk => clk
    );

END bhv;