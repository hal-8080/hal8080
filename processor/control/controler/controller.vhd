--             HAL8080 Processor           --
-- Kasper, Dennis, Tjeerd, Nick, Oussama 2020
--                controller
-- This file contains the controller.
-- The controller is in charge of making sure
-- the ALU and memory receive the right signals
-- read from the microstore based on the 
-- assemblyhal instruction.

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_Std.ALL;

ENTITY controller IS
    PORT (
        -- INTERNALS
        clk   :  IN std_logic;
        reset :  IN std_logic;
        -- CONTROL (CONTROL)
        ir    :  IN std_logic_vector(15 DOWNTO 0);
        statusN, statusZ   : IN std_logic;
        statusND, statusZD : IN std_logic;
        update_status      : IN std_logic; -- Whether to update status flipflops.
        in_debug           : IN std_logic;
        -- CONTROL STORE
        micro_instr :  IN std_logic_vector(32 DOWNTO 0);
        address2cs  : OUT std_logic_vector(10 DOWNTO 0) -- 11 bit from CS address MUX
    );
END ENTITY controller;


ARCHITECTURE bhv OF controller IS
    SIGNAL cbl      : std_logic_vector( 1 DOWNTO 0) := "00"; -- Control branch logic IN(%psr,COND) OUT(CSaddrMUX)
    SIGNAL CSAI_inc : std_logic_vector(10 DOWNTO 0) := "00000000000"; -- Control store address incrementer.
    SIGNAL address  : std_logic_vector(10 DOWNTO 0) := "00000000000"; -- Current microstore address.
    -- PROGRAM STATUS REGISTER
    SIGNAL psr      : std_logic_vector(3 DOWNTO 0)  := "0000";-- psr(3):ND and psr(2):zD psr(1):N and psr(0):z
    -- ALIASES FOR PSR
    ALIAS sN  : std_logic IS psr(0);
    ALIAS sZ  : std_logic IS psr(1);
    ALIAS sND : std_logic IS psr(2);
    ALIAS sZD : std_logic IS psr(3);
    -- INSTRUCTION FORMAT
    ALIAS OP       : std_logic_vector( 1 DOWNTO 0) IS ir(15 DOWNTO 14); -- instruction format
    ALIAS OP2      : std_logic_vector( 3 DOWNTO 0) IS ir(8  DOWNTO 5 ); -- ALU instruction
    ALIAS OP3      : std_logic_vector( 1 DOWNTO 0) IS ir(12 DOWNTO 11); -- display format 
    ALIAS OPLS     : std_logic IS ir( 8);                               -- load store bit mem format
    ALIAS OPi      : std_logic IS ir(13);                               -- i bit for branch set formats
    -- CONTROL BRANCH LOGIC
    ALIAS jmpA     : std_logic_vector(10 DOWNTO 0) IS micro_instr(10 DOWNTO  0);
    ALIAS COND     : std_logic_vector( 2 DOWNTO 0) IS micro_instr(13 DOWNTO 11);
    -- MICRO-LANGUAGE CONSTANTS
    CONSTANT COND_NextAddress : std_logic_vector(2 DOWNTO 0) := "000";
    CONSTANT COND_JumpZero    : std_logic_vector(2 DOWNTO 0) := "010";
    CONSTANT COND_JumpNeg     : std_logic_vector(2 DOWNTO 0) := "001";
    CONSTANT COND_JumpAlways  : std_logic_vector(2 DOWNTO 0) := "011";
    CONSTANT COND_Decode      : std_logic_vector(2 DOWNTO 0) := "111";
    -- CBL
    CONSTANT CBL_NEXT         : std_logic_vector(1 DOWNTO 0) := "00";
    CONSTANT CBL_JUMP         : std_logic_vector(1 DOWNTO 0) := "01";
    CONSTANT CBL_DECODE       : std_logic_vector(1 DOWNTO 0) := "10";
