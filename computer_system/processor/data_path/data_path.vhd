--tested
--
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
		micro_inst 	: IN 	std_logic_vector(32 DOWNTO 0);	
	-- To the controller
		statusN		: OUT std_logic := '0';
		statusZ		: OUT std_logic := '0';
		statusD		: IN std_logic := '0';
		statusND		: OUT std_logic := '0';
		statusZD		: OUT std_logic := '0';
	--to and from memory
		mmI			: IN 	std_logic_vector(15 DOWNTO 0);
		mmAdress		: OUT std_logic_vector(15 DOWNTO 0);
		mmData		: OUT std_logic_vector(15 DOWNTO 0);
		ir				: OUT std_logic_vector(15 DOWNTO 0) := x"0000"
	);
END ENTITY data_path;



ARCHITECTURE bhv OF data_path IS
	
	TYPE reg_vector IS ARRAY (0 to 31) OF std_logic_vector(15 DOWNTO 0); --array of 32 16-bit vectors

	SIGNAL reg : reg_vector := (others=>(x"0000")); --32 registers of 16 bits --use example: "reg(2) <= a_16_bit_vector" stores the vector in register 2
	
									
-- Split up the micro instruction									

	SIGNAL micro_addrA	: std_logic_vector(4 DOWNTO 0) 	:= micro_inst(32 DOWNTO 28);
	SIGNAL micro_addrB	: std_logic_vector(4 DOWNTO 0) 	:= micro_inst(26 DOWNTO 22);
	SIGNAL muxA		: std_logic 									:= micro_inst(27);			-- 0 then take MIR A or 1 take from %r 
	SIGNAL muxB		: std_logic 									:= micro_inst(21);
	SIGNAL muxC		: std_logic 									:= micro_inst(20);			-- !! To either get data from the ALU or MM
	SIGNAL rd		: std_logic 									:= micro_inst(19);
	SIGNAL wr		: std_logic 									:= micro_inst(18);
	SIGNAL ALU		: std_logic_vector(3 DOWNTO 0)			:= micro_inst(17 DOWNTO 14);
	SIGNAL cond		: std_logic_vector(2 DOWNTO 0) 			:= micro_inst(13 DOWNTO 11);
	SIGNAL jump		: std_logic_vector(10 DOWNTO 0) 			:= micro_inst(10 DOWNTO 0);
--	
	SIGNAL instr	: std_logic_vector(15 DOWNTO 0)			:= x"0000";
--busses	
	SIGNAL Abus		: std_logic_vector(15 DOWNTO 0) 	:= x"0000";
	SIGNAL Bbus		: std_logic_vector(15 DOWNTO 0) 	:= x"0000";
	SIGNAL Cbus		: std_logic_vector(15 DOWNTO 0) 	:= x"0000";
-- instruction counter
	SIGNAL counter : integer RANGE 0 TO 3 := 0;
	
-- MUX DECODER
	SIGNAL addr2decA : std_logic_vector(4 DOWNTO 0)	:= "00000";
	SIGNAL addr2decB : std_logic_vector(4 DOWNTO 0) := "00000";
	--SIGNAL mux2busA : std_logic_vector(15 DOWNTO 0) := x"0000"; --can go
	--SIGNAL mux2busB : std_logic_vector(15 DOWNTO 0) := x"0000"; --can go

-- from alu & memory to register
	SIGNAL ALUout	: std_logic_vector(15 DOWNTO 0) := x"0001";
	
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
        WHEN OTHERS 	=> RETURN NOT "0000000";  --EMPTY
        END CASE;
    END hex2display;
	 
