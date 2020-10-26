LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY data_path IS
	PORT(
		clk			: IN 	std_logic;
		reset			: IN 	std_logic;
		instruction : IN 	std_logic_vector(15 DOWNTO 0);
		mmI			: IN 	std_logic_vector(15 DOWNTO 0);
		statusN		: OUT std_logic;
		statusZ		: OUT std_logic;
		mmAdress		: OUT std_logic_vector(15 DOWNTO 0);
		mmData		: OUT std_logic_vector(15 DOWNTO 0);
		ir				: OUT std_logic_vector(15 DOWNTO 0)
		
	);
END ENTITY data_path;
ARCHITECTURE bhv OF data_path IS
	TYPE reg_vector IS ARRAY (0 to 31) OF std_logic_vector(15 DOWNTO 0); --array of 32 16-bit vectors
	
	SIGNAL reg : reg_vector; --32 registers of 16 bits
										--use example: "reg(2) <= a_16_bit_vector" stores the vector in register 2
BEGIN

END;