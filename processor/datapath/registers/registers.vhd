--             HAL8080 Processor           --
-- Kasper, Dennis, Tjeerd, Nick, Oussama 2020
--                   registers
-- This file describes the registers store
-- inside the datapath

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY registers IS
    PORT (
        -- INTERNALS
        clk   :  IN std_logic;
        reset :  IN std_logic;
        -- CONTROL
        AdrA  :  IN std_logic_vector( 4 DOWNTO 0); -- Address of A
        AdrB  :  IN std_logic_vector( 4 DOWNTO 0); -- Address of B
        AdrC  :  IN std_logic_vector( 4 DOWNTO 0); -- Address of C (Store can be different from A)
        BusA  : OUT std_logic_vector(15 DOWNTO 0); -- Output of A
        BusB  : OUT std_logic_vector(15 DOWNTO 0); -- Output of B
        BusC  :  IN std_logic_vector(15 DOWNTO 0); -- Input  of C
        iir   : OUT std_logic_vector(15 DOWNTO 0)  -- Always expose the Instruction Register.
    );
END ENTITY registers;

ARCHITECTURE bhv OF registers IS
    -- table of 32 16-bit vectors
    TYPE reg_table IS ARRAY (0 to 31) OF std_logic_vector(15 DOWNTO 0);
    --32 registers of 16 bits --use example: "reg(2) <= a_16_bit_vector" stores the vector in register 2
    SIGNAL reg : reg_table := (
             0 => x"0000",
             1 => x"0001",
        OTHERS => x"0000"
    );
BEGIN
    PROCESS(clk, reset)
        VARIABLE index : natural;
    BEGIN
        IF reset = '0' THEN
            reg <= ( -- Reset the registers.
                     0 => x"0000",
                     1 => x"0001",
                OTHERS => x"0000"
            );
        ELSIF rising_edge(clk) THEN
            index := to_integer(unsigned(AdrC));
            IF index > 1 THEN
                reg(index) <= BusC;
            END IF;
        END IF;
    END PROCESS;

    -- Directly Expose A, B and the Instruction Register IR
    BusA <= reg(to_integer(unsigned(AdrA)));
    BusB <= reg(to_integer(unsigned(AdrB)));
    iir  <= reg(31);

END bhv;