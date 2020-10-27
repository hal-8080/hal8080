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

-- DATE "10/27/2020 16:49:12"

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

ENTITY 	data_path IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	micro_inst : IN std_logic_vector(29 DOWNTO 0);
	statusN : OUT std_logic;
	statusZ : OUT std_logic;
	mmI : IN std_logic_vector(15 DOWNTO 0);
	mmAdress : OUT std_logic_vector(15 DOWNTO 0);
	mmData : OUT std_logic_vector(15 DOWNTO 0);
	ir : OUT std_logic_vector(15 DOWNTO 0);
	Dig0 : OUT std_logic_vector(6 DOWNTO 0);
	dig1 : OUT std_logic_vector(6 DOWNTO 0);
	dig2 : OUT std_logic_vector(6 DOWNTO 0);
	dig3 : OUT std_logic_vector(6 DOWNTO 0);
	dig4 : OUT std_logic_vector(6 DOWNTO 0);
	dig5 : OUT std_logic_vector(6 DOWNTO 0)
	);
END data_path;

-- Design Ports Information
-- mmAdress[0]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmAdress[1]	=>  Location: PIN_AF21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmAdress[2]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmAdress[3]	=>  Location: PIN_AK2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmAdress[4]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmAdress[5]	=>  Location: PIN_AJ25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmAdress[6]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmAdress[7]	=>  Location: PIN_AJ22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmAdress[8]	=>  Location: PIN_AJ29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmAdress[9]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmAdress[10]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmAdress[11]	=>  Location: PIN_AF6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmAdress[12]	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmAdress[13]	=>  Location: PIN_AH7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmAdress[14]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmAdress[15]	=>  Location: PIN_AJ26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmData[0]	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmData[1]	=>  Location: PIN_AB21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmData[2]	=>  Location: PIN_Y24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmData[3]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmData[4]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmData[5]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmData[6]	=>  Location: PIN_AH25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmData[7]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmData[8]	=>  Location: PIN_AG12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmData[9]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmData[10]	=>  Location: PIN_AK6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmData[11]	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmData[12]	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmData[13]	=>  Location: PIN_AG3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmData[14]	=>  Location: PIN_AD17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmData[15]	=>  Location: PIN_AD24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[0]	=>  Location: PIN_AG26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[1]	=>  Location: PIN_AH13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[2]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[3]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[4]	=>  Location: PIN_AF18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[5]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[6]	=>  Location: PIN_G7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[7]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[8]	=>  Location: PIN_AK21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[9]	=>  Location: PIN_AH4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[10]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[11]	=>  Location: PIN_AJ19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[12]	=>  Location: PIN_AE24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[13]	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[14]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ir[15]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[0]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[1]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[2]	=>  Location: PIN_AE23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[3]	=>  Location: PIN_AJ5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[4]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[5]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[6]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[7]	=>  Location: PIN_AC14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[8]	=>  Location: PIN_AK7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[9]	=>  Location: PIN_AK29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[10]	=>  Location: PIN_AG17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[15]	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[16]	=>  Location: PIN_AF24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[17]	=>  Location: PIN_AD20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[18]	=>  Location: PIN_AE16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[19]	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[20]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[21]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[22]	=>  Location: PIN_AE17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[23]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[24]	=>  Location: PIN_AK19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[25]	=>  Location: PIN_AD7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[26]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[27]	=>  Location: PIN_AF19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[28]	=>  Location: PIN_AE7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[29]	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmI[0]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmI[1]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmI[2]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmI[3]	=>  Location: PIN_AK11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmI[4]	=>  Location: PIN_AF26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmI[5]	=>  Location: PIN_AF20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmI[6]	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmI[7]	=>  Location: PIN_AC23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmI[8]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmI[9]	=>  Location: PIN_AJ6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmI[10]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmI[11]	=>  Location: PIN_C5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmI[12]	=>  Location: PIN_AC18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmI[13]	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmI[14]	=>  Location: PIN_AJ2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mmI[15]	=>  Location: PIN_AG18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dig0[0]	=>  Location: PIN_AJ14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dig0[1]	=>  Location: PIN_AF11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dig0[2]	=>  Location: PIN_AF15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dig0[3]	=>  Location: PIN_AJ21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dig0[4]	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dig0[5]	=>  Location: PIN_AH3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Dig0[6]	=>  Location: PIN_AG16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig1[0]	=>  Location: PIN_AE13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig1[1]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig1[2]	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig1[3]	=>  Location: PIN_AH9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig1[4]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig1[5]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig1[6]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig2[0]	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig2[1]	=>  Location: PIN_E13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig2[2]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig2[3]	=>  Location: PIN_AE14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig2[4]	=>  Location: PIN_AF16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig2[5]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig2[6]	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig3[0]	=>  Location: PIN_G8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig3[1]	=>  Location: PIN_AK13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig3[2]	=>  Location: PIN_K12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig3[3]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig3[4]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig3[5]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig3[6]	=>  Location: PIN_AJ10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig4[0]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig4[1]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig4[2]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig4[3]	=>  Location: PIN_F6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig4[4]	=>  Location: PIN_AG28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig4[5]	=>  Location: PIN_AF5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig4[6]	=>  Location: PIN_AG7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig5[0]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig5[1]	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig5[2]	=>  Location: PIN_AG27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig5[3]	=>  Location: PIN_AH15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig5[4]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig5[5]	=>  Location: PIN_H7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dig5[6]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- statusN	=>  Location: PIN_AD29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- statusZ	=>  Location: PIN_AE29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_AC30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[12]	=>  Location: PIN_AD30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[13]	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[11]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- micro_inst[14]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF data_path IS
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
SIGNAL ww_micro_inst : std_logic_vector(29 DOWNTO 0);
SIGNAL ww_statusN : std_logic;
SIGNAL ww_statusZ : std_logic;
SIGNAL ww_mmI : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_mmAdress : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_mmData : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_ir : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Dig0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_dig1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_dig2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_dig3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_dig4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_dig5 : std_logic_vector(6 DOWNTO 0);
SIGNAL \Mult0~8_AX_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \Mult0~8_AY_bus\ : std_logic_vector(18 DOWNTO 0);
SIGNAL \Mult0~8_RESULTA_bus\ : std_logic_vector(63 DOWNTO 0);
SIGNAL \Mult0~24\ : std_logic;
SIGNAL \Mult0~25\ : std_logic;
SIGNAL \Mult0~26\ : std_logic;
SIGNAL \Mult0~27\ : std_logic;
SIGNAL \Mult0~28\ : std_logic;
SIGNAL \Mult0~29\ : std_logic;
SIGNAL \Mult0~30\ : std_logic;
SIGNAL \Mult0~31\ : std_logic;
SIGNAL \Mult0~32\ : std_logic;
SIGNAL \Mult0~33\ : std_logic;
SIGNAL \Mult0~34\ : std_logic;
SIGNAL \Mult0~35\ : std_logic;
SIGNAL \Mult0~36\ : std_logic;
SIGNAL \Mult0~37\ : std_logic;
SIGNAL \Mult0~38\ : std_logic;
SIGNAL \Mult0~39\ : std_logic;
SIGNAL \Mult0~40\ : std_logic;
SIGNAL \Mult0~41\ : std_logic;
SIGNAL \Mult0~42\ : std_logic;
SIGNAL \Mult0~43\ : std_logic;
SIGNAL \Mult0~44\ : std_logic;
SIGNAL \Mult0~45\ : std_logic;
SIGNAL \Mult0~46\ : std_logic;
SIGNAL \Mult0~47\ : std_logic;
SIGNAL \Mult0~48\ : std_logic;
SIGNAL \Mult0~49\ : std_logic;
SIGNAL \Mult0~50\ : std_logic;
SIGNAL \Mult0~51\ : std_logic;
SIGNAL \Mult0~52\ : std_logic;
SIGNAL \Mult0~53\ : std_logic;
SIGNAL \Mult0~54\ : std_logic;
SIGNAL \Mult0~55\ : std_logic;
SIGNAL \Mult0~56\ : std_logic;
SIGNAL \Mult0~57\ : std_logic;
SIGNAL \Mult0~58\ : std_logic;
SIGNAL \Mult0~59\ : std_logic;
SIGNAL \Mult0~60\ : std_logic;
SIGNAL \Mult0~61\ : std_logic;
SIGNAL \Mult0~62\ : std_logic;
SIGNAL \Mult0~63\ : std_logic;
SIGNAL \Mult0~64\ : std_logic;
SIGNAL \Mult0~65\ : std_logic;
SIGNAL \Mult0~66\ : std_logic;
SIGNAL \Mult0~67\ : std_logic;
SIGNAL \Mult0~68\ : std_logic;
SIGNAL \Mult0~69\ : std_logic;
SIGNAL \Mult0~70\ : std_logic;
SIGNAL \Mult0~71\ : std_logic;
SIGNAL \micro_inst[0]~input_o\ : std_logic;
SIGNAL \micro_inst[1]~input_o\ : std_logic;
SIGNAL \micro_inst[2]~input_o\ : std_logic;
SIGNAL \micro_inst[3]~input_o\ : std_logic;
SIGNAL \micro_inst[4]~input_o\ : std_logic;
SIGNAL \micro_inst[5]~input_o\ : std_logic;
SIGNAL \micro_inst[6]~input_o\ : std_logic;
SIGNAL \micro_inst[7]~input_o\ : std_logic;
SIGNAL \micro_inst[8]~input_o\ : std_logic;
SIGNAL \micro_inst[9]~input_o\ : std_logic;
SIGNAL \micro_inst[10]~input_o\ : std_logic;
SIGNAL \micro_inst[15]~input_o\ : std_logic;
SIGNAL \micro_inst[16]~input_o\ : std_logic;
SIGNAL \micro_inst[17]~input_o\ : std_logic;
SIGNAL \micro_inst[18]~input_o\ : std_logic;
SIGNAL \micro_inst[19]~input_o\ : std_logic;
SIGNAL \micro_inst[20]~input_o\ : std_logic;
SIGNAL \micro_inst[21]~input_o\ : std_logic;
SIGNAL \micro_inst[22]~input_o\ : std_logic;
SIGNAL \micro_inst[23]~input_o\ : std_logic;
SIGNAL \micro_inst[24]~input_o\ : std_logic;
SIGNAL \micro_inst[25]~input_o\ : std_logic;
SIGNAL \micro_inst[26]~input_o\ : std_logic;
SIGNAL \micro_inst[27]~input_o\ : std_logic;
SIGNAL \micro_inst[28]~input_o\ : std_logic;
SIGNAL \micro_inst[29]~input_o\ : std_logic;
SIGNAL \mmI[0]~input_o\ : std_logic;
SIGNAL \mmI[1]~input_o\ : std_logic;
SIGNAL \mmI[2]~input_o\ : std_logic;
SIGNAL \mmI[3]~input_o\ : std_logic;
SIGNAL \mmI[4]~input_o\ : std_logic;
SIGNAL \mmI[5]~input_o\ : std_logic;
SIGNAL \mmI[6]~input_o\ : std_logic;
SIGNAL \mmI[7]~input_o\ : std_logic;
SIGNAL \mmI[8]~input_o\ : std_logic;
SIGNAL \mmI[9]~input_o\ : std_logic;
SIGNAL \mmI[10]~input_o\ : std_logic;
SIGNAL \mmI[11]~input_o\ : std_logic;
SIGNAL \mmI[12]~input_o\ : std_logic;
SIGNAL \mmI[13]~input_o\ : std_logic;
SIGNAL \mmI[14]~input_o\ : std_logic;
SIGNAL \mmI[15]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \micro_inst[14]~input_o\ : std_logic;
SIGNAL \micro_inst[11]~input_o\ : std_logic;
SIGNAL \micro_inst[13]~input_o\ : std_logic;
SIGNAL \micro_inst[12]~input_o\ : std_logic;
SIGNAL \Mux32~0_combout\ : std_logic;
SIGNAL \Mult0~23\ : std_logic;
SIGNAL \ALUout[15]~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \ALUout[15]~1_combout\ : std_logic;
SIGNAL \statusN~reg0feeder_combout\ : std_logic;
SIGNAL \statusN~reg0_q\ : std_logic;
SIGNAL \ALUout[14]~2_combout\ : std_logic;
SIGNAL \ALUout[14]~3_combout\ : std_logic;
SIGNAL \Mult0~8_resulta\ : std_logic;
SIGNAL \Mux33~0_combout\ : std_logic;
SIGNAL \Mux47~0_combout\ : std_logic;
SIGNAL \ALUout[14]~4_combout\ : std_logic;
SIGNAL \Mult0~10\ : std_logic;
SIGNAL \Mux45~0_combout\ : std_logic;
SIGNAL \Mult0~9\ : std_logic;
SIGNAL \Mux46~0_combout\ : std_logic;
SIGNAL \Mult0~11\ : std_logic;
SIGNAL \Mux44~0_combout\ : std_logic;
SIGNAL \Equal1024~2_combout\ : std_logic;
SIGNAL \Mult0~12\ : std_logic;
SIGNAL \Mux43~0_combout\ : std_logic;
SIGNAL \Mult0~18\ : std_logic;
SIGNAL \Mux37~0_combout\ : std_logic;
SIGNAL \Mult0~15\ : std_logic;
SIGNAL \Mux40~0_combout\ : std_logic;
SIGNAL \Mult0~14\ : std_logic;
SIGNAL \Mux41~0_combout\ : std_logic;
SIGNAL \Mult0~13\ : std_logic;
SIGNAL \Mux42~0_combout\ : std_logic;
SIGNAL \Mult0~17\ : std_logic;
SIGNAL \Mux38~0_combout\ : std_logic;
SIGNAL \Mult0~16\ : std_logic;
SIGNAL \Mux39~0_combout\ : std_logic;
SIGNAL \Equal1024~1_combout\ : std_logic;
SIGNAL \Mult0~22\ : std_logic;
SIGNAL \Mux33~1_combout\ : std_logic;
SIGNAL \Mult0~21\ : std_logic;
SIGNAL \Mux34~0_combout\ : std_logic;
SIGNAL \Mult0~19\ : std_logic;
SIGNAL \Mux36~0_combout\ : std_logic;
SIGNAL \Mult0~20\ : std_logic;
SIGNAL \Mux35~0_combout\ : std_logic;
SIGNAL \Equal1024~0_combout\ : std_logic;
SIGNAL \Equal1024~3_combout\ : std_logic;
SIGNAL \statusZ~reg0_q\ : std_logic;
SIGNAL ALUout : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_ALUout[14]~3_combout\ : std_logic;
SIGNAL \ALT_INV_Mux33~0_combout\ : std_logic;
SIGNAL \ALT_INV_ALUout[14]~2_combout\ : std_logic;
SIGNAL \ALT_INV_Mux32~0_combout\ : std_logic;
SIGNAL \ALT_INV_ALUout[15]~0_combout\ : std_logic;
SIGNAL \ALT_INV_Equal1024~2_combout\ : std_logic;
SIGNAL \ALT_INV_Equal1024~1_combout\ : std_logic;
SIGNAL \ALT_INV_Equal1024~0_combout\ : std_logic;
SIGNAL ALT_INV_ALUout : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_Mult0~23\ : std_logic;
SIGNAL \ALT_INV_Mult0~22\ : std_logic;
SIGNAL \ALT_INV_Mult0~21\ : std_logic;
SIGNAL \ALT_INV_Mult0~20\ : std_logic;
SIGNAL \ALT_INV_Mult0~19\ : std_logic;
SIGNAL \ALT_INV_Mult0~18\ : std_logic;
SIGNAL \ALT_INV_Mult0~17\ : std_logic;
SIGNAL \ALT_INV_Mult0~16\ : std_logic;
SIGNAL \ALT_INV_Mult0~15\ : std_logic;
SIGNAL \ALT_INV_Mult0~14\ : std_logic;
SIGNAL \ALT_INV_Mult0~13\ : std_logic;
SIGNAL \ALT_INV_Mult0~12\ : std_logic;
SIGNAL \ALT_INV_Mult0~11\ : std_logic;
SIGNAL \ALT_INV_Mult0~10\ : std_logic;
SIGNAL \ALT_INV_Mult0~9\ : std_logic;
SIGNAL \ALT_INV_Mult0~8_resulta\ : std_logic;
SIGNAL \ALT_INV_micro_inst[14]~input_o\ : std_logic;
SIGNAL \ALT_INV_micro_inst[11]~input_o\ : std_logic;
SIGNAL \ALT_INV_micro_inst[13]~input_o\ : std_logic;
SIGNAL \ALT_INV_micro_inst[12]~input_o\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_micro_inst <= micro_inst;
statusN <= ww_statusN;
statusZ <= ww_statusZ;
ww_mmI <= mmI;
mmAdress <= ww_mmAdress;
mmData <= ww_mmData;
ir <= ww_ir;
Dig0 <= ww_Dig0;
dig1 <= ww_dig1;
dig2 <= ww_dig2;
dig3 <= ww_dig3;
dig4 <= ww_dig4;
dig5 <= ww_dig5;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Mult0~8_AX_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Mult0~8_AY_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd);

