LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY computer_system IS
	PORT(
		
	);
END ENTITY computer_system;
ARCHITECTURE bhv OF computer_system IS

BEGIN

	mm:ENTITY work.main_memory PORT MAP(
	);
	
	logic:ENTITY work.logic PORT MAP(
	);
	
	processor:ENTITY work.processor PORT MAP(
	);
	
END;