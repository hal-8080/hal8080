LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY control_section IS
	PORT(
		clk			: IN	std_logic;
		reset			: IN 	std_logic;
		
	-- FROM DATAPATH
		ir				: IN	std_logic_vector(15 DOWNTO 0);
		statusN, statusZ	: IN 	std_logic;
		statusND, statusZD : IN std_logic;
		 
	-- TO DATAPATH
		micro_instr	: OUT	std_logic_vector(32 DOWNTO 0)
		
	);
END ENTITY control_section;


ARCHITECTURE bhv OF control_section IS
	SIGNAL wire_address2cs	: std_logic_vector(10 DOWNTO 0);
	SIGNAL wire_micro_instr	: std_logic_vector(32 DOWNTO 0);
	
BEGIN
	control:ENTITY work.control PORT MAP(
		clk => clk,
		reset	=> reset,
		ir	=> ir,									-- IN		instruction register from datapath
		statusN => statusN,						-- IN		ALU neg flag bit for psr
		statusZ => statusZ,						-- IN		ALU zero flag bit for psr
		statusND => statusND,					-- IN		ALU debug neg flag bit for psr
		statusZD => statusZD,					-- IN		ALU debug zero flag bit for psr
		micro_instr => wire_micro_instr,		-- IN		Micro instruction from microstore
		address2cs => wire_address2cs			-- OUT	next addres for the microstore
	);
	
	MS:ENTITY work.MStore PORT MAP(
		address => wire_address2cs,			-- IN 	address from control
		microcode => micro_instr,				-- OUT 	instruction to datapath
		microcode2contr => wire_micro_instr	-- OUT	instruciton to control
	);

END;