\Mult0~8_resulta\ <= \Mult0~8_RESULTA_bus\(0);
\Mult0~9\ <= \Mult0~8_RESULTA_bus\(1);
\Mult0~10\ <= \Mult0~8_RESULTA_bus\(2);
\Mult0~11\ <= \Mult0~8_RESULTA_bus\(3);
\Mult0~12\ <= \Mult0~8_RESULTA_bus\(4);
\Mult0~13\ <= \Mult0~8_RESULTA_bus\(5);
\Mult0~14\ <= \Mult0~8_RESULTA_bus\(6);
\Mult0~15\ <= \Mult0~8_RESULTA_bus\(7);
\Mult0~16\ <= \Mult0~8_RESULTA_bus\(8);
\Mult0~17\ <= \Mult0~8_RESULTA_bus\(9);
\Mult0~18\ <= \Mult0~8_RESULTA_bus\(10);
\Mult0~19\ <= \Mult0~8_RESULTA_bus\(11);
\Mult0~20\ <= \Mult0~8_RESULTA_bus\(12);
\Mult0~21\ <= \Mult0~8_RESULTA_bus\(13);
\Mult0~22\ <= \Mult0~8_RESULTA_bus\(14);
\Mult0~23\ <= \Mult0~8_RESULTA_bus\(15);
\Mult0~24\ <= \Mult0~8_RESULTA_bus\(16);
\Mult0~25\ <= \Mult0~8_RESULTA_bus\(17);
\Mult0~26\ <= \Mult0~8_RESULTA_bus\(18);
\Mult0~27\ <= \Mult0~8_RESULTA_bus\(19);
\Mult0~28\ <= \Mult0~8_RESULTA_bus\(20);
\Mult0~29\ <= \Mult0~8_RESULTA_bus\(21);
\Mult0~30\ <= \Mult0~8_RESULTA_bus\(22);
\Mult0~31\ <= \Mult0~8_RESULTA_bus\(23);
\Mult0~32\ <= \Mult0~8_RESULTA_bus\(24);
\Mult0~33\ <= \Mult0~8_RESULTA_bus\(25);
\Mult0~34\ <= \Mult0~8_RESULTA_bus\(26);
\Mult0~35\ <= \Mult0~8_RESULTA_bus\(27);
\Mult0~36\ <= \Mult0~8_RESULTA_bus\(28);
\Mult0~37\ <= \Mult0~8_RESULTA_bus\(29);
\Mult0~38\ <= \Mult0~8_RESULTA_bus\(30);
\Mult0~39\ <= \Mult0~8_RESULTA_bus\(31);
\Mult0~40\ <= \Mult0~8_RESULTA_bus\(32);
\Mult0~41\ <= \Mult0~8_RESULTA_bus\(33);
\Mult0~42\ <= \Mult0~8_RESULTA_bus\(34);
\Mult0~43\ <= \Mult0~8_RESULTA_bus\(35);
\Mult0~44\ <= \Mult0~8_RESULTA_bus\(36);
\Mult0~45\ <= \Mult0~8_RESULTA_bus\(37);
\Mult0~46\ <= \Mult0~8_RESULTA_bus\(38);
\Mult0~47\ <= \Mult0~8_RESULTA_bus\(39);
\Mult0~48\ <= \Mult0~8_RESULTA_bus\(40);
\Mult0~49\ <= \Mult0~8_RESULTA_bus\(41);
\Mult0~50\ <= \Mult0~8_RESULTA_bus\(42);
\Mult0~51\ <= \Mult0~8_RESULTA_bus\(43);
\Mult0~52\ <= \Mult0~8_RESULTA_bus\(44);
\Mult0~53\ <= \Mult0~8_RESULTA_bus\(45);
\Mult0~54\ <= \Mult0~8_RESULTA_bus\(46);
\Mult0~55\ <= \Mult0~8_RESULTA_bus\(47);
\Mult0~56\ <= \Mult0~8_RESULTA_bus\(48);
\Mult0~57\ <= \Mult0~8_RESULTA_bus\(49);
\Mult0~58\ <= \Mult0~8_RESULTA_bus\(50);
\Mult0~59\ <= \Mult0~8_RESULTA_bus\(51);
\Mult0~60\ <= \Mult0~8_RESULTA_bus\(52);
\Mult0~61\ <= \Mult0~8_RESULTA_bus\(53);
\Mult0~62\ <= \Mult0~8_RESULTA_bus\(54);
\Mult0~63\ <= \Mult0~8_RESULTA_bus\(55);
\Mult0~64\ <= \Mult0~8_RESULTA_bus\(56);
\Mult0~65\ <= \Mult0~8_RESULTA_bus\(57);
\Mult0~66\ <= \Mult0~8_RESULTA_bus\(58);
\Mult0~67\ <= \Mult0~8_RESULTA_bus\(59);
\Mult0~68\ <= \Mult0~8_RESULTA_bus\(60);
\Mult0~69\ <= \Mult0~8_RESULTA_bus\(61);
\Mult0~70\ <= \Mult0~8_RESULTA_bus\(62);
\Mult0~71\ <= \Mult0~8_RESULTA_bus\(63);
\ALT_INV_ALUout[14]~3_combout\ <= NOT \ALUout[14]~3_combout\;
\ALT_INV_Mux33~0_combout\ <= NOT \Mux33~0_combout\;
\ALT_INV_ALUout[14]~2_combout\ <= NOT \ALUout[14]~2_combout\;
\ALT_INV_Mux32~0_combout\ <= NOT \Mux32~0_combout\;
\ALT_INV_ALUout[15]~0_combout\ <= NOT \ALUout[15]~0_combout\;
\ALT_INV_Equal1024~2_combout\ <= NOT \Equal1024~2_combout\;
\ALT_INV_Equal1024~1_combout\ <= NOT \Equal1024~1_combout\;
\ALT_INV_Equal1024~0_combout\ <= NOT \Equal1024~0_combout\;
ALT_INV_ALUout(15) <= NOT ALUout(15);
\ALT_INV_Mult0~23\ <= NOT \Mult0~23\;
\ALT_INV_Mult0~22\ <= NOT \Mult0~22\;
\ALT_INV_Mult0~21\ <= NOT \Mult0~21\;
\ALT_INV_Mult0~20\ <= NOT \Mult0~20\;
\ALT_INV_Mult0~19\ <= NOT \Mult0~19\;
\ALT_INV_Mult0~18\ <= NOT \Mult0~18\;
\ALT_INV_Mult0~17\ <= NOT \Mult0~17\;
\ALT_INV_Mult0~16\ <= NOT \Mult0~16\;
\ALT_INV_Mult0~15\ <= NOT \Mult0~15\;
\ALT_INV_Mult0~14\ <= NOT \Mult0~14\;
\ALT_INV_Mult0~13\ <= NOT \Mult0~13\;
\ALT_INV_Mult0~12\ <= NOT \Mult0~12\;
\ALT_INV_Mult0~11\ <= NOT \Mult0~11\;
\ALT_INV_Mult0~10\ <= NOT \Mult0~10\;
\ALT_INV_Mult0~9\ <= NOT \Mult0~9\;
\ALT_INV_Mult0~8_resulta\ <= NOT \Mult0~8_resulta\;
ALT_INV_ALUout(0) <= NOT ALUout(0);
ALT_INV_ALUout(1) <= NOT ALUout(1);
ALT_INV_ALUout(2) <= NOT ALUout(2);
ALT_INV_ALUout(3) <= NOT ALUout(3);
ALT_INV_ALUout(5) <= NOT ALUout(5);
ALT_INV_ALUout(6) <= NOT ALUout(6);
ALT_INV_ALUout(7) <= NOT ALUout(7);
ALT_INV_ALUout(8) <= NOT ALUout(8);
ALT_INV_ALUout(9) <= NOT ALUout(9);
ALT_INV_ALUout(11) <= NOT ALUout(11);
ALT_INV_ALUout(12) <= NOT ALUout(12);
ALT_INV_ALUout(13) <= NOT ALUout(13);
ALT_INV_ALUout(14) <= NOT ALUout(14);
ALT_INV_ALUout(4) <= NOT ALUout(4);
ALT_INV_ALUout(10) <= NOT ALUout(10);
\ALT_INV_micro_inst[14]~input_o\ <= NOT \micro_inst[14]~input_o\;
\ALT_INV_micro_inst[11]~input_o\ <= NOT \micro_inst[11]~input_o\;
\ALT_INV_micro_inst[13]~input_o\ <= NOT \micro_inst[13]~input_o\;
\ALT_INV_micro_inst[12]~input_o\ <= NOT \micro_inst[12]~input_o\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;

