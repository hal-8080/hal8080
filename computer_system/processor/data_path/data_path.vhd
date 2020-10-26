LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_Std.ALL;
ENTITY data_path IS
	PORT(
		clk			: IN 	std_logic;
		reset			: IN 	std_logic;
	-- From the controller
		micro_inst 	: IN 	std_logic_vector(25 DOWNTO 0);	
	-- To the controller
		statusN		: OUT std_logic;
		statusZ		: OUT std_logic;
		mmI			: IN 	std_logic_vector(15 DOWNTO 0);
		mmAdress		: OUT std_logic_vector(15 DOWNTO 0);
		mmData		: OUT std_logic_vector(15 DOWNTO 0);
		ir				: OUT std_logic_vector(15 DOWNTO 0)
	);
END ENTITY data_path;



ARCHITECTURE bhv OF data_path IS
	
	TYPE reg_vector IS ARRAY (0 to 31) OF std_logic_vector(15 DOWNTO 0); --array of 32 16-bit vectors

	SIGNAL reg 			: reg_vector; --32 registers of 16 bits --use example: "reg(2) <= a_16_bit_vector" stores the vector in register 2
	SIGNAL busA, busB	: std_logic_vector(15 DOWNTO 0);
	
									
-- Split up the micro instruction									

	SIGNAL micro_addrA	: std_logic_vector(4 DOWNTO 0) 	:= micro_inst(25 DOWNTO 21);
	SIGNAL micro_addrB	: std_logic_vector(4 DOWNTO 0) 	:= micro_inst(19 DOWNTO 15);
	SIGNAL muxA		: std_logic 							:= micro_inst(20);			-- 0 then take MIR A or 1 take from %r 
	SIGNAL muxB		: std_logic 							:= micro_inst(14);
	SIGNAL muxC		: std_logic 							:= micro_inst(15);			-- To either store in registers or mm
	SIGNAL rd		: std_logic 							:= micro_inst(12);
	SIGNAL wr		: std_logic 							:= micro_inst(11);
	SIGNAL cond		: std_logic_vector(2 DOWNTO 0) 	:= micro_inst(10 DOWNTO 8);
	SIGNAL jump		: std_logic_vector(7 DOWNTO 0) 	:= micro_inst(7 DOWNTO 0);
	
	SIGNAL instr	: std_logic_vector(15 DOWNTO 0) 	:= reg(31);
	
	SIGNAL Abus		: std_logic_vector(15 DOWNTO 0) 	:= x"0000";
	SIGNAL Bbus		: std_logic_vector(15 DOWNTO 0) 	:= x"0000";
	SIGNAL addr2decA : std_logic_vector(4 DOWNTO 0)	:= "00000";
	SIGNAL addr2decB : std_logic_vector(4 DOWNTO 0) := "00000";
	
-- MUX DECODER
	SIGNAL mux2decA: std_logic_vector(4 DOWNTO 0)	:= "00000";
	SIGNAL mux2decB: std_logic_vector(4 DOWNTO 0)	:= "00000";
	

BEGIN

	MUX:PROCESS(clk, reset)
		BEGIN
	IF reset = '0' THEN
	ELSIF rising_edge(clk) THEN
		-- MUX A
			IF muxA = '1' THEN
				addr2decA <= '0' & instr(12 DOWNTO 9);
			ELSE
				addr2decA <= micro_addrA;
			END IF;
			
		-- MUX B	
			IF muxB = '1' THEN	-- The role of i [instr(13)] depents on OP1
				IF instr(15 DOWNTO 14) = "00" THEN				-- ARITHMATIC
					IF instr(13) = '0' THEN
						addr2decB <= '0' & instr(3 DOWNTO 0); -- addr2decB <= '0' + B adress of the assembly instruction
					ELSE
						Bbus <= "00000000000" & instr(4 DOWNTO 0); -- Bbus <= constant in assembly instruction
					END IF;
					
				ELSIF instr(15 DOWNTO 14) = "01" THEN			-- MEMORY
					IF instr(13) = '0' THEN
						addr2decB <= "0" & instr(3 DOWNTO 0);	-- addr2decB <= B adress of the assemby instruction
					ELSE
						Bbus <= x"00" & instr(7 DOWNTO 0); -- addr2decB <= constant in assembly instruction
					END IF;
					
				ELSIF instr(15 DOWNTO 14) = "10" THEN			-- DISP

					
				ELSIF instr(15 DOWNTO 14) = "11" THEN			-- BRANCH/SETHI

					
				END IF;
				
			ELSE
				addr2decB <= micro_addrB;
			END IF;
		END IF;
	END PROCESS MUX;

	
	DECODER:PROCESS(clk, reset)
		BEGIN
		IF reset = '0' THEN
		ELSIF rising_edge(clk) THEN
			-- DECODER	set binary addr to integer that points to register
			IF (instr(15 DOWNTO 13) = "011") OR (instr(15 DOWNTO 13) = "001") THEN
				Abus <= reg(to_integer(unsigned(addr2decA))); --Abus<=reg(A)
			ELSE
				Abus <= reg(to_integer(unsigned(addr2decA)));
				Bbus <= reg(to_integer(unsigned(addr2decB)));
			END IF;
		END IF;
	END PROCESS DECODER;
			

	reg(0) <= x"0000";-- make sure reg(0) is always 0
	
	
	--pseudo random generator
	PROCESS (clk, reset)
		CONSTANT seed 			: unsigned(15 DOWNTO 0) := x"ABCD";	--starting seed 
		VARIABLE random 		: unsigned(15 DOWNTO 0) := seed;
	BEGIN
		IF reset = '0' THEN
			random := seed;
		ELSIF rising_edge(clk) THEN
			IF random = x"0000" THEN
				random := seed;
			ELSE
				random := RESIZE((random * seed), 16);
			END IF;		
		END IF;
	END PROCESS;
	
END;