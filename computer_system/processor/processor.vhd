LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY processor IS
	PORT(
		
	);
END ENTITY processor;
ARCHITECTURE bhv OF processor IS

BEGIN
	control:ENTITY work.control PORT MAP(
	);
	
	dp:ENTITY work.data_path PORT MAP(
	);

END;