-- Location: IOOBUF_X88_Y0_N3
\mmAdress[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmAdress(0));

-- Location: IOOBUF_X70_Y0_N19
\mmAdress[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmAdress(1));

-- Location: IOOBUF_X18_Y81_N59
\mmAdress[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmAdress(2));

-- Location: IOOBUF_X20_Y0_N36
\mmAdress[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmAdress(3));

-- Location: IOOBUF_X2_Y81_N59
\mmAdress[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmAdress(4));

-- Location: IOOBUF_X74_Y0_N93
\mmAdress[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmAdress(5));

-- Location: IOOBUF_X12_Y81_N19
\mmAdress[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmAdress(6));

-- Location: IOOBUF_X70_Y0_N53
\mmAdress[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmAdress(7));

-- Location: IOOBUF_X89_Y6_N39
\mmAdress[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmAdress(8));

-- Location: IOOBUF_X38_Y81_N2
\mmAdress[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmAdress(9));

-- Location: IOOBUF_X38_Y81_N19
\mmAdress[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmAdress(10));

-- Location: IOOBUF_X12_Y0_N36
\mmAdress[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmAdress(11));

-- Location: IOOBUF_X8_Y81_N53
\mmAdress[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmAdress(12));

-- Location: IOOBUF_X32_Y0_N36
\mmAdress[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmAdress(13));