BEGIN

    --==========================================--
    --            SEQUENTIAL LOGIC              --
    --==========================================--

    -- SYNC BEHAVIOUR
    -- In normal operation, get the next address on
    -- the rising edge of the clock.
    ControlStoreCounter: PROCESS(reset, clk)
    BEGIN
        IF reset='0' THEN
            CSAI_inc <= (OTHERS=>'0'); -- Put the next address to 0.
        ELSIF rising_edge(clk) THEN
            CSAI_inc <= std_logic_vector(unsigned(address)+1);    
        END IF;
    END PROCESS;

    StatusRegisterUpdate: PROCESS(reset, clk)
    BEGIN
        IF reset='0' THEN
            psr <= (OTHERS=>'0'); -- Reset the status bits to 0.
        ELSIF rising_edge(clk) THEN
            IF update_status='1' THEN
                -- Update status bits based on the signals from datapath.
                psr(3) <= statusND;
                psr(2) <= statusZD;
                psr(1) <= statusN;
                psr(0) <= statusZ;
            END IF;
        END IF;
    END PROCESS;

    --==========================================--
    --           COMBINATIONAL LOGIC            --
    --==========================================--

    -- CONTROL BRANCH LOGIC
    -- Decide wether to actually jump based on condition and status bits.
    ControlBranchLogic:PROCESS(COND, psr, in_debug)
    BEGIN
        CASE COND IS
            -- Micro: Next? Always goto next address.
            WHEN COND_NextAddress => cbl <= CBL_NEXT;
            -- Micro: Zero? Check zero/debugzero status bit.
            WHEN COND_JumpZero => 
                IF (in_debug = '0' AND sZ = '1') OR (in_debug = '1' AND sZD = '1') THEN
                    cbl <= CBL_JUMP; 
                ELSE
                    cbl <= CBL_NEXT; 
                END IF;
            -- Micro: Neg? Check neg/debugneg status bit.
            WHEN COND_JumpNeg => 
                IF (in_debug = '0' AND sN = '1') OR (in_debug = '1' AND sND = '1') THEN
                    cbl <= CBL_JUMP; 
                ELSE
                    cbl <= CBL_NEXT; 
                END IF;
            -- Micro: BA? Always jump.
            WHEN COND_JumpAlways => cbl <= CBL_JUMP;
            -- Micro: Decode? Decode based on OP codes.
            WHEN OTHERS => cbl <= CBL_DECODE; -- Otherwise decode.
        END CASE;
    END PROCESS; 

    -- NEXT ADDRESS LOGIC
    NextAddress: PROCESS(micro_instr, cbl, ir, CSAI_inc)
    BEGIN
        CASE cbl IS
            -- If next (usually) use the counter that is incremented
            -- with the rising edge of the clock.
            WHEN CBL_NEXT => address <= CSAI_inc;
            -- If we jump. Use the jumpaddress from the microinstruction.
            WHEN CBL_JUMP => address <= jmpA;
            -- If we decode, construct the jumpaddress from the assemblyhal
            -- format currently in the Instruction Register.
            WHEN OTHERS =>
                -- ALU Operations
                IF OP = "00" THEN address <= "10" & OP & '0' & OP2 & "00";
                -- MEMORY Operations
                ELSIF OP = "01" THEN address <= "10" & OP & '0' & OPLS & "00000";
                -- DISPLAY Operations
                ELSIF OP = "10" THEN        
                    IF OPi = '0' THEN address <= "10" & OP & OPi & OP3 & OPLS & "000"; -- B register display.
                    ELSE address <= "10" & OP & OPi & OP3 & "0000"; END IF; -- 2 Const display.
                -- SET / BRANCH Operations
                ELSIF OP = "11" THEN        
                    IF OPi = '1' THEN address <= "10" & OP & OPi & OPLS & "00000"; -- SETHI/SETLO
                    ELSE address <= "10" & OP & OPi & OP2 & "00"; END IF; -- BRANCH
                ELSE
                    address <= CSAI_inc; -- Prevent latch.
                END IF;
        END CASE;
    END PROCESS;

    -- Update Address to control store with the address we know now.
    -- This makes the next microinstruction available when we
    -- change the address in the controller.
    address2cs <= address;

END bhv;