--look up table for shiftL/R
--	FUNCTION shiftLR(busB:integer RANGE -32768 TO 32767; busA:std_logic_vector(15 DOWNTO 0); ALUf:std_logic_vector(3 DOWNTO 0)) RETURN signed IS
--		variable shift_vector	: std_logic_vector(15 DOWNTO 0) := x"0000";
--		VARIABLE Bbus_shift		: integer RANGE 0 TO 15;
--		VARIABLE sol : std_logic_vector(31 DOWNTO 0);
--	BEGIN
--		IF busB < 1 THEN
--			Bbus_shift := 0;
--		ELSIF busB > 15 THEN
--			Bbus_shift := 16;
--		ELSE
--			Bbus_shift := busB;
--		END IF;		
--		IF ALUf = x"8" THEN --SHIFTL and 0 extend right
--			sol := busA	& shift_vector;
--			CASE Bbus_shift IS
--				WHEN 1 	=> RETURN signed(sol(30 DOWNTO 15));
--				WHEN 2 	=> RETURN signed(sol(29 DOWNTO 14));		
--				WHEN 3 	=> RETURN signed(sol(28 DOWNTO 13));
--				WHEN 4 	=> RETURN signed(sol(27 DOWNTO 12));
--				WHEN 5 	=> RETURN signed(sol(26 DOWNTO 11));
--				WHEN 6 	=> RETURN signed(sol(25 DOWNTO 10));
--				WHEN 7 	=> RETURN signed(sol(24 DOWNTO 9));
--				WHEN 8 	=> RETURN signed(sol(23 DOWNTO 8));
--				WHEN 9 	=> RETURN signed(sol(22 DOWNTO 7));
--				WHEN 10 	=> RETURN signed(sol(21 DOWNTO 6));
--				WHEN 11 	=> RETURN signed(sol(20 DOWNTO 5));
--				WHEN 12 	=> RETURN signed(sol(19 DOWNTO 4));
--				WHEN 13 	=> RETURN signed(sol(18 DOWNTO 3));
--				WHEN 14 	=> RETURN signed(sol(17 DOWNTO 2));
--				WHEN 15 	=> RETURN signed(sol(16 DOWNTO 1));
--				WHEN 16 	=> RETURN signed(sol(15 DOWNTO 0));
--				WHEN OTHERS => RETURN signed(sol(31 DOWNTO 16));
--			END CASE;
--		ELSIF ALUf = x"9" THEN --shiftR and sign extend left for sign bit is 0
--			CASE Bbus_shift IS --SHIFT_LEFT
--				WHEN 1 	=> RETURN resize(signed(busA(15 DOWNTO 1)), 16);
--				WHEN 2 	=> RETURN resize(signed(busA(15 DOWNTO 2)), 16);
--				WHEN 3 	=> RETURN resize(signed(busA(15 DOWNTO 3)), 16);
--				WHEN 4 	=> RETURN resize(signed(busA(15 DOWNTO 4)), 16);
--				WHEN 5 	=> RETURN resize(signed(busA(15 DOWNTO 5)), 16);
--				WHEN 6 	=> RETURN resize(signed(busA(15 DOWNTO 6)), 16);
--				WHEN 7 	=> RETURN resize(signed(busA(15 DOWNTO 7)), 16);
--				WHEN 8 	=> RETURN resize(signed(busA(15 DOWNTO 8)), 16);
--				WHEN 9 	=> RETURN resize(signed(busA(15 DOWNTO 9)), 16);
--				WHEN 10 	=> RETURN resize(signed(busA(15 DOWNTO 10)), 16);
--				WHEN 11 	=> RETURN resize(signed(busA(15 DOWNTO 11)), 16);
--				WHEN 12 	=> RETURN resize(signed(busA(15 DOWNTO 12)), 16);
--				WHEN 13 	=> RETURN resize(signed(busA(15 DOWNTO 13)), 16);
--				WHEN 14 	=> RETURN resize(signed(busA(15 DOWNTO 14)), 16);
--				WHEN 15 	=> RETURN resize(signed(busA(15 DOWNTO 15)), 16);
--				WHEN 16 	=> RETURN resize(signed(busA(15 DOWNTO 15)), 16);
--				WHEN OTHERS => RETURN signed(busA(15 DOWNTO 0));
--			END CASE;
--		END IF;
--	END shiftLR;

-----------------------------------------------------------------------
BEGIN