-- Location: IOOBUF_X36_Y0_N2
\mmAdress[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmAdress(14));

-- Location: IOOBUF_X76_Y0_N36
\mmAdress[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmAdress(15));

-- Location: IOOBUF_X16_Y81_N36
\mmData[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmData(0));

-- Location: IOOBUF_X88_Y0_N20
\mmData[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmData(1));

-- Location: IOOBUF_X89_Y13_N22
\mmData[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmData(2));

-- Location: IOOBUF_X16_Y0_N19
\mmData[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmData(3));

-- Location: IOOBUF_X56_Y0_N19
\mmData[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmData(4));

-- Location: IOOBUF_X4_Y0_N19
\mmData[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmData(5));

-- Location: IOOBUF_X78_Y0_N53
\mmData[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmData(6));

-- Location: IOOBUF_X89_Y6_N22
\mmData[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmData(7));

-- Location: IOOBUF_X26_Y0_N42
\mmData[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmData(8));

-- Location: IOOBUF_X26_Y81_N42
\mmData[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmData(9));

-- Location: IOOBUF_X24_Y0_N53
\mmData[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmData(10));

-- Location: IOOBUF_X89_Y11_N79
\mmData[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmData(11));

-- Location: IOOBUF_X10_Y81_N76
\mmData[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmData(12));

-- Location: IOOBUF_X6_Y0_N36
\mmData[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmData(13));

-- Location: IOOBUF_X64_Y0_N19
\mmData[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmData(14));

-- Location: IOOBUF_X88_Y0_N37
\mmData[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_mmData(15));

-- Location: IOOBUF_X84_Y0_N36
\ir[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ir(0));

-- Location: IOOBUF_X30_Y0_N2
\ir[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ir(1));

-- Location: IOOBUF_X28_Y0_N2
\ir[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ir(2));

-- Location: IOOBUF_X34_Y81_N42
\ir[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ir(3));

-- Location: IOOBUF_X50_Y0_N59
\ir[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ir(4));

-- Location: IOOBUF_X12_Y0_N2
\ir[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ir(5));

-- Location: IOOBUF_X2_Y81_N76
\ir[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ir(6));

-- Location: IOOBUF_X89_Y8_N22
\ir[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ir(7));

-- Location: IOOBUF_X68_Y0_N36
\ir[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ir(8));

-- Location: IOOBUF_X6_Y0_N53
\ir[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ir(9));

-- Location: IOOBUF_X40_Y0_N19
\ir[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ir(10));

-- Location: IOOBUF_X60_Y0_N36
\ir[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ir(11));

-- Location: IOOBUF_X88_Y0_N54
\ir[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ir(12));

-- Location: IOOBUF_X28_Y81_N2
\ir[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ir(13));

-- Location: IOOBUF_X28_Y81_N53
\ir[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ir(14));

-- Location: IOOBUF_X20_Y0_N19
\ir[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_ir(15));

-- Location: IOOBUF_X40_Y0_N36
\Dig0[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_Dig0(0));

-- Location: IOOBUF_X18_Y0_N42
\Dig0[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_Dig0(1));

-- Location: IOOBUF_X32_Y0_N19
\Dig0[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_Dig0(2));

-- Location: IOOBUF_X62_Y0_N53
\Dig0[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_Dig0(3));

-- Location: IOOBUF_X16_Y81_N53
\Dig0[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_Dig0(4));

-- Location: IOOBUF_X16_Y0_N53
\Dig0[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_Dig0(5));

-- Location: IOOBUF_X50_Y0_N76
\Dig0[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_Dig0(6));

-- Location: IOOBUF_X22_Y0_N2
\dig1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig1(0));

-- Location: IOOBUF_X14_Y81_N19
\dig1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig1(1));

-- Location: IOOBUF_X32_Y0_N2
\dig1[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig1(2));

-- Location: IOOBUF_X18_Y0_N93
\dig1[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig1(3));

