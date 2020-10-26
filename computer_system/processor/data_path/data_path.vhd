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
		ir				: OUT std_logic_vector(15 DOWNTO 0);
	);
END ENTITY data_path;
ARCHITECTURE bhv OF data_path IS

	
	TYPE reg_vector IS ARRAY (0 to 31) OF std_logic_vector(15 DOWNTO 0); --array of 32 16-bit vectors

	SIGNAL reg : reg_vector; --32 registers of 16 bits --use example: "reg(2) <= a_16_bit_vector" stores the vector in register 2
									
-- Split up the micro instruction									
	SIGNAL addrA	: std_logic_vector(4 DOWNTO 0) 	:= micro_inst(25 DOWNTO 21)
	SIGNAL addrB	: std_logic_vector(4 DOWNTO 0) 	:= micro_inst(19 DOWNTO 15)
	SIGNAL muxA		: std_logic 							:= micro_inst(20)				-- 0 then take MIR A or 1 take from %r 
	SIGNAL muxB		: std_logic 							:= micro_inst(14)
	SIGNAL muxC		: std_logic 							:= micro_inst(15)				-- To either store in registers or mm
	SIGNAL rd		: std_logic 							:= micro_inst(12)
	SIGNAL wr		: std_logic 							:= micro_inst(11)
	SIGNAL cond		: std_logic_vector(2 DOWNTO 0) 	:= micro_inst(10 DOWNTO 8)
	SIGNAL jump		: std_logic_vector(7 DOWNTO 0) 	:= micro_inst(7 DOWNTO 0)
	
	SIGNAL instr	: 
	SIGNAL mux2decA: std_logic_vector(4 DOWNTO 0)	:= "00000";
	
BEGIN

		reg(0) <= x"0000";		-- make sure reg(0) is always 0
		
		
BEGIN

		
END;