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

-- DATE "10/28/2020 00:01:21"

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

ENTITY 	hal8080 IS
    PORT (
	clk : IN std_logic;
	seg0 : OUT std_logic_vector(6 DOWNTO 0);
	seg1 : OUT std_logic_vector(6 DOWNTO 0);
	seg2 : OUT std_logic_vector(6 DOWNTO 0);
	seg3 : OUT std_logic_vector(6 DOWNTO 0);
	seg4 : OUT std_logic_vector(6 DOWNTO 0);
	seg5 : OUT std_logic_vector(6 DOWNTO 0);
	leds : OUT std_logic_vector(9 DOWNTO 0);
	switches : IN std_logic_vector(9 DOWNTO 0);
	buttons : IN std_logic_vector(3 DOWNTO 0)
	);
END hal8080;

-- Design Ports Information
-- seg0[0]	=>  Location: PIN_AE26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg0[1]	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg0[2]	=>  Location: PIN_AE28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg0[3]	=>  Location: PIN_AG27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg0[4]	=>  Location: PIN_AF28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg0[5]	=>  Location: PIN_AG28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg0[6]	=>  Location: PIN_AH28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg1[0]	=>  Location: PIN_AJ29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg1[1]	=>  Location: PIN_AH29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg1[2]	=>  Location: PIN_AH30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg1[3]	=>  Location: PIN_AG30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg1[4]	=>  Location: PIN_AF29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg1[5]	=>  Location: PIN_AF30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg1[6]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg2[0]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg2[1]	=>  Location: PIN_AE29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg2[2]	=>  Location: PIN_AD29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg2[3]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg2[4]	=>  Location: PIN_AD30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg2[5]	=>  Location: PIN_AC29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg2[6]	=>  Location: PIN_AC30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg3[0]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg3[1]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg3[2]	=>  Location: PIN_AD25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg3[3]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg3[4]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg3[5]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg3[6]	=>  Location: PIN_AB22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg4[0]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg4[1]	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg4[2]	=>  Location: PIN_Y24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg4[3]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg4[4]	=>  Location: PIN_W24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg4[5]	=>  Location: PIN_V23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg4[6]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg5[0]	=>  Location: PIN_V25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg5[1]	=>  Location: PIN_AA28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg5[2]	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg5[3]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg5[4]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg5[5]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg5[6]	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[0]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[1]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[2]	=>  Location: PIN_V17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[3]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[4]	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[5]	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[6]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[7]	=>  Location: PIN_W20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[8]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds[9]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switches[1]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switches[2]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switches[3]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switches[4]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switches[5]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switches[6]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switches[7]	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switches[8]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switches[9]	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[0]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[1]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[2]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buttons[3]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- switches[0]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF hal8080 IS
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
SIGNAL ww_seg0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_seg1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_seg2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_seg3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_seg4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_seg5 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_leds : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_switches : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_buttons : std_logic_vector(3 DOWNTO 0);
SIGNAL \switches[1]~input_o\ : std_logic;
SIGNAL \switches[2]~input_o\ : std_logic;
SIGNAL \switches[3]~input_o\ : std_logic;
SIGNAL \switches[4]~input_o\ : std_logic;
SIGNAL \switches[5]~input_o\ : std_logic;
SIGNAL \switches[6]~input_o\ : std_logic;
SIGNAL \switches[7]~input_o\ : std_logic;
SIGNAL \switches[8]~input_o\ : std_logic;
SIGNAL \switches[9]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \buttons[0]~input_o\ : std_logic;
SIGNAL \buttons[1]~input_o\ : std_logic;
SIGNAL \buttons[3]~input_o\ : std_logic;
SIGNAL \buttons[2]~input_o\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \setup|address_bus[13]~feeder_combout\ : std_logic;
SIGNAL \setup|Add1~2\ : std_logic;
SIGNAL \setup|Add1~101_sumout\ : std_logic;
SIGNAL \setup|Add0~5_sumout\ : std_logic;
SIGNAL \setup|check_lever[0]~feeder_combout\ : std_logic;
SIGNAL \setup|Add0~6\ : std_logic;
SIGNAL \setup|Add0~1_sumout\ : std_logic;
SIGNAL \setup|Add0~2\ : std_logic;
SIGNAL \setup|Add0~13_sumout\ : std_logic;
SIGNAL \setup|Add0~14\ : std_logic;
SIGNAL \setup|Add0~9_sumout\ : std_logic;
SIGNAL \setup|Add0~10\ : std_logic;
SIGNAL \setup|Add0~25_sumout\ : std_logic;
SIGNAL \setup|Add0~26\ : std_logic;
SIGNAL \setup|Add0~21_sumout\ : std_logic;
SIGNAL \setup|Add0~22\ : std_logic;
SIGNAL \setup|Add0~17_sumout\ : std_logic;
SIGNAL \setup|Add0~18\ : std_logic;
SIGNAL \setup|Add0~33_sumout\ : std_logic;
SIGNAL \setup|check_lever[8]~DUPLICATE_q\ : std_logic;
SIGNAL \setup|Add0~34\ : std_logic;
SIGNAL \setup|Add0~29_sumout\ : std_logic;
SIGNAL \setup|do_cnt~0_combout\ : std_logic;
SIGNAL \setup|Equal0~0_combout\ : std_logic;
SIGNAL \setup|LessThan1~1_combout\ : std_logic;
SIGNAL \setup|LessThan1~0_combout\ : std_logic;
SIGNAL \setup|LessThan1~2_combout\ : std_logic;
SIGNAL \setup|LessThan1~3_combout\ : std_logic;
SIGNAL \setup|LessThan1~4_combout\ : std_logic;
SIGNAL \setup|LessThan1~5_combout\ : std_logic;
SIGNAL \setup|address_bus[13]~0_combout\ : std_logic;
SIGNAL \setup|address_bus~1_combout\ : std_logic;
SIGNAL \setup|do_write~q\ : std_logic;
SIGNAL \memory|mmio[0][0]~0_combout\ : std_logic;
SIGNAL \memory|mmio[0][0]~q\ : std_logic;
SIGNAL \memory|mmio[14][0]~3_combout\ : std_logic;
SIGNAL \memory|mmio[14][0]~q\ : std_logic;
SIGNAL \memory|mmio[8][0]~2_combout\ : std_logic;
SIGNAL \memory|mmio[8][0]~q\ : std_logic;
SIGNAL \memory|mmio[6][0]~1_combout\ : std_logic;
SIGNAL \memory|mmio[6][0]~q\ : std_logic;
SIGNAL \memory|Mux15~0_combout\ : std_logic;
SIGNAL \memory|Decoder1~0_combout\ : std_logic;
SIGNAL \memory|mmio[57344][0]~DUPLICATE_q\ : std_logic;
SIGNAL \memory|Decoder1~1_combout\ : std_logic;
SIGNAL \memory|mmio[57350][0]~q\ : std_logic;
SIGNAL \switches[0]~input_o\ : std_logic;
SIGNAL \memory|mmio[57352][0]~q\ : std_logic;
SIGNAL \setup|do_cnt~3_combout\ : std_logic;
SIGNAL \setup|do_cnt~1_combout\ : std_logic;
SIGNAL \setup|do_cnt~2_combout\ : std_logic;
SIGNAL \setup|do_cnt~4_combout\ : std_logic;
SIGNAL \setup|do_cnt~q\ : std_logic;
SIGNAL \setup|Add1~17_sumout\ : std_logic;
SIGNAL \setup|Add1~18\ : std_logic;
SIGNAL \setup|Add1~21_sumout\ : std_logic;
SIGNAL \setup|Add1~22\ : std_logic;
SIGNAL \setup|Add1~13_sumout\ : std_logic;
SIGNAL \setup|Add1~14\ : std_logic;
SIGNAL \setup|Add1~37_sumout\ : std_logic;
SIGNAL \setup|Add1~38\ : std_logic;
SIGNAL \setup|Add1~33_sumout\ : std_logic;
SIGNAL \setup|cnt[4]~DUPLICATE_q\ : std_logic;
SIGNAL \setup|Add1~34\ : std_logic;
SIGNAL \setup|Add1~29_sumout\ : std_logic;
SIGNAL \setup|Add1~30\ : std_logic;
SIGNAL \setup|Add1~25_sumout\ : std_logic;
SIGNAL \setup|Add1~26\ : std_logic;
SIGNAL \setup|Add1~57_sumout\ : std_logic;
SIGNAL \setup|Add1~58\ : std_logic;
SIGNAL \setup|Add1~53_sumout\ : std_logic;
SIGNAL \setup|Add1~54\ : std_logic;
SIGNAL \setup|Add1~49_sumout\ : std_logic;
SIGNAL \setup|Add1~50\ : std_logic;
SIGNAL \setup|Add1~45_sumout\ : std_logic;
SIGNAL \setup|cnt[10]~DUPLICATE_q\ : std_logic;
SIGNAL \setup|Add1~46\ : std_logic;
SIGNAL \setup|Add1~41_sumout\ : std_logic;
SIGNAL \setup|cnt[11]~DUPLICATE_q\ : std_logic;
SIGNAL \setup|Add1~42\ : std_logic;
SIGNAL \setup|Add1~77_sumout\ : std_logic;
SIGNAL \setup|Add1~78\ : std_logic;
SIGNAL \setup|Add1~73_sumout\ : std_logic;
SIGNAL \setup|Add1~74\ : std_logic;
SIGNAL \setup|Add1~69_sumout\ : std_logic;
SIGNAL \setup|Add1~70\ : std_logic;
SIGNAL \setup|Add1~65_sumout\ : std_logic;
SIGNAL \setup|Add1~66\ : std_logic;
SIGNAL \setup|Add1~9_sumout\ : std_logic;
SIGNAL \setup|cnt[16]~DUPLICATE_q\ : std_logic;
SIGNAL \setup|Add1~10\ : std_logic;
SIGNAL \setup|Add1~61_sumout\ : std_logic;
SIGNAL \setup|cnt[17]~DUPLICATE_q\ : std_logic;
SIGNAL \setup|Add1~62\ : std_logic;
SIGNAL \setup|Add1~5_sumout\ : std_logic;
SIGNAL \setup|Add1~6\ : std_logic;
SIGNAL \setup|Add1~97_sumout\ : std_logic;
SIGNAL \setup|cnt[19]~DUPLICATE_q\ : std_logic;
SIGNAL \setup|Add1~98\ : std_logic;
SIGNAL \setup|Add1~93_sumout\ : std_logic;
SIGNAL \setup|Add1~94\ : std_logic;
SIGNAL \setup|Add1~89_sumout\ : std_logic;
SIGNAL \setup|Add1~90\ : std_logic;
SIGNAL \setup|Add1~85_sumout\ : std_logic;
SIGNAL \setup|Add1~86\ : std_logic;
SIGNAL \setup|Add1~81_sumout\ : std_logic;
SIGNAL \setup|cnt[23]~DUPLICATE_q\ : std_logic;
SIGNAL \setup|Add1~82\ : std_logic;
SIGNAL \setup|Add1~1_sumout\ : std_logic;
SIGNAL \setup|LessThan1~6_combout\ : std_logic;
SIGNAL \setup|ledcnt[0]~0_combout\ : std_logic;
SIGNAL \setup|ledcnt[0]~DUPLICATE_q\ : std_logic;
SIGNAL \setup|data_bus_out[0]~feeder_combout\ : std_logic;
SIGNAL \setup|data_bus_out[0]~0_combout\ : std_logic;
SIGNAL \memory|mmio[57344][0]~4_combout\ : std_logic;
SIGNAL \memory|mmio[57344][0]~q\ : std_logic;
SIGNAL \setup|Add2~1_sumout\ : std_logic;
SIGNAL \memory|mmio[57344][1]~5_combout\ : std_logic;
SIGNAL \memory|mmio[57344][1]~q\ : std_logic;
SIGNAL \setup|Add2~2\ : std_logic;
SIGNAL \setup|Add2~5_sumout\ : std_logic;
SIGNAL \memory|mmio[57344][2]~6_combout\ : std_logic;
SIGNAL \memory|mmio[57344][2]~q\ : std_logic;
SIGNAL \setup|Add2~6\ : std_logic;
SIGNAL \setup|Add2~9_sumout\ : std_logic;
SIGNAL \memory|mmio[57344][3]~7_combout\ : std_logic;
SIGNAL \memory|mmio[57344][3]~q\ : std_logic;
SIGNAL \setup|Add2~10\ : std_logic;
SIGNAL \setup|Add2~13_sumout\ : std_logic;
SIGNAL \memory|mmio[57344][4]~8_combout\ : std_logic;
SIGNAL \memory|mmio[57344][4]~q\ : std_logic;
SIGNAL \setup|Add2~14\ : std_logic;
SIGNAL \setup|Add2~17_sumout\ : std_logic;
SIGNAL \memory|mmio[57344][5]~9_combout\ : std_logic;
SIGNAL \memory|mmio[57344][5]~q\ : std_logic;
SIGNAL \setup|Add2~18\ : std_logic;
SIGNAL \setup|Add2~21_sumout\ : std_logic;
SIGNAL \memory|mmio[57344][6]~10_combout\ : std_logic;
SIGNAL \memory|mmio[57344][6]~q\ : std_logic;
SIGNAL \setup|Add2~22\ : std_logic;
SIGNAL \setup|Add2~33_sumout\ : std_logic;
SIGNAL \setup|Add2~34\ : std_logic;
SIGNAL \setup|Add2~25_sumout\ : std_logic;
SIGNAL \memory|mmio[57345][0]~11_combout\ : std_logic;
SIGNAL \memory|mmio[57345][0]~q\ : std_logic;
SIGNAL \setup|Add2~26\ : std_logic;
SIGNAL \setup|Add2~29_sumout\ : std_logic;
SIGNAL \memory|mmio[57345][1]~12_combout\ : std_logic;
SIGNAL \memory|mmio[57345][1]~q\ : std_logic;
SIGNAL \memory|mmio[57345][2]~feeder_combout\ : std_logic;
SIGNAL \memory|mmio[57345][2]~q\ : std_logic;
SIGNAL \memory|mmio[57350][1]~feeder_combout\ : std_logic;
SIGNAL \memory|mmio[57350][1]~q\ : std_logic;
SIGNAL \memory|mmio[57350][2]~feeder_combout\ : std_logic;
SIGNAL \memory|mmio[57350][2]~q\ : std_logic;
SIGNAL \memory|mmio[57350][3]~feeder_combout\ : std_logic;
SIGNAL \memory|mmio[57350][3]~q\ : std_logic;
SIGNAL \memory|mmio[57350][4]~feeder_combout\ : std_logic;
SIGNAL \memory|mmio[57350][4]~q\ : std_logic;
SIGNAL \memory|mmio[57350][5]~q\ : std_logic;
SIGNAL \memory|mmio[57350][6]~feeder_combout\ : std_logic;
SIGNAL \memory|mmio[57350][6]~q\ : std_logic;
SIGNAL \setup|data_bus_out[7]~feeder_combout\ : std_logic;
SIGNAL \memory|mmio[57350][7]~feeder_combout\ : std_logic;
SIGNAL \memory|mmio[57350][7]~q\ : std_logic;
SIGNAL \memory|mmio[57351][0]~feeder_combout\ : std_logic;
SIGNAL \memory|mmio[57351][0]~q\ : std_logic;
SIGNAL \memory|mmio[57351][1]~feeder_combout\ : std_logic;
SIGNAL \memory|mmio[57351][1]~q\ : std_logic;
SIGNAL \setup|cnt\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \setup|check_lever\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \setup|data_bus_out\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \setup|address_bus\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \setup|ledcnt\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \setup|ALT_INV_cnt\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \setup|ALT_INV_ledcnt[0]~DUPLICATE_q\ : std_logic;
SIGNAL \memory|ALT_INV_mmio[57344][0]~DUPLICATE_q\ : std_logic;
SIGNAL \setup|ALT_INV_check_lever[8]~DUPLICATE_q\ : std_logic;
SIGNAL \setup|ALT_INV_cnt[19]~DUPLICATE_q\ : std_logic;
SIGNAL \setup|ALT_INV_cnt[23]~DUPLICATE_q\ : std_logic;
SIGNAL \setup|ALT_INV_cnt[17]~DUPLICATE_q\ : std_logic;
SIGNAL \setup|ALT_INV_cnt[10]~DUPLICATE_q\ : std_logic;
SIGNAL \setup|ALT_INV_cnt[11]~DUPLICATE_q\ : std_logic;
SIGNAL \setup|ALT_INV_cnt[4]~DUPLICATE_q\ : std_logic;
SIGNAL \setup|ALT_INV_cnt[16]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_buttons[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_buttons[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_buttons[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_buttons[0]~input_o\ : std_logic;
SIGNAL \setup|ALT_INV_do_cnt~3_combout\ : std_logic;
SIGNAL \memory|ALT_INV_mmio[57352][0]~q\ : std_logic;
SIGNAL \memory|ALT_INV_Mux15~0_combout\ : std_logic;
SIGNAL \memory|ALT_INV_mmio[14][0]~q\ : std_logic;
SIGNAL \memory|ALT_INV_mmio[8][0]~q\ : std_logic;
SIGNAL \memory|ALT_INV_mmio[6][0]~q\ : std_logic;
SIGNAL \memory|ALT_INV_mmio[0][0]~q\ : std_logic;
SIGNAL \setup|ALT_INV_do_cnt~2_combout\ : std_logic;
SIGNAL \setup|ALT_INV_do_cnt~1_combout\ : std_logic;
SIGNAL \setup|ALT_INV_do_cnt~q\ : std_logic;
SIGNAL \setup|ALT_INV_ledcnt\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \setup|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \setup|ALT_INV_do_cnt~0_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \setup|ALT_INV_LessThan1~5_combout\ : std_logic;
SIGNAL \setup|ALT_INV_LessThan1~4_combout\ : std_logic;
SIGNAL \setup|ALT_INV_LessThan1~3_combout\ : std_logic;
SIGNAL \setup|ALT_INV_LessThan1~2_combout\ : std_logic;
SIGNAL \setup|ALT_INV_LessThan1~1_combout\ : std_logic;
SIGNAL \setup|ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL \setup|ALT_INV_data_bus_out\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \setup|ALT_INV_address_bus\ : std_logic_vector(13 DOWNTO 1);
SIGNAL \setup|ALT_INV_do_write~q\ : std_logic;
SIGNAL \memory|ALT_INV_mmio[57350][0]~q\ : std_logic;
SIGNAL \memory|ALT_INV_mmio[57345][2]~q\ : std_logic;
SIGNAL \memory|ALT_INV_mmio[57345][1]~q\ : std_logic;
SIGNAL \memory|ALT_INV_mmio[57345][0]~q\ : std_logic;
SIGNAL \memory|ALT_INV_mmio[57344][6]~q\ : std_logic;
SIGNAL \memory|ALT_INV_mmio[57344][5]~q\ : std_logic;
SIGNAL \memory|ALT_INV_mmio[57344][4]~q\ : std_logic;
SIGNAL \memory|ALT_INV_mmio[57344][3]~q\ : std_logic;
SIGNAL \memory|ALT_INV_mmio[57344][2]~q\ : std_logic;
SIGNAL \memory|ALT_INV_mmio[57344][1]~q\ : std_logic;
SIGNAL \memory|ALT_INV_mmio[57344][0]~q\ : std_logic;
SIGNAL \setup|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \setup|ALT_INV_check_lever\ : std_logic_vector(8 DOWNTO 0);

BEGIN

ww_clk <= clk;
seg0 <= ww_seg0;
seg1 <= ww_seg1;
seg2 <= ww_seg2;
seg3 <= ww_seg3;
seg4 <= ww_seg4;
seg5 <= ww_seg5;
leds <= ww_leds;
ww_switches <= switches;
ww_buttons <= buttons;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\setup|ALT_INV_cnt\(25) <= NOT \setup|cnt\(25);
\setup|ALT_INV_cnt\(19) <= NOT \setup|cnt\(19);
\setup|ALT_INV_cnt\(20) <= NOT \setup|cnt\(20);
\setup|ALT_INV_cnt\(21) <= NOT \setup|cnt\(21);
\setup|ALT_INV_cnt\(22) <= NOT \setup|cnt\(22);
\setup|ALT_INV_cnt\(23) <= NOT \setup|cnt\(23);
\setup|ALT_INV_cnt\(12) <= NOT \setup|cnt\(12);
\setup|ALT_INV_cnt\(13) <= NOT \setup|cnt\(13);
\setup|ALT_INV_cnt\(14) <= NOT \setup|cnt\(14);
\setup|ALT_INV_cnt\(15) <= NOT \setup|cnt\(15);
\setup|ALT_INV_cnt\(17) <= NOT \setup|cnt\(17);
\setup|ALT_INV_cnt\(7) <= NOT \setup|cnt\(7);
\setup|ALT_INV_cnt\(8) <= NOT \setup|cnt\(8);
\setup|ALT_INV_cnt\(9) <= NOT \setup|cnt\(9);
\setup|ALT_INV_cnt\(10) <= NOT \setup|cnt\(10);
\setup|ALT_INV_cnt\(11) <= NOT \setup|cnt\(11);
\setup|ALT_INV_cnt\(3) <= NOT \setup|cnt\(3);
\setup|ALT_INV_cnt\(4) <= NOT \setup|cnt\(4);
\setup|ALT_INV_cnt\(5) <= NOT \setup|cnt\(5);
\setup|ALT_INV_cnt\(6) <= NOT \setup|cnt\(6);
\setup|ALT_INV_cnt\(1) <= NOT \setup|cnt\(1);
\setup|ALT_INV_cnt\(0) <= NOT \setup|cnt\(0);
\setup|ALT_INV_cnt\(2) <= NOT \setup|cnt\(2);
\setup|ALT_INV_cnt\(16) <= NOT \setup|cnt\(16);
\setup|ALT_INV_cnt\(18) <= NOT \setup|cnt\(18);
\setup|ALT_INV_cnt\(24) <= NOT \setup|cnt\(24);
\setup|ALT_INV_ledcnt[0]~DUPLICATE_q\ <= NOT \setup|ledcnt[0]~DUPLICATE_q\;
\memory|ALT_INV_mmio[57344][0]~DUPLICATE_q\ <= NOT \memory|mmio[57344][0]~DUPLICATE_q\;
\setup|ALT_INV_check_lever[8]~DUPLICATE_q\ <= NOT \setup|check_lever[8]~DUPLICATE_q\;
\setup|ALT_INV_cnt[19]~DUPLICATE_q\ <= NOT \setup|cnt[19]~DUPLICATE_q\;
\setup|ALT_INV_cnt[23]~DUPLICATE_q\ <= NOT \setup|cnt[23]~DUPLICATE_q\;
\setup|ALT_INV_cnt[17]~DUPLICATE_q\ <= NOT \setup|cnt[17]~DUPLICATE_q\;
\setup|ALT_INV_cnt[10]~DUPLICATE_q\ <= NOT \setup|cnt[10]~DUPLICATE_q\;
\setup|ALT_INV_cnt[11]~DUPLICATE_q\ <= NOT \setup|cnt[11]~DUPLICATE_q\;
\setup|ALT_INV_cnt[4]~DUPLICATE_q\ <= NOT \setup|cnt[4]~DUPLICATE_q\;
\setup|ALT_INV_cnt[16]~DUPLICATE_q\ <= NOT \setup|cnt[16]~DUPLICATE_q\;
\ALT_INV_buttons[3]~input_o\ <= NOT \buttons[3]~input_o\;
\ALT_INV_buttons[2]~input_o\ <= NOT \buttons[2]~input_o\;
\ALT_INV_buttons[1]~input_o\ <= NOT \buttons[1]~input_o\;
\ALT_INV_buttons[0]~input_o\ <= NOT \buttons[0]~input_o\;
\setup|ALT_INV_do_cnt~3_combout\ <= NOT \setup|do_cnt~3_combout\;
\memory|ALT_INV_mmio[57352][0]~q\ <= NOT \memory|mmio[57352][0]~q\;
\memory|ALT_INV_Mux15~0_combout\ <= NOT \memory|Mux15~0_combout\;
\memory|ALT_INV_mmio[14][0]~q\ <= NOT \memory|mmio[14][0]~q\;
\memory|ALT_INV_mmio[8][0]~q\ <= NOT \memory|mmio[8][0]~q\;
\memory|ALT_INV_mmio[6][0]~q\ <= NOT \memory|mmio[6][0]~q\;
\memory|ALT_INV_mmio[0][0]~q\ <= NOT \memory|mmio[0][0]~q\;
\setup|ALT_INV_do_cnt~2_combout\ <= NOT \setup|do_cnt~2_combout\;
\setup|ALT_INV_do_cnt~1_combout\ <= NOT \setup|do_cnt~1_combout\;
\setup|ALT_INV_do_cnt~q\ <= NOT \setup|do_cnt~q\;
\setup|ALT_INV_ledcnt\(7) <= NOT \setup|ledcnt\(7);
\setup|ALT_INV_ledcnt\(9) <= NOT \setup|ledcnt\(9);
\setup|ALT_INV_ledcnt\(8) <= NOT \setup|ledcnt\(8);
\setup|ALT_INV_ledcnt\(6) <= NOT \setup|ledcnt\(6);
\setup|ALT_INV_ledcnt\(5) <= NOT \setup|ledcnt\(5);
\setup|ALT_INV_ledcnt\(4) <= NOT \setup|ledcnt\(4);
\setup|ALT_INV_ledcnt\(3) <= NOT \setup|ledcnt\(3);
\setup|ALT_INV_ledcnt\(2) <= NOT \setup|ledcnt\(2);
\setup|ALT_INV_ledcnt\(1) <= NOT \setup|ledcnt\(1);
\setup|ALT_INV_Equal0~0_combout\ <= NOT \setup|Equal0~0_combout\;
\setup|ALT_INV_do_cnt~0_combout\ <= NOT \setup|do_cnt~0_combout\;
\ALT_INV_Equal0~0_combout\ <= NOT \Equal0~0_combout\;
\setup|ALT_INV_LessThan1~5_combout\ <= NOT \setup|LessThan1~5_combout\;
\setup|ALT_INV_LessThan1~4_combout\ <= NOT \setup|LessThan1~4_combout\;
\setup|ALT_INV_LessThan1~3_combout\ <= NOT \setup|LessThan1~3_combout\;
\setup|ALT_INV_LessThan1~2_combout\ <= NOT \setup|LessThan1~2_combout\;
\setup|ALT_INV_LessThan1~1_combout\ <= NOT \setup|LessThan1~1_combout\;
\setup|ALT_INV_LessThan1~0_combout\ <= NOT \setup|LessThan1~0_combout\;
\setup|ALT_INV_ledcnt\(0) <= NOT \setup|ledcnt\(0);
\setup|ALT_INV_data_bus_out\(7) <= NOT \setup|data_bus_out\(7);
\setup|ALT_INV_data_bus_out\(9) <= NOT \setup|data_bus_out\(9);
\setup|ALT_INV_data_bus_out\(8) <= NOT \setup|data_bus_out\(8);
\setup|ALT_INV_data_bus_out\(6) <= NOT \setup|data_bus_out\(6);
\setup|ALT_INV_data_bus_out\(5) <= NOT \setup|data_bus_out\(5);
\setup|ALT_INV_data_bus_out\(4) <= NOT \setup|data_bus_out\(4);
\setup|ALT_INV_data_bus_out\(3) <= NOT \setup|data_bus_out\(3);
\setup|ALT_INV_data_bus_out\(2) <= NOT \setup|data_bus_out\(2);
\setup|ALT_INV_data_bus_out\(1) <= NOT \setup|data_bus_out\(1);
\setup|ALT_INV_address_bus\(3) <= NOT \setup|address_bus\(3);
\setup|ALT_INV_address_bus\(13) <= NOT \setup|address_bus\(13);
\setup|ALT_INV_do_write~q\ <= NOT \setup|do_write~q\;
\setup|ALT_INV_address_bus\(1) <= NOT \setup|address_bus\(1);
\setup|ALT_INV_data_bus_out\(0) <= NOT \setup|data_bus_out\(0);
\memory|ALT_INV_mmio[57350][0]~q\ <= NOT \memory|mmio[57350][0]~q\;
\memory|ALT_INV_mmio[57345][2]~q\ <= NOT \memory|mmio[57345][2]~q\;
\memory|ALT_INV_mmio[57345][1]~q\ <= NOT \memory|mmio[57345][1]~q\;
\memory|ALT_INV_mmio[57345][0]~q\ <= NOT \memory|mmio[57345][0]~q\;
\memory|ALT_INV_mmio[57344][6]~q\ <= NOT \memory|mmio[57344][6]~q\;
\memory|ALT_INV_mmio[57344][5]~q\ <= NOT \memory|mmio[57344][5]~q\;
\memory|ALT_INV_mmio[57344][4]~q\ <= NOT \memory|mmio[57344][4]~q\;
\memory|ALT_INV_mmio[57344][3]~q\ <= NOT \memory|mmio[57344][3]~q\;
\memory|ALT_INV_mmio[57344][2]~q\ <= NOT \memory|mmio[57344][2]~q\;
\memory|ALT_INV_mmio[57344][1]~q\ <= NOT \memory|mmio[57344][1]~q\;
\memory|ALT_INV_mmio[57344][0]~q\ <= NOT \memory|mmio[57344][0]~q\;
\setup|ALT_INV_Add0~5_sumout\ <= NOT \setup|Add0~5_sumout\;
\setup|ALT_INV_check_lever\(7) <= NOT \setup|check_lever\(7);
\setup|ALT_INV_check_lever\(8) <= NOT \setup|check_lever\(8);
\setup|ALT_INV_check_lever\(4) <= NOT \setup|check_lever\(4);
\setup|ALT_INV_check_lever\(5) <= NOT \setup|check_lever\(5);
\setup|ALT_INV_check_lever\(6) <= NOT \setup|check_lever\(6);
\setup|ALT_INV_check_lever\(2) <= NOT \setup|check_lever\(2);
\setup|ALT_INV_check_lever\(3) <= NOT \setup|check_lever\(3);
\setup|ALT_INV_check_lever\(0) <= NOT \setup|check_lever\(0);
\setup|ALT_INV_check_lever\(1) <= NOT \setup|check_lever\(1);

-- Location: IOOBUF_X89_Y8_N39
\seg0[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|ALT_INV_mmio[57344][0]~q\,
	devoe => ww_devoe,
	o => ww_seg0(0));

-- Location: IOOBUF_X89_Y11_N79
\seg0[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|ALT_INV_mmio[57344][1]~q\,
	devoe => ww_devoe,
	o => ww_seg0(1));

-- Location: IOOBUF_X89_Y11_N96
\seg0[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|ALT_INV_mmio[57344][2]~q\,
	devoe => ww_devoe,
	o => ww_seg0(2));

-- Location: IOOBUF_X89_Y4_N79
\seg0[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|ALT_INV_mmio[57344][3]~q\,
	devoe => ww_devoe,
	o => ww_seg0(3));

-- Location: IOOBUF_X89_Y13_N56
\seg0[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|ALT_INV_mmio[57344][4]~q\,
	devoe => ww_devoe,
	o => ww_seg0(4));

-- Location: IOOBUF_X89_Y13_N39
\seg0[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|ALT_INV_mmio[57344][5]~q\,
	devoe => ww_devoe,
	o => ww_seg0(5));

-- Location: IOOBUF_X89_Y4_N96
\seg0[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|ALT_INV_mmio[57344][6]~q\,
	devoe => ww_devoe,
	o => ww_seg0(6));

-- Location: IOOBUF_X89_Y6_N39
\seg1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|ALT_INV_mmio[57345][0]~q\,
	devoe => ww_devoe,
	o => ww_seg1(0));

-- Location: IOOBUF_X89_Y6_N56
\seg1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|ALT_INV_mmio[57345][1]~q\,
	devoe => ww_devoe,
	o => ww_seg1(1));

-- Location: IOOBUF_X89_Y16_N39
\seg1[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|ALT_INV_mmio[57345][2]~q\,
	devoe => ww_devoe,
	o => ww_seg1(2));

-- Location: IOOBUF_X89_Y16_N56
\seg1[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|ALT_INV_mmio[57345][2]~q\,
	devoe => ww_devoe,
	o => ww_seg1(3));

-- Location: IOOBUF_X89_Y15_N39
\seg1[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|ALT_INV_mmio[57345][2]~q\,
	devoe => ww_devoe,
	o => ww_seg1(4));

-- Location: IOOBUF_X89_Y15_N56
\seg1[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|ALT_INV_mmio[57345][2]~q\,
	devoe => ww_devoe,
	o => ww_seg1(5));

-- Location: IOOBUF_X89_Y8_N56
\seg1[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|ALT_INV_mmio[57345][2]~q\,
	devoe => ww_devoe,
	o => ww_seg1(6));

-- Location: IOOBUF_X89_Y9_N22
\seg2[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg2(0));

-- Location: IOOBUF_X89_Y23_N39
\seg2[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg2(1));

-- Location: IOOBUF_X89_Y23_N56
\seg2[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg2(2));

-- Location: IOOBUF_X89_Y20_N79
\seg2[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg2(3));

-- Location: IOOBUF_X89_Y25_N39
\seg2[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg2(4));

-- Location: IOOBUF_X89_Y20_N96
\seg2[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg2(5));

-- Location: IOOBUF_X89_Y25_N56
\seg2[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg2(6));

-- Location: IOOBUF_X89_Y16_N5
\seg3[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg3(0));

-- Location: IOOBUF_X89_Y16_N22
\seg3[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg3(1));

-- Location: IOOBUF_X89_Y4_N45
\seg3[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg3(2));

-- Location: IOOBUF_X89_Y4_N62
\seg3[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg3(3));

-- Location: IOOBUF_X89_Y21_N39
\seg3[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg3(4));

-- Location: IOOBUF_X89_Y11_N62
\seg3[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg3(5));

-- Location: IOOBUF_X89_Y9_N5
\seg3[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg3(6));

-- Location: IOOBUF_X89_Y11_N45
\seg4[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg4(0));

-- Location: IOOBUF_X89_Y13_N5
\seg4[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg4(1));

-- Location: IOOBUF_X89_Y13_N22
\seg4[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg4(2));

-- Location: IOOBUF_X89_Y8_N22
\seg4[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg4(3));

-- Location: IOOBUF_X89_Y15_N22
\seg4[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg4(4));

-- Location: IOOBUF_X89_Y15_N5
\seg4[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg4(5));

-- Location: IOOBUF_X89_Y20_N45
\seg4[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg4(6));

-- Location: IOOBUF_X89_Y20_N62
\seg5[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg5(0));

-- Location: IOOBUF_X89_Y21_N56
\seg5[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg5(1));

-- Location: IOOBUF_X89_Y25_N22
\seg5[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg5(2));

-- Location: IOOBUF_X89_Y23_N22
\seg5[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg5(3));

-- Location: IOOBUF_X89_Y9_N56
\seg5[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg5(4));

-- Location: IOOBUF_X89_Y23_N5
\seg5[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg5(5));

-- Location: IOOBUF_X89_Y9_N39
\seg5[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_seg5(6));

-- Location: IOOBUF_X52_Y0_N2
\leds[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|mmio[57350][0]~q\,
	devoe => ww_devoe,
	o => ww_leds(0));

-- Location: IOOBUF_X52_Y0_N19
\leds[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|mmio[57350][1]~q\,
	devoe => ww_devoe,
	o => ww_leds(1));

-- Location: IOOBUF_X60_Y0_N2
\leds[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|mmio[57350][2]~q\,
	devoe => ww_devoe,
	o => ww_leds(2));

-- Location: IOOBUF_X80_Y0_N2
\leds[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|mmio[57350][3]~q\,
	devoe => ww_devoe,
	o => ww_leds(3));

-- Location: IOOBUF_X60_Y0_N19
\leds[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|mmio[57350][4]~q\,
	devoe => ww_devoe,
	o => ww_leds(4));

-- Location: IOOBUF_X80_Y0_N19
\leds[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|mmio[57350][5]~q\,
	devoe => ww_devoe,
	o => ww_leds(5));

-- Location: IOOBUF_X84_Y0_N2
\leds[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|mmio[57350][6]~q\,
	devoe => ww_devoe,
	o => ww_leds(6));

-- Location: IOOBUF_X89_Y6_N5
\leds[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|mmio[57350][7]~q\,
	devoe => ww_devoe,
	o => ww_leds(7));

-- Location: IOOBUF_X89_Y8_N5
\leds[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|mmio[57351][0]~q\,
	devoe => ww_devoe,
	o => ww_leds(8));

-- Location: IOOBUF_X89_Y6_N22
\leds[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memory|mmio[57351][1]~q\,
	devoe => ww_devoe,
	o => ww_leds(9));

-- Location: IOIBUF_X32_Y0_N1
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G6
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

-- Location: IOIBUF_X36_Y0_N1
\buttons[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buttons(0),
	o => \buttons[0]~input_o\);

-- Location: IOIBUF_X36_Y0_N18
\buttons[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buttons(1),
	o => \buttons[1]~input_o\);

-- Location: IOIBUF_X40_Y0_N18
\buttons[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buttons(3),
	o => \buttons[3]~input_o\);

-- Location: IOIBUF_X40_Y0_N1
\buttons[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buttons(2),
	o => \buttons[2]~input_o\);

-- Location: MLABCELL_X84_Y7_N45
\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( !\buttons[3]~input_o\ & ( !\buttons[2]~input_o\ & ( (!\buttons[0]~input_o\ & !\buttons[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_buttons[0]~input_o\,
	datac => \ALT_INV_buttons[1]~input_o\,
	datae => \ALT_INV_buttons[3]~input_o\,
	dataf => \ALT_INV_buttons[2]~input_o\,
	combout => \Equal0~0_combout\);

-- Location: MLABCELL_X87_Y8_N33
\setup|address_bus[13]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|address_bus[13]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \setup|address_bus[13]~feeder_combout\);

-- Location: LABCELL_X88_Y7_N42
\setup|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~1_sumout\ = SUM(( \setup|cnt\(24) ) + ( GND ) + ( \setup|Add1~82\ ))
-- \setup|Add1~2\ = CARRY(( \setup|cnt\(24) ) + ( GND ) + ( \setup|Add1~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \setup|ALT_INV_cnt\(24),
	cin => \setup|Add1~82\,
	sumout => \setup|Add1~1_sumout\,
	cout => \setup|Add1~2\);

-- Location: LABCELL_X88_Y7_N45
\setup|Add1~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~101_sumout\ = SUM(( \setup|cnt\(25) ) + ( GND ) + ( \setup|Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \setup|ALT_INV_cnt\(25),
	cin => \setup|Add1~2\,
	sumout => \setup|Add1~101_sumout\);

-- Location: FF_X88_Y7_N46
\setup|cnt[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~101_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(25));

-- Location: MLABCELL_X87_Y8_N0
\setup|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add0~5_sumout\ = SUM(( \setup|check_lever\(0) ) + ( VCC ) + ( !VCC ))
-- \setup|Add0~6\ = CARRY(( \setup|check_lever\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_check_lever\(0),
	cin => GND,
	sumout => \setup|Add0~5_sumout\,
	cout => \setup|Add0~6\);

-- Location: LABCELL_X88_Y8_N15
\setup|check_lever[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|check_lever[0]~feeder_combout\ = ( \setup|Add0~5_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \setup|ALT_INV_Add0~5_sumout\,
	combout => \setup|check_lever[0]~feeder_combout\);

-- Location: FF_X88_Y8_N17
\setup|check_lever[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|check_lever[0]~feeder_combout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|check_lever\(0));

-- Location: MLABCELL_X87_Y8_N3
\setup|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add0~1_sumout\ = SUM(( \setup|check_lever\(1) ) + ( GND ) + ( \setup|Add0~6\ ))
-- \setup|Add0~2\ = CARRY(( \setup|check_lever\(1) ) + ( GND ) + ( \setup|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_check_lever\(1),
	cin => \setup|Add0~6\,
	sumout => \setup|Add0~1_sumout\,
	cout => \setup|Add0~2\);

-- Location: FF_X87_Y8_N5
\setup|check_lever[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add0~1_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|check_lever\(1));

-- Location: MLABCELL_X87_Y8_N6
\setup|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add0~13_sumout\ = SUM(( \setup|check_lever\(2) ) + ( GND ) + ( \setup|Add0~2\ ))
-- \setup|Add0~14\ = CARRY(( \setup|check_lever\(2) ) + ( GND ) + ( \setup|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_check_lever\(2),
	cin => \setup|Add0~2\,
	sumout => \setup|Add0~13_sumout\,
	cout => \setup|Add0~14\);

-- Location: FF_X87_Y8_N8
\setup|check_lever[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add0~13_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|check_lever\(2));

-- Location: MLABCELL_X87_Y8_N9
\setup|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add0~9_sumout\ = SUM(( \setup|check_lever\(3) ) + ( GND ) + ( \setup|Add0~14\ ))
-- \setup|Add0~10\ = CARRY(( \setup|check_lever\(3) ) + ( GND ) + ( \setup|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_check_lever\(3),
	cin => \setup|Add0~14\,
	sumout => \setup|Add0~9_sumout\,
	cout => \setup|Add0~10\);

-- Location: FF_X87_Y8_N11
\setup|check_lever[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add0~9_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|check_lever\(3));

-- Location: MLABCELL_X87_Y8_N12
\setup|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add0~25_sumout\ = SUM(( \setup|check_lever\(4) ) + ( GND ) + ( \setup|Add0~10\ ))
-- \setup|Add0~26\ = CARRY(( \setup|check_lever\(4) ) + ( GND ) + ( \setup|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_check_lever\(4),
	cin => \setup|Add0~10\,
	sumout => \setup|Add0~25_sumout\,
	cout => \setup|Add0~26\);

-- Location: FF_X87_Y8_N14
\setup|check_lever[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add0~25_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|check_lever\(4));

-- Location: MLABCELL_X87_Y8_N15
\setup|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add0~21_sumout\ = SUM(( \setup|check_lever\(5) ) + ( GND ) + ( \setup|Add0~26\ ))
-- \setup|Add0~22\ = CARRY(( \setup|check_lever\(5) ) + ( GND ) + ( \setup|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_check_lever\(5),
	cin => \setup|Add0~26\,
	sumout => \setup|Add0~21_sumout\,
	cout => \setup|Add0~22\);

-- Location: FF_X87_Y8_N17
\setup|check_lever[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add0~21_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|check_lever\(5));

-- Location: MLABCELL_X87_Y8_N18
\setup|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add0~17_sumout\ = SUM(( \setup|check_lever\(6) ) + ( GND ) + ( \setup|Add0~22\ ))
-- \setup|Add0~18\ = CARRY(( \setup|check_lever\(6) ) + ( GND ) + ( \setup|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_check_lever\(6),
	cin => \setup|Add0~22\,
	sumout => \setup|Add0~17_sumout\,
	cout => \setup|Add0~18\);

-- Location: FF_X87_Y8_N20
\setup|check_lever[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add0~17_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|check_lever\(6));

-- Location: MLABCELL_X87_Y8_N21
\setup|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add0~33_sumout\ = SUM(( \setup|check_lever\(7) ) + ( GND ) + ( \setup|Add0~18\ ))
-- \setup|Add0~34\ = CARRY(( \setup|check_lever\(7) ) + ( GND ) + ( \setup|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_check_lever\(7),
	cin => \setup|Add0~18\,
	sumout => \setup|Add0~33_sumout\,
	cout => \setup|Add0~34\);

-- Location: FF_X87_Y8_N23
\setup|check_lever[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add0~33_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|check_lever\(7));

-- Location: FF_X88_Y7_N58
\setup|check_lever[8]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \setup|Add0~29_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|check_lever[8]~DUPLICATE_q\);

-- Location: MLABCELL_X87_Y8_N24
\setup|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add0~29_sumout\ = SUM(( \setup|check_lever[8]~DUPLICATE_q\ ) + ( GND ) + ( \setup|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_check_lever[8]~DUPLICATE_q\,
	cin => \setup|Add0~34\,
	sumout => \setup|Add0~29_sumout\);

-- Location: FF_X88_Y7_N59
\setup|check_lever[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \setup|Add0~29_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|check_lever\(8));

-- Location: MLABCELL_X87_Y8_N57
\setup|do_cnt~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|do_cnt~0_combout\ = ( \setup|check_lever\(7) & ( \setup|check_lever\(8) & ( (\setup|check_lever\(4) & (\setup|check_lever\(5) & \setup|check_lever\(6))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \setup|ALT_INV_check_lever\(4),
	datac => \setup|ALT_INV_check_lever\(5),
	datad => \setup|ALT_INV_check_lever\(6),
	datae => \setup|ALT_INV_check_lever\(7),
	dataf => \setup|ALT_INV_check_lever\(8),
	combout => \setup|do_cnt~0_combout\);

-- Location: MLABCELL_X87_Y8_N45
\setup|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Equal0~0_combout\ = ( \setup|check_lever\(1) & ( \setup|do_cnt~0_combout\ & ( (!\setup|check_lever\(0) & (!\setup|check_lever\(3) & !\setup|check_lever\(2))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \setup|ALT_INV_check_lever\(0),
	datab => \setup|ALT_INV_check_lever\(3),
	datac => \setup|ALT_INV_check_lever\(2),
	datae => \setup|ALT_INV_check_lever\(1),
	dataf => \setup|ALT_INV_do_cnt~0_combout\,
	combout => \setup|Equal0~0_combout\);

-- Location: FF_X88_Y7_N19
\setup|cnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~9_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(16));

-- Location: FF_X87_Y8_N55
\setup|cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \setup|Add1~41_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(11));

-- Location: FF_X88_Y7_N1
\setup|cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~45_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(10));

-- Location: LABCELL_X88_Y8_N0
\setup|LessThan1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|LessThan1~1_combout\ = ( !\setup|cnt\(11) & ( !\setup|cnt\(10) & ( (!\setup|cnt\(8) & (!\setup|cnt\(7) & !\setup|cnt\(9))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \setup|ALT_INV_cnt\(8),
	datac => \setup|ALT_INV_cnt\(7),
	datad => \setup|ALT_INV_cnt\(9),
	datae => \setup|ALT_INV_cnt\(11),
	dataf => \setup|ALT_INV_cnt\(10),
	combout => \setup|LessThan1~1_combout\);

-- Location: FF_X88_Y8_N43
\setup|cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~33_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(4));

-- Location: LABCELL_X88_Y8_N24
\setup|LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|LessThan1~0_combout\ = ( \setup|cnt\(4) & ( \setup|cnt\(1) & ( (\setup|cnt\(5) & (\setup|cnt\(6) & \setup|cnt\(3))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \setup|ALT_INV_cnt\(5),
	datac => \setup|ALT_INV_cnt\(6),
	datad => \setup|ALT_INV_cnt\(3),
	datae => \setup|ALT_INV_cnt\(4),
	dataf => \setup|ALT_INV_cnt\(1),
	combout => \setup|LessThan1~0_combout\);

-- Location: LABCELL_X88_Y8_N6
\setup|LessThan1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|LessThan1~2_combout\ = ( \setup|LessThan1~1_combout\ & ( \setup|LessThan1~0_combout\ & ( (!\setup|cnt\(16) & (!\setup|cnt\(18) & ((!\setup|cnt\(2)) # (!\setup|cnt\(0))))) ) ) ) # ( \setup|LessThan1~1_combout\ & ( !\setup|LessThan1~0_combout\ & ( 
-- (!\setup|cnt\(16) & !\setup|cnt\(18)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100000000000000000000000000001110000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \setup|ALT_INV_cnt\(2),
	datab => \setup|ALT_INV_cnt\(0),
	datac => \setup|ALT_INV_cnt\(16),
	datad => \setup|ALT_INV_cnt\(18),
	datae => \setup|ALT_INV_LessThan1~1_combout\,
	dataf => \setup|ALT_INV_LessThan1~0_combout\,
	combout => \setup|LessThan1~2_combout\);

-- Location: FF_X88_Y7_N23
\setup|cnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~61_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(17));

-- Location: LABCELL_X88_Y7_N54
\setup|LessThan1~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|LessThan1~3_combout\ = ( \setup|cnt\(13) & ( \setup|cnt\(12) & ( (\setup|cnt\(14) & \setup|cnt\(15)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \setup|ALT_INV_cnt\(14),
	datad => \setup|ALT_INV_cnt\(15),
	datae => \setup|ALT_INV_cnt\(13),
	dataf => \setup|ALT_INV_cnt\(12),
	combout => \setup|LessThan1~3_combout\);

-- Location: FF_X88_Y7_N29
\setup|cnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~97_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(19));

-- Location: FF_X88_Y7_N40
\setup|cnt[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~81_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(23));

-- Location: LABCELL_X88_Y7_N51
\setup|LessThan1~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|LessThan1~4_combout\ = ( \setup|cnt\(23) & ( \setup|cnt\(21) & ( (\setup|cnt\(22) & (\setup|cnt\(20) & \setup|cnt\(19))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \setup|ALT_INV_cnt\(22),
	datac => \setup|ALT_INV_cnt\(20),
	datad => \setup|ALT_INV_cnt\(19),
	datae => \setup|ALT_INV_cnt\(23),
	dataf => \setup|ALT_INV_cnt\(21),
	combout => \setup|LessThan1~4_combout\);

-- Location: MLABCELL_X87_Y7_N39
\setup|LessThan1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|LessThan1~5_combout\ = ( \setup|LessThan1~4_combout\ & ( ((\setup|cnt\(17) & ((\setup|LessThan1~3_combout\) # (\setup|cnt[16]~DUPLICATE_q\)))) # (\setup|cnt\(18)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110111011101110011011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \setup|ALT_INV_cnt\(17),
	datab => \setup|ALT_INV_cnt\(18),
	datac => \setup|ALT_INV_cnt[16]~DUPLICATE_q\,
	datad => \setup|ALT_INV_LessThan1~3_combout\,
	dataf => \setup|ALT_INV_LessThan1~4_combout\,
	combout => \setup|LessThan1~5_combout\);

-- Location: MLABCELL_X87_Y8_N39
\setup|address_bus[13]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|address_bus[13]~0_combout\ = ( \setup|LessThan1~2_combout\ & ( \setup|LessThan1~5_combout\ & ( (!\Equal0~0_combout\ & (((\setup|cnt\(25) & \setup|cnt\(24))) # (\setup|Equal0~0_combout\))) ) ) ) # ( !\setup|LessThan1~2_combout\ & ( 
-- \setup|LessThan1~5_combout\ & ( (!\Equal0~0_combout\ & ((\setup|Equal0~0_combout\) # (\setup|cnt\(25)))) ) ) ) # ( \setup|LessThan1~2_combout\ & ( !\setup|LessThan1~5_combout\ & ( (!\Equal0~0_combout\ & (((\setup|cnt\(25) & \setup|cnt\(24))) # 
-- (\setup|Equal0~0_combout\))) ) ) ) # ( !\setup|LessThan1~2_combout\ & ( !\setup|LessThan1~5_combout\ & ( (!\Equal0~0_combout\ & (((\setup|cnt\(25) & \setup|cnt\(24))) # (\setup|Equal0~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110001001100000011000100110001001100010011000000110001001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \setup|ALT_INV_cnt\(25),
	datab => \ALT_INV_Equal0~0_combout\,
	datac => \setup|ALT_INV_Equal0~0_combout\,
	datad => \setup|ALT_INV_cnt\(24),
	datae => \setup|ALT_INV_LessThan1~2_combout\,
	dataf => \setup|ALT_INV_LessThan1~5_combout\,
	combout => \setup|address_bus[13]~0_combout\);

-- Location: FF_X87_Y8_N35
\setup|address_bus[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|address_bus[13]~feeder_combout\,
	ena => \setup|address_bus[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|address_bus\(13));

-- Location: MLABCELL_X87_Y8_N48
\setup|address_bus~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|address_bus~1_combout\ = ( \setup|address_bus\(3) & ( \setup|LessThan1~5_combout\ & ( (!\setup|cnt\(25)) # ((!\setup|cnt\(24) & \setup|LessThan1~2_combout\)) ) ) ) # ( !\setup|address_bus\(3) & ( \setup|LessThan1~5_combout\ & ( 
-- (\setup|Equal0~0_combout\ & ((!\setup|cnt\(25)) # ((!\setup|cnt\(24) & \setup|LessThan1~2_combout\)))) ) ) ) # ( \setup|address_bus\(3) & ( !\setup|LessThan1~5_combout\ & ( (!\setup|cnt\(24)) # (!\setup|cnt\(25)) ) ) ) # ( !\setup|address_bus\(3) & ( 
-- !\setup|LessThan1~5_combout\ & ( (\setup|Equal0~0_combout\ & ((!\setup|cnt\(24)) # (!\setup|cnt\(25)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001000110010111110101111101000110000001100101111000011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \setup|ALT_INV_cnt\(24),
	datab => \setup|ALT_INV_Equal0~0_combout\,
	datac => \setup|ALT_INV_cnt\(25),
	datad => \setup|ALT_INV_LessThan1~2_combout\,
	datae => \setup|ALT_INV_address_bus\(3),
	dataf => \setup|ALT_INV_LessThan1~5_combout\,
	combout => \setup|address_bus~1_combout\);

-- Location: FF_X87_Y8_N50
\setup|address_bus[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|address_bus~1_combout\,
	ena => \ALT_INV_Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|address_bus\(3));

-- Location: FF_X87_Y8_N38
\setup|address_bus[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \setup|LessThan1~6_combout\,
	sload => VCC,
	ena => \setup|address_bus[13]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|address_bus\(1));

-- Location: FF_X88_Y7_N50
\setup|do_write\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \setup|LessThan1~6_combout\,
	sload => VCC,
	ena => \ALT_INV_Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|do_write~q\);

-- Location: LABCELL_X85_Y8_N48
\memory|mmio[0][0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|mmio[0][0]~0_combout\ = ( \memory|mmio[0][0]~q\ & ( \setup|do_write~q\ & ( (((\setup|address_bus\(13)) # (\setup|address_bus\(1))) # (\setup|address_bus\(3))) # (\setup|data_bus_out\(0)) ) ) ) # ( !\memory|mmio[0][0]~q\ & ( \setup|do_write~q\ & ( 
-- (\setup|data_bus_out\(0) & (!\setup|address_bus\(3) & (!\setup|address_bus\(1) & !\setup|address_bus\(13)))) ) ) ) # ( \memory|mmio[0][0]~q\ & ( !\setup|do_write~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111101000000000000000111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \setup|ALT_INV_data_bus_out\(0),
	datab => \setup|ALT_INV_address_bus\(3),
	datac => \setup|ALT_INV_address_bus\(1),
	datad => \setup|ALT_INV_address_bus\(13),
	datae => \memory|ALT_INV_mmio[0][0]~q\,
	dataf => \setup|ALT_INV_do_write~q\,
	combout => \memory|mmio[0][0]~0_combout\);

-- Location: FF_X85_Y8_N50
\memory|mmio[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[0][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[0][0]~q\);

-- Location: LABCELL_X85_Y8_N42
\memory|mmio[14][0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|mmio[14][0]~3_combout\ = ( \memory|mmio[14][0]~q\ & ( \setup|do_write~q\ & ( ((!\setup|address_bus\(3)) # ((!\setup|address_bus\(1)) # (\setup|address_bus\(13)))) # (\setup|data_bus_out\(0)) ) ) ) # ( !\memory|mmio[14][0]~q\ & ( \setup|do_write~q\ 
-- & ( (\setup|data_bus_out\(0) & (\setup|address_bus\(3) & (\setup|address_bus\(1) & !\setup|address_bus\(13)))) ) ) ) # ( \memory|mmio[14][0]~q\ & ( !\setup|do_write~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000001000000001111110111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \setup|ALT_INV_data_bus_out\(0),
	datab => \setup|ALT_INV_address_bus\(3),
	datac => \setup|ALT_INV_address_bus\(1),
	datad => \setup|ALT_INV_address_bus\(13),
	datae => \memory|ALT_INV_mmio[14][0]~q\,
	dataf => \setup|ALT_INV_do_write~q\,
	combout => \memory|mmio[14][0]~3_combout\);

-- Location: FF_X85_Y8_N44
\memory|mmio[14][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[14][0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[14][0]~q\);

-- Location: LABCELL_X85_Y8_N24
\memory|mmio[8][0]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|mmio[8][0]~2_combout\ = ( \memory|mmio[8][0]~q\ & ( \setup|do_write~q\ & ( ((!\setup|address_bus\(3)) # ((\setup|address_bus\(13)) # (\setup|address_bus\(1)))) # (\setup|data_bus_out\(0)) ) ) ) # ( !\memory|mmio[8][0]~q\ & ( \setup|do_write~q\ & ( 
-- (\setup|data_bus_out\(0) & (\setup|address_bus\(3) & (!\setup|address_bus\(1) & !\setup|address_bus\(13)))) ) ) ) # ( \memory|mmio[8][0]~q\ & ( !\setup|do_write~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100010000000000001101111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \setup|ALT_INV_data_bus_out\(0),
	datab => \setup|ALT_INV_address_bus\(3),
	datac => \setup|ALT_INV_address_bus\(1),
	datad => \setup|ALT_INV_address_bus\(13),
	datae => \memory|ALT_INV_mmio[8][0]~q\,
	dataf => \setup|ALT_INV_do_write~q\,
	combout => \memory|mmio[8][0]~2_combout\);

-- Location: FF_X85_Y8_N26
\memory|mmio[8][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[8][0]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[8][0]~q\);

-- Location: LABCELL_X85_Y8_N54
\memory|mmio[6][0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|mmio[6][0]~1_combout\ = ( \memory|mmio[6][0]~q\ & ( \setup|do_write~q\ & ( (((!\setup|address_bus\(1)) # (\setup|address_bus\(13))) # (\setup|address_bus\(3))) # (\setup|data_bus_out\(0)) ) ) ) # ( !\memory|mmio[6][0]~q\ & ( \setup|do_write~q\ & ( 
-- (\setup|data_bus_out\(0) & (!\setup|address_bus\(3) & (\setup|address_bus\(1) & !\setup|address_bus\(13)))) ) ) ) # ( \memory|mmio[6][0]~q\ & ( !\setup|do_write~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000100000000001111011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \setup|ALT_INV_data_bus_out\(0),
	datab => \setup|ALT_INV_address_bus\(3),
	datac => \setup|ALT_INV_address_bus\(1),
	datad => \setup|ALT_INV_address_bus\(13),
	datae => \memory|ALT_INV_mmio[6][0]~q\,
	dataf => \setup|ALT_INV_do_write~q\,
	combout => \memory|mmio[6][0]~1_combout\);

-- Location: FF_X85_Y8_N56
\memory|mmio[6][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[6][0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[6][0]~q\);

-- Location: LABCELL_X85_Y8_N36
\memory|Mux15~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|Mux15~0_combout\ = ( \memory|mmio[6][0]~q\ & ( \setup|address_bus\(1) & ( (!\setup|address_bus\(3)) # (\memory|mmio[14][0]~q\) ) ) ) # ( !\memory|mmio[6][0]~q\ & ( \setup|address_bus\(1) & ( (\memory|mmio[14][0]~q\ & \setup|address_bus\(3)) ) ) ) 
-- # ( \memory|mmio[6][0]~q\ & ( !\setup|address_bus\(1) & ( (!\setup|address_bus\(3) & (\memory|mmio[0][0]~q\)) # (\setup|address_bus\(3) & ((\memory|mmio[8][0]~q\))) ) ) ) # ( !\memory|mmio[6][0]~q\ & ( !\setup|address_bus\(1) & ( (!\setup|address_bus\(3) 
-- & (\memory|mmio[0][0]~q\)) # (\setup|address_bus\(3) & ((\memory|mmio[8][0]~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100001111010101010000111100000000001100111111111100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \memory|ALT_INV_mmio[0][0]~q\,
	datab => \memory|ALT_INV_mmio[14][0]~q\,
	datac => \memory|ALT_INV_mmio[8][0]~q\,
	datad => \setup|ALT_INV_address_bus\(3),
	datae => \memory|ALT_INV_mmio[6][0]~q\,
	dataf => \setup|ALT_INV_address_bus\(1),
	combout => \memory|Mux15~0_combout\);

-- Location: LABCELL_X85_Y8_N15
\memory|Decoder1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|Decoder1~0_combout\ = ( \setup|do_write~q\ & ( (!\setup|address_bus\(1) & (!\setup|address_bus\(3) & \setup|address_bus\(13))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000110000000000000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \setup|ALT_INV_address_bus\(1),
	datac => \setup|ALT_INV_address_bus\(3),
	datad => \setup|ALT_INV_address_bus\(13),
	dataf => \setup|ALT_INV_do_write~q\,
	combout => \memory|Decoder1~0_combout\);

-- Location: FF_X85_Y8_N14
\memory|mmio[57344][0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[57344][0]~4_combout\,
	ena => \memory|Decoder1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[57344][0]~DUPLICATE_q\);

-- Location: LABCELL_X85_Y8_N21
\memory|Decoder1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|Decoder1~1_combout\ = ( \setup|address_bus\(13) & ( \setup|do_write~q\ & ( (\setup|address_bus\(1) & !\setup|address_bus\(3)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \setup|ALT_INV_address_bus\(1),
	datac => \setup|ALT_INV_address_bus\(3),
	datae => \setup|ALT_INV_address_bus\(13),
	dataf => \setup|ALT_INV_do_write~q\,
	combout => \memory|Decoder1~1_combout\);

-- Location: FF_X85_Y8_N23
\memory|mmio[57350][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \setup|data_bus_out\(0),
	sload => VCC,
	ena => \memory|Decoder1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[57350][0]~q\);

-- Location: IOIBUF_X12_Y0_N18
\switches[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switches(0),
	o => \switches[0]~input_o\);

-- Location: FF_X85_Y8_N35
\memory|mmio[57352][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \switches[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[57352][0]~q\);

-- Location: LABCELL_X85_Y8_N33
\setup|do_cnt~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|do_cnt~3_combout\ = ( \memory|mmio[57352][0]~q\ & ( \setup|address_bus\(1) & ( (!\setup|address_bus\(3) & \memory|mmio[57350][0]~q\) ) ) ) # ( !\memory|mmio[57352][0]~q\ & ( \setup|address_bus\(1) & ( (!\setup|address_bus\(3) & 
-- \memory|mmio[57350][0]~q\) ) ) ) # ( \memory|mmio[57352][0]~q\ & ( !\setup|address_bus\(1) & ( (!\memory|mmio[57344][0]~DUPLICATE_q\) # (\setup|address_bus\(3)) ) ) ) # ( !\memory|mmio[57352][0]~q\ & ( !\setup|address_bus\(1) & ( 
-- (!\memory|mmio[57344][0]~DUPLICATE_q\ & !\setup|address_bus\(3)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011000000110011111100111100000000111100000000000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \memory|ALT_INV_mmio[57344][0]~DUPLICATE_q\,
	datac => \setup|ALT_INV_address_bus\(3),
	datad => \memory|ALT_INV_mmio[57350][0]~q\,
	datae => \memory|ALT_INV_mmio[57352][0]~q\,
	dataf => \setup|ALT_INV_address_bus\(1),
	combout => \setup|do_cnt~3_combout\);

-- Location: MLABCELL_X87_Y8_N30
\setup|do_cnt~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|do_cnt~1_combout\ = ( !\setup|check_lever\(3) & ( (!\setup|check_lever\(2) & ((!\setup|check_lever\(1)) # (!\setup|check_lever\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110011000000110011001100000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \setup|ALT_INV_check_lever\(2),
	datac => \setup|ALT_INV_check_lever\(1),
	datad => \setup|ALT_INV_check_lever\(0),
	dataf => \setup|ALT_INV_check_lever\(3),
	combout => \setup|do_cnt~1_combout\);

-- Location: MLABCELL_X84_Y7_N48
\setup|do_cnt~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|do_cnt~2_combout\ = ( !\setup|do_cnt~1_combout\ & ( \setup|do_cnt~0_combout\ & ( (((\buttons[0]~input_o\) # (\buttons[3]~input_o\)) # (\buttons[1]~input_o\)) # (\buttons[2]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_buttons[2]~input_o\,
	datab => \ALT_INV_buttons[1]~input_o\,
	datac => \ALT_INV_buttons[3]~input_o\,
	datad => \ALT_INV_buttons[0]~input_o\,
	datae => \setup|ALT_INV_do_cnt~1_combout\,
	dataf => \setup|ALT_INV_do_cnt~0_combout\,
	combout => \setup|do_cnt~2_combout\);

-- Location: LABCELL_X88_Y8_N18
\setup|do_cnt~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|do_cnt~4_combout\ = ( \setup|do_cnt~q\ & ( \setup|Equal0~0_combout\ ) ) # ( \setup|do_cnt~q\ & ( !\setup|Equal0~0_combout\ & ( (!\setup|do_cnt~2_combout\) # ((!\setup|address_bus\(13) & (\memory|Mux15~0_combout\)) # (\setup|address_bus\(13) & 
-- ((\setup|do_cnt~3_combout\)))) ) ) ) # ( !\setup|do_cnt~q\ & ( !\setup|Equal0~0_combout\ & ( (\setup|do_cnt~2_combout\ & ((!\setup|address_bus\(13) & (\memory|Mux15~0_combout\)) # (\setup|address_bus\(13) & ((\setup|do_cnt~3_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000100111111111110010011100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \setup|ALT_INV_address_bus\(13),
	datab => \memory|ALT_INV_Mux15~0_combout\,
	datac => \setup|ALT_INV_do_cnt~3_combout\,
	datad => \setup|ALT_INV_do_cnt~2_combout\,
	datae => \setup|ALT_INV_do_cnt~q\,
	dataf => \setup|ALT_INV_Equal0~0_combout\,
	combout => \setup|do_cnt~4_combout\);

-- Location: FF_X88_Y8_N20
\setup|do_cnt\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|do_cnt~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|do_cnt~q\);

-- Location: LABCELL_X88_Y8_N30
\setup|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~17_sumout\ = SUM(( \setup|cnt\(0) ) + ( \setup|do_cnt~q\ ) + ( !VCC ))
-- \setup|Add1~18\ = CARRY(( \setup|cnt\(0) ) + ( \setup|do_cnt~q\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \setup|ALT_INV_cnt\(0),
	datac => \setup|ALT_INV_do_cnt~q\,
	cin => GND,
	sumout => \setup|Add1~17_sumout\,
	cout => \setup|Add1~18\);

-- Location: FF_X88_Y8_N32
\setup|cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~17_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(0));

-- Location: LABCELL_X88_Y8_N33
\setup|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~21_sumout\ = SUM(( \setup|cnt\(1) ) + ( GND ) + ( \setup|Add1~18\ ))
-- \setup|Add1~22\ = CARRY(( \setup|cnt\(1) ) + ( GND ) + ( \setup|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \setup|ALT_INV_cnt\(1),
	cin => \setup|Add1~18\,
	sumout => \setup|Add1~21_sumout\,
	cout => \setup|Add1~22\);

-- Location: FF_X88_Y8_N35
\setup|cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~21_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(1));

-- Location: LABCELL_X88_Y8_N36
\setup|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~13_sumout\ = SUM(( \setup|cnt\(2) ) + ( GND ) + ( \setup|Add1~22\ ))
-- \setup|Add1~14\ = CARRY(( \setup|cnt\(2) ) + ( GND ) + ( \setup|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_cnt\(2),
	cin => \setup|Add1~22\,
	sumout => \setup|Add1~13_sumout\,
	cout => \setup|Add1~14\);

-- Location: FF_X88_Y8_N38
\setup|cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~13_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(2));

-- Location: LABCELL_X88_Y8_N39
\setup|Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~37_sumout\ = SUM(( \setup|cnt\(3) ) + ( GND ) + ( \setup|Add1~14\ ))
-- \setup|Add1~38\ = CARRY(( \setup|cnt\(3) ) + ( GND ) + ( \setup|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \setup|ALT_INV_cnt\(3),
	cin => \setup|Add1~14\,
	sumout => \setup|Add1~37_sumout\,
	cout => \setup|Add1~38\);

-- Location: FF_X88_Y8_N41
\setup|cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~37_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(3));

-- Location: LABCELL_X88_Y8_N42
\setup|Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~33_sumout\ = SUM(( \setup|cnt[4]~DUPLICATE_q\ ) + ( GND ) + ( \setup|Add1~38\ ))
-- \setup|Add1~34\ = CARRY(( \setup|cnt[4]~DUPLICATE_q\ ) + ( GND ) + ( \setup|Add1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \setup|ALT_INV_cnt[4]~DUPLICATE_q\,
	cin => \setup|Add1~38\,
	sumout => \setup|Add1~33_sumout\,
	cout => \setup|Add1~34\);

-- Location: FF_X88_Y8_N44
\setup|cnt[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~33_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt[4]~DUPLICATE_q\);

-- Location: LABCELL_X88_Y8_N45
\setup|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~29_sumout\ = SUM(( \setup|cnt\(5) ) + ( GND ) + ( \setup|Add1~34\ ))
-- \setup|Add1~30\ = CARRY(( \setup|cnt\(5) ) + ( GND ) + ( \setup|Add1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_cnt\(5),
	cin => \setup|Add1~34\,
	sumout => \setup|Add1~29_sumout\,
	cout => \setup|Add1~30\);

-- Location: FF_X88_Y8_N47
\setup|cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~29_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(5));

-- Location: LABCELL_X88_Y8_N48
\setup|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~25_sumout\ = SUM(( \setup|cnt\(6) ) + ( GND ) + ( \setup|Add1~30\ ))
-- \setup|Add1~26\ = CARRY(( \setup|cnt\(6) ) + ( GND ) + ( \setup|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \setup|ALT_INV_cnt\(6),
	cin => \setup|Add1~30\,
	sumout => \setup|Add1~25_sumout\,
	cout => \setup|Add1~26\);

-- Location: FF_X88_Y8_N50
\setup|cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~25_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(6));

-- Location: LABCELL_X88_Y8_N51
\setup|Add1~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~57_sumout\ = SUM(( \setup|cnt\(7) ) + ( GND ) + ( \setup|Add1~26\ ))
-- \setup|Add1~58\ = CARRY(( \setup|cnt\(7) ) + ( GND ) + ( \setup|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \setup|ALT_INV_cnt\(7),
	cin => \setup|Add1~26\,
	sumout => \setup|Add1~57_sumout\,
	cout => \setup|Add1~58\);

-- Location: FF_X88_Y8_N53
\setup|cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~57_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(7));

-- Location: LABCELL_X88_Y8_N54
\setup|Add1~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~53_sumout\ = SUM(( \setup|cnt\(8) ) + ( GND ) + ( \setup|Add1~58\ ))
-- \setup|Add1~54\ = CARRY(( \setup|cnt\(8) ) + ( GND ) + ( \setup|Add1~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_cnt\(8),
	cin => \setup|Add1~58\,
	sumout => \setup|Add1~53_sumout\,
	cout => \setup|Add1~54\);

-- Location: FF_X88_Y8_N56
\setup|cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~53_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(8));

-- Location: LABCELL_X88_Y8_N57
\setup|Add1~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~49_sumout\ = SUM(( \setup|cnt\(9) ) + ( GND ) + ( \setup|Add1~54\ ))
-- \setup|Add1~50\ = CARRY(( \setup|cnt\(9) ) + ( GND ) + ( \setup|Add1~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_cnt\(9),
	cin => \setup|Add1~54\,
	sumout => \setup|Add1~49_sumout\,
	cout => \setup|Add1~50\);

-- Location: FF_X88_Y8_N59
\setup|cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~49_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(9));

-- Location: LABCELL_X88_Y7_N0
\setup|Add1~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~45_sumout\ = SUM(( \setup|cnt[10]~DUPLICATE_q\ ) + ( GND ) + ( \setup|Add1~50\ ))
-- \setup|Add1~46\ = CARRY(( \setup|cnt[10]~DUPLICATE_q\ ) + ( GND ) + ( \setup|Add1~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \setup|ALT_INV_cnt[10]~DUPLICATE_q\,
	cin => \setup|Add1~50\,
	sumout => \setup|Add1~45_sumout\,
	cout => \setup|Add1~46\);

-- Location: FF_X88_Y7_N2
\setup|cnt[10]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~45_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt[10]~DUPLICATE_q\);

-- Location: LABCELL_X88_Y7_N3
\setup|Add1~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~41_sumout\ = SUM(( \setup|cnt[11]~DUPLICATE_q\ ) + ( GND ) + ( \setup|Add1~46\ ))
-- \setup|Add1~42\ = CARRY(( \setup|cnt[11]~DUPLICATE_q\ ) + ( GND ) + ( \setup|Add1~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_cnt[11]~DUPLICATE_q\,
	cin => \setup|Add1~46\,
	sumout => \setup|Add1~41_sumout\,
	cout => \setup|Add1~42\);

-- Location: FF_X87_Y8_N56
\setup|cnt[11]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \setup|Add1~41_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt[11]~DUPLICATE_q\);

-- Location: LABCELL_X88_Y7_N6
\setup|Add1~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~77_sumout\ = SUM(( \setup|cnt\(12) ) + ( GND ) + ( \setup|Add1~42\ ))
-- \setup|Add1~78\ = CARRY(( \setup|cnt\(12) ) + ( GND ) + ( \setup|Add1~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \setup|ALT_INV_cnt\(12),
	cin => \setup|Add1~42\,
	sumout => \setup|Add1~77_sumout\,
	cout => \setup|Add1~78\);

-- Location: FF_X88_Y7_N8
\setup|cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~77_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(12));

-- Location: LABCELL_X88_Y7_N9
\setup|Add1~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~73_sumout\ = SUM(( \setup|cnt\(13) ) + ( GND ) + ( \setup|Add1~78\ ))
-- \setup|Add1~74\ = CARRY(( \setup|cnt\(13) ) + ( GND ) + ( \setup|Add1~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_cnt\(13),
	cin => \setup|Add1~78\,
	sumout => \setup|Add1~73_sumout\,
	cout => \setup|Add1~74\);

-- Location: FF_X88_Y7_N10
\setup|cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~73_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(13));

-- Location: LABCELL_X88_Y7_N12
\setup|Add1~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~69_sumout\ = SUM(( \setup|cnt\(14) ) + ( GND ) + ( \setup|Add1~74\ ))
-- \setup|Add1~70\ = CARRY(( \setup|cnt\(14) ) + ( GND ) + ( \setup|Add1~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \setup|ALT_INV_cnt\(14),
	cin => \setup|Add1~74\,
	sumout => \setup|Add1~69_sumout\,
	cout => \setup|Add1~70\);

-- Location: FF_X88_Y7_N14
\setup|cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~69_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(14));

-- Location: LABCELL_X88_Y7_N15
\setup|Add1~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~65_sumout\ = SUM(( \setup|cnt\(15) ) + ( GND ) + ( \setup|Add1~70\ ))
-- \setup|Add1~66\ = CARRY(( \setup|cnt\(15) ) + ( GND ) + ( \setup|Add1~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \setup|ALT_INV_cnt\(15),
	cin => \setup|Add1~70\,
	sumout => \setup|Add1~65_sumout\,
	cout => \setup|Add1~66\);

-- Location: FF_X88_Y7_N17
\setup|cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~65_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(15));

-- Location: LABCELL_X88_Y7_N18
\setup|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~9_sumout\ = SUM(( \setup|cnt[16]~DUPLICATE_q\ ) + ( GND ) + ( \setup|Add1~66\ ))
-- \setup|Add1~10\ = CARRY(( \setup|cnt[16]~DUPLICATE_q\ ) + ( GND ) + ( \setup|Add1~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \setup|ALT_INV_cnt[16]~DUPLICATE_q\,
	cin => \setup|Add1~66\,
	sumout => \setup|Add1~9_sumout\,
	cout => \setup|Add1~10\);

-- Location: FF_X88_Y7_N20
\setup|cnt[16]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~9_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt[16]~DUPLICATE_q\);

-- Location: LABCELL_X88_Y7_N21
\setup|Add1~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~61_sumout\ = SUM(( \setup|cnt[17]~DUPLICATE_q\ ) + ( GND ) + ( \setup|Add1~10\ ))
-- \setup|Add1~62\ = CARRY(( \setup|cnt[17]~DUPLICATE_q\ ) + ( GND ) + ( \setup|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \setup|ALT_INV_cnt[17]~DUPLICATE_q\,
	cin => \setup|Add1~10\,
	sumout => \setup|Add1~61_sumout\,
	cout => \setup|Add1~62\);

-- Location: FF_X88_Y7_N22
\setup|cnt[17]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~61_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt[17]~DUPLICATE_q\);

-- Location: LABCELL_X88_Y7_N24
\setup|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~5_sumout\ = SUM(( \setup|cnt\(18) ) + ( GND ) + ( \setup|Add1~62\ ))
-- \setup|Add1~6\ = CARRY(( \setup|cnt\(18) ) + ( GND ) + ( \setup|Add1~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \setup|ALT_INV_cnt\(18),
	cin => \setup|Add1~62\,
	sumout => \setup|Add1~5_sumout\,
	cout => \setup|Add1~6\);

-- Location: FF_X88_Y7_N26
\setup|cnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~5_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(18));

-- Location: LABCELL_X88_Y7_N27
\setup|Add1~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~97_sumout\ = SUM(( \setup|cnt[19]~DUPLICATE_q\ ) + ( GND ) + ( \setup|Add1~6\ ))
-- \setup|Add1~98\ = CARRY(( \setup|cnt[19]~DUPLICATE_q\ ) + ( GND ) + ( \setup|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \setup|ALT_INV_cnt[19]~DUPLICATE_q\,
	cin => \setup|Add1~6\,
	sumout => \setup|Add1~97_sumout\,
	cout => \setup|Add1~98\);

-- Location: FF_X88_Y7_N28
\setup|cnt[19]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~97_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt[19]~DUPLICATE_q\);

-- Location: LABCELL_X88_Y7_N30
\setup|Add1~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~93_sumout\ = SUM(( \setup|cnt\(20) ) + ( GND ) + ( \setup|Add1~98\ ))
-- \setup|Add1~94\ = CARRY(( \setup|cnt\(20) ) + ( GND ) + ( \setup|Add1~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \setup|ALT_INV_cnt\(20),
	cin => \setup|Add1~98\,
	sumout => \setup|Add1~93_sumout\,
	cout => \setup|Add1~94\);

-- Location: FF_X88_Y7_N32
\setup|cnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~93_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(20));

-- Location: LABCELL_X88_Y7_N33
\setup|Add1~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~89_sumout\ = SUM(( \setup|cnt\(21) ) + ( GND ) + ( \setup|Add1~94\ ))
-- \setup|Add1~90\ = CARRY(( \setup|cnt\(21) ) + ( GND ) + ( \setup|Add1~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \setup|ALT_INV_cnt\(21),
	cin => \setup|Add1~94\,
	sumout => \setup|Add1~89_sumout\,
	cout => \setup|Add1~90\);

-- Location: FF_X88_Y7_N35
\setup|cnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~89_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(21));

-- Location: LABCELL_X88_Y7_N36
\setup|Add1~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~85_sumout\ = SUM(( \setup|cnt\(22) ) + ( GND ) + ( \setup|Add1~90\ ))
-- \setup|Add1~86\ = CARRY(( \setup|cnt\(22) ) + ( GND ) + ( \setup|Add1~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \setup|ALT_INV_cnt\(22),
	cin => \setup|Add1~90\,
	sumout => \setup|Add1~85_sumout\,
	cout => \setup|Add1~86\);

-- Location: FF_X88_Y7_N38
\setup|cnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~85_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(22));

-- Location: LABCELL_X88_Y7_N39
\setup|Add1~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add1~81_sumout\ = SUM(( \setup|cnt[23]~DUPLICATE_q\ ) + ( GND ) + ( \setup|Add1~86\ ))
-- \setup|Add1~82\ = CARRY(( \setup|cnt[23]~DUPLICATE_q\ ) + ( GND ) + ( \setup|Add1~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \setup|ALT_INV_cnt[23]~DUPLICATE_q\,
	cin => \setup|Add1~86\,
	sumout => \setup|Add1~81_sumout\,
	cout => \setup|Add1~82\);

-- Location: FF_X88_Y7_N41
\setup|cnt[23]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~81_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt[23]~DUPLICATE_q\);

-- Location: FF_X88_Y7_N44
\setup|cnt[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add1~1_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sclr => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|cnt\(24));

-- Location: MLABCELL_X87_Y7_N33
\setup|LessThan1~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|LessThan1~6_combout\ = ( \setup|LessThan1~2_combout\ & ( (\setup|cnt\(24) & \setup|cnt\(25)) ) ) # ( !\setup|LessThan1~2_combout\ & ( (\setup|cnt\(25) & ((\setup|LessThan1~5_combout\) # (\setup|cnt\(24)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000111111000000000011111100000000001100110000000000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \setup|ALT_INV_cnt\(24),
	datac => \setup|ALT_INV_LessThan1~5_combout\,
	datad => \setup|ALT_INV_cnt\(25),
	dataf => \setup|ALT_INV_LessThan1~2_combout\,
	combout => \setup|LessThan1~6_combout\);

-- Location: FF_X87_Y7_N29
\setup|ledcnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \setup|ledcnt[0]~0_combout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sload => VCC,
	ena => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|ledcnt\(0));

-- Location: MLABCELL_X87_Y7_N36
\setup|ledcnt[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|ledcnt[0]~0_combout\ = !\setup|ledcnt\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \setup|ALT_INV_ledcnt\(0),
	combout => \setup|ledcnt[0]~0_combout\);

-- Location: FF_X87_Y7_N28
\setup|ledcnt[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \setup|ledcnt[0]~0_combout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	sload => VCC,
	ena => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|ledcnt[0]~DUPLICATE_q\);

-- Location: MLABCELL_X87_Y7_N30
\setup|data_bus_out[0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|data_bus_out[0]~feeder_combout\ = ( \setup|ledcnt[0]~DUPLICATE_q\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \setup|ALT_INV_ledcnt[0]~DUPLICATE_q\,
	combout => \setup|data_bus_out[0]~feeder_combout\);

-- Location: MLABCELL_X87_Y7_N57
\setup|data_bus_out[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|data_bus_out[0]~0_combout\ = ( \setup|LessThan1~2_combout\ & ( (!\Equal0~0_combout\ & (\setup|cnt\(25) & \setup|cnt\(24))) ) ) # ( !\setup|LessThan1~2_combout\ & ( (!\Equal0~0_combout\ & (\setup|cnt\(25) & ((\setup|cnt\(24)) # 
-- (\setup|LessThan1~5_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000100010000000100010001000000000001000100000000000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal0~0_combout\,
	datab => \setup|ALT_INV_cnt\(25),
	datac => \setup|ALT_INV_LessThan1~5_combout\,
	datad => \setup|ALT_INV_cnt\(24),
	dataf => \setup|ALT_INV_LessThan1~2_combout\,
	combout => \setup|data_bus_out[0]~0_combout\);

-- Location: FF_X87_Y7_N31
\setup|data_bus_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|data_bus_out[0]~feeder_combout\,
	ena => \setup|data_bus_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|data_bus_out\(0));

-- Location: LABCELL_X85_Y8_N12
\memory|mmio[57344][0]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|mmio[57344][0]~4_combout\ = ( !\setup|data_bus_out\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \setup|ALT_INV_data_bus_out\(0),
	combout => \memory|mmio[57344][0]~4_combout\);

-- Location: FF_X85_Y8_N13
\memory|mmio[57344][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[57344][0]~4_combout\,
	ena => \memory|Decoder1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[57344][0]~q\);

-- Location: MLABCELL_X87_Y7_N0
\setup|Add2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add2~1_sumout\ = SUM(( \setup|ledcnt\(1) ) + ( \setup|ledcnt[0]~DUPLICATE_q\ ) + ( !VCC ))
-- \setup|Add2~2\ = CARRY(( \setup|ledcnt\(1) ) + ( \setup|ledcnt[0]~DUPLICATE_q\ ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \setup|ALT_INV_ledcnt[0]~DUPLICATE_q\,
	datad => \setup|ALT_INV_ledcnt\(1),
	cin => GND,
	sumout => \setup|Add2~1_sumout\,
	cout => \setup|Add2~2\);

-- Location: FF_X87_Y7_N2
\setup|ledcnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add2~1_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	ena => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|ledcnt\(1));

-- Location: FF_X87_Y7_N50
\setup|data_bus_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \setup|ledcnt\(1),
	sload => VCC,
	ena => \setup|data_bus_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|data_bus_out\(1));

-- Location: LABCELL_X85_Y7_N39
\memory|mmio[57344][1]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|mmio[57344][1]~5_combout\ = ( !\setup|data_bus_out\(1) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \setup|ALT_INV_data_bus_out\(1),
	combout => \memory|mmio[57344][1]~5_combout\);

-- Location: FF_X85_Y7_N40
\memory|mmio[57344][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[57344][1]~5_combout\,
	ena => \memory|Decoder1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[57344][1]~q\);

-- Location: MLABCELL_X87_Y7_N3
\setup|Add2~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add2~5_sumout\ = SUM(( \setup|ledcnt\(2) ) + ( GND ) + ( \setup|Add2~2\ ))
-- \setup|Add2~6\ = CARRY(( \setup|ledcnt\(2) ) + ( GND ) + ( \setup|Add2~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_ledcnt\(2),
	cin => \setup|Add2~2\,
	sumout => \setup|Add2~5_sumout\,
	cout => \setup|Add2~6\);

-- Location: FF_X87_Y7_N4
\setup|ledcnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add2~5_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	ena => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|ledcnt\(2));

-- Location: FF_X87_Y7_N44
\setup|data_bus_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \setup|ledcnt\(2),
	sload => VCC,
	ena => \setup|data_bus_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|data_bus_out\(2));

-- Location: LABCELL_X83_Y7_N39
\memory|mmio[57344][2]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|mmio[57344][2]~6_combout\ = ( !\setup|data_bus_out\(2) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \setup|ALT_INV_data_bus_out\(2),
	combout => \memory|mmio[57344][2]~6_combout\);

-- Location: FF_X83_Y7_N40
\memory|mmio[57344][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[57344][2]~6_combout\,
	ena => \memory|Decoder1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[57344][2]~q\);

-- Location: MLABCELL_X87_Y7_N6
\setup|Add2~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add2~9_sumout\ = SUM(( \setup|ledcnt\(3) ) + ( GND ) + ( \setup|Add2~6\ ))
-- \setup|Add2~10\ = CARRY(( \setup|ledcnt\(3) ) + ( GND ) + ( \setup|Add2~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_ledcnt\(3),
	cin => \setup|Add2~6\,
	sumout => \setup|Add2~9_sumout\,
	cout => \setup|Add2~10\);

-- Location: FF_X87_Y7_N7
\setup|ledcnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add2~9_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	ena => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|ledcnt\(3));

-- Location: FF_X87_Y7_N59
\setup|data_bus_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \setup|ledcnt\(3),
	sload => VCC,
	ena => \setup|data_bus_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|data_bus_out\(3));

-- Location: MLABCELL_X84_Y7_N3
\memory|mmio[57344][3]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|mmio[57344][3]~7_combout\ = ( !\setup|data_bus_out\(3) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \setup|ALT_INV_data_bus_out\(3),
	combout => \memory|mmio[57344][3]~7_combout\);

-- Location: FF_X84_Y7_N4
\memory|mmio[57344][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[57344][3]~7_combout\,
	ena => \memory|Decoder1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[57344][3]~q\);

-- Location: MLABCELL_X87_Y7_N9
\setup|Add2~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add2~13_sumout\ = SUM(( \setup|ledcnt\(4) ) + ( GND ) + ( \setup|Add2~10\ ))
-- \setup|Add2~14\ = CARRY(( \setup|ledcnt\(4) ) + ( GND ) + ( \setup|Add2~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_ledcnt\(4),
	cin => \setup|Add2~10\,
	sumout => \setup|Add2~13_sumout\,
	cout => \setup|Add2~14\);

-- Location: FF_X87_Y7_N10
\setup|ledcnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add2~13_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	ena => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|ledcnt\(4));

-- Location: FF_X87_Y7_N53
\setup|data_bus_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \setup|ledcnt\(4),
	sload => VCC,
	ena => \setup|data_bus_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|data_bus_out\(4));

-- Location: LABCELL_X85_Y7_N9
\memory|mmio[57344][4]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|mmio[57344][4]~8_combout\ = ( !\setup|data_bus_out\(4) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \setup|ALT_INV_data_bus_out\(4),
	combout => \memory|mmio[57344][4]~8_combout\);

-- Location: FF_X85_Y7_N11
\memory|mmio[57344][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[57344][4]~8_combout\,
	ena => \memory|Decoder1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[57344][4]~q\);

-- Location: MLABCELL_X87_Y7_N12
\setup|Add2~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add2~17_sumout\ = SUM(( \setup|ledcnt\(5) ) + ( GND ) + ( \setup|Add2~14\ ))
-- \setup|Add2~18\ = CARRY(( \setup|ledcnt\(5) ) + ( GND ) + ( \setup|Add2~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_ledcnt\(5),
	cin => \setup|Add2~14\,
	sumout => \setup|Add2~17_sumout\,
	cout => \setup|Add2~18\);

-- Location: FF_X87_Y7_N14
\setup|ledcnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add2~17_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	ena => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|ledcnt\(5));

-- Location: FF_X87_Y7_N47
\setup|data_bus_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \setup|ledcnt\(5),
	sload => VCC,
	ena => \setup|data_bus_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|data_bus_out\(5));

-- Location: LABCELL_X85_Y7_N12
\memory|mmio[57344][5]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|mmio[57344][5]~9_combout\ = ( !\setup|data_bus_out\(5) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \setup|ALT_INV_data_bus_out\(5),
	combout => \memory|mmio[57344][5]~9_combout\);

-- Location: FF_X85_Y7_N13
\memory|mmio[57344][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[57344][5]~9_combout\,
	ena => \memory|Decoder1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[57344][5]~q\);

-- Location: MLABCELL_X87_Y7_N15
\setup|Add2~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add2~21_sumout\ = SUM(( \setup|ledcnt\(6) ) + ( GND ) + ( \setup|Add2~18\ ))
-- \setup|Add2~22\ = CARRY(( \setup|ledcnt\(6) ) + ( GND ) + ( \setup|Add2~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_ledcnt\(6),
	cin => \setup|Add2~18\,
	sumout => \setup|Add2~21_sumout\,
	cout => \setup|Add2~22\);

-- Location: FF_X87_Y7_N17
\setup|ledcnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add2~21_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	ena => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|ledcnt\(6));

-- Location: FF_X87_Y7_N56
\setup|data_bus_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \setup|ledcnt\(6),
	sload => VCC,
	ena => \setup|data_bus_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|data_bus_out\(6));

-- Location: LABCELL_X85_Y7_N21
\memory|mmio[57344][6]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|mmio[57344][6]~10_combout\ = ( !\setup|data_bus_out\(6) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \setup|ALT_INV_data_bus_out\(6),
	combout => \memory|mmio[57344][6]~10_combout\);

-- Location: FF_X85_Y7_N22
\memory|mmio[57344][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[57344][6]~10_combout\,
	ena => \memory|Decoder1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[57344][6]~q\);

-- Location: MLABCELL_X87_Y7_N18
\setup|Add2~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add2~33_sumout\ = SUM(( \setup|ledcnt\(7) ) + ( GND ) + ( \setup|Add2~22\ ))
-- \setup|Add2~34\ = CARRY(( \setup|ledcnt\(7) ) + ( GND ) + ( \setup|Add2~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_ledcnt\(7),
	cin => \setup|Add2~22\,
	sumout => \setup|Add2~33_sumout\,
	cout => \setup|Add2~34\);

-- Location: FF_X87_Y7_N19
\setup|ledcnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add2~33_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	ena => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|ledcnt\(7));

-- Location: MLABCELL_X87_Y7_N21
\setup|Add2~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add2~25_sumout\ = SUM(( \setup|ledcnt\(8) ) + ( GND ) + ( \setup|Add2~34\ ))
-- \setup|Add2~26\ = CARRY(( \setup|ledcnt\(8) ) + ( GND ) + ( \setup|Add2~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_ledcnt\(8),
	cin => \setup|Add2~34\,
	sumout => \setup|Add2~25_sumout\,
	cout => \setup|Add2~26\);

-- Location: FF_X87_Y7_N22
\setup|ledcnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add2~25_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	ena => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|ledcnt\(8));

-- Location: FF_X87_Y7_N32
\setup|data_bus_out[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \setup|ledcnt\(8),
	sload => VCC,
	ena => \setup|data_bus_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|data_bus_out\(8));

-- Location: LABCELL_X85_Y7_N0
\memory|mmio[57345][0]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|mmio[57345][0]~11_combout\ = ( !\setup|data_bus_out\(8) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \setup|ALT_INV_data_bus_out\(8),
	combout => \memory|mmio[57345][0]~11_combout\);

-- Location: FF_X85_Y7_N1
\memory|mmio[57345][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[57345][0]~11_combout\,
	ena => \memory|Decoder1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[57345][0]~q\);

-- Location: MLABCELL_X87_Y7_N24
\setup|Add2~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|Add2~29_sumout\ = SUM(( \setup|ledcnt\(9) ) + ( GND ) + ( \setup|Add2~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \setup|ALT_INV_ledcnt\(9),
	cin => \setup|Add2~26\,
	sumout => \setup|Add2~29_sumout\);

-- Location: FF_X87_Y7_N26
\setup|ledcnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|Add2~29_sumout\,
	clrn => \ALT_INV_Equal0~0_combout\,
	ena => \setup|LessThan1~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|ledcnt\(9));

-- Location: FF_X87_Y7_N41
\setup|data_bus_out[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \setup|ledcnt\(9),
	sload => VCC,
	ena => \setup|data_bus_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|data_bus_out\(9));

-- Location: LABCELL_X85_Y7_N42
\memory|mmio[57345][1]~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|mmio[57345][1]~12_combout\ = ( !\setup|data_bus_out\(9) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \setup|ALT_INV_data_bus_out\(9),
	combout => \memory|mmio[57345][1]~12_combout\);

-- Location: FF_X85_Y7_N43
\memory|mmio[57345][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[57345][1]~12_combout\,
	ena => \memory|Decoder1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[57345][1]~q\);

-- Location: MLABCELL_X84_Y8_N39
\memory|mmio[57345][2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|mmio[57345][2]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \memory|mmio[57345][2]~feeder_combout\);

-- Location: FF_X84_Y8_N40
\memory|mmio[57345][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[57345][2]~feeder_combout\,
	ena => \memory|Decoder1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[57345][2]~q\);

-- Location: LABCELL_X85_Y7_N27
\memory|mmio[57350][1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|mmio[57350][1]~feeder_combout\ = ( \setup|data_bus_out\(1) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \setup|ALT_INV_data_bus_out\(1),
	combout => \memory|mmio[57350][1]~feeder_combout\);

-- Location: FF_X85_Y7_N28
\memory|mmio[57350][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[57350][1]~feeder_combout\,
	ena => \memory|Decoder1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[57350][1]~q\);

-- Location: MLABCELL_X84_Y7_N54
\memory|mmio[57350][2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|mmio[57350][2]~feeder_combout\ = ( \setup|data_bus_out\(2) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \setup|ALT_INV_data_bus_out\(2),
	combout => \memory|mmio[57350][2]~feeder_combout\);

-- Location: FF_X84_Y7_N55
\memory|mmio[57350][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[57350][2]~feeder_combout\,
	ena => \memory|Decoder1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[57350][2]~q\);

-- Location: MLABCELL_X84_Y7_N24
\memory|mmio[57350][3]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|mmio[57350][3]~feeder_combout\ = ( \setup|data_bus_out\(3) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \setup|ALT_INV_data_bus_out\(3),
	combout => \memory|mmio[57350][3]~feeder_combout\);

-- Location: FF_X84_Y7_N25
\memory|mmio[57350][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[57350][3]~feeder_combout\,
	ena => \memory|Decoder1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[57350][3]~q\);

-- Location: LABCELL_X85_Y7_N24
\memory|mmio[57350][4]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|mmio[57350][4]~feeder_combout\ = ( \setup|data_bus_out\(4) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \setup|ALT_INV_data_bus_out\(4),
	combout => \memory|mmio[57350][4]~feeder_combout\);

-- Location: FF_X85_Y7_N26
\memory|mmio[57350][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[57350][4]~feeder_combout\,
	ena => \memory|Decoder1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[57350][4]~q\);

-- Location: FF_X85_Y7_N55
\memory|mmio[57350][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \setup|data_bus_out\(5),
	sload => VCC,
	ena => \memory|Decoder1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[57350][5]~q\);

-- Location: LABCELL_X85_Y7_N48
\memory|mmio[57350][6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|mmio[57350][6]~feeder_combout\ = ( \setup|data_bus_out\(6) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \setup|ALT_INV_data_bus_out\(6),
	combout => \memory|mmio[57350][6]~feeder_combout\);

-- Location: FF_X85_Y7_N49
\memory|mmio[57350][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[57350][6]~feeder_combout\,
	ena => \memory|Decoder1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[57350][6]~q\);

-- Location: MLABCELL_X87_Y7_N54
\setup|data_bus_out[7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \setup|data_bus_out[7]~feeder_combout\ = \setup|ledcnt\(7)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \setup|ALT_INV_ledcnt\(7),
	combout => \setup|data_bus_out[7]~feeder_combout\);

-- Location: FF_X87_Y7_N55
\setup|data_bus_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \setup|data_bus_out[7]~feeder_combout\,
	ena => \setup|data_bus_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \setup|data_bus_out\(7));

-- Location: LABCELL_X85_Y7_N30
\memory|mmio[57350][7]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|mmio[57350][7]~feeder_combout\ = ( \setup|data_bus_out\(7) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \setup|ALT_INV_data_bus_out\(7),
	combout => \memory|mmio[57350][7]~feeder_combout\);

-- Location: FF_X85_Y7_N31
\memory|mmio[57350][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[57350][7]~feeder_combout\,
	ena => \memory|Decoder1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[57350][7]~q\);

-- Location: LABCELL_X85_Y7_N33
\memory|mmio[57351][0]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|mmio[57351][0]~feeder_combout\ = ( \setup|data_bus_out\(8) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \setup|ALT_INV_data_bus_out\(8),
	combout => \memory|mmio[57351][0]~feeder_combout\);

-- Location: FF_X85_Y7_N34
\memory|mmio[57351][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[57351][0]~feeder_combout\,
	ena => \memory|Decoder1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[57351][0]~q\);

-- Location: LABCELL_X85_Y7_N57
\memory|mmio[57351][1]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \memory|mmio[57351][1]~feeder_combout\ = ( \setup|data_bus_out\(9) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \setup|ALT_INV_data_bus_out\(9),
	combout => \memory|mmio[57351][1]~feeder_combout\);

-- Location: FF_X85_Y7_N58
\memory|mmio[57351][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \memory|mmio[57351][1]~feeder_combout\,
	ena => \memory|Decoder1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \memory|mmio[57351][1]~q\);

-- Location: IOIBUF_X16_Y0_N1
\switches[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switches(1),
	o => \switches[1]~input_o\);

-- Location: IOIBUF_X8_Y0_N35
\switches[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switches(2),
	o => \switches[2]~input_o\);

-- Location: IOIBUF_X4_Y0_N52
\switches[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switches(3),
	o => \switches[3]~input_o\);

-- Location: IOIBUF_X2_Y0_N41
\switches[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switches(4),
	o => \switches[4]~input_o\);

-- Location: IOIBUF_X16_Y0_N18
\switches[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switches(5),
	o => \switches[5]~input_o\);

-- Location: IOIBUF_X4_Y0_N35
\switches[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switches(6),
	o => \switches[6]~input_o\);

-- Location: IOIBUF_X4_Y0_N1
\switches[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switches(7),
	o => \switches[7]~input_o\);

-- Location: IOIBUF_X4_Y0_N18
\switches[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switches(8),
	o => \switches[8]~input_o\);

-- Location: IOIBUF_X2_Y0_N58
\switches[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_switches(9),
	o => \switches[9]~input_o\);

-- Location: MLABCELL_X21_Y25_N3
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