-- Location: IOOBUF_X18_Y81_N93
\dig1[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig1(4));

-- Location: IOOBUF_X28_Y81_N19
\dig1[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig1(5));

-- Location: IOOBUF_X14_Y81_N2
\dig1[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig1(6));

-- Location: IOOBUF_X89_Y13_N5
\dig2[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig2(0));

-- Location: IOOBUF_X26_Y81_N59
\dig2[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig2(1));

-- Location: IOOBUF_X89_Y11_N45
\dig2[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig2(2));

-- Location: IOOBUF_X24_Y0_N19
\dig2[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig2(3));

-- Location: IOOBUF_X52_Y0_N53
\dig2[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig2(4));

-- Location: IOOBUF_X89_Y4_N62
\dig2[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig2(5));

-- Location: IOOBUF_X6_Y81_N53
\dig2[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig2(6));

-- Location: IOOBUF_X24_Y81_N19
\dig3[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig3(0));

-- Location: IOOBUF_X36_Y0_N53
\dig3[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig3(1));

-- Location: IOOBUF_X12_Y81_N2
\dig3[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig3(2));

-- Location: IOOBUF_X16_Y0_N2
\dig3[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig3(3));

-- Location: IOOBUF_X4_Y0_N53
\dig3[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig3(4));

-- Location: IOOBUF_X66_Y0_N59
\dig3[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig3(5));

-- Location: IOOBUF_X34_Y0_N93
\dig3[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig3(6));

-- Location: IOOBUF_X89_Y9_N56
\dig4[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig4(0));

-- Location: IOOBUF_X26_Y81_N93
\dig4[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig4(1));

-- Location: IOOBUF_X84_Y0_N19
\dig4[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig4(2));

-- Location: IOOBUF_X2_Y81_N93
\dig4[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig4(3));

-- Location: IOOBUF_X89_Y13_N39
\dig4[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig4(4));

-- Location: IOOBUF_X8_Y0_N19
\dig4[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig4(5));

-- Location: IOOBUF_X10_Y0_N93
\dig4[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig4(6));

-- Location: IOOBUF_X38_Y81_N53
\dig5[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig5(0));

-- Location: IOOBUF_X2_Y0_N59
\dig5[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig5(1));

-- Location: IOOBUF_X89_Y4_N79
\dig5[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig5(2));

-- Location: IOOBUF_X38_Y0_N19
\dig5[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig5(3));

-- Location: IOOBUF_X52_Y0_N2
\dig5[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig5(4));

-- Location: IOOBUF_X16_Y81_N19
\dig5[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig5(5));

-- Location: IOOBUF_X6_Y81_N19
\dig5[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_dig5(6));

-- Location: IOOBUF_X89_Y23_N56
\statusN~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \statusN~reg0_q\,
	devoe => ww_devoe,
	o => ww_statusN);

-- Location: IOOBUF_X89_Y23_N39
\statusZ~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \statusZ~reg0_q\,
	devoe => ww_devoe,
	o => ww_statusZ);

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

-- Location: IOIBUF_X89_Y23_N4
\micro_inst[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(14),
	o => \micro_inst[14]~input_o\);

-- Location: IOIBUF_X89_Y23_N21
\micro_inst[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(11),
	o => \micro_inst[11]~input_o\);

-- Location: IOIBUF_X89_Y25_N4
\micro_inst[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(13),
	o => \micro_inst[13]~input_o\);

-- Location: IOIBUF_X89_Y25_N38
\micro_inst[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(12),
	o => \micro_inst[12]~input_o\);

-- Location: LABCELL_X88_Y35_N21
\Mux32~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux32~0_combout\ = ( \micro_inst[12]~input_o\ & ( (\micro_inst[11]~input_o\ & \micro_inst[13]~input_o\) ) ) # ( !\micro_inst[12]~input_o\ & ( (\micro_inst[14]~input_o\ & \micro_inst[13]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010100000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_micro_inst[14]~input_o\,
	datac => \ALT_INV_micro_inst[11]~input_o\,
	datad => \ALT_INV_micro_inst[13]~input_o\,
	dataf => \ALT_INV_micro_inst[12]~input_o\,
	combout => \Mux32~0_combout\);

-- Location: DSP_X86_Y35_N0
\Mult0~8\ : cyclonev_mac
-- pragma translate_off
GENERIC MAP (
	accumulate_clock => "none",
	ax_clock => "none",
	ax_width => 18,
	ay_scan_in_clock => "none",
	ay_scan_in_width => 19,
	ay_use_scan_in => "false",
	az_clock => "none",
	bx_clock => "none",
	by_clock => "none",
	by_use_scan_in => "false",
	bz_clock => "none",
	coef_a_0 => 0,
	coef_a_1 => 0,
	coef_a_2 => 0,
	coef_a_3 => 0,
	coef_a_4 => 0,
	coef_a_5 => 0,
	coef_a_6 => 0,
	coef_a_7 => 0,
	coef_b_0 => 0,
	coef_b_1 => 0,
	coef_b_2 => 0,
	coef_b_3 => 0,
	coef_b_4 => 0,
	coef_b_5 => 0,
	coef_b_6 => 0,
	coef_b_7 => 0,
	coef_sel_a_clock => "none",
	coef_sel_b_clock => "none",
	delay_scan_out_ay => "false",
	delay_scan_out_by => "false",
	enable_double_accum => "false",
	load_const_clock => "none",
	load_const_value => 0,
	mode_sub_location => 0,
	negate_clock => "none",
	operand_source_max => "input",
	operand_source_may => "input",
	operand_source_mbx => "input",
	operand_source_mby => "input",
	operation_mode => "m18x18_full",
	output_clock => "none",
	preadder_subtract_a => "false",
	preadder_subtract_b => "false",
	result_a_width => 64,
	signed_max => "true",
	signed_may => "true",
	signed_mbx => "false",
	signed_mby => "false",
	sub_clock => "none",
	use_chainadder => "false")
-- pragma translate_on
PORT MAP (
	sub => GND,
	negate => GND,
	ax => \Mult0~8_AX_bus\,
	ay => \Mult0~8_AY_bus\,
	resulta => \Mult0~8_RESULTA_bus\);

-- Location: LABCELL_X88_Y35_N27
\ALUout[15]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALUout[15]~0_combout\ = ( !\micro_inst[13]~input_o\ & ( \micro_inst[14]~input_o\ & ( (\micro_inst[12]~input_o\ & !\micro_inst[11]~input_o\) ) ) ) # ( \micro_inst[13]~input_o\ & ( !\micro_inst[14]~input_o\ & ( (!\micro_inst[12]~input_o\ & (\Mult0~23\ & 
-- \micro_inst[11]~input_o\)) # (\micro_inst[12]~input_o\ & ((!\micro_inst[11]~input_o\))) ) ) ) # ( !\micro_inst[13]~input_o\ & ( !\micro_inst[14]~input_o\ & ( \micro_inst[11]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111001100110000110000110011000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_micro_inst[12]~input_o\,
	datac => \ALT_INV_Mult0~23\,
	datad => \ALT_INV_micro_inst[11]~input_o\,
	datae => \ALT_INV_micro_inst[13]~input_o\,
	dataf => \ALT_INV_micro_inst[14]~input_o\,
	combout => \ALUout[15]~0_combout\);

