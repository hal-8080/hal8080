LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
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

	SIGNAL reg : reg_vector; --32 registers of 16 bits
										--use example: "reg(2) <= a_16_bit_vector" stores the vector in register 2
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
	SIGNAL 
	SIGNAL Abus		: std_logic_vector(15 DOWNTO 0) 	:= "0000000000000000";
	SIGNAL Bbus		: std_logic_vector(15 DOWNTO 0) 	:= "0000000000000000";
	
-- MUX DEC
	SIGNAL mux2decA: std_logic_vector(4 DOWNTO 0)	:= "00000";
	SIGNAL mux2decB: std_logic_vector(4 DOWNTO 0)	:= "00000";
	
	
	TYPE reg_vector IS ARRAY (0 to 31) OF std_logic_vector(15 DOWNTO 0); --array of 32 16-bit vectors
	
	SIGNAL reg : reg_vector; --32 registers of 16 bits
										--use example: "reg(2) <= a_16_bit_vector" stores the vector in register 2

BEGIN

	MUX:PROCESS()
		BEGIN
		
		-- MUX A
			IF muxA THEN
				addr2decA <= '0' & instr(12 DOWNTO 9);
			ELSE
				addr2decA <= micro_addrA;
			END IF;
			
		-- MUX B	
			IF muxB THEN	-- The role of i [instr(13)] depents on OP1
				IF instr(15 DOWNTO 14) = "00" THEN				-- ARITHMATIC
					IF NOT(instr(13)) THEN
						addr2decB <= '0' & instr(3 DOWNTO 0);
					ELSE
						Bbus <= "00000000000" & instr(4 DOWNTO 0);
					END IF;
					
				ELSIF instr(15 DOWNTO 14) = "01" THEN			-- MEMORY
					IF NOT(instr(13)) THEN
						addr2decB <= "0" & instr(3 DOWNTO 0);
					ELSE
						Bbus <= "0000000" & instr(7 DOWNTO 0);
					END IF;
					
				ELSIF instr(15 DOWNTO 14) = "10" THEN			-- DISP
					END IF;
					
				ELSIF instr(15 DOWNTO 14) = "11" THEN			-- BRANCH/SETHI
					END IF;
					
				END IF;
				
			ELSE
				addr2decB <= micro_addrB;
			END IF;
	END PROCESS MUX;

	
	DECODER:PROCESS(addr2decA, addr2decB)
		BEGIN
		-- DECODER	set binary addr to integer that points to register
		IF (instr(15 DOWNTO 13) = "011") OR (instr(15 DOWNTO 13) = "001")
			Abus <= reg(to_integer(unsigned(addr2decA)));
		ELSE
			Abus <= reg(to_integer(unsigned(addr2decA)));
			Bbus <= reg(to_integer(unsigned(addr2decB)));
		END PROCESS DECODER:
			
END;