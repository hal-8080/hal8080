LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY processor IS
	PORT(
		clk			: IN 	std_logic;
		reset			: IN 	std_logic;
		mmI			: IN 	std_logic_vector(15 DOWNTO 0);
		mmAdress		: OUT std_logic_vector(15 DOWNTO 0);
		mmData		: OUT std_logic_vector(15 DOWNTO 0)
	);
END ENTITY processor;
ARCHITECTURE bhv OF processor IS
	SIGNAL micro_inst : 	std_logic_vector(32 DOWNTO 0);
	SIGNAL statusN		: std_logic := '0';
	SIGNAL statusZ		: std_logic := '0';
	SIGNAL ir			: std_logic_vector(15 DOWNTO 0);
BEGIN

	cs:ENTITY work.control_section PORT MAP(
		clk => clk,	--IN
		reset => reset, --IN
		ir => ir,	--IN
		statusN => statusN, --IN
		statusZ => statusZ, --IN
		micro_instr => micro_inst --OUT
	);
	
	dp:ENTITY work.data_path PORT MAP(
		clk => clk,						--IN
		reset => reset,				--IN
		mmI => mmI,						--IN
		mmAdress => mmAdress,		--OUT
		mmData => mmData,				--OUT
		ir => ir,						--OUT
		micro_inst => micro_inst,	--IN
		statusN => statusN,			--OUT
		statusZ => statusZ			--OUT
	);

END;