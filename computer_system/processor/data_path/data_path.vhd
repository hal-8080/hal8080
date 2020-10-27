--clear drivers (move all bus assignments to the decoder process)
--try moving the alu to a different entity
--
--
--


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_Std.ALL;
ENTITY data_path IS
	PORT(
		clk			: IN 	std_logic;
		reset			: IN 	std_logic;
	-- From the controller
		micro_inst 	: IN 	std_logic_vector(29 DOWNTO 0);	
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

	SIGNAL reg : reg_vector; --32 registers of 16 bits --use example: "reg(2) <= a_16_bit_vector" stores the vector in register 2
	
									
-- Split up the micro instruction									

	SIGNAL micro_addrA	: std_logic_vector(4 DOWNTO 0) 	:= micro_inst(29 DOWNTO 25);
	SIGNAL micro_addrB	: std_logic_vector(4 DOWNTO 0) 	:= micro_inst(23 DOWNTO 19);
	SIGNAL muxA		: std_logic 							:= micro_inst(24);			-- 0 then take MIR A or 1 take from %r 
	SIGNAL muxB		: std_logic 							:= micro_inst(18);
	SIGNAL muxC		: std_logic 							:= micro_inst(17);			-- !! To either get data from the ALU or MM
	SIGNAL rd		: std_logic 							:= micro_inst(16);
	SIGNAL wr		: std_logic 							:= micro_inst(15);
	SIGNAL ALU		: std_logic_vector(3 DOWNTO 0)	:= micro_inst(14 DOWNTO 11);
	SIGNAL cond		: std_logic_vector(2 DOWNTO 0) 	:= micro_inst(10 DOWNTO 8);
	SIGNAL jump		: std_logic_vector(7 DOWNTO 0) 	:= micro_inst(7 DOWNTO 0);
	
	SIGNAL instr	: std_logic_vector(15 DOWNTO 0) 	:= reg(31);
	
	SIGNAL Abus		: std_logic_vector(15 DOWNTO 0) 	:= x"0000";
	SIGNAL Bbus		: std_logic_vector(15 DOWNTO 0) 	:= x"0000";
	SIGNAL Cbus		: std_logic_vector(15 DOWNTO 0) 	:= x"0000";
	
-- MUX DECODER
	SIGNAL mux2decA: std_logic_vector(4 DOWNTO 0)	:= "00000";
	SIGNAL mux2decB: std_logic_vector(4 DOWNTO 0)	:= "00000";
	SIGNAL addr2decA : std_logic_vector(4 DOWNTO 0)	:= "00000";
	SIGNAL addr2decB : std_logic_vector(7 DOWNTO 0) := x"00";

-- from alu & memory to register
	SIGNAL ALUout	: signed(17 DOWNTO 0);
	SIGNAL ALUbool	: boolean;
	SIGNAL Big_temp_reg: std_logic_vector(15 DOWNTO 0):= x"0000";
	SIGNAL temp_reg: std_logic_vector(7 DOWNTO 0)	:= x"00";
	
--status bits
	
	--SIGNAL status	: std_logic_vector(1 DOWNTO 0); --vector of status bits ZN
	

BEGIN
	statusZ <= ALUout(16);
	statusN <= ALUout(17);
	--reg(0) <= x"0000";-- make sure reg(0) is always 0
	
	
	
	--A MUX & B MUX
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
						addr2decB <= x"0" & instr(3 DOWNTO 0); -- addr2decB <= '0' + B adress of the assembly instruction
					ELSE
						addr2decB <= "000" & instr(4 DOWNTO 0); -- addr2decB <= constant in assembly instruction
					END IF;
					
				ELSIF instr(15 DOWNTO 14) = "01" THEN			-- MEMORY
					IF instr(13) = '0' THEN
						addr2decB <= x"0" & instr(3 DOWNTO 0);	-- addr2decB <= B adress of the assemby instruction
					ELSE
						addr2decB <= instr(7 DOWNTO 0); -- addr2decB <= constant in assembly instruction
					END IF;
					
				ELSIF instr(15 DOWNTO 14) = "10" THEN			-- DISP
					
					
				ELSIF instr(15 DOWNTO 14) = "11" THEN			-- BRANCH/SETHI
					IF instr(13) = '0' THEN							-- Branch
						-- PC needs to be updated?
					ELSE													-- Set-hi/low
						IF instr(8) = '0' THEN						-- high
							big_temp_reg <= reg(to_integer(unsigned(addr2decA)));
							temp_reg <= big_temp_reg(7 DOWNTO 0);
							reg(to_integer(unsigned(addr2decA))) <= instr & temp_reg;
						ELSE												-- low
							big_temp_reg <= reg(to_integer(unsigned(addr2decA)));
							temp_reg <= big_temp_reg(15 DOWNTO 8);
							reg(to_integer(unsigned(addr2decA))) <= temp_reg & instr;
						END IF;
					END IF;
				END IF;
				
			ELSE
				addr2decB <= "000" & micro_addrB;
			END IF;
			-- MUX C
			IF (muxc = '1') THEN		-- From ALU
				Cbus <= std_logic_vector(ALUout(15 DOWNTO 0));
			ELSE					-- From MM
				Cbus <= mmI;
			END IF;
		END IF;
	END PROCESS MUX;

	--THE DECODERS
	DECODER:PROCESS(clk, reset)
		BEGIN
		IF reset = '0' THEN
		ELSIF rising_edge(clk) THEN
			-- DECODER	set binary addr to integer that points to register
			IF (instr(15 DOWNTO 13) = "011") OR (instr(15 DOWNTO 13) = "001") THEN		-- For ALU and MEM when i '1'
				Abus <= reg(to_integer(unsigned(addr2decA))); --Abus<=reg(A)
				Bbus <= reg(to_integer(unsigned(addr2decA))); --Bbus<=reg(B)
			ELSIF (instr(15 DOWNTO 14) = "000") OR (instr(15 DOWNTO 14) = "010") THEN	-- For ALU and MEM when i '0'
				Abus <= reg(to_integer(unsigned(addr2decA)));
				Bbus <= reg(to_integer(unsigned(addr2decB)));
			END IF;
			
			reg(to_integer(unsigned(addr2decA))) <= Cbus;
		END IF;
	END PROCESS DECODER;
		
	--THE ALU	

	Maths:PROCESS(clk,reset)
		CONSTANT	max_value				: integer := 1024;
		VARIABLE Abus_sign, Bbus_sign : signed(15 DOWNTO 0);
		VARIABLE abus_int, Bbus_int	: integer RANGE -32768 TO 32767;
		VARIABLE powTemp					: integer RANGE -32768 TO 32767;
		VARIABLE solution					: signed(15 DOWNTO 0);
	BEGIN
		IF reset = '0' THEN
		ELSIF rising_edge(clk) THEN
			Abus_sign 	:= signed(Abus);
			Bbus_sign 	:= signed(Bbus);
			Abus_int 	:= to_integer(Abus_sign);
			Bbus_int		:= to_integer(Bbus_sign);
			
			CASE ALU IS
			WHEN x"0" => solution := Abus_sign AND Bbus_sign;						--AND
			WHEN x"1" => solution := Abus_sign NAND Bbus_sign;					--NAND
			WHEN x"2" => solution := Abus_sign OR Bbus_sign;						--OR
			WHEN x"3" => solution := Abus_sign OR NOT Bbus_sign;					--ORN
			WHEN x"4" => solution := to_signed(Abus_int + Bbus_int, 16);		--ADD
			WHEN x"5" => solution := to_signed(Abus_int * Bbus_int, 16);		--MUL
			WHEN x"6" => solution := to_signed(Abus_int / Bbus_int, 16);		--DIV
			WHEN x"7" => null;															--NOP
			WHEN x"8" => solution := signed(Abus(14 DOWNTO 0) & '0');			--SHIFTL
			WHEN x"9" => solution := signed(Abus(15) & Abus(15 DOWNTO 1));	--SHIFTR
			WHEN x"A" => solution := NOT Abus_sign;									--INV
			
			WHEN x"B" => 																	--POW B can be max 1024 (2^11)
				powTemp := Abus_int;
				FOR i IN 1 TO max_value LOOP
					IF i < Bbus_int THEN
						powTemp := powTemp * Abus_int;
					ELSE
						solution := to_signed(powTemp, 16);
						EXIT WHEN i = Bbus_int;
					END IF;
				END LOOP;
				
			WHEN x"C" => 																	--EQL
				IF Abus = Bbus THEN
					ALUbool <= TRUE;
				ELSE
					ALUbool <= FALSE;
				END IF;
				
			WHEN x"D" =>																	--GT
				IF Abus > Bbus THEN
					ALUbool <= TRUE;
				ELSE
					ALUbool <= FALSE;
				END IF;
				
			WHEN x"E" =>	solution := Bbus_sign;										--COPY
			WHEN OTHERS => null;															-- RAND (SEPERATE PROCESS)
			
			END CASE;
				ALUout(15 DOWNTO 0) <= solution;
				IF to_integer(ALUout(15 DOWNTO 0)) = 0 THEN
					ALUout(16) <= '1'; --statusZ
					ALUout(17) <= '0'; --statusN
				ELSIF to_integer(ALUout(15 DOWNTO 0)) < 0 THEN
					ALUout(16) <= '0'; --statusZ
					ALUout(17) <= '1'; --statusN
				ELSE
					ALUout(16) <= '0'; --statusZ
					ALUout(17) <= '0'; --statusN
				END IF;
		END IF;
	END PROCESS Maths;
	
	--pseudo random generator (ALU ="F")
	RANDO:PROCESS (clk, reset)
		CONSTANT seed 			: unsigned(15 DOWNTO 0) := x"ABCD";	--starting seed 
		VARIABLE random 		: unsigned(15 DOWNTO 0) := seed;
	BEGIN
		IF reset = '0' THEN
			random := seed;
		ELSIF rising_edge(clk) THEN
			--multiplying random with seed and store the lower 16 bits in random every clock cycle
			IF random = x"0000" THEN		
				random := seed;
			ELSE
				random := RESIZE((random * seed), 16);
			END IF;
			--when ALU is x"F", send the current random value to the mux
			IF ALU = x"F" THEN
				ALUout(15 DOWNTO 0) <= signed(random);
			END IF;
		END IF;
	END PROCESS RANDO;
	
	
END;