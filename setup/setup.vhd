--             HAL8080 Processor           --
-- Dennis, Kasper, Tjeerd, Nick, Oussama 2020
--                setup
-- The processor setup.

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
USE work.memory_utils.ALL;

ENTITY setup IS
    PORT(
        clk : IN std_logic; -- Main (50Mhz) clock.
        reset : IN std_logic;
        address_bus  : OUT std_logic_vector(15 DOWNTO 0) := x"0000";
        data_bus_out : OUT std_logic_vector(15 DOWNTO 0) := x"0000";
        data_bus_in  : IN  std_logic_vector(15 DOWNTO 0) := x"0000";
        do_write     : OUT std_logic := '0';
        do_read      : OUT std_logic := '0'
    );
END ENTITY setup;

ARCHITECTURE bhv OF setup IS
    SIGNAL cnt : integer RANGE 0 TO 50000000 := 0;
    SIGNAL check_lever : integer RANGE 0 TO 500 := 0;
    SIGNAL ledcnt : unsigned(9 downto 0) := (others => '0');
    SIGNAL do_cnt : std_logic := '0';
BEGIN
    PROCESS(clk, reset)
    BEGIN
        IF reset = '0' THEN
            check_lever <= 0;
            cnt <= 0;
            ledcnt <= "0000000000";
        ELSIF rising_edge(clk) THEN
            -- Never write / read to memory unless we do.
            do_write <= '0'; do_read <= '0';
            -- Count up to next lever check.
            check_lever <= check_lever + 1;
            -- Request lever data from memory
            IF check_lever = 498 THEN
                address_bus <= std_logic_vector(to_unsigned(start_switches, 16));
                do_read <= '1';
            -- Read lever data from memory
            ELSIF check_lever >= 499 THEN
                -- Store lever data in flipflop. Should we count?
                check_lever <= 0;
                do_cnt <= data_bus_in(0);
            END IF;
            -- If lever is on, keep counting.
            IF do_cnt = '1' THEN
                cnt <= cnt + 1;
            END IF;
            -- Every second.
            IF cnt >= 49999999 THEN --49999999
                ledcnt <= ledcnt + 1;
                -- Don't overflow!
                IF ledcnt >= (2**10) THEN 
                    ledcnt <= "0000000000";
                END IF;
                -- Flash to memory
                address_bus <= std_logic_vector(to_unsigned(start_leds, 16));
                data_bus_out <= "000000" & std_logic_vector(ledcnt);
                do_write <= '1';
                check_lever <= 0; -- Only check after many clock cycles.
                -- Reset cnt
                cnt <= 0;
            END IF;
        END IF;
    END PROCESS;
END bhv;