micro_addrA <= micro_inst(32 DOWNTO 28);
micro_addrB	<= micro_inst(26 DOWNTO 22);
muxA			<= micro_inst(27);
muxB			<= micro_inst(21);
muxC			<= micro_inst(20);
rd				<= micro_inst(19);
wr				<= micro_inst(18);
ALU			<= micro_inst(17 DOWNTO 14);
cond			<= micro_inst(13 DOWNTO 11);
jump 			<= micro_inst(10 DOWNTO 0);

	instrcounter:PROCESS(clk, reset)
	BEGIN
		IF reset = '0' THEN
		ELSIF rising_edge(clk) THEN
			IF counter < 3 THEN
				counter <= counter + 1;
			ELSE
				counter <= 0;
			END IF;
		END IF;
	END PROCESS instrcounter;

	instruction:PROCESS(clk, reset)
	BEGIN
		IF reset= '0' THEN
		ELSIF rising_edge(clk) THEN
			ir <= reg(31);
			instr <= reg(31);
		END IF;
	END PROCESS instruction;
	
	--A MUX & B MUX & decoder
	MUX:PROCESS(clk, reset)
		VARIABLE Aaddr, Baddr : std_logic_vector(4 DOWNTO 0);
	BEGIN
		IF reset = '0' THEN
		ELSIF rising_edge(clk) AND counter = 0 THEN
			IF muxA = '1' THEN
				IF statusD = '0' THEN	--if debug mode is off, use regular registers
					Aaddr := '0' & instr(12 DOWNTO 9);
				ELSE							--if debug mode is on, use register + 16
					Aaddr := std_logic_vector(to_unsigned((to_integer(unsigned('0' & instr(12 DOWNTO 9)))+16), 5));
				END IF;
				addr2decA <= Aaddr;
				Abus <= reg(to_integer(unsigned(Aaddr)));
			ELSE
				addr2decA <= micro_addrA;
				Abus <= reg(to_integer(unsigned(micro_addrA)));
			END IF;
			
		-- MUX B	
			IF muxB = '1' THEN	-- The role of i [instr(13)] depents on OP1
				IF instr(13) = '0' THEN --the role of i is the same when it is 1 for all OP1
					IF statusD = '0' THEN	--if debug mode is off, use regular registers
						Baddr := '0' & instr(3 DOWNTO 0);
					ELSE							--if debug mode is on, use register + 16
						Baddr := std_logic_vector(to_unsigned((to_integer(unsigned('0' & instr(3 DOWNTO 0)))+16), 5));
					END IF;
					addr2decB <= Baddr; -- addr2decB <= '0' + B adress of the assembly instruction
					Bbus <= reg(to_integer(unsigned(Baddr)));
				ELSIF instr(13) = '1' THEN
					CASE instr(15 DOWNTO 14) IS
					WHEN "00" 	=> Bbus <= std_logic_vector(RESIZE(signed(instr(4 DOWNTO 0)), 16)); 	-- ARITHMATIC 	--Bbus <= constant in assembly instruction
					WHEN "01" 	=> Bbus <= std_logic_vector(RESIZE(signed(instr(7 DOWNTO 0)), 16));			-- MEMORY		--Bbus <= constant in assembly instruction
					WHEN "10" 	=> Bbus <= std_logic_vector(RESIZE(signed('0' & instr(9 DOWNTO 5)) & signed('0' & instr(4 DOWNTO 0)), 16));-- DISPLAY		
					WHEN OTHERS => Bbus <= x"00" & instr(7 DOWNTO 0);			-- sethi/low
				END CASE;
				END IF;				
			ELSE
				addr2decB <= micro_addrB;
				Bbus <= reg(to_integer(unsigned(micro_addrB)));
			END IF;
		END IF;
	END PROCESS MUX;

	--THE DECODERS
	--DECODER:PROCESS(clk, reset)
	--	BEGIN
	--	IF reset = '0' THEN
	--	ELSIF rising_edge(clk) THEN
	--		-- DECODER	set binary addr to integer that points to register
	--			Abus <= reg(to_integer(unsigned(addr2decA))); --Abus<=reg(A)
	--		IF muxB = '1'AND instr(13) = '1' THEN
	--			CASE instr(15 DOWNTO 14) IS
	--				WHEN "00" 	=> Bbus <= mux2busB; 	-- ARITHMATIC 	--Bbus <= constant in assembly instruction
	--				WHEN "01" 	=> Bbus <= mux2busB;			-- MEMORY		--Bbus <= constant in assembly instruction
	--				WHEN "10" 	=> Bbus <= mux2busB;-- DISPLAY		
	--				WHEN OTHERS => Bbus <= mux2busB;			-- sethi/low
	--			END CASE;
	--		ELSE
	--			Bbus <= reg(to_integer(unsigned(addr2decB))); --Bbus<=reg(B)
	--		END IF;
	--	END IF;
	--END PROCESS DECODER;
		
	--THE ALU	
	Maths:PROCESS(clk,reset)
		CONSTANT	max_value				: integer := 1024;
 
		VARIABLE Abus_sign, Bbus_sign : signed(15 DOWNTO 0);
		VARIABLE Abus_int, Bbus_int	: integer RANGE -32768 TO 32767;		
		VARIABLE powTemp					: integer RANGE 0 TO 32767;
		VARIABLE solution					: signed(15 DOWNTO 0) := x"0001";
		--random gen
		CONSTANT seed 			: unsigned(15 DOWNTO 0) := x"ABCD";	--starting seed 
		VARIABLE random 		: unsigned(15 DOWNTO 0) := seed;
		--shift
		VARIABLE Bbus_shift		: integer RANGE 0 TO 16;
	BEGIN
		IF reset = '0' THEN
		ELSIF rising_edge(clk) AND counter = 1  THEN
			Abus_sign 	:= signed(Abus);
			Bbus_sign 	:= signed(Bbus);
			Abus_int 	:= to_integer(Abus_sign);
			Bbus_int		:= to_integer(Bbus_sign);
			
			IF Bbus_int < 1 THEN
				Bbus_shift := 0;
			ELSIF Bbus_int > 15 THEN
				Bbus_shift := 16;
			ELSE
				Bbus_shift := Bbus_int;
			END IF;
			
			
			CASE ALU IS
			WHEN x"0" => --AND bitwise
				solution := Abus_sign AND Bbus_sign; 		
				ALUout <= std_logic_vector(solution);
			WHEN x"1" => --NAND bitwise
				solution := Abus_sign NAND Bbus_sign;	 	
				ALUout <= std_logic_vector(solution);				
			WHEN x"2" => --OR bitwise
				solution := Abus_sign OR Bbus_sign;		
				ALUout <= std_logic_vector(solution);						
			WHEN x"3" => --ORN bitwise
				solution := Abus_sign OR NOT Bbus_sign;	
				ALUout <= std_logic_vector(solution);				
			WHEN x"4" => --ADD
				solution := to_signed(Abus_int + Bbus_int, 16);	
				ALUout <= std_logic_vector(solution);		
			WHEN x"5" => --MUL
				solution := to_signed(Abus_int * Bbus_int, 16);	
				ALUout <= std_logic_vector(solution);	
			WHEN x"6" => --DIV
				solution := to_signed(Abus_int / Bbus_int, 16);	
				ALUout <= std_logic_vector(solution);	
			WHEN x"7" => --	xor
				solution := Abus_sign XOR Bbus_sign;					
				ALUout <= std_logic_vector(solution);				
			WHEN x"8" => --SHIFTL
				solution := signed(shift_left(unsigned(Abus), Bbus_shift));	
				ALUout <= std_logic_vector(solution);				
			WHEN x"9" => --shiftR
				solution := shift_right(Abus_sign, Bbus_shift);					
				ALUout <= std_logic_vector(solution);			
			WHEN x"A" => --INV bitwise
				solution := NOT Bbus_sign;												
				ALUout <= std_logic_vector(solution);			
			WHEN x"B" => --POW B must be positive and can be max 1024 (2^11), A must be positive
				powTemp := Abus_int;
				FOR i IN 1 TO max_value LOOP
					IF i < Bbus_int THEN
						powTemp := powTemp * Abus_int;
					ELSE
						solution := to_signed(powTemp, 16);
						EXIT WHEN i = Bbus_int;
					END IF;
				END LOOP;
				ALUout <= std_logic_vector(solution);
				
			WHEN x"C" => --SUB
				solution := to_signed(Abus_int - Bbus_int, 16);		
				ALUout <= std_logic_vector(solution);		

			WHEN x"D" => ALUout <= ('0' & hex2display(Bbus(12 DOWNTO 8))) & ('0' & hex2display(Bbus(4 DOWNTO 0)));	--DISP																	--DISPLAY
				
			WHEN x"E" => ALUout <= Bbus;--COPY
			
			WHEN x"F" => ALUout <= std_logic_vector(random); -- RAND (SEPERATE in the process)
			WHEN OTHERS => null;
			
			END CASE;
			
			IF random = x"0000" THEN		
				random := seed;
			ELSE
				random := RESIZE((random * seed), 16);
			END IF;
			
			--status bits:
			IF statusD = '0' THEN	--if debug is off, update regular status bits
				IF to_integer(solution) = 0 AND rd='0' AND wr='0' AND (ALU /= x"D" AND ALU /= x"E" AND ALU /= x"F") AND addr2decA /= "11111" THEN
					statusZ <= '1'; --statusZ
					statusN <= '0'; --statusN
				ELSIF to_integer(solution) < 0 AND rd='0' AND wr='0' AND (ALU /= x"D" AND ALU /= x"E" AND ALU /= x"F") AND addr2decA /= "11111" THEN
					statusZ <= '0'; --statusZ
					statusN <= '1'; --statusN
				ELSIF to_integer(solution) > 0 AND rd='0' AND wr='0' AND (ALU /= x"D" AND ALU /= x"E" AND ALU /= x"F") AND addr2decA /= "11111" THEN
					statusZ <= '0'; --statusZ
					statusN <= '0'; --statusN
				END IF;
			ELSE --if debug is on, update only the debug status bits
				IF to_integer(solution) = 0 AND rd='0' AND wr='0' AND (ALU /= x"D" AND ALU /= x"E" AND ALU /= x"F") AND addr2decA /= "11111" THEN
					statusZD <= '1'; --statusZ
					statusND <= '0'; --statusN
				ELSIF to_integer(solution) < 0 AND rd='0' AND wr='0' AND (ALU /= x"D" AND ALU /= x"E" AND ALU /= x"F") AND addr2decA /= "11111" THEN
					statusZD <= '0'; --statusZ
					statusND <= '1'; --statusN
				ELSIF to_integer(solution) > 0 AND rd='0' AND wr='0' AND (ALU /= x"D" AND ALU /= x"E" AND ALU /= x"F") AND addr2decA /= "11111" THEN
					statusZD <= '0'; --statusZ
					statusND <= '0'; --statusN
				END IF;
			END IF;
		END IF;
	END PROCESS Maths;
	
	
	--move the ALU output or mm data to the Cbus
	CMUX:PROCESS (clk, reset)	
		VARIABLE temp_reg			: std_logic_vector(15 DOWNTO 0);
		VARIABLE Cbusi				: std_logic_vector(15 DOWNTO 0);
		VARIABLE caddr 			: std_logic_vector(4 DOWNTO 0);
	BEGIN
	IF reset = '0' THEN
	ELSIF rising_edge(clk) AND counter = 2 THEN
			--store ALU/MM in Cbus
		IF rd = '0' AND wr = '0' THEN
			Cbusi := std_logic_vector(ALUout);
		ELSIF rd = '1' THEN
			Cbusi := mmI;
		END IF;
		
		Cbus <= Cbusi;
		
		--CbusMux
		IF wr = '0' THEN
				IF statusD = '0' THEN	--if debug mode is off, use regular registers
					caddr := '0' & instr(12 DOWNTO 9);
				ELSE							--if debug mode is on, use register + 16
					caddr := std_logic_vector(to_unsigned((to_integer(unsigned('0' & instr(12 DOWNTO 9)))+16), 5));
				END IF;
			
			IF muxC = '1' AND (caddr) /= "00000" AND (caddr) /= "00001" THEN
				reg(to_integer(unsigned(caddr))) <= Cbusi;
			ELSIF muxC ='0' AND micro_addrA /= "00000" AND micro_addrA /= "00001" THEN
				reg(to_integer(unsigned(micro_addrA))) <= Cbusi;
			END IF;
		END IF;
		
		reg(0) <= x"0000";-- make sure reg(0) is always 0
		reg(1) <= x"0001";
		
		
	END IF;
	END PROCESS CMUX;
	