-- Location: IOIBUF_X89_Y25_N55
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: LABCELL_X88_Y35_N18
\ALUout[15]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALUout[15]~1_combout\ = ( \reset~input_o\ & ( (!\Mux32~0_combout\ & (\ALUout[15]~0_combout\)) # (\Mux32~0_combout\ & ((ALUout(15)))) ) ) # ( !\reset~input_o\ & ( ALUout(15) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001100001111110000110000111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Mux32~0_combout\,
	datac => \ALT_INV_ALUout[15]~0_combout\,
	datad => ALT_INV_ALUout(15),
	dataf => \ALT_INV_reset~input_o\,
	combout => \ALUout[15]~1_combout\);

-- Location: FF_X88_Y35_N20
\ALUout[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ALUout[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout(15));

-- Location: LABCELL_X88_Y35_N48
\statusN~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \statusN~reg0feeder_combout\ = ( ALUout(15) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_ALUout(15),
	combout => \statusN~reg0feeder_combout\);

-- Location: FF_X88_Y35_N49
\statusN~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \statusN~reg0feeder_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \statusN~reg0_q\);

-- Location: LABCELL_X88_Y35_N45
\ALUout[14]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALUout[14]~2_combout\ = ( !\micro_inst[13]~input_o\ & ( \micro_inst[14]~input_o\ & ( (\micro_inst[12]~input_o\ & \micro_inst[11]~input_o\) ) ) ) # ( \micro_inst[13]~input_o\ & ( !\micro_inst[14]~input_o\ & ( \micro_inst[11]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000001111111100000000000011110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_micro_inst[12]~input_o\,
	datad => \ALT_INV_micro_inst[11]~input_o\,
	datae => \ALT_INV_micro_inst[13]~input_o\,
	dataf => \ALT_INV_micro_inst[14]~input_o\,
	combout => \ALUout[14]~2_combout\);

-- Location: LABCELL_X88_Y35_N12
\ALUout[14]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALUout[14]~3_combout\ = ( \micro_inst[11]~input_o\ & ( (\micro_inst[13]~input_o\ & !\micro_inst[14]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010100000101000000000000000000000101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_micro_inst[13]~input_o\,
	datac => \ALT_INV_micro_inst[14]~input_o\,
	datae => \ALT_INV_micro_inst[11]~input_o\,
	combout => \ALUout[14]~3_combout\);

-- Location: LABCELL_X88_Y35_N30
\Mux33~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux33~0_combout\ = ( \micro_inst[14]~input_o\ & ( (!\micro_inst[13]~input_o\ & \micro_inst[12]~input_o\) ) ) # ( !\micro_inst[14]~input_o\ & ( ((\micro_inst[13]~input_o\ & \micro_inst[12]~input_o\)) # (\micro_inst[11]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111100011111000111110001111100100010001000100010001000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_micro_inst[13]~input_o\,
	datab => \ALT_INV_micro_inst[12]~input_o\,
	datac => \ALT_INV_micro_inst[11]~input_o\,
	dataf => \ALT_INV_micro_inst[14]~input_o\,
	combout => \Mux33~0_combout\);

-- Location: MLABCELL_X87_Y35_N18
\Mux47~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux47~0_combout\ = (!\ALUout[14]~3_combout\ & (!\ALUout[14]~2_combout\ & ((\Mux33~0_combout\)))) # (\ALUout[14]~3_combout\ & (((\Mult0~8_resulta\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001110001011000000111000101100000011100010110000001110001011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ALUout[14]~2_combout\,
	datab => \ALT_INV_ALUout[14]~3_combout\,
	datac => \ALT_INV_Mult0~8_resulta\,
	datad => \ALT_INV_Mux33~0_combout\,
	combout => \Mux47~0_combout\);

-- Location: LABCELL_X88_Y35_N6
\ALUout[14]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALUout[14]~4_combout\ = ( \micro_inst[11]~input_o\ & ( \reset~input_o\ & ( (!\micro_inst[13]~input_o\) # ((!\micro_inst[12]~input_o\ & !\micro_inst[14]~input_o\)) ) ) ) # ( !\micro_inst[11]~input_o\ & ( \reset~input_o\ & ( (!\micro_inst[13]~input_o\) # 
-- ((!\micro_inst[14]~input_o\) # (\micro_inst[12]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111011111110111110101011101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_micro_inst[13]~input_o\,
	datab => \ALT_INV_micro_inst[12]~input_o\,
	datac => \ALT_INV_micro_inst[14]~input_o\,
	datae => \ALT_INV_micro_inst[11]~input_o\,
	dataf => \ALT_INV_reset~input_o\,
	combout => \ALUout[14]~4_combout\);

-- Location: FF_X87_Y35_N20
\ALUout[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux47~0_combout\,
	ena => \ALUout[14]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout(0));

-- Location: LABCELL_X88_Y35_N54
\Mux45~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux45~0_combout\ = ( \ALUout[14]~2_combout\ & ( \Mux33~0_combout\ & ( (\Mult0~10\ & \ALUout[14]~3_combout\) ) ) ) # ( !\ALUout[14]~2_combout\ & ( \Mux33~0_combout\ & ( (!\ALUout[14]~3_combout\) # (\Mult0~10\) ) ) ) # ( \ALUout[14]~2_combout\ & ( 
-- !\Mux33~0_combout\ & ( (\Mult0~10\ & \ALUout[14]~3_combout\) ) ) ) # ( !\ALUout[14]~2_combout\ & ( !\Mux33~0_combout\ & ( (\Mult0~10\ & \ALUout[14]~3_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011000000000011001111111111001100110000000000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Mult0~10\,
	datad => \ALT_INV_ALUout[14]~3_combout\,
	datae => \ALT_INV_ALUout[14]~2_combout\,
	dataf => \ALT_INV_Mux33~0_combout\,
	combout => \Mux45~0_combout\);

-- Location: FF_X87_Y35_N38
\ALUout[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux45~0_combout\,
	sload => VCC,
	ena => \ALUout[14]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout(2));

-- Location: MLABCELL_X87_Y35_N45
\Mux46~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux46~0_combout\ = ( \ALUout[14]~3_combout\ & ( \Mult0~9\ ) ) # ( !\ALUout[14]~3_combout\ & ( (!\ALUout[14]~2_combout\ & \Mux33~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ALUout[14]~2_combout\,
	datab => \ALT_INV_Mux33~0_combout\,
	datad => \ALT_INV_Mult0~9\,
	dataf => \ALT_INV_ALUout[14]~3_combout\,
	combout => \Mux46~0_combout\);

-- Location: FF_X87_Y35_N47
\ALUout[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux46~0_combout\,
	ena => \ALUout[14]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout(1));

-- Location: MLABCELL_X87_Y35_N39
\Mux44~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux44~0_combout\ = ( \ALUout[14]~3_combout\ & ( \Mult0~11\ ) ) # ( !\ALUout[14]~3_combout\ & ( (!\ALUout[14]~2_combout\ & \Mux33~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ALUout[14]~2_combout\,
	datab => \ALT_INV_Mux33~0_combout\,
	datac => \ALT_INV_Mult0~11\,
	dataf => \ALT_INV_ALUout[14]~3_combout\,
	combout => \Mux44~0_combout\);

-- Location: FF_X87_Y35_N7
\ALUout[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux44~0_combout\,
	sload => VCC,
	ena => \ALUout[14]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout(3));

