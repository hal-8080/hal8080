--             HAL8080 Processor           --
-- Dennis, Kasper, Tjeerd, Nick, Oussama 2020
--                control
-- The processor control. Connects the controller unit
-- with the microstore that houses the microistructions.
-- Together they are responsible to provide the correct
-- microinstruction to the datapath.

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY control IS
    PORT(
        -- INTERNALS
        clk                :  IN std_logic;
        reset              :  IN std_logic;
        -- CONTROL (CONTROL)
        ir                 :  IN std_logic_vector(15 DOWNTO 0);
        statusN, statusZ   :  IN std_logic;
        statusND, statusZD :  IN std_logic;
        in_debug           :  IN std_logic;
        -- CONTROL STORE
        micro_instr_out    : OUT std_logic_vector(32 DOWNTO 0)
    );
END ENTITY control;

ARCHITECTURE bhv OF control IS
    SIGNAL address2cs : std_logic_vector(10 DOWNTO 0); -- 11 bit address frin Controller to Microstore.
    SIGNAL micro_inst : std_logic_vector(32 DOWNTO 0); -- The 33 bit microinstruction from the store to controller and outside.
BEGIN
    cntrl:ENTITY work.controller PORT MAP(
        clk => clk,                --  IN 50 MHz Clock.
        reset => reset,            --  IN Async Reset
        ir    => ir,               --  IN instruction register from datapath
        statusN => statusN,        --  IN ALU neg flag bit for psr
        statusZ => statusZ,        --  IN ALU zero flag bit for psr
        statusND => statusND,      --  IN ALU debug neg flag bit for psr
        statusZD => statusZD,      --  IN ALU debug zero flag bit for psr
        in_debug => in_debug,      --  IN MemoryIO debug signal.
        micro_instr => micro_inst, --  IN Micro instruction from microstore
        address2cs => address2cs   -- OUT next addres for the microstore
    );

    mstore:ENTITY work.microstore PORT MAP(
        address => address2cs,     --  IN address from control
        microcode => micro_inst    -- OUT instruction to 
    );

    -- Expose the micro_inst to the outside.
    micro_instr_out <= micro_inst;

END bhv;