--untested
--branch instruction needs to be computed in the controller
--the controller has to send a copy (ALU) instruction to copy
--the contents of the assembly instruction's target register
--to reg(PC) when the relevent status bit is active

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
		ir				: OUT std_logic_vector(15 DOWNTO 0);
		Dig0, dig1, dig2, dig3, dig4, dig5	: OUT std_logic_vector(6 DOWNTO 0)
	);
END ENTITY data_path;



ARCHITECTURE bhv OF data_path IS
	
	TYPE reg_vector IS ARRAY (0 to 31) OF std_logic_vector(15 DOWNTO 0); --array of 32 16-bit vectors

	SIGNAL reg : reg_vector := (others=>(x"0000")); --32 registers of 16 bits --use example: "reg(2) <= a_16_bit_vector" stores the vector in register 2
	
									
-- Split up the micro instruction									

	SIGNAL micro_addrA	: std_logic_vector(4 DOWNTO 0) 	:= micro_inst(29 DOWNTO 25);
	SIGNAL micro_addrB	: std_logic_vector(4 DOWNTO 0) 	:= micro_inst(23 DOWNTO 19);
	SIGNAL muxA		: std_logic 									:= micro_inst(24);			-- 0 then take MIR A or 1 take from %r 
	SIGNAL muxB		: std_logic 									:= micro_inst(18);
	SIGNAL muxC		: std_logic 									:= micro_inst(17);			-- !! To either get data from the ALU or MM
	SIGNAL rd		: std_logic 									:= micro_inst(16);
	SIGNAL wr		: std_logic 									:= micro_inst(15);
	SIGNAL ALU		: std_logic_vector(3 DOWNTO 0)			:= micro_inst(14 DOWNTO 11);
	SIGNAL cond		: std_logic_vector(2 DOWNTO 0) 			:= micro_inst(10 DOWNTO 8);
	SIGNAL jump		: std_logic_vector(7 DOWNTO 0) 			:= micro_inst(7 DOWNTO 0);
--	
	SIGNAL instr	: std_logic_vector(15 DOWNTO 0)			:= x"0000";
--busses	
	SIGNAL Abus		: std_logic_vector(15 DOWNTO 0) 	:= x"0000";
	SIGNAL Bbus		: std_logic_vector(15 DOWNTO 0) 	:= x"0000";
	SIGNAL Cbus		: std_logic_vector(15 DOWNTO 0) 	:= x"0000";
	
-- MUX DECODER
	SIGNAL addr2decA : std_logic_vector(4 DOWNTO 0)	:= "00000";
	SIGNAL addr2decB : std_logic_vector(7 DOWNTO 0) := x"00";

-- from alu & memory to register
	SIGNAL ALUout	: signed(15 DOWNTO 0);
	
--look up table for display port
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
        WHEN "10011" => RETURN NOT "0011110"; --J
        WHEN "10100" => RETURN NOT "1010100"; --n
        WHEN "10101" => RETURN NOT "1110011"; --p
        WHEN "10110" => RETURN NOT "1100111"; --q
        WHEN "10111" => RETURN NOT "1111000"; --t
        WHEN "11000" => RETURN NOT "0111110"; --u
        WHEN "11001" => RETURN NOT "0111101"; --G
        WHEN "11010" => RETURN NOT "0000001"; --UP
        WHEN "11011" => RETURN NOT "1000000"; --MID
        WHEN "11100" => RETURN NOT "0001000"; --BOT
        WHEN "11101" => RETURN NOT "0000110"; --LEFT
        WHEN "11110" => RETURN NOT "0110000"; --RIGHT
        WHEN OTHERS => RETURN NOT "0000000";  --EMPTY
        END CASE;
    END hex2display;

