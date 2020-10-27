LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_Std.ALL;
ENTITY control IS
	PORT(
		clk			: IN	std_logic;
		reset			: IN 	std_logic;
		ir				: IN	std_logic_vector(15 DOWNTO 0);
	-- PSR
		ALUout		: IN 	std_logic_vector(17 DOWNTO 0);
		
	-- CONTROL STORE
		micro_instr	: IN 	std_logic_vector(32 DOWNTO 0);
		address2cs	: OUT	std_logic_vector(10 DOWNTO 0)		-- 11 bit from CS address MUX

	);
END ENTITY control;
ARCHITECTURE bhv OF control IS
	SIGNAL cbl 		: std_logic_vector(1 DOWNTO 0)	:= "00";		-- Control branch logic IN(%psr,COND) OUT(CSaddrMUX)
	SIGNAL jmpA		: std_logic_vector(10 DOWNTO 0)	:= micro_instr(10 DOWNTO 0);
	SIGNAL CSAI_inc: std_logic_vector(10 DOWNTO 0)	:= "00000000000";
	SIGNAL address : std_logic_vector(10 DOWNTO 0)	:= "00000000000";
-- INSTRUCTION FORMAT
	SIGNAL OP		: std_logic_vector(1 DOWNTO 0)	:= ir(15 DOWNTO 14);		-- instruction format
	SIGNAL OP2		: std_logic_vector(3 DOWNTO 0)	:= ir(8  DOWNTO 5 );		-- ALU instruction
	SIGNAL OP3		: std_logic_vector(1 DOWNTO 0)	:= ir(12 DOWNTO 11);		-- display format 
	SIGNAL OPLS		: std_logic := ir(8);				-- load store bit mem format
	SIGNAL OPi		: std_logic := ir(13);				-- i bit for branch set formats
-- PROGRAM STATUS REGISTER
	SIGNAL psr		: std_logic_vector(1 DOWNTO 0)	:= ALUout(17 DOWNTO 16);-- psr(1):N and psr(0):z
-- CONTROL BRANCH LOGIC
	SIGNAL COND		: std_logic_vector(2 DOWNTO 0)	:= micro_instr(13 DOWNTO 11);
BEGIN

CLB:PROCESS(reset,clk)
  BEGIN
    IF reset='0' THEN
      --reset
    ELSIF rising_edge(clk) THEN
      CASE COND IS
		-- Next addr
			WHEN "000" =>	cbl <= "00";
		-- Jump if n
			WHEN "001" =>	IF psr(1) = '1' THEN
								cbl <= "01";    ELSE		cbl <= "00"; END IF;
		-- Jump if z
			WHEN "010" =>	IF psr(0) = '1' THEN
								cbl <= "01";    ELSE		cbl <= "00"; END IF;
		-- jump always
			WHEN "011" =>	cbl <= "01";
		-- DECODE "111"
			WHEN OTHERS =>	cbl <= "10";
		END CASE;
    END IF;
  END PROCESS; 
  

CSAI:PROCESS(reset,clk)
  BEGIN
    IF reset='0' THEN
      CSAI_inc <= (OTHERS=>'0');
    ELSIF rising_edge(clk) THEN
      CSAI_inc <= std_logic_vector(unsigned(address)+1);	
    END IF;
  END PROCESS;  


MUX:	PROCESS(clk, reset)
	BEGIN
	IF reset = '0' THEN
	--reset
	ELSIF rising_edge(clk) THEN
		CASE cbl IS
			-- NEXT ADDR
			WHEN "00" => address <= CSAI_inc;
			-- JUMP
			WHEN "01" => address <= JmpA;
			-- DECODE
			WHEN OTHERS => IF OP = "00" THEN		-- ALU
							address <= "10000" & OP & OP2;
						 ELSIF OP = "01" THEN		-- MEM
							address <= "10000" & OP & "000" & OPLS;
						 ELSIF OP = "10" THEN		-- BR SH
							address <= "10000" & OP & "000" & OPi;
						 END IF;
		END CASE;
	END IF;
	END PROCESS;
	
	address2cs <= address;
END bhv;