--	CTOREG:PROCESS(Clk, reset)
--	BEGIN
--		IF reset = '0' THEN
--		ELSIF rising_edge(clk) THEN
--			
--			IF wr = '0' THEN
--				IF (muxC = muxA) AND (addr2decA /= "00000") AND (addr2decA /= "00001") THEN
--					reg(to_integer(unsigned(addr2decA))) <= Cbus;
--				ELSIF muxC = '1' AND ('0' & instr(12 DOWNTO 9)) /= "00000" AND ('0' & instr(12 DOWNTO 9)) /= "00001" THEN
--					reg(to_integer(unsigned('0' & instr(12 DOWNTO 9)))) <= Cbus;
--				ELSIF muxC ='0' AND micro_addrA /= "00000" AND micro_addrA /= "00001" THEN
--					reg(to_integer(unsigned(micro_addrA))) <= Cbus;
--				END IF;
--			END IF;
--			reg(0) <= x"0000";-- make sure reg(0) is always 0
--			reg(1) <= x"0001";
--		END IF;
--	END PROCESS CTOREG;
	
		--Memory
		MEMORY:PROCESS(Abus, Bbus)
	BEGIN
			--IF wr = '1' THEN	
				mmAdress <= Bbus;
				mmData <= Abus;			
			--END IF;
	END PROCESS MEMORY;
	 
END;
