--             HAL8080 Processor           --
-- Dennis, Kasper, Tjeerd, Nick, Oussama 2020
--                setup
-- The processor setup.

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

ENTITY setup IS
    PORT(
        clk : IN std_logic; -- Main (50Mhz) clock.
        reset : IN std_logic;
        leds : OUT std_logic_vector(9 DOWNTO 0) -- leds
    );
END ENTITY setup;

ARCHITECTURE bhv OF setup IS
    SIGNAL cnt : integer RANGE 0 TO 50000000 := 0;
    SIGNAL ledcnt : unsigned(9 downto 0) := (others => '0');
BEGIN
    PROCESS(clk, reset)
    BEGIN
        IF reset = '0' THEN
            cnt <= 0;
            ledcnt <= "0000000000";
        ELSIF rising_edge(clk) THEN
            cnt <= cnt + 1;
            IF cnt >= 49999999 THEN
                ledcnt <= ledcnt + 1;
                IF ledcnt >= (2**10) THEN 
                    ledcnt <= "0000000000";
                END IF;
                cnt <= 0;
            END IF;
        END IF;
    END PROCESS;
    leds <= std_logic_vector(ledcnt);
END bhv;