-----------------------------------------------------------------------
BEGIN
	
	--A MUX & B MUX
	MUX:PROCESS(clk, reset)
	BEGIN
		IF reset = '0' THEN
		ELSIF rising_edge(clk) THEN
		-- MUX A  !!!!!!!!!!!! add that addr2decA is reg(PC) when OP1= 110
			IF muxA = '1' THEN
				addr2decA <= '0' & instr(12 DOWNTO 9);
			ELSE
				addr2decA <= micro_addrA;
			END IF;
			
		-- MUX B	
			IF muxB = '1' THEN	-- The role of i [instr(13)] depents on OP1
				IF instr(13) = '0' THEN --the role of i is the same when it is 1 for all OP1
					addr2decB <= x"0" & instr(3 DOWNTO 0); -- addr2decB <= '0' + B adress of the assembly instruction
				ELSE							--the role of i differs when it is 0
					CASE instr(15 DOWNTO 14) IS
						WHEN "00" 	=> addr2decB <= "000" & instr(4 DOWNTO 0); 	-- ARITHMATIC 	--addr2decB <= constant in assembly instruction
						WHEN "01" 	=> addr2decB <= instr(7 DOWNTO 0);				-- MEMORY		--addr2decB <= constant in assembly instruction
						WHEN "10" 	=> null;													-- DISPLAY		
						WHEN OTHERS => null;													-- branch/sethi
					END CASE;
				END IF;				
			ELSE
				addr2decB <= "000" & micro_addrB;
			END IF;
		END IF;
	END PROCESS MUX;

	--THE DECODERS
	DECODER:PROCESS(clk, reset)
		BEGIN
		IF reset = '0' THEN
		ELSIF rising_edge(clk) THEN
			-- DECODER	set binary addr to integer that points to register
				Abus <= reg(to_integer(unsigned(addr2decA))); --Abus<=reg(A)
				Bbus <= reg(to_integer(unsigned(addr2decB))); --Bbus<=reg(B)

		END IF;
	END PROCESS DECODER;
		
	--THE ALU	
	Maths:PROCESS(clk,reset)
		CONSTANT	max_value				: integer := 1024;
		VARIABLE Abus_sign, Bbus_sign : signed(15 DOWNTO 0);
		VARIABLE abus_int, Bbus_int	: integer RANGE -32768 TO 32767;
		VARIABLE powTemp					: integer RANGE 0 TO 32767;
		VARIABLE solution					: signed(15 DOWNTO 0);
		--random gen
		CONSTANT seed 			: unsigned(15 DOWNTO 0) := x"ABCD";	--starting seed 
		VARIABLE random 		: unsigned(15 DOWNTO 0) := seed;
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
			
			WHEN x"B" => 																	--POW B must be positive and can be max 1024 (2^11), A must be positive
				powTemp := Abus_int;
				FOR i IN 1 TO max_value LOOP
					IF i < Bbus_int THEN
						powTemp := powTemp * Abus_int;
					ELSE
						solution := to_signed(powTemp, 16);
						EXIT WHEN i = Bbus_int;
					END IF;
				END LOOP;
				
			WHEN x"C" => 																	--EQL true is denoted as hex FFFF and false as hex 0000
				IF Abus = Bbus THEN
					ALUout <= x"FFFF";
				ELSE
					ALUout <= x"0000";
				END IF;
				
			WHEN x"D" =>																	--GT  true is denoted as hex FFFF and false as hex 0000
				IF Abus > Bbus THEN
					ALUout <= x"FFFF";
				ELSE
					ALUout <= x"0000";
				END IF;
				
			WHEN x"E" =>	solution := Bbus_sign;										--COPY
			
			WHEN x"F" => ALUout <= signed(random);											-- RAND (SEPERATE in the process)
			WHEN OTHERS => null;
			
			END CASE;
			
			IF random = x"0000" THEN		
				random := seed;
			ELSE
				random := RESIZE((random * seed), 16);
			END IF;
			
			
				ALUout <= solution;
				IF to_integer(ALUout) = 0 THEN
					statusZ <= '1'; --statusZ
					statusN <= '0'; --statusN
				ELSIF to_integer(ALUout) < 0 THEN
					statusZ <= '0'; --statusZ
					statusN <= '1'; --statusN
				ELSE
					statusZ <= '0'; --statusZ
					statusN <= '0'; --statusN
				END IF;
		END IF;
	END PROCESS Maths;
	
	
	--move the ALU output or mm data to the Cbus & sethigh/low
	----try changing op1 to a case statement
	CMUX:PROCESS (clk, reset)	
		VARIABLE temp_reg			: std_logic_vector(15 DOWNTO 0);
	BEGIN
	IF reset = '0' THEN
	ELSIF rising_edge(clk) THEN
		
		IF instr(15 DOWNTO 14) = "11" THEN			-- BRANCH/SETHI
			IF instr(13) = '0' THEN							-- Branch
				--!!!!!!!!branch instruction has to be changed to a different micro instruction in the controller
			ELSE													-- Set-hi/lo
				IF instr(8) = '0' THEN						-- high
					Cbus <= instr(7 DOWNTO 0) & Abus(7 DOWNTO 0);
				ELSE												-- low
					Cbus <= Abus(15 DOWNTO 8) & instr(7 DOWNTO 0);
				END IF;
			END IF;
			--store ALU/MM in Cbus
		ELSIF instr(15 DOWNTO 14) = "00" THEN
			Cbus <= std_logic_vector(ALUout);
		ELSIF instr(15 DOWNTO 14) = "01" THEN
			Cbus <= mmI;
		END IF;
	END IF;
	END PROCESS CMUX;
	
	CTOREG:PROCESS(clk, reset)
	BEGIN
		IF reset = '0' THEN
		ELSIF rising_edge(clk) THEN
			reg(0) <= x"0000";-- make sure reg(0) is always 0
			IF (instr(15 DOWNTO 14) = "01" XOR instr(8) = '1') AND (instr(15 DOWNTO 14) /= "10") AND (instr(15 DOWNTO 13) /= "110")THEN
				reg(to_integer(unsigned(addr2decA))) <= Cbus;
			END IF;
		END IF;
	END PROCESS CTOREG;
	
	
	
	--DISPLAY
	Display:PROCESS (clk, reset)
		VARIABLE OP3 : std_logic_vector(1 DOWNTO 0);
		VARIABLE Digi0, digi1, digi2, digi3, digi4, digi5	:std_logic_vector(6 DOWNTO 0);
		VARIABLE Seg1, Seg2, Seg3, Seg4	: std_logic_vector(4 DOWNTO 0):= "00000";
	BEGIN

		IF reset = '0' THEN
		ELSIF rising_edge(clk) THEN
			OP3  := instr(12 DOWNTO 11);
			
			IF instr(15 DOWNTO 14) = "10" THEN
				IF instr(13) = '0' THEN 
					IF instr(8) = '0' THEN
					--Bregister split it up in 16 bits and set those with a + '0' so that they are 5 long
					--put them in seg1, seg2, seg3 and seg4
						Seg1 := '0' & Bbus(3 DOWNTO 0);
						Seg2 := '0' & Bbus(7 DOWNTO 4);
						Seg3 := '0' & Bbus(11 DOWNTO 8);
						Seg4 := '0' & Bbus(15 DOWNTO 12);
					ELSE
						Seg1 := Bbus(4 DOWNTO 0);-- 2 seg ments display used with the 10 lowest bits of B register
						Seg2 := Bbus(9 DOWNTO 5);
					END IF;
			
				ELSE
					Seg1 := instr(9 DOWNTO 5);
               Seg2 := instr(4 DOWNTO 0);
				END IF;
				
				CASE OP3 IS
					WHEN "00" => Digi0 := hex2display(Seg1); Digi1 := hex2display(Seg2);Digi2 := hex2display(Seg3);Digi3 := hex2display(Seg4);
					WHEN "01" => Digi2 := hex2display(Seg1); Digi3 := hex2display(Seg2);Digi4 := hex2display(Seg3);Digi5 := hex2display(Seg4);
					WHEN "10" => Digi4 := hex2display(Seg1); Digi5 := hex2display(Seg2);
					WHEN OTHERS => null;
				END CASE;
			
			END IF;
			Dig0 <= Digi0;
			Dig1 <= Digi1;
			Dig2 <= Digi2;
			Dig3 <= Digi3;
			Dig4 <= Digi4;
			Dig5 <= Digi5;
		END IF;
	END PROCESS Display;
	 
END;
