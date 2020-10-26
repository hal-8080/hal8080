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
		ir				: OUT integer -- have to set a range
		
	);
END ENTITY data_path;
ARCHITECTURE bhv OF data_path IS

BEGIN

END;