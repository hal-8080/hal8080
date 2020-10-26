--             HAL8080 Processor           --
-- Dennis, Kasper, Tjeerd, Nick, Oussama 2020
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
        seg0, seg1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- first segment display pair
        seg2, seg3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- second segment display piar
        seg4, seg5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- third segment display piar
        leds : OUT STD_LOGIC_VECTOR(9 DOWNTO 0); -- leds
        -- INPUT
        switches : IN STD_LOGIC_VECTOR(9 DOWNTO 0); -- user switches
        buttons : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- user buttons
    );
END ENTITY hal8080;

ARCHITECTURE structure OF hal8080 IS
BEGIN

    -- setup, used to burn the main memory and setup.
    setup: ENTITY work.setup PORT MAP(
        clk => clk
    );
    -- memory, the main memory.
    memory:ENTITY work.memory PORT MAP(
        clk => clk
    );
    -- processor, the alu and stuff inside the processor.
    processor: ENTITY work.processor PORT MAP(
        clk => clk
    );

END structure;