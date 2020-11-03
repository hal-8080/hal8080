--             HAL8080 Processor           --
-- Kasper, Dennis, Tjeerd, Nick, Oussama 2020
--                datapath
-- The processor datapath. The datapath receives
-- micro-instructions from the control and is tasked
-- with putting the correct signals to the ALU and
-- registers and the main memory. In other words;
-- describing the path the data follows.

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_Std.ALL;

ENTITY datapath IS
    PORT (
        -- INTERNALS
        clk          : IN std_logic; -- Main (50Mhz) clock.
        reset        : IN std_logic; -- Async Reset
        -- CONTROL (MEMORY)
        address_bus  : OUT std_logic_vector(15 DOWNTO 0);
        data_bus_in  :  IN std_logic_vector(15 DOWNTO 0);
        do_read      :  IN std_logic; -- Read directly from microinstruction.
        do_write     :  IN std_logic; -- Read directly from microinstruction.
        data_bus_out : OUT std_logic_vector(15 DOWNTO 0);
        in_debug     :  IN std_logic; -- Debug flag from MemoryIO
        -- CONTROL (CONTROL)
        micro_inst   :  IN std_logic_vector(32 DOWNTO 0);
        ir           : OUT std_logic_vector(15 DOWNTO 0);
        statusN      : OUT std_logic; -- Negative status bit (from ALU)
        statusZ      : OUT std_logic; -- Zero status bit (from ALU)
        statusND     : OUT std_logic; -- Negative status bit when in debug (from ALU)
        statusZD     : OUT std_logic; -- Zero status bit when in debug (from ALU)
        update_status: OUT std_logic  -- Whether to flash the status bits.
    );
END ENTITY datapath;

ARCHITECTURE bhv OF datapath IS

    -- Import the registers as component of the datapath.
    COMPONENT registers IS
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
    END COMPONENT registers;

    -- Import the ALU as component of the datapath
    COMPONENT ALU IS
        PORT (
            clk       :  IN std_logic;                     -- Clocky! (For random number gen)
            F         :  IN std_logic_vector( 3 DOWNTO 0); -- F, selection of ALU operation.
            BusA      :  IN std_logic_vector(15 DOWNTO 0); -- BusA input 1 of ALU.
            BusB      :  IN std_logic_vector(15 DOWNTO 0); -- BusB input 2 of ALU.
            ALUout    : OUT std_logic_vector(15 DOWNTO 0); -- ALU output.
            statusN   : OUT std_logic;                     -- Negative Status
            statusZ   : OUT std_logic;                     -- Zero Status
            statusND  : OUT std_logic;                     -- Negative Status DEBUG
            statusZD  : OUT std_logic;                     -- Zero Status DEBUG
            update_status : OUT std_logic;                 -- Whether to update status flags. (Flash signal)
            in_debug  :  IN std_logic;                     -- Whether we are in debug mode (toggles which status bits are used).
            do_read   :  IN std_logic;                     -- Whether we are reading from memory.
            do_write  :  IN std_logic;                     -- Whether we are writing to memory.
            AdrA      :  IN std_logic_vector( 4 DOWNTO 0)  -- Address where A is to be stored.
        );
    END COMPONENT ALU;

    -- Address busses
    SIGNAL AdrA   : std_logic_vector( 4 DOWNTO 0); -- Address of A
    SIGNAL AdrB   : std_logic_vector( 4 DOWNTO 0); -- Address of B
    SIGNAL AdrC   : std_logic_vector( 4 DOWNTO 0); -- Address of C (Store can be different from A)
    -- Data busses
    SIGNAL BusA   : std_logic_vector(15 DOWNTO 0); -- Output of register A (Rd)
    SIGNAL BusBR  : std_logic_vector(15 DOWNTO 0); -- Output of register B (Rs)
    SIGNAL BusB   : std_logic_vector(15 DOWNTO 0); -- Output of register B or constant.
    SIGNAL BusC   : std_logic_vector(15 DOWNTO 0); --  Input of regsiter C
    SIGNAL ALUout : std_logic_vector(15 DOWNTO 0); -- Output of the ALU.
    SIGNAL IR_i   : std_logic_vector(15 DOWNTO 0); -- Always expose the Instruction Register.

    -- Split the microinstruction to readable format. (do_read & do_write are already inputted in processor.vhd)
    ALIAS micro_addrA  : std_logic_vector( 4 DOWNTO 0) IS micro_inst(32 DOWNTO 28);
    ALIAS micro_addrB  : std_logic_vector( 4 DOWNTO 0) IS micro_inst(26 DOWNTO 22);
    ALIAS micro_addrC  : std_logic_vector( 4 DOWNTO 0) IS micro_inst(32 DOWNTO 28);
    ALIAS muxA         : std_logic                     IS micro_inst(27);
    ALIAS muxB         : std_logic                     IS micro_inst(21);
    ALIAS muxC         : std_logic                     IS micro_inst(20);
    ALIAS F            : std_logic_vector( 3 DOWNTO 0) IS micro_inst(17 DOWNTO 14);
    ALIAS cond         : std_logic_vector( 2 DOWNTO 0) IS micro_inst(13 DOWNTO 11);
    ALIAS jump         : std_logic_vector(10 DOWNTO 0) IS micro_inst(10 DOWNTO  0);
    -- Split the instruction from instruction register also.
    ALIAS OP1          : std_logic_vector( 1 DOWNTO 0) IS IR_i(15 DOWNTO 14);
    ALIAS OPi          : std_logic                     IS IR_i(13);
    ALIAS inst_addrA   : std_logic_vector( 3 DOWNTO 0) IS IR_i(12 DOWNTO 9);
    ALIAS inst_addrB   : std_logic_vector( 3 DOWNTO 0) IS IR_i( 3 DOWNTO 0);
    ALIAS inst_addrC   : std_logic_vector( 3 DOWNTO 0) IS IR_i(12 DOWNTO 9);

