--             HAL8080 Processor           --
-- Kasper, Dennis, Tjeerd, Nick, Oussama 2020
--                  timer
-- This file  discribes the simple hardware timers 
-- available inside the HAL8080 processor.

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY timer IS
    PORT (
        -- INTERNALS
        clk : IN std_logic; -- 50 Mhz Clock
        reset : IN std_logic; -- Async reset

        -- INPUT / OUTPUT
        activate :  IN std_logic; -- Whether to activate timer.
        output   : OUT std_logic_vector(15 DOWNTO 0) -- Bus to write millis onto.
    );
END ENTITY timer;

ARCHITECTURE bhv OF timer IS
    SIGNAL cnt : integer RANGE 0 TO 65535 := 0; -- Cnt for output
    SIGNAL subcnt : integer RANGE 0 TO 50000 := 0; -- Subcnt to get milliseconds.
BEGIN
    -- Synchronous write.
    PROCESS(clk, reset)
        VARIABLE address : natural;
    BEGIN
        IF reset = '0' THEN
            cnt <= 0;
            subcnt <= 0;
        ELSIF rising_edge(clk) THEN
            IF activate = '1' AND cnt < 65535 THEN
                subcnt <= subcnt + 1; -- Usually.
                IF subcnt >= 49999 THEN
                    cnt <= cnt + 1;
                    subcnt <= 0;
                END IF;
            ELSIF activate = '0' THEN
                cnt <= 0;
                subcnt <= 0;
            END IF;
        END IF;
    END PROCESS;

    output <= std_logic_vector(to_unsigned(cnt, 16));
END bhv;
