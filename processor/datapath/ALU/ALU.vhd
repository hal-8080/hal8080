--             HAL8080 Processor           --
-- Kasper, Dennis, Tjeerd, Nick, Oussama 2020
--                   ALU
-- This file describes the Arithmetic Logic Unit.

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_Std.ALL;

ENTITY ALU IS
    PORT(
        clk           :  IN std_logic;                     -- Clocky! (For random number gen)
        F             :  IN std_logic_vector( 3 DOWNTO 0); -- F, selection of ALU operation.
        BusA          :  IN std_logic_vector(15 DOWNTO 0); -- BusA input 1 of ALU.
        BusB          :  IN std_logic_vector(15 DOWNTO 0); -- BusB input 2 of ALU.
        ALUout        : OUT std_logic_vector(15 DOWNTO 0); -- ALU output.
        statusN       : OUT std_logic;                     -- Negative Status
        statusZ       : OUT std_logic;                     -- Zero Status
        statusND      : OUT std_logic;                     -- Negative Status DEBUG
        statusZD      : OUT std_logic;                     -- Zero Status DEBUG
        update_status : OUT std_logic;                     -- Whether to update status flags. (Flash signal)
        in_debug      :  IN std_logic;                     -- Whether we are in debug mode (toggles which status bits are used).
        do_read       :  IN std_logic;                     -- Whether we are reading from memory.
        do_write      :  IN std_logic;                     -- Whether we are writing to memory.
        AdrA          :  IN std_logic_vector( 4 DOWNTO 0)  -- Address where A is to be stored. Used to check we don't mess with status bits on Program Counter.
    );
END ENTITY ALU;

ARCHITECTURE bhv OF ALU IS
    -- Lookup-table for display port
    FUNCTION hex2display(nib:std_logic_vector(4 DOWNTO 0)) RETURN std_logic_vector IS
    VARIABLE res : std_logic_vector(6 DOWNTO 0);
        BEGIN
        CASE nib IS          --         low active
        WHEN "00000" => RETURN NOT "0111111"; --0
        WHEN "00001" => RETURN NOT "0000110"; --1
        WHEN "00010" => RETURN NOT "1011011"; --2
        WHEN "00011" => RETURN NOT "1001111"; --3
        WHEN "00100" => RETURN NOT "1100110"; --4
        WHEN "00101" => RETURN NOT "1101101"; --5
        WHEN "00110" => RETURN NOT "1111101"; --6
        WHEN "00111" => RETURN NOT "0000111"; --7
        WHEN "01000" => RETURN NOT "1111111"; --8
        WHEN "01001" => RETURN NOT "1101111"; --9
        WHEN "01010" => RETURN NOT "1110111"; --A
        WHEN "01011" => RETURN NOT "1111100"; --B
        WHEN "01100" => RETURN NOT "0111001"; --C
        WHEN "01101" => RETURN NOT "1011110"; --D
        WHEN "01110" => RETURN NOT "1111001"; --E
        WHEN "01111" => RETURN NOT "1110001"; --F
        WHEN "10000" => RETURN NOT "1110110"; --H
        WHEN "10001" => RETURN NOT "0111000"; --L
        WHEN "10010" => RETURN NOT "1101110"; --Y
        WHEN "10011" => RETURN NOT "1001001"; --upmidbot
        WHEN "10100" => RETURN NOT "1010100"; --n
        WHEN "10101" => RETURN NOT "1110011"; --p
        WHEN "10110" => RETURN NOT "1000001"; --upmid
        WHEN "10111" => RETURN NOT "0001001"; --upbot
        WHEN "11000" => RETURN NOT "0111110"; --u
        WHEN "11001" => RETURN NOT "0111101"; --G
        WHEN "11010" => RETURN NOT "0000001"; --UP
        WHEN "11011" => RETURN NOT "1000000"; --MID
        WHEN "11100" => RETURN NOT "0001000"; --BOT
        WHEN "11101" => RETURN NOT "0000110"; --LEFT
        WHEN "11110" => RETURN NOT "1001000"; --midbot
        WHEN OTHERS  => RETURN NOT "0000000"; --EMPTY
        END CASE;
    END hex2display;

    --random gen
    CONSTANT seed : unsigned(15 DOWNTO 0) := x"ABCD";    --starting seed 
    SIGNAL random : unsigned(15 DOWNTO 0) := seed;