BEGIN

    --==========================================--
    --            COMPONENT MAPPING             --
    --==========================================--

    regs: registers PORT MAP(
        clk   => clk,
        reset => reset,
        AdrA  => AdrA,
        AdrB  => AdrB,
        AdrC  => AdrC,
        BusA  => BusA,
        BusB  => BusBR,
        BusC  => BusC,
        iir   => IR_i
    );

    aluu: alu PORT MAP(
        clk           => clk,          -- Internal clock
        F             => F,            -- Internal async reset.
        BusA          => BusA,         -- Directly from BusA
        BusB          => BusB,         -- Directly from BusB
        ALUout        => ALUout,       -- Put maybe to C
        statusN       => statusN,      -- Directly to control
        statusZ       => statusZ,      -- Directly to control
        statusND      => statusND,     -- Directly to control
        statusZD      => statusZD,     -- Directly to control
        update_status => update_status,-- Directly to control
        in_debug      => in_debug,     -- Directly from MemoryIO
        do_read       => do_read,      -- From micro_inst in processor
        do_write      => do_write,     -- From micro_inst in processor
        AdrA          => AdrA          -- Address A of register. Because we dont mess with status bits on Program Counter.
    );

    --==========================================--
    --           COMBINATIONAL LOGIC            --
    --==========================================--

    -- STEP 1: Put on the right addresses based on AMUX.
    -- in_debug will be 1 thus add 16 to registers if we are in debug mode.
    AdrA <= in_debug & inst_addrA WHEN muxA = '1' ELSE micro_addrA;
    -- STEP 1.5: registers will automatically make correct data available on BusA.
    -- STEP 2: Put on the right address based on BMUX
    AdrB <= in_debug & inst_addrB WHEN muxB = '1' ELSE micro_addrB;
    -- STEP 2.5: registers will automatically make data available on BusBR. But we might want a constant instead.
    -- STEP 3: Get the correct B on the Bbus for the ALU.
    GETB: PROCESS(muxB, micro_inst, IR_i, BusBR)
    BEGIN
        IF muxB = '1' AND OPi = '1' THEN -- If Mux in microinstruction and OPi in assembly tell to use constant:
            CASE OP1 IS
                -- Arithmatic; Sign-Extend last 5 bits.
                WHEN "00" => BusB <= std_logic_vector(RESIZE(signed(IR_i(4 DOWNTO 0)), 16));
                -- Memory; Sign-Extend last 8 bits.
                WHEN "01" => BusB <= std_logic_vector(RESIZE(signed(IR_i(7 DOWNTO 0)), 16));
                -- Display; shift second 5 bits to the upper 8 bits. Zero extend both on the left.
                WHEN "10" => BusB <= std_logic_vector(RESIZE(unsigned(IR_i(9 DOWNTO 5)), 8) & RESIZE(unsigned(IR_i(4 DOWNTO 0)), 8));
                -- SET (HI/LO); just get the last 8 bits.
                WHEN OTHERS => BusB <= x"00" & IR_i(7 DOWNTO 0);
            END CASE;
        ELSE -- Otherwise just get the B from the registers.
            BusB <= BusBR;
        END IF;
    END PROCESS;
    -- STEP 4: The ALU will always work immidiatly and output in ALUout.
    -- SETP 5: Set the correct C on the Cbus.
    AdrC <= in_debug & inst_addrC WHEN muxC = '1' ELSE micro_addrC;
    -- STEP 6: Decide whether to use ALU or memory for Cbus.
    BusC <= data_bus_in WHEN do_read = '1' ELSE ALUout;
    -- STEP 7: Expose necessary signals to control / memory.
    ir <= IR_i; -- Expose the Instruction Register
    address_bus <= BusB; -- Always put BusB on the address of the memory.
    data_bus_out <= BusA; -- Always put BusA on the data input of the memory.

END bhv;