-- Location: MLABCELL_X87_Y35_N54
\Equal1024~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal1024~2_combout\ = ( !ALUout(3) & ( (!ALUout(0) & (!ALUout(2) & !ALUout(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000101000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUout(0),
	datac => ALT_INV_ALUout(2),
	datad => ALT_INV_ALUout(1),
	dataf => ALT_INV_ALUout(3),
	combout => \Equal1024~2_combout\);

-- Location: MLABCELL_X87_Y35_N12
\Mux43~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux43~0_combout\ = ( \ALUout[14]~3_combout\ & ( \Mult0~12\ ) ) # ( !\ALUout[14]~3_combout\ & ( (!\ALUout[14]~2_combout\ & \Mux33~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ALUout[14]~2_combout\,
	datab => \ALT_INV_Mux33~0_combout\,
	datac => \ALT_INV_Mult0~12\,
	dataf => \ALT_INV_ALUout[14]~3_combout\,
	combout => \Mux43~0_combout\);

-- Location: FF_X87_Y35_N14
\ALUout[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux43~0_combout\,
	ena => \ALUout[14]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout(4));

-- Location: MLABCELL_X87_Y35_N30
\Mux37~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux37~0_combout\ = ( \ALUout[14]~3_combout\ & ( \Mult0~18\ ) ) # ( !\ALUout[14]~3_combout\ & ( (\Mux33~0_combout\ & !\ALUout[14]~2_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Mux33~0_combout\,
	datac => \ALT_INV_ALUout[14]~2_combout\,
	datad => \ALT_INV_Mult0~18\,
	dataf => \ALT_INV_ALUout[14]~3_combout\,
	combout => \Mux37~0_combout\);

-- Location: FF_X87_Y35_N32
\ALUout[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux37~0_combout\,
	ena => \ALUout[14]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout(10));

-- Location: MLABCELL_X87_Y35_N42
\Mux40~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux40~0_combout\ = ( \ALUout[14]~3_combout\ & ( \Mult0~15\ ) ) # ( !\ALUout[14]~3_combout\ & ( (!\ALUout[14]~2_combout\ & \Mux33~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ALUout[14]~2_combout\,
	datab => \ALT_INV_Mux33~0_combout\,
	datac => \ALT_INV_Mult0~15\,
	dataf => \ALT_INV_ALUout[14]~3_combout\,
	combout => \Mux40~0_combout\);

-- Location: FF_X87_Y35_N11
\ALUout[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux40~0_combout\,
	sload => VCC,
	ena => \ALUout[14]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout(7));

-- Location: MLABCELL_X87_Y35_N15
\Mux41~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux41~0_combout\ = ( \ALUout[14]~3_combout\ & ( \Mult0~14\ ) ) # ( !\ALUout[14]~3_combout\ & ( (!\ALUout[14]~2_combout\ & \Mux33~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ALUout[14]~2_combout\,
	datab => \ALT_INV_Mux33~0_combout\,
	datac => \ALT_INV_Mult0~14\,
	dataf => \ALT_INV_ALUout[14]~3_combout\,
	combout => \Mux41~0_combout\);

-- Location: FF_X87_Y35_N17
\ALUout[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux41~0_combout\,
	ena => \ALUout[14]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout(6));

-- Location: MLABCELL_X87_Y35_N3
\Mux42~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux42~0_combout\ = ( \ALUout[14]~3_combout\ & ( \Mult0~13\ ) ) # ( !\ALUout[14]~3_combout\ & ( (!\ALUout[14]~2_combout\ & \Mux33~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ALUout[14]~2_combout\,
	datab => \ALT_INV_Mux33~0_combout\,
	datad => \ALT_INV_Mult0~13\,
	dataf => \ALT_INV_ALUout[14]~3_combout\,
	combout => \Mux42~0_combout\);

-- Location: FF_X87_Y35_N5
\ALUout[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux42~0_combout\,
	ena => \ALUout[14]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout(5));

-- Location: MLABCELL_X87_Y35_N57
\Mux38~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux38~0_combout\ = ( \ALUout[14]~2_combout\ & ( (\ALUout[14]~3_combout\ & \Mult0~17\) ) ) # ( !\ALUout[14]~2_combout\ & ( (!\ALUout[14]~3_combout\ & ((\Mux33~0_combout\))) # (\ALUout[14]~3_combout\ & (\Mult0~17\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111001111000000111100111100000011000000110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_ALUout[14]~3_combout\,
	datac => \ALT_INV_Mult0~17\,
	datad => \ALT_INV_Mux33~0_combout\,
	dataf => \ALT_INV_ALUout[14]~2_combout\,
	combout => \Mux38~0_combout\);

-- Location: FF_X87_Y35_N59
\ALUout[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux38~0_combout\,
	ena => \ALUout[14]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout(9));

-- Location: MLABCELL_X87_Y35_N33
\Mux39~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux39~0_combout\ = ( \Mult0~16\ & ( ((!\ALUout[14]~2_combout\ & \Mux33~0_combout\)) # (\ALUout[14]~3_combout\) ) ) # ( !\Mult0~16\ & ( (!\ALUout[14]~2_combout\ & (\Mux33~0_combout\ & !\ALUout[14]~3_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000100000001000000010000000101111001011110010111100101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ALUout[14]~2_combout\,
	datab => \ALT_INV_Mux33~0_combout\,
	datac => \ALT_INV_ALUout[14]~3_combout\,
	dataf => \ALT_INV_Mult0~16\,
	combout => \Mux39~0_combout\);

-- Location: FF_X87_Y35_N35
\ALUout[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux39~0_combout\,
	ena => \ALUout[14]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout(8));

-- Location: MLABCELL_X87_Y35_N27
\Equal1024~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal1024~1_combout\ = ( !ALUout(9) & ( !ALUout(8) & ( (!ALUout(7) & (!ALUout(6) & !ALUout(5))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_ALUout(7),
	datac => ALT_INV_ALUout(6),
	datad => ALT_INV_ALUout(5),
	datae => ALT_INV_ALUout(9),
	dataf => ALT_INV_ALUout(8),
	combout => \Equal1024~1_combout\);

-- Location: MLABCELL_X87_Y35_N21
\Mux33~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux33~1_combout\ = ( \Mult0~22\ & ( ((!\ALUout[14]~2_combout\ & \Mux33~0_combout\)) # (\ALUout[14]~3_combout\) ) ) # ( !\Mult0~22\ & ( (!\ALUout[14]~2_combout\ & (!\ALUout[14]~3_combout\ & \Mux33~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000001000000010000000100000111011001110110011101100111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ALUout[14]~2_combout\,
	datab => \ALT_INV_ALUout[14]~3_combout\,
	datac => \ALT_INV_Mux33~0_combout\,
	dataf => \ALT_INV_Mult0~22\,
	combout => \Mux33~1_combout\);

-- Location: FF_X87_Y35_N41
\ALUout[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux33~1_combout\,
	sload => VCC,
	ena => \ALUout[14]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout(14));

-- Location: MLABCELL_X87_Y35_N0
\Mux34~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux34~0_combout\ = ( \ALUout[14]~3_combout\ & ( \Mult0~21\ ) ) # ( !\ALUout[14]~3_combout\ & ( (!\ALUout[14]~2_combout\ & \Mux33~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ALUout[14]~2_combout\,
	datab => \ALT_INV_Mux33~0_combout\,
	datac => \ALT_INV_Mult0~21\,
	dataf => \ALT_INV_ALUout[14]~3_combout\,
	combout => \Mux34~0_combout\);

-- Location: FF_X87_Y35_N2
\ALUout[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux34~0_combout\,
	ena => \ALUout[14]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout(13));

-- Location: LABCELL_X88_Y35_N36
\Mux36~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux36~0_combout\ = ( \ALUout[14]~2_combout\ & ( \Mux33~0_combout\ & ( (\ALUout[14]~3_combout\ & \Mult0~19\) ) ) ) # ( !\ALUout[14]~2_combout\ & ( \Mux33~0_combout\ & ( (!\ALUout[14]~3_combout\) # (\Mult0~19\) ) ) ) # ( \ALUout[14]~2_combout\ & ( 
-- !\Mux33~0_combout\ & ( (\ALUout[14]~3_combout\ & \Mult0~19\) ) ) ) # ( !\ALUout[14]~2_combout\ & ( !\Mux33~0_combout\ & ( (\ALUout[14]~3_combout\ & \Mult0~19\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001111001111110011110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_ALUout[14]~3_combout\,
	datac => \ALT_INV_Mult0~19\,
	datae => \ALT_INV_ALUout[14]~2_combout\,
	dataf => \ALT_INV_Mux33~0_combout\,
	combout => \Mux36~0_combout\);

-- Location: FF_X87_Y35_N44
\ALUout[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux36~0_combout\,
	sload => VCC,
	ena => \ALUout[14]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout(11));

-- Location: MLABCELL_X87_Y35_N36
\Mux35~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux35~0_combout\ = ( \ALUout[14]~3_combout\ & ( \Mult0~20\ ) ) # ( !\ALUout[14]~3_combout\ & ( (!\ALUout[14]~2_combout\ & \Mux33~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010001000100010001000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ALUout[14]~2_combout\,
	datab => \ALT_INV_Mux33~0_combout\,
	datac => \ALT_INV_Mult0~20\,
	dataf => \ALT_INV_ALUout[14]~3_combout\,
	combout => \Mux35~0_combout\);

