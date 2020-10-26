--             HAL8080 Processor           --
-- Dennis, Kasper, Tjeerd, Nick, Oussama 2020
--                setup
-- The processor setup.

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY setup IS
    PORT(
        clk : IN std_logic -- Main (50Mhz) clock.
    );
END ENTITY setup;

ARCHITECTURE bhv OF setup IS
BEGIN

END bhv;