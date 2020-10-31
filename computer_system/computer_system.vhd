LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY computer_system IS
	PORT(
      clk 			: IN std_logic; -- 50 Mhz Clock
      reset 		: IN std_logic; -- Async reset
		
		o_seg0 		: OUT std_logic_vector(6 DOWNTO 0);
		o_seg1  		: OUT std_logic_vector(6 DOWNTO 0);
      o_seg2 		: OUT std_logic_vector(6 DOWNTO 0);
		o_seg3 		: OUT std_logic_vector(6 DOWNTO 0);
      o_seg4 		: OUT std_logic_vector(6 DOWNTO 0);
		o_seg5  		: OUT std_logic_vector(6 DOWNTO 0);
      o_leds      : OUT std_logic_vector(9 DOWNTO 0);
      i_switches  :  IN std_logic_vector(9 DOWNTO 0);
      i_buttons 	:  IN	std_logic_vector(3 DOWNTO 0)
		
	);
END ENTITY computer_system;
ARCHITECTURE bhv OF computer_system IS
	SIGNAL mmI			:	std_logic_vector(15 DOWNTO 0);
	SIGNAL mmAdress	:	std_logic_vector(15 DOWNTO 0);
	SIGNAL mmData		:	std_logic_vector(15 DOWNTO 0);
	SIGNAL micro_instr: 	std_logic_vector(32 DOWNTO 0);
	SIGNAL statusD		: 	std_logic;
BEGIN

	mm:ENTITY work.memory PORT MAP(
		clk				=> clk,
		reset				=> reset,
	
		address_bus 	=> mmAdress,			-- IN
		data_bus_in 	=> mmData,				-- IN
		do_read			=> micro_instr(18),	-- IN
		do_write			=> micro_instr(19),	-- IN
		data_bus_out	=> mmI,					-- OUT
		
		o_seg0			=> o_seg0,				-- OUT
		o_seg1 			=> o_seg1,				-- OUT
      o_seg2			=> o_seg2,				-- OUT
		o_seg3			=> o_seg3,				-- OUT
      o_seg4			=> o_seg4,				-- OUT
		o_seg5 			=> o_seg5,				-- OUT
      o_leds         => o_leds,				-- OUT
      i_switches  	=> i_switches,			-- IN
      i_buttons		=> i_buttons			-- IN
	);
	
--	logic:ENTITY work.logic PORT MAP(
--	);
	
	processor:ENTITY work.processor PORT MAP(
		clk			=> clk,
		reset			=> reset,
		statusD		=> statusD,			-- IN
		mmI			=> mmI,				-- IN
		mmAdress		=> mmAdress,		-- OUT
		mmData		=> mmData,			-- OUT
		
		micro_instr	=>	micro_instr		-- OUT
	);
	
END;