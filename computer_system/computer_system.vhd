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
	
	CONSTANT a_timer0        : std_logic := '1'; -- Activation of timer 0 (Clock) always on!
    SIGNAL a_timer1          : std_logic := '0'; -- Activation of timer 1
    SIGNAL a_timer2          : std_logic := '0'; -- Activation of timer 2
    SIGNAL o_timer0          : std_logic_vector(15 DOWNTO 0); -- Data of timer 0 (Millis Clock)
    SIGNAL o_timer1          : std_logic_vector(15 DOWNTO 0); -- Data of timer 1
    SIGNAL o_timer2          : std_logic_vector(15 DOWNTO 0); -- Data of timer 2
BEGIN

	mm:ENTITY work.memory PORT MAP(
		clk				=> clk,
		reset				=> reset,
	
		address_bus 	=> mmAdress,			-- IN
		data_bus_in 	=> mmData,				-- IN
		do_read			=> micro_instr(19),	-- IN
		do_write			=> micro_instr(18),	-- IN
		data_bus_out	=> mmI,					-- OUT
		
		o_seg0			=> o_seg0,				-- OUT
		o_seg1 			=> o_seg1,				-- OUT
      o_seg2			=> o_seg2,				-- OUT
		o_seg3			=> o_seg3,				-- OUT
      o_seg4			=> o_seg4,				-- OUT
		o_seg5 			=> o_seg5,				-- OUT
      o_leds         => o_leds,				-- OUT
      i_switches  	=> i_switches,			-- IN
      i_buttons		=> i_buttons,			-- IN
		
		o_timer1 => a_timer1, 
		o_timer2 => a_timer2,
      i_timer0 => o_timer0,
      i_timer1 => o_timer1,
      i_timer2 => o_timer2,
		  
		  debug_out => statusD
	);
	
	processor:ENTITY work.processor PORT MAP(
		clk			=> clk,
		reset			=> reset,
		statusD		=> statusD,			-- IN
		mmI			=> mmI,				-- IN
		mmAdress		=> mmAdress,		-- OUT
		mmData		=> mmData,			-- OUT
		
		micro_instr	=>	micro_instr		-- OUT
	);
	
	timer0:ENTITY work.timer PORT MAP(
        clk => clk,
        reset => reset,
        activate => a_timer0,
        output => o_timer0
    );
    -- timer1
    timer1:ENTITY work.timer PORT MAP(
        clk => clk,
        reset => reset,
        activate => a_timer1,
        output => o_timer1
    );
    -- timer2
    timer2:ENTITY work.timer PORT MAP(
        clk => clk,
        reset => reset,
        activate => a_timer2,
        output => o_timer2
    );
	
END;