-- Location: FF_X87_Y35_N23
\ALUout[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Mux35~0_combout\,
	sload => VCC,
	ena => \ALUout[14]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout(12));

-- Location: MLABCELL_X87_Y35_N6
\Equal1024~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal1024~0_combout\ = ( !ALUout(12) & ( !ALUout(15) & ( (!ALUout(14) & (!ALUout(13) & !ALUout(11))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_ALUout(14),
	datac => ALT_INV_ALUout(13),
	datad => ALT_INV_ALUout(11),
	datae => ALT_INV_ALUout(12),
	dataf => ALT_INV_ALUout(15),
	combout => \Equal1024~0_combout\);

-- Location: MLABCELL_X87_Y35_N48
\Equal1024~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal1024~3_combout\ = ( \Equal1024~1_combout\ & ( \Equal1024~0_combout\ & ( (\Equal1024~2_combout\ & (!ALUout(4) & !ALUout(10))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000100010000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal1024~2_combout\,
	datab => ALT_INV_ALUout(4),
	datad => ALT_INV_ALUout(10),
	datae => \ALT_INV_Equal1024~1_combout\,
	dataf => \ALT_INV_Equal1024~0_combout\,
	combout => \Equal1024~3_combout\);

-- Location: FF_X87_Y35_N49
\statusZ~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Equal1024~3_combout\,
	ena => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \statusZ~reg0_q\);

-- Location: IOIBUF_X89_Y20_N44
\micro_inst[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(0),
	o => \micro_inst[0]~input_o\);

-- Location: IOIBUF_X38_Y81_N35
\micro_inst[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(1),
	o => \micro_inst[1]~input_o\);

-- Location: IOIBUF_X78_Y0_N18
\micro_inst[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(2),
	o => \micro_inst[2]~input_o\);

-- Location: IOIBUF_X24_Y0_N35
\micro_inst[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(3),
	o => \micro_inst[3]~input_o\);

-- Location: IOIBUF_X20_Y81_N1
\micro_inst[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(4),
	o => \micro_inst[4]~input_o\);

-- Location: IOIBUF_X36_Y81_N18
\micro_inst[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(5),
	o => \micro_inst[5]~input_o\);

-- Location: IOIBUF_X89_Y11_N61
\micro_inst[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(6),
	o => \micro_inst[6]~input_o\);

-- Location: IOIBUF_X28_Y0_N18
\micro_inst[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(7),
	o => \micro_inst[7]~input_o\);

-- Location: IOIBUF_X28_Y0_N35
\micro_inst[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(8),
	o => \micro_inst[8]~input_o\);

-- Location: IOIBUF_X82_Y0_N92
\micro_inst[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(9),
	o => \micro_inst[9]~input_o\);

-- Location: IOIBUF_X50_Y0_N92
\micro_inst[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(10),
	o => \micro_inst[10]~input_o\);

-- Location: IOIBUF_X60_Y0_N18
\micro_inst[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(15),
	o => \micro_inst[15]~input_o\);

-- Location: IOIBUF_X74_Y0_N58
\micro_inst[16]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(16),
	o => \micro_inst[16]~input_o\);

-- Location: IOIBUF_X82_Y0_N41
\micro_inst[17]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(17),
	o => \micro_inst[17]~input_o\);

-- Location: IOIBUF_X52_Y0_N35
\micro_inst[18]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(18),
	o => \micro_inst[18]~input_o\);

-- Location: IOIBUF_X68_Y0_N18
\micro_inst[19]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(19),
	o => \micro_inst[19]~input_o\);

-- Location: IOIBUF_X40_Y81_N18
\micro_inst[20]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(20),
	o => \micro_inst[20]~input_o\);

-- Location: IOIBUF_X36_Y81_N1
\micro_inst[21]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(21),
	o => \micro_inst[21]~input_o\);

-- Location: IOIBUF_X50_Y0_N41
\micro_inst[22]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(22),
	o => \micro_inst[22]~input_o\);

-- Location: IOIBUF_X56_Y0_N52
\micro_inst[23]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(23),
	o => \micro_inst[23]~input_o\);

-- Location: IOIBUF_X60_Y0_N52
\micro_inst[24]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(24),
	o => \micro_inst[24]~input_o\);

-- Location: IOIBUF_X6_Y0_N1
\micro_inst[25]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(25),
	o => \micro_inst[25]~input_o\);

-- Location: IOIBUF_X89_Y16_N21
\micro_inst[26]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(26),
	o => \micro_inst[26]~input_o\);

-- Location: IOIBUF_X62_Y0_N1
\micro_inst[27]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(27),
	o => \micro_inst[27]~input_o\);

-- Location: IOIBUF_X6_Y0_N18
\micro_inst[28]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(28),
	o => \micro_inst[28]~input_o\);

-- Location: IOIBUF_X74_Y0_N41
\micro_inst[29]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_micro_inst(29),
	o => \micro_inst[29]~input_o\);

-- Location: IOIBUF_X6_Y81_N1
\mmI[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mmI(0),
	o => \mmI[0]~input_o\);

-- Location: IOIBUF_X32_Y81_N52
\mmI[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mmI(1),
	o => \mmI[1]~input_o\);

-- Location: IOIBUF_X22_Y81_N35
\mmI[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mmI(2),
	o => \mmI[2]~input_o\);

-- Location: IOIBUF_X34_Y0_N58
\mmI[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mmI(3),
	o => \mmI[3]~input_o\);

-- Location: IOIBUF_X86_Y0_N52
\mmI[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mmI(4),
	o => \mmI[4]~input_o\);

-- Location: IOIBUF_X70_Y0_N1
\mmI[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mmI(5),
	o => \mmI[5]~input_o\);

-- Location: IOIBUF_X20_Y81_N52
\mmI[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mmI(6),
	o => \mmI[6]~input_o\);

-- Location: IOIBUF_X86_Y0_N18
\mmI[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mmI(7),
	o => \mmI[7]~input_o\);

-- Location: IOIBUF_X36_Y81_N35
\mmI[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mmI(8),
	o => \mmI[8]~input_o\);

-- Location: IOIBUF_X26_Y0_N75
\mmI[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mmI(9),
	o => \mmI[9]~input_o\);

-- Location: IOIBUF_X14_Y81_N52
\mmI[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mmI(10),
	o => \mmI[10]~input_o\);

-- Location: IOIBUF_X22_Y81_N52
\mmI[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mmI(11),
	o => \mmI[11]~input_o\);

-- Location: IOIBUF_X64_Y0_N1
\mmI[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mmI(12),
	o => \mmI[12]~input_o\);

-- Location: IOIBUF_X16_Y81_N1
\mmI[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mmI(13),
	o => \mmI[13]~input_o\);

-- Location: IOIBUF_X14_Y0_N18
\mmI[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mmI(14),
	o => \mmI[14]~input_o\);

-- Location: IOIBUF_X58_Y0_N75
\mmI[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mmI(15),
	o => \mmI[15]~input_o\);

-- Location: LABCELL_X33_Y59_N0
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


