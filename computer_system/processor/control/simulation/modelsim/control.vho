-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"

-- DATE "10/27/2020 16:28:38"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	control IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	ir : IN std_logic_vector(15 DOWNTO 0);
	ALUout : IN std_logic_vector(17 DOWNTO 0);
	micro_instr : IN std_logic_vector(32 DOWNTO 0);
	address2cs : OUT std_logic_vector(10 DOWNTO 0)
	);
END control;

-- Design Ports Information
-- ir[0]	=>  Location: PIN_AF13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[1]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[2]	=>  Location: PIN_AC18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[3]	=>  Location: PIN_AE14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[4]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[9]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[10]	=>  Location: PIN_AC29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[11]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[12]	=>  Location: PIN_AH15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[0]	=>  Location: PIN_K12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[1]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[2]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[3]	=>  Location: PIN_AE24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[4]	=>  Location: PIN_AF15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[5]	=>  Location: PIN_AG15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[6]	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[7]	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[8]	=>  Location: PIN_AE16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[9]	=>  Location: PIN_K14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[10]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[11]	=>  Location: PIN_K7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[12]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[13]	=>  Location: PIN_AJ14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[14]	=>  Location: PIN_AJ1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[15]	=>  Location: PIN_AF24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[14]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[15]	=>  Location: PIN_AB22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[16]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[17]	=>  Location: PIN_AJ7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[18]	=>  Location: PIN_AH24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[19]	=>  Location: PIN_AD24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[20]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[21]	=>  Location: PIN_AE7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[22]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[23]	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[24]	=>  Location: PIN_AG11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[25]	=>  Location: PIN_AG28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[26]	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[27]	=>  Location: PIN_AH5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[28]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[29]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[30]	=>  Location: PIN_AD30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[31]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[32]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address2cs[0]	=>  Location: PIN_AD20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address2cs[1]	=>  Location: PIN_AG25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address2cs[2]	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address2cs[3]	=>  Location: PIN_AJ27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address2cs[4]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address2cs[5]	=>  Location: PIN_AH29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address2cs[6]	=>  Location: PIN_AK28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address2cs[7]	=>  Location: PIN_AG26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address2cs[8]	=>  Location: PIN_AG27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address2cs[9]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address2cs[10]	=>  Location: PIN_AH28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[5]	=>  Location: PIN_AD19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[13]	=>  Location: PIN_AK27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[8]	=>  Location: PIN_AD25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[15]	=>  Location: PIN_AH27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[14]	=>  Location: PIN_AD21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[0]	=>  Location: PIN_AK26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_AK29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[6]	=>  Location: PIN_AE23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[1]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[7]	=>  Location: PIN_AH25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[2]	=>  Location: PIN_AE22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[3]	=>  Location: PIN_AE26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[4]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[5]	=>  Location: PIN_W20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[6]	=>  Location: PIN_AB21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[7]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[8]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[9]	=>  Location: PIN_AC22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[10]	=>  Location: PIN_AJ29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[13]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[16]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[12]	=>  Location: PIN_AF26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_instr[11]	=>  Location: PIN_AF25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[17]	=>  Location: PIN_AC23,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF control IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_ir : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_ALUout : std_logic_vector(17 DOWNTO 0);
SIGNAL ww_micro_instr : std_logic_vector(32 DOWNTO 0);
SIGNAL ww_address2cs : std_logic_vector(10 DOWNTO 0);
SIGNAL \ir[0]~input_o\ : std_logic;
SIGNAL \ir[1]~input_o\ : std_logic;
SIGNAL \ir[2]~input_o\ : std_logic;
SIGNAL \ir[3]~input_o\ : std_logic;
SIGNAL \ir[4]~input_o\ : std_logic;
SIGNAL \ir[9]~input_o\ : std_logic;
SIGNAL \ir[10]~input_o\ : std_logic;
SIGNAL \ir[11]~input_o\ : std_logic;
SIGNAL \ir[12]~input_o\ : std_logic;
SIGNAL \ALUout[0]~input_o\ : std_logic;
SIGNAL \ALUout[1]~input_o\ : std_logic;
SIGNAL \ALUout[2]~input_o\ : std_logic;
SIGNAL \ALUout[3]~input_o\ : std_logic;
SIGNAL \ALUout[4]~input_o\ : std_logic;
SIGNAL \ALUout[5]~input_o\ : std_logic;
SIGNAL \ALUout[6]~input_o\ : std_logic;
SIGNAL \ALUout[7]~input_o\ : std_logic;
SIGNAL \ALUout[8]~input_o\ : std_logic;
SIGNAL \ALUout[9]~input_o\ : std_logic;
SIGNAL \ALUout[10]~input_o\ : std_logic;
SIGNAL \ALUout[11]~input_o\ : std_logic;
SIGNAL \ALUout[12]~input_o\ : std_logic;
SIGNAL \ALUout[13]~input_o\ : std_logic;
SIGNAL \ALUout[14]~input_o\ : std_logic;
SIGNAL \ALUout[15]~input_o\ : std_logic;
SIGNAL \micro_instr[14]~input_o\ : std_logic;
SIGNAL \micro_instr[15]~input_o\ : std_logic;
SIGNAL \micro_instr[16]~input_o\ : std_logic;
SIGNAL \micro_instr[17]~input_o\ : std_logic;
SIGNAL \micro_instr[18]~input_o\ : std_logic;
SIGNAL \micro_instr[19]~input_o\ : std_logic;
SIGNAL \micro_instr[20]~input_o\ : std_logic;
SIGNAL \micro_instr[21]~input_o\ : std_logic;
SIGNAL \micro_instr[22]~input_o\ : std_logic;
SIGNAL \micro_instr[23]~input_o\ : std_logic;
SIGNAL \micro_instr[24]~input_o\ : std_logic;
SIGNAL \micro_instr[25]~input_o\ : std_logic;
SIGNAL \micro_instr[26]~input_o\ : std_logic;
SIGNAL \micro_instr[27]~input_o\ : std_logic;
SIGNAL \micro_instr[28]~input_o\ : std_logic;
SIGNAL \micro_instr[29]~input_o\ : std_logic;
SIGNAL \micro_instr[30]~input_o\ : std_logic;
SIGNAL \micro_instr[31]~input_o\ : std_logic;
SIGNAL \micro_instr[32]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \CSAI_inc[0]~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \micro_instr[0]~input_o\ : std_logic;
SIGNAL \ir[8]~input_o\ : std_logic;
SIGNAL \ir[5]~input_o\ : std_logic;
SIGNAL \ir[14]~input_o\ : std_logic;
SIGNAL \ir[15]~input_o\ : std_logic;
SIGNAL \ir[13]~input_o\ : std_logic;
SIGNAL \address~0_combout\ : std_logic;
SIGNAL \micro_instr[12]~input_o\ : std_logic;
SIGNAL \micro_instr[11]~input_o\ : std_logic;
SIGNAL \ALUout[17]~input_o\ : std_logic;
SIGNAL \micro_instr[13]~input_o\ : std_logic;
SIGNAL \ALUout[16]~input_o\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \micro_instr[1]~input_o\ : std_logic;
SIGNAL \ir[6]~input_o\ : std_logic;
SIGNAL \address[1]~1_combout\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \address[1]~2_combout\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \micro_instr[2]~input_o\ : std_logic;
SIGNAL \ir[7]~input_o\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \micro_instr[3]~input_o\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \micro_instr[4]~input_o\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \micro_instr[5]~input_o\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \micro_instr[6]~input_o\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \micro_instr[7]~input_o\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~29_sumout\ : std_logic;
SIGNAL \micro_instr[8]~input_o\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Add0~30\ : std_logic;
SIGNAL \Add0~33_sumout\ : std_logic;
SIGNAL \micro_instr[9]~input_o\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Add0~34\ : std_logic;
SIGNAL \Add0~37_sumout\ : std_logic;
SIGNAL \micro_instr[10]~input_o\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL address : std_logic_vector(10 DOWNTO 0);
SIGNAL cbl : std_logic_vector(1 DOWNTO 0);
SIGNAL CSAI_inc : std_logic_vector(10 DOWNTO 0);
SIGNAL \ALT_INV_ALUout[17]~input_o\ : std_logic;
SIGNAL \ALT_INV_micro_instr[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_micro_instr[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_ALUout[16]~input_o\ : std_logic;
SIGNAL \ALT_INV_micro_instr[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_micro_instr[10]~input_o\ : std_logic;
SIGNAL \ALT_INV_micro_instr[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_micro_instr[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_micro_instr[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_micro_instr[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_micro_instr[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_micro_instr[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_micro_instr[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_micro_instr[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_micro_instr[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \ALT_INV_micro_instr[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[15]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_ir[5]~input_o\ : std_logic;
SIGNAL ALT_INV_CSAI_inc : std_logic_vector(10 DOWNTO 0);
SIGNAL \ALT_INV_address[1]~1_combout\ : std_logic;
SIGNAL ALT_INV_cbl : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_address~0_combout\ : std_logic;
SIGNAL ALT_INV_address : std_logic_vector(10 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_ir <= ir;
ww_ALUout <= ALUout;
ww_micro_instr <= micro_instr;
address2cs <= ww_address2cs;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_ALUout[17]~input_o\ <= NOT \ALUout[17]~input_o\;
\ALT_INV_micro_instr[11]~input_o\ <= NOT \micro_instr[11]~input_o\;
\ALT_INV_micro_instr[12]~input_o\ <= NOT \micro_instr[12]~input_o\;
\ALT_INV_ALUout[16]~input_o\ <= NOT \ALUout[16]~input_o\;
\ALT_INV_micro_instr[13]~input_o\ <= NOT \micro_instr[13]~input_o\;
\ALT_INV_micro_instr[10]~input_o\ <= NOT \micro_instr[10]~input_o\;
\ALT_INV_micro_instr[9]~input_o\ <= NOT \micro_instr[9]~input_o\;
\ALT_INV_micro_instr[8]~input_o\ <= NOT \micro_instr[8]~input_o\;
\ALT_INV_micro_instr[7]~input_o\ <= NOT \micro_instr[7]~input_o\;
\ALT_INV_micro_instr[6]~input_o\ <= NOT \micro_instr[6]~input_o\;
\ALT_INV_micro_instr[5]~input_o\ <= NOT \micro_instr[5]~input_o\;
\ALT_INV_micro_instr[4]~input_o\ <= NOT \micro_instr[4]~input_o\;
\ALT_INV_micro_instr[3]~input_o\ <= NOT \micro_instr[3]~input_o\;
\ALT_INV_micro_instr[2]~input_o\ <= NOT \micro_instr[2]~input_o\;
\ALT_INV_ir[7]~input_o\ <= NOT \ir[7]~input_o\;
\ALT_INV_micro_instr[1]~input_o\ <= NOT \micro_instr[1]~input_o\;
\ALT_INV_ir[6]~input_o\ <= NOT \ir[6]~input_o\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\ALT_INV_micro_instr[0]~input_o\ <= NOT \micro_instr[0]~input_o\;
\ALT_INV_ir[14]~input_o\ <= NOT \ir[14]~input_o\;
\ALT_INV_ir[15]~input_o\ <= NOT \ir[15]~input_o\;
\ALT_INV_ir[8]~input_o\ <= NOT \ir[8]~input_o\;
\ALT_INV_ir[13]~input_o\ <= NOT \ir[13]~input_o\;
\ALT_INV_ir[5]~input_o\ <= NOT \ir[5]~input_o\;
ALT_INV_CSAI_inc(10) <= NOT CSAI_inc(10);
ALT_INV_CSAI_inc(9) <= NOT CSAI_inc(9);
ALT_INV_CSAI_inc(8) <= NOT CSAI_inc(8);
ALT_INV_CSAI_inc(7) <= NOT CSAI_inc(7);
ALT_INV_CSAI_inc(6) <= NOT CSAI_inc(6);
ALT_INV_CSAI_inc(5) <= NOT CSAI_inc(5);
ALT_INV_CSAI_inc(4) <= NOT CSAI_inc(4);
ALT_INV_CSAI_inc(3) <= NOT CSAI_inc(3);
ALT_INV_CSAI_inc(2) <= NOT CSAI_inc(2);
ALT_INV_CSAI_inc(1) <= NOT CSAI_inc(1);
\ALT_INV_address[1]~1_combout\ <= NOT \address[1]~1_combout\;
ALT_INV_CSAI_inc(0) <= NOT CSAI_inc(0);
ALT_INV_cbl(0) <= NOT cbl(0);
\ALT_INV_address~0_combout\ <= NOT \address~0_combout\;
ALT_INV_cbl(1) <= NOT cbl(1);
ALT_INV_address(10) <= NOT address(10);
ALT_INV_address(9) <= NOT address(9);
ALT_INV_address(8) <= NOT address(8);
ALT_INV_address(7) <= NOT address(7);
ALT_INV_address(6) <= NOT address(6);
ALT_INV_address(5) <= NOT address(5);
ALT_INV_address(4) <= NOT address(4);
ALT_INV_address(3) <= NOT address(3);
ALT_INV_address(2) <= NOT address(2);
ALT_INV_address(1) <= NOT address(1);
ALT_INV_address(0) <= NOT address(0);

-- Location: IOOBUF_X82_Y0_N42
\address2cs[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => address(0),
	devoe => ww_devoe,
	o => ww_address2cs(0));

-- Location: IOOBUF_X78_Y0_N36
\address2cs[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => address(1),
	devoe => ww_devoe,
	o => ww_address2cs(1));

-- Location: IOOBUF_X80_Y0_N19
\address2cs[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => address(2),
	devoe => ww_devoe,
	o => ww_address2cs(2));

-- Location: IOOBUF_X80_Y0_N36
\address2cs[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => address(3),
	devoe => ww_devoe,
	o => ww_address2cs(3));

-- Location: IOOBUF_X84_Y0_N19
\address2cs[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => address(4),
	devoe => ww_devoe,
	o => ww_address2cs(4));

-- Location: IOOBUF_X89_Y6_N56
\address2cs[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => address(5),
	devoe => ww_devoe,
	o => ww_address2cs(5));

-- Location: IOOBUF_X82_Y0_N76
\address2cs[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => address(6),
	devoe => ww_devoe,
	o => ww_address2cs(6));

-- Location: IOOBUF_X84_Y0_N36
\address2cs[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => address(7),
	devoe => ww_devoe,
	o => ww_address2cs(7));

-- Location: IOOBUF_X89_Y4_N79
\address2cs[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => address(8),
	devoe => ww_devoe,
	o => ww_address2cs(8));

-- Location: IOOBUF_X89_Y4_N62
\address2cs[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => address(9),
	devoe => ww_devoe,
	o => ww_address2cs(9));

-- Location: IOOBUF_X89_Y4_N96
\address2cs[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => address(10),
	devoe => ww_devoe,
	o => ww_address2cs(10));

-- Location: IOIBUF_X89_Y25_N21
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: MLABCELL_X82_Y4_N30
\CSAI_inc[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \CSAI_inc[0]~0_combout\ = ( !address(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_address(0),
	combout => \CSAI_inc[0]~0_combout\);

-- Location: IOIBUF_X82_Y0_N92
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X82_Y4_N31
\CSAI_inc[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \CSAI_inc[0]~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CSAI_inc(0));

-- Location: IOIBUF_X76_Y0_N52
\micro_instr[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(0),
	o => \micro_instr[0]~input_o\);

-- Location: IOIBUF_X89_Y4_N44
\ir[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(8),
	o => \ir[8]~input_o\);

-- Location: IOIBUF_X76_Y0_N18
\ir[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(5),
	o => \ir[5]~input_o\);

-- Location: IOIBUF_X82_Y0_N58
\ir[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(14),
	o => \ir[14]~input_o\);

-- Location: IOIBUF_X84_Y0_N52
\ir[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(15),
	o => \ir[15]~input_o\);

-- Location: IOIBUF_X80_Y0_N52
\ir[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(13),
	o => \ir[13]~input_o\);

-- Location: MLABCELL_X82_Y4_N48
\address~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \address~0_combout\ = ( \ir[13]~input_o\ & ( address(0) & ( ((!\ir[14]~input_o\ & ((\ir[5]~input_o\))) # (\ir[14]~input_o\ & (\ir[8]~input_o\))) # (\ir[15]~input_o\) ) ) ) # ( !\ir[13]~input_o\ & ( address(0) & ( (!\ir[14]~input_o\ & (((\ir[5]~input_o\ & 
-- !\ir[15]~input_o\)))) # (\ir[14]~input_o\ & (((\ir[15]~input_o\)) # (\ir[8]~input_o\))) ) ) ) # ( \ir[13]~input_o\ & ( !address(0) & ( (!\ir[14]~input_o\ & (((\ir[15]~input_o\) # (\ir[5]~input_o\)))) # (\ir[14]~input_o\ & (\ir[8]~input_o\ & 
-- ((!\ir[15]~input_o\)))) ) ) ) # ( !\ir[13]~input_o\ & ( !address(0) & ( (!\ir[15]~input_o\ & ((!\ir[14]~input_o\ & ((\ir[5]~input_o\))) # (\ir[14]~input_o\ & (\ir[8]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011010100000000001101011111000000110101000011110011010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ir[8]~input_o\,
	datab => \ALT_INV_ir[5]~input_o\,
	datac => \ALT_INV_ir[14]~input_o\,
	datad => \ALT_INV_ir[15]~input_o\,
	datae => \ALT_INV_ir[13]~input_o\,
	dataf => ALT_INV_address(0),
	combout => \address~0_combout\);

-- Location: IOIBUF_X86_Y0_N52
\micro_instr[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(12),
	o => \micro_instr[12]~input_o\);

-- Location: IOIBUF_X86_Y0_N35
\micro_instr[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(11),
	o => \micro_instr[11]~input_o\);

-- Location: IOIBUF_X86_Y0_N18
\ALUout[17]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUout(17),
	o => \ALUout[17]~input_o\);

-- Location: IOIBUF_X89_Y8_N55
\micro_instr[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(13),
	o => \micro_instr[13]~input_o\);

-- Location: IOIBUF_X89_Y8_N4
\ALUout[16]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUout(16),
	o => \ALUout[16]~input_o\);

-- Location: LABCELL_X83_Y4_N0
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ( !\micro_instr[13]~input_o\ & ( \ALUout[16]~input_o\ & ( ((\micro_instr[11]~input_o\ & \ALUout[17]~input_o\)) # (\micro_instr[12]~input_o\) ) ) ) # ( !\micro_instr[13]~input_o\ & ( !\ALUout[16]~input_o\ & ( (\micro_instr[11]~input_o\ & 
-- ((\ALUout[17]~input_o\) # (\micro_instr[12]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001100010011000000000000000001010111010101110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_micro_instr[12]~input_o\,
	datab => \ALT_INV_micro_instr[11]~input_o\,
	datac => \ALT_INV_ALUout[17]~input_o\,
	datae => \ALT_INV_micro_instr[13]~input_o\,
	dataf => \ALT_INV_ALUout[16]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: FF_X83_Y4_N2
\cbl[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux0~0_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cbl(0));

-- Location: FF_X83_Y4_N14
\cbl[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \micro_instr[13]~input_o\,
	sload => VCC,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cbl(1));

-- Location: MLABCELL_X82_Y4_N54
\Mux11~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = ( cbl(1) & ( \address~0_combout\ ) ) # ( !cbl(1) & ( (!cbl(0) & (CSAI_inc(0))) # (cbl(0) & ((\micro_instr[0]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100110011010101010011001100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_CSAI_inc(0),
	datab => \ALT_INV_micro_instr[0]~input_o\,
	datac => \ALT_INV_address~0_combout\,
	datad => ALT_INV_cbl(0),
	dataf => ALT_INV_cbl(1),
	combout => \Mux11~0_combout\);

-- Location: FF_X82_Y4_N56
\address[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux11~0_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => address(0));

-- Location: MLABCELL_X82_Y4_N0
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( address(1) ) + ( address(0) ) + ( !VCC ))
-- \Add0~2\ = CARRY(( address(1) ) + ( address(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_address(0),
	datad => ALT_INV_address(1),
	cin => GND,
	sumout => \Add0~1_sumout\,
	cout => \Add0~2\);

-- Location: FF_X82_Y4_N2
\CSAI_inc[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~1_sumout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CSAI_inc(1));

-- Location: IOIBUF_X80_Y0_N1
\micro_instr[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(1),
	o => \micro_instr[1]~input_o\);

-- Location: IOIBUF_X78_Y0_N18
\ir[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(6),
	o => \ir[6]~input_o\);

-- Location: MLABCELL_X82_Y4_N57
\address[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \address[1]~1_combout\ = ( !\ir[14]~input_o\ & ( !\ir[15]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_ir[15]~input_o\,
	dataf => \ALT_INV_ir[14]~input_o\,
	combout => \address[1]~1_combout\);

-- Location: MLABCELL_X82_Y4_N36
\Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = ( cbl(0) & ( cbl(1) & ( (\ir[6]~input_o\ & \address[1]~1_combout\) ) ) ) # ( !cbl(0) & ( cbl(1) & ( (\ir[6]~input_o\ & \address[1]~1_combout\) ) ) ) # ( cbl(0) & ( !cbl(1) & ( \micro_instr[1]~input_o\ ) ) ) # ( !cbl(0) & ( !cbl(1) & ( 
-- CSAI_inc(1) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_CSAI_inc(1),
	datab => \ALT_INV_micro_instr[1]~input_o\,
	datac => \ALT_INV_ir[6]~input_o\,
	datad => \ALT_INV_address[1]~1_combout\,
	datae => ALT_INV_cbl(0),
	dataf => ALT_INV_cbl(1),
	combout => \Mux10~0_combout\);

-- Location: LABCELL_X83_Y4_N21
\address[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \address[1]~2_combout\ = ( cbl(1) & ( (\reset~input_o\ & ((!\ir[14]~input_o\) # (!\ir[15]~input_o\))) ) ) # ( !cbl(1) & ( \reset~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100000011001100110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_reset~input_o\,
	datac => \ALT_INV_ir[14]~input_o\,
	datad => \ALT_INV_ir[15]~input_o\,
	dataf => ALT_INV_cbl(1),
	combout => \address[1]~2_combout\);

-- Location: FF_X82_Y4_N38
\address[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux10~0_combout\,
	ena => \address[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => address(1));

-- Location: MLABCELL_X82_Y4_N3
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( address(2) ) + ( GND ) + ( \Add0~2\ ))
-- \Add0~6\ = CARRY(( address(2) ) + ( GND ) + ( \Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_address(2),
	cin => \Add0~2\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: FF_X82_Y4_N5
\CSAI_inc[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~5_sumout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CSAI_inc(2));

-- Location: IOIBUF_X78_Y0_N1
\micro_instr[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(2),
	o => \micro_instr[2]~input_o\);

-- Location: IOIBUF_X78_Y0_N52
\ir[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(7),
	o => \ir[7]~input_o\);

-- Location: MLABCELL_X82_Y4_N42
\Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = ( cbl(0) & ( cbl(1) & ( (\address[1]~1_combout\ & \ir[7]~input_o\) ) ) ) # ( !cbl(0) & ( cbl(1) & ( (\address[1]~1_combout\ & \ir[7]~input_o\) ) ) ) # ( cbl(0) & ( !cbl(1) & ( \micro_instr[2]~input_o\ ) ) ) # ( !cbl(0) & ( !cbl(1) & ( 
-- CSAI_inc(2) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101000011110000111100000000001100110000000000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_CSAI_inc(2),
	datab => \ALT_INV_address[1]~1_combout\,
	datac => \ALT_INV_micro_instr[2]~input_o\,
	datad => \ALT_INV_ir[7]~input_o\,
	datae => ALT_INV_cbl(0),
	dataf => ALT_INV_cbl(1),
	combout => \Mux9~0_combout\);

-- Location: FF_X82_Y4_N44
\address[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux9~0_combout\,
	ena => \address[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => address(2));

-- Location: IOIBUF_X89_Y8_N38
\micro_instr[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(3),
	o => \micro_instr[3]~input_o\);

-- Location: MLABCELL_X82_Y4_N6
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( address(3) ) + ( GND ) + ( \Add0~6\ ))
-- \Add0~10\ = CARRY(( address(3) ) + ( GND ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_address(3),
	cin => \Add0~6\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

-- Location: FF_X82_Y4_N7
\CSAI_inc[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~9_sumout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CSAI_inc(3));

-- Location: LABCELL_X83_Y4_N6
\Mux8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = ( cbl(0) & ( cbl(1) & ( (\address[1]~1_combout\ & \ir[8]~input_o\) ) ) ) # ( !cbl(0) & ( cbl(1) & ( (\address[1]~1_combout\ & \ir[8]~input_o\) ) ) ) # ( cbl(0) & ( !cbl(1) & ( \micro_instr[3]~input_o\ ) ) ) # ( !cbl(0) & ( !cbl(1) & ( 
-- CSAI_inc(3) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111010101010101010100000000001100110000000000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_micro_instr[3]~input_o\,
	datab => \ALT_INV_address[1]~1_combout\,
	datac => ALT_INV_CSAI_inc(3),
	datad => \ALT_INV_ir[8]~input_o\,
	datae => ALT_INV_cbl(0),
	dataf => ALT_INV_cbl(1),
	combout => \Mux8~0_combout\);

-- Location: FF_X83_Y4_N8
\address[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux8~0_combout\,
	ena => \address[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => address(3));

-- Location: IOIBUF_X89_Y6_N21
\micro_instr[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(4),
	o => \micro_instr[4]~input_o\);

-- Location: MLABCELL_X82_Y4_N9
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( address(4) ) + ( GND ) + ( \Add0~10\ ))
-- \Add0~14\ = CARRY(( address(4) ) + ( GND ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_address(4),
	cin => \Add0~10\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: FF_X82_Y4_N10
\CSAI_inc[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~13_sumout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CSAI_inc(4));

-- Location: LABCELL_X83_Y4_N48
\Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = ( CSAI_inc(4) & ( (!cbl(1) & ((!cbl(0)) # ((\micro_instr[4]~input_o\)))) # (cbl(1) & (((\ir[14]~input_o\)))) ) ) # ( !CSAI_inc(4) & ( (!cbl(1) & (cbl(0) & ((\micro_instr[4]~input_o\)))) # (cbl(1) & (((\ir[14]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001101000111000000110100011110001011110011111000101111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cbl(0),
	datab => ALT_INV_cbl(1),
	datac => \ALT_INV_ir[14]~input_o\,
	datad => \ALT_INV_micro_instr[4]~input_o\,
	dataf => ALT_INV_CSAI_inc(4),
	combout => \Mux7~0_combout\);

-- Location: FF_X83_Y4_N50
\address[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux7~0_combout\,
	ena => \address[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => address(4));

-- Location: IOIBUF_X89_Y6_N4
\micro_instr[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(5),
	o => \micro_instr[5]~input_o\);

-- Location: MLABCELL_X82_Y4_N12
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( address(5) ) + ( GND ) + ( \Add0~14\ ))
-- \Add0~18\ = CARRY(( address(5) ) + ( GND ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_address(5),
	cin => \Add0~14\,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: FF_X82_Y4_N13
\CSAI_inc[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~17_sumout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CSAI_inc(5));

-- Location: LABCELL_X83_Y4_N51
\Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = ( \ir[15]~input_o\ & ( ((!cbl(0) & ((CSAI_inc(5)))) # (cbl(0) & (\micro_instr[5]~input_o\))) # (cbl(1)) ) ) # ( !\ir[15]~input_o\ & ( (!cbl(1) & ((!cbl(0) & ((CSAI_inc(5)))) # (cbl(0) & (\micro_instr[5]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010010001100000001001000110000110111101111110011011110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cbl(0),
	datab => ALT_INV_cbl(1),
	datac => \ALT_INV_micro_instr[5]~input_o\,
	datad => ALT_INV_CSAI_inc(5),
	dataf => \ALT_INV_ir[15]~input_o\,
	combout => \Mux6~0_combout\);

-- Location: FF_X83_Y4_N53
\address[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux6~0_combout\,
	ena => \address[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => address(5));

-- Location: MLABCELL_X82_Y4_N15
\Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( address(6) ) + ( GND ) + ( \Add0~18\ ))
-- \Add0~22\ = CARRY(( address(6) ) + ( GND ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_address(6),
	cin => \Add0~18\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

-- Location: FF_X82_Y4_N16
\CSAI_inc[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~21_sumout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CSAI_inc(6));

-- Location: IOIBUF_X88_Y0_N19
\micro_instr[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(6),
	o => \micro_instr[6]~input_o\);

-- Location: LABCELL_X83_Y4_N54
\Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = ( !cbl(1) & ( (!cbl(0) & (CSAI_inc(6))) # (cbl(0) & ((\micro_instr[6]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100001111001100110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_CSAI_inc(6),
	datac => \ALT_INV_micro_instr[6]~input_o\,
	datad => ALT_INV_cbl(0),
	dataf => ALT_INV_cbl(1),
	combout => \Mux5~0_combout\);

-- Location: FF_X83_Y4_N56
\address[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux5~0_combout\,
	ena => \address[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => address(6));

-- Location: MLABCELL_X82_Y4_N18
\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( address(7) ) + ( GND ) + ( \Add0~22\ ))
-- \Add0~26\ = CARRY(( address(7) ) + ( GND ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_address(7),
	cin => \Add0~22\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: FF_X82_Y4_N20
\CSAI_inc[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~25_sumout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CSAI_inc(7));

-- Location: IOIBUF_X84_Y0_N1
\micro_instr[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(7),
	o => \micro_instr[7]~input_o\);

-- Location: LABCELL_X83_Y4_N57
\Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = ( !cbl(1) & ( (!cbl(0) & (CSAI_inc(7))) # (cbl(0) & ((\micro_instr[7]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100001111010101010000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_CSAI_inc(7),
	datac => \ALT_INV_micro_instr[7]~input_o\,
	datad => ALT_INV_cbl(0),
	dataf => ALT_INV_cbl(1),
	combout => \Mux4~0_combout\);

-- Location: FF_X83_Y4_N59
\address[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux4~0_combout\,
	ena => \address[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => address(7));

-- Location: MLABCELL_X82_Y4_N21
\Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~29_sumout\ = SUM(( address(8) ) + ( GND ) + ( \Add0~26\ ))
-- \Add0~30\ = CARRY(( address(8) ) + ( GND ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_address(8),
	cin => \Add0~26\,
	sumout => \Add0~29_sumout\,
	cout => \Add0~30\);

-- Location: FF_X82_Y4_N22
\CSAI_inc[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~29_sumout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CSAI_inc(8));

-- Location: IOIBUF_X89_Y8_N21
\micro_instr[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(8),
	o => \micro_instr[8]~input_o\);

-- Location: LABCELL_X83_Y4_N24
\Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = ( !cbl(1) & ( (!cbl(0) & (CSAI_inc(8))) # (cbl(0) & ((\micro_instr[8]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100001111010101010000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_CSAI_inc(8),
	datac => \ALT_INV_micro_instr[8]~input_o\,
	datad => ALT_INV_cbl(0),
	dataf => ALT_INV_cbl(1),
	combout => \Mux3~0_combout\);

-- Location: FF_X83_Y4_N26
\address[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux3~0_combout\,
	ena => \address[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => address(8));

-- Location: MLABCELL_X82_Y4_N24
\Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~33_sumout\ = SUM(( address(9) ) + ( GND ) + ( \Add0~30\ ))
-- \Add0~34\ = CARRY(( address(9) ) + ( GND ) + ( \Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_address(9),
	cin => \Add0~30\,
	sumout => \Add0~33_sumout\,
	cout => \Add0~34\);

-- Location: FF_X82_Y4_N25
\CSAI_inc[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~33_sumout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CSAI_inc(9));

-- Location: IOIBUF_X86_Y0_N1
\micro_instr[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(9),
	o => \micro_instr[9]~input_o\);

-- Location: LABCELL_X83_Y4_N27
\Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = ( !cbl(1) & ( (!cbl(0) & (CSAI_inc(9))) # (cbl(0) & ((\micro_instr[9]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100001111001100110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_CSAI_inc(9),
	datac => \ALT_INV_micro_instr[9]~input_o\,
	datad => ALT_INV_cbl(0),
	dataf => ALT_INV_cbl(1),
	combout => \Mux2~0_combout\);

-- Location: FF_X83_Y4_N29
\address[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux2~0_combout\,
	ena => \address[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => address(9));

-- Location: MLABCELL_X82_Y4_N27
\Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~37_sumout\ = SUM(( address(10) ) + ( GND ) + ( \Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_address(10),
	cin => \Add0~34\,
	sumout => \Add0~37_sumout\);

-- Location: FF_X82_Y4_N28
\CSAI_inc[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~37_sumout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => CSAI_inc(10));

-- Location: IOIBUF_X89_Y6_N38
\micro_instr[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(10),
	o => \micro_instr[10]~input_o\);

-- Location: LABCELL_X83_Y4_N18
\Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = ( cbl(1) ) # ( !cbl(1) & ( (!cbl(0) & (CSAI_inc(10))) # (cbl(0) & ((\micro_instr[10]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100001111010101010000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_CSAI_inc(10),
	datac => \ALT_INV_micro_instr[10]~input_o\,
	datad => ALT_INV_cbl(0),
	dataf => ALT_INV_cbl(1),
	combout => \Mux1~0_combout\);

-- Location: FF_X83_Y4_N20
\address[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux1~0_combout\,
	ena => \address[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => address(10));

-- Location: IOIBUF_X22_Y0_N18
\ir[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(0),
	o => \ir[0]~input_o\);

-- Location: IOIBUF_X16_Y0_N18
\ir[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(1),
	o => \ir[1]~input_o\);

-- Location: IOIBUF_X64_Y0_N1
\ir[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(2),
	o => \ir[2]~input_o\);

-- Location: IOIBUF_X24_Y0_N18
\ir[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(3),
	o => \ir[3]~input_o\);

-- Location: IOIBUF_X26_Y81_N75
\ir[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(4),
	o => \ir[4]~input_o\);

-- Location: IOIBUF_X28_Y0_N1
\ir[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(9),
	o => \ir[9]~input_o\);

-- Location: IOIBUF_X89_Y20_N95
\ir[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(10),
	o => \ir[10]~input_o\);

-- Location: IOIBUF_X34_Y81_N75
\ir[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(11),
	o => \ir[11]~input_o\);

-- Location: IOIBUF_X38_Y0_N18
\ir[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ir(12),
	o => \ir[12]~input_o\);

-- Location: IOIBUF_X12_Y81_N1
\ALUout[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUout(0),
	o => \ALUout[0]~input_o\);

-- Location: IOIBUF_X40_Y0_N18
\ALUout[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUout(1),
	o => \ALUout[1]~input_o\);

-- Location: IOIBUF_X66_Y0_N58
\ALUout[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUout(2),
	o => \ALUout[2]~input_o\);

-- Location: IOIBUF_X88_Y0_N53
\ALUout[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUout(3),
	o => \ALUout[3]~input_o\);

-- Location: IOIBUF_X32_Y0_N18
\ALUout[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUout(4),
	o => \ALUout[4]~input_o\);

-- Location: IOIBUF_X38_Y0_N1
\ALUout[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUout(5),
	o => \ALUout[5]~input_o\);

-- Location: IOIBUF_X6_Y81_N52
\ALUout[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUout(6),
	o => \ALUout[6]~input_o\);

-- Location: IOIBUF_X89_Y25_N4
\ALUout[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUout(7),
	o => \ALUout[7]~input_o\);

-- Location: IOIBUF_X52_Y0_N35
\ALUout[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUout(8),
	o => \ALUout[8]~input_o\);

-- Location: IOIBUF_X32_Y81_N1
\ALUout[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUout(9),
	o => \ALUout[9]~input_o\);

-- Location: IOIBUF_X89_Y11_N44
\ALUout[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUout(10),
	o => \ALUout[10]~input_o\);

-- Location: IOIBUF_X8_Y81_N1
\ALUout[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUout(11),
	o => \ALUout[11]~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\ALUout[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUout(12),
	o => \ALUout[12]~input_o\);

-- Location: IOIBUF_X40_Y0_N35
\ALUout[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUout(13),
	o => \ALUout[13]~input_o\);

-- Location: IOIBUF_X14_Y0_N1
\ALUout[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUout(14),
	o => \ALUout[14]~input_o\);

-- Location: IOIBUF_X74_Y0_N58
\ALUout[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUout(15),
	o => \ALUout[15]~input_o\);

-- Location: IOIBUF_X36_Y81_N52
\micro_instr[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(14),
	o => \micro_instr[14]~input_o\);

-- Location: IOIBUF_X89_Y9_N4
\micro_instr[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(15),
	o => \micro_instr[15]~input_o\);

-- Location: IOIBUF_X36_Y81_N1
\micro_instr[16]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(16),
	o => \micro_instr[16]~input_o\);

-- Location: IOIBUF_X26_Y0_N92
\micro_instr[17]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(17),
	o => \micro_instr[17]~input_o\);

-- Location: IOIBUF_X64_Y0_N52
\micro_instr[18]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(18),
	o => \micro_instr[18]~input_o\);

-- Location: IOIBUF_X88_Y0_N36
\micro_instr[19]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(19),
	o => \micro_instr[19]~input_o\);

-- Location: IOIBUF_X22_Y81_N18
\micro_instr[20]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(20),
	o => \micro_instr[20]~input_o\);

-- Location: IOIBUF_X6_Y0_N18
\micro_instr[21]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(21),
	o => \micro_instr[21]~input_o\);

-- Location: IOIBUF_X40_Y81_N18
\micro_instr[22]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(22),
	o => \micro_instr[22]~input_o\);

-- Location: IOIBUF_X89_Y11_N78
\micro_instr[23]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(23),
	o => \micro_instr[23]~input_o\);

-- Location: IOIBUF_X18_Y0_N58
\micro_instr[24]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(24),
	o => \micro_instr[24]~input_o\);

-- Location: IOIBUF_X89_Y13_N38
\micro_instr[25]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(25),
	o => \micro_instr[25]~input_o\);

-- Location: IOIBUF_X20_Y81_N52
\micro_instr[26]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(26),
	o => \micro_instr[26]~input_o\);

-- Location: IOIBUF_X14_Y0_N52
\micro_instr[27]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(27),
	o => \micro_instr[27]~input_o\);

-- Location: IOIBUF_X36_Y81_N18
\micro_instr[28]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(28),
	o => \micro_instr[28]~input_o\);

-- Location: IOIBUF_X89_Y16_N21
\micro_instr[29]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(29),
	o => \micro_instr[29]~input_o\);

-- Location: IOIBUF_X89_Y25_N38
\micro_instr[30]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(30),
	o => \micro_instr[30]~input_o\);

-- Location: IOIBUF_X28_Y81_N18
\micro_instr[31]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(31),
	o => \micro_instr[31]~input_o\);

-- Location: IOIBUF_X38_Y81_N1
\micro_instr[32]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_instr(32),
	o => \micro_instr[32]~input_o\);

-- Location: LABCELL_X30_Y78_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