BEGIN

    --==========================================--
    --            SEQUENTIAL LOGIC              --
    --==========================================--

    -- Generate a new random number every clock cycle.
    RANGEN:PROCESS(clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF random = x"0000" THEN        
                random <= seed;
            ELSE
                random <= RESIZE((random * seed), 16);
            END IF;
        END IF;
    END PROCESS;

    --==========================================--
    --           COMBINATIONAL LOGIC            --
    --==========================================--

    -- Combinational ALU
    ALU:PROCESS(F, BusA, BusB, AdrA, in_debug, do_read, do_write, random)
        CONSTANT max_power_value      : integer := 2; -- Max value for power synthesis.
        VARIABLE Abus_sign, Bbus_sign : signed(15 DOWNTO 0);
        VARIABLE Abus_int, Bbus_int   : integer RANGE -32768 TO 32767;
        VARIABLE powTemp              : integer RANGE 0 TO 32767;
        VARIABLE solution             : signed(15 DOWNTO 0) := x"0001";
        --shift
        VARIABLE Bbus_shift           : integer RANGE 0 TO 16;
        -- Update status bits?
        VARIABLE update_stat          : std_logic := '0';
    BEGIN
        -- Default
        solution := x"0001";
        update_status <= '0';
        statusN <= '0';
        statusZ <= '0';
        statusND <= '0';
        statusZD <= '0';
        -- Set helper variables.
        Abus_sign     := signed(BusA);
        Bbus_sign     := signed(BusB);
        Abus_int      := to_integer(Abus_sign);
        Bbus_int      := to_integer(Bbus_sign);
        -- Clamp input of B for SHIFT operations
        IF Bbus_int < 1 THEN
            Bbus_shift := 0;
        ELSIF Bbus_int > 15 THEN
            Bbus_shift := 16;
        ELSE
            Bbus_shift := Bbus_int;
        END IF;
        -- ALU DESCRIPTION
        CASE F IS
        WHEN x"0" => --AND bitwise
            solution := Abus_sign AND Bbus_sign;         
            ALUout <= std_logic_vector(solution);
            update_stat := '0';
        WHEN x"1" => --NAND bitwise
            solution := Abus_sign NAND Bbus_sign;         
            ALUout <= std_logic_vector(solution);
            update_stat := '0';             
        WHEN x"2" => --OR bitwise
            solution := Abus_sign OR Bbus_sign;        
            ALUout <= std_logic_vector(solution);
            update_stat := '0';                       
        WHEN x"3" => --ORN bitwise
            solution := Abus_sign OR NOT Bbus_sign;    
            ALUout <= std_logic_vector(solution);
            update_stat := '0';             
        WHEN x"4" => --ADD
            solution := to_signed(Abus_int + Bbus_int, 16);    
            ALUout <= std_logic_vector(solution);
            update_stat := '1';
        WHEN x"5" => --MUL
            solution := to_signed(Abus_int * Bbus_int, 16);    
            ALUout <= std_logic_vector(solution);
            update_stat := '1';
        WHEN x"6" => --DIV
            solution := to_signed(Abus_int / Bbus_int, 16);    
            ALUout <= std_logic_vector(solution);
            update_stat := '1';
        WHEN x"7" => --XOR
            solution := Abus_sign XOR Bbus_sign;                    
            ALUout <= std_logic_vector(solution);
            update_stat := '0';     
        WHEN x"8" => --SHIFTL
            solution := signed(shift_left(unsigned(BusA), Bbus_shift));    
            ALUout <= std_logic_vector(solution);
            update_stat := '0';  
        WHEN x"9" => --SHIFTR
            solution := shift_right(Abus_sign, Bbus_shift);
            ALUout <= std_logic_vector(solution);
            update_stat := '0';
        WHEN x"A" => --INV bitwise
            solution := NOT Bbus_sign;
            ALUout <= std_logic_vector(solution);
            update_stat := '0';
        WHEN x"B" => --POW B must be positive and can be max (2^max_power_value), A must be positive
            powTemp := Abus_int;
            -- FOR i IN 1 TO max_power_value LOOP
            --     IF i < Bbus_int THEN
            --         powTemp := powTemp * Abus_int;
            --     ELSE
            --         solution := to_signed(powTemp, 16);
            --         EXIT WHEN i = Bbus_int;
            --     END IF;
            -- END LOOP;
            ALUout <= std_logic_vector(solution);
            update_stat := '1';
        WHEN x"C" => --SUB
            solution := to_signed(Abus_int - Bbus_int, 16);        
            ALUout <= std_logic_vector(solution);
            update_stat := '1';
        WHEN x"D" => --DISP
            ALUout <= ('0' & hex2display(BusB(12 DOWNTO 8))) & ('0' & hex2display(BusB(4 DOWNTO 0)));
            update_stat := '0';
        WHEN x"E" => --COPY
            ALUout <= BusB;
            update_stat := '0';
        WHEN x"F" => -- RAND (SEPERATE process)
            ALUout <= std_logic_vector(random);
            update_stat := '0';
        WHEN OTHERS => null;
        END CASE;
        
        -- Status bits:
        IF in_debug = '0' THEN --if debug is off, update regular status bits
            IF    to_integer(solution) = 0 AND do_read='0' AND do_write='0' AND update_stat = '1' AND AdrA /= "11110" THEN
                statusZ <= '1'; --statusZ
                statusN <= '0'; --statusN
                update_status <= '1';
            ELSIF to_integer(solution) < 0 AND do_read='0' AND do_write='0' AND update_stat = '1' AND AdrA /= "11110" THEN
                statusZ <= '0'; --statusZ
                statusN <= '1'; --statusN
                update_status <= '1';
            ELSIF to_integer(solution) > 0 AND do_read='0' AND do_write='0' AND update_stat = '1' AND AdrA /= "11110" THEN
                statusZ <= '0'; --statusZ
                statusN <= '0'; --statusN
                update_status <= '1';
            END IF;
        ELSE                   --if debug is on, update only the debug status bits
            IF    to_integer(solution) = 0 AND do_read='0' AND do_write='0' AND update_stat = '1' AND AdrA /= "11110" THEN
                statusZD <= '1'; --statusZ
                statusND <= '0'; --statusN
                update_status <= '1';
            ELSIF to_integer(solution) < 0 AND do_read='0' AND do_write='0' AND update_stat = '1' AND AdrA /= "11110" THEN
                statusZD <= '0'; --statusZ
                statusND <= '1'; --statusN
                update_status <= '1';
            ELSIF to_integer(solution) > 0 AND do_read='0' AND do_write='0' AND update_stat = '1' AND AdrA /= "11110" THEN
                statusZD <= '0'; --statusZ
                statusND <= '0'; --statusN
                update_status <= '1';
            END IF;
        END IF;
    END PROCESS;

END bhv;