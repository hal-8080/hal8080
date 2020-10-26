--             HAL8080 Processor           --
-- Dennis, Kasper, Tjeerd, Nick, Oussama 2020
--         Main entity discription.
-- This file should just be used to map ports
-- to specific subparts of the processor.

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY hal8080 IS
    PORT (
        clk : IN std_logic
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