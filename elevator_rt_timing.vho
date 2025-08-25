-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "08/25/2025 00:02:34"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	elevator_fsm_rt IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	k0_p : IN std_logic;
	k1_p : IN std_logic;
	k2_p : IN std_logic;
	k3_p : IN std_logic;
	led_red : BUFFER std_logic;
	led_green : BUFFER std_logic;
	led_yellow : BUFFER std_logic;
	hex0 : BUFFER std_logic_vector(6 DOWNTO 0);
	hex1 : BUFFER std_logic_vector(6 DOWNTO 0);
	hex5 : BUFFER std_logic_vector(6 DOWNTO 0);
	hex6 : BUFFER std_logic_vector(6 DOWNTO 0);
	hex7 : BUFFER std_logic_vector(6 DOWNTO 0);
	state_dbg : BUFFER std_logic_vector(2 DOWNTO 0);
	tick_1ms : IN std_logic
	);
END elevator_fsm_rt;

-- Design Ports Information
-- led_red	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_green	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_yellow	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[0]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[1]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[2]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[3]	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[4]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[5]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[6]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[0]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[1]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[2]	=>  Location: PIN_G22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[3]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[4]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[5]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[6]	=>  Location: PIN_H21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex5[0]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex5[1]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex5[2]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex5[3]	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex5[4]	=>  Location: PIN_B17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex5[5]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex5[6]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex6[0]	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex6[1]	=>  Location: PIN_G27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex6[2]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex6[3]	=>  Location: PIN_J14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex6[4]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex6[5]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex6[6]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex7[0]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex7[1]	=>  Location: PIN_AE14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex7[2]	=>  Location: PIN_AA4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex7[3]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex7[4]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex7[5]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex7[6]	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- state_dbg[0]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- state_dbg[1]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- state_dbg[2]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k3_p	=>  Location: PIN_G14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k0_p	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k1_p	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k2_p	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- tick_1ms	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF elevator_fsm_rt IS
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
SIGNAL ww_rst : std_logic;
SIGNAL ww_k0_p : std_logic;
SIGNAL ww_k1_p : std_logic;
SIGNAL ww_k2_p : std_logic;
SIGNAL ww_k3_p : std_logic;
SIGNAL ww_led_red : std_logic;
SIGNAL ww_led_green : std_logic;
SIGNAL ww_led_yellow : std_logic;
SIGNAL ww_hex0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_hex1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_hex5 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_hex6 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_hex7 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_state_dbg : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_tick_1ms : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \led_red~output_o\ : std_logic;
SIGNAL \led_green~output_o\ : std_logic;
SIGNAL \led_yellow~output_o\ : std_logic;
SIGNAL \hex0[0]~output_o\ : std_logic;
SIGNAL \hex0[1]~output_o\ : std_logic;
SIGNAL \hex0[2]~output_o\ : std_logic;
SIGNAL \hex0[3]~output_o\ : std_logic;
SIGNAL \hex0[4]~output_o\ : std_logic;
SIGNAL \hex0[5]~output_o\ : std_logic;
SIGNAL \hex0[6]~output_o\ : std_logic;
SIGNAL \hex1[0]~output_o\ : std_logic;
SIGNAL \hex1[1]~output_o\ : std_logic;
SIGNAL \hex1[2]~output_o\ : std_logic;
SIGNAL \hex1[3]~output_o\ : std_logic;
SIGNAL \hex1[4]~output_o\ : std_logic;
SIGNAL \hex1[5]~output_o\ : std_logic;
SIGNAL \hex1[6]~output_o\ : std_logic;
SIGNAL \hex5[0]~output_o\ : std_logic;
SIGNAL \hex5[1]~output_o\ : std_logic;
SIGNAL \hex5[2]~output_o\ : std_logic;
SIGNAL \hex5[3]~output_o\ : std_logic;
SIGNAL \hex5[4]~output_o\ : std_logic;
SIGNAL \hex5[5]~output_o\ : std_logic;
SIGNAL \hex5[6]~output_o\ : std_logic;
SIGNAL \hex6[0]~output_o\ : std_logic;
SIGNAL \hex6[1]~output_o\ : std_logic;
SIGNAL \hex6[2]~output_o\ : std_logic;
SIGNAL \hex6[3]~output_o\ : std_logic;
SIGNAL \hex6[4]~output_o\ : std_logic;
SIGNAL \hex6[5]~output_o\ : std_logic;
SIGNAL \hex6[6]~output_o\ : std_logic;
SIGNAL \hex7[0]~output_o\ : std_logic;
SIGNAL \hex7[1]~output_o\ : std_logic;
SIGNAL \hex7[2]~output_o\ : std_logic;
SIGNAL \hex7[3]~output_o\ : std_logic;
SIGNAL \hex7[4]~output_o\ : std_logic;
SIGNAL \hex7[5]~output_o\ : std_logic;
SIGNAL \hex7[6]~output_o\ : std_logic;
SIGNAL \state_dbg[0]~output_o\ : std_logic;
SIGNAL \state_dbg[1]~output_o\ : std_logic;
SIGNAL \state_dbg[2]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \tick_1ms~input_o\ : std_logic;
SIGNAL \k1_p~input_o\ : std_logic;
SIGNAL \u_door|cnt[0]~32_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \u_door|run~1_combout\ : std_logic;
SIGNAL \u_door|run~q\ : std_logic;
SIGNAL \k2_p~input_o\ : std_logic;
SIGNAL \k0_p~input_o\ : std_logic;
SIGNAL \v_next_pin_digits~0_combout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \s.PIN_ENTRY~q\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \target_floor~0_combout\ : std_logic;
SIGNAL \v_next_target_floor~1_combout\ : std_logic;
SIGNAL \v_next_target_floor~0_combout\ : std_logic;
SIGNAL \user_floor~0_combout\ : std_logic;
SIGNAL \user_floor~1_combout\ : std_logic;
SIGNAL \user_floor~2_combout\ : std_logic;
SIGNAL \current_floor~0_combout\ : std_logic;
SIGNAL \Add5~0_combout\ : std_logic;
SIGNAL \Selector5~4_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \Selector1~5_combout\ : std_logic;
SIGNAL \Selector26~0_combout\ : std_logic;
SIGNAL \current_floor~1_combout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \k3_p~input_o\ : std_logic;
SIGNAL \Selector38~0_combout\ : std_logic;
SIGNAL \Selector38~1_combout\ : std_logic;
SIGNAL \target_valid~q\ : std_logic;
SIGNAL \v_next_s~7_combout\ : std_logic;
SIGNAL \Selector5~2_combout\ : std_logic;
SIGNAL \Selector5~3_combout\ : std_logic;
SIGNAL \s.MOVING~q\ : std_logic;
SIGNAL \Selector6~1_combout\ : std_logic;
SIGNAL \s.DOOR_OPEN_EXIT~q\ : std_logic;
SIGNAL \Selector37~0_combout\ : std_logic;
SIGNAL \pin_digits[1][1]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\ : std_logic;
SIGNAL \pin_digits~14_combout\ : std_logic;
SIGNAL \Selector36~0_combout\ : std_logic;
SIGNAL \Selector36~1_combout\ : std_logic;
SIGNAL \Selector36~2_combout\ : std_logic;
SIGNAL \Selector36~3_combout\ : std_logic;
SIGNAL \pin_index~q\ : std_logic;
SIGNAL \pin_digits[0][2]~15_combout\ : std_logic;
SIGNAL \pin_digits[0][2]~16_combout\ : std_logic;
SIGNAL \pin_digits[0][0]~q\ : std_logic;
SIGNAL \Add2~1_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[16]~9_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[15]~7_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[15]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\ : std_logic;
SIGNAL \pin_digits~19_combout\ : std_logic;
SIGNAL \pin_digits~21_combout\ : std_logic;
SIGNAL \pin_digits[0][2]~q\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[18]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[18]~3_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~9_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\ : std_logic;
SIGNAL \pin_digits~17_combout\ : std_logic;
SIGNAL \pin_digits~18_combout\ : std_logic;
SIGNAL \pin_digits[0][1]~q\ : std_logic;
SIGNAL \Add2~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\ : std_logic;
SIGNAL \pin_digits~20_combout\ : std_logic;
SIGNAL \pin_digits~22_combout\ : std_logic;
SIGNAL \pin_digits[0][3]~q\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[15]~8_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[15]~7_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\ : std_logic;
SIGNAL \pin_digits~8_combout\ : std_logic;
SIGNAL \pin_digits~9_combout\ : std_logic;
SIGNAL \pin_digits[1][1]~6_combout\ : std_logic;
SIGNAL \pin_digits[1][1]~7_combout\ : std_logic;
SIGNAL \pin_digits[1][1]~q\ : std_logic;
SIGNAL \process_1~1_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[16]~9_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[16]~6_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~3\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\ : std_logic;
SIGNAL \pin_digits~10_combout\ : std_logic;
SIGNAL \pin_digits~11_combout\ : std_logic;
SIGNAL \pin_digits[1][2]~q\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[17]~5_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[17]~4_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~5\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\ : std_logic;
SIGNAL \pin_digits~12_combout\ : std_logic;
SIGNAL \pin_digits~13_combout\ : std_logic;
SIGNAL \pin_digits[1][3]~q\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[18]~3_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|StageOut[18]~2_combout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~7\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~9_cout\ : std_logic;
SIGNAL \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ : std_logic;
SIGNAL \pin_digits~5_combout\ : std_logic;
SIGNAL \pin_digits[1][0]~q\ : std_logic;
SIGNAL \process_1~0_combout\ : std_logic;
SIGNAL \process_1~2_combout\ : std_logic;
SIGNAL \process_1~3_combout\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \Selector37~1_combout\ : std_logic;
SIGNAL \close_to_ready~q\ : std_logic;
SIGNAL \Selector0~1_combout\ : std_logic;
SIGNAL \s~10_combout\ : std_logic;
SIGNAL \s.IDLE_LOCKED~q\ : std_logic;
SIGNAL \user_floor[1]~3_combout\ : std_logic;
SIGNAL \user_floor[1]~4_combout\ : std_logic;
SIGNAL \v_next_s~8_combout\ : std_logic;
SIGNAL \Selector2~2_combout\ : std_logic;
SIGNAL \Selector2~3_combout\ : std_logic;
SIGNAL \Selector2~4_combout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \Selector2~1_combout\ : std_logic;
SIGNAL \Selector2~5_combout\ : std_logic;
SIGNAL \s.DOOR_OPEN_ENTRY~q\ : std_logic;
SIGNAL \WideOr19~0_combout\ : std_logic;
SIGNAL \u_door|run~0_combout\ : std_logic;
SIGNAL \u_door|cnt[0]~34_combout\ : std_logic;
SIGNAL \u_door|cnt[0]~35_combout\ : std_logic;
SIGNAL \u_door|cnt[0]~36_combout\ : std_logic;
SIGNAL \u_door|cnt[0]~33\ : std_logic;
SIGNAL \u_door|cnt[1]~37_combout\ : std_logic;
SIGNAL \u_door|cnt[1]~38\ : std_logic;
SIGNAL \u_door|cnt[2]~39_combout\ : std_logic;
SIGNAL \u_door|cnt[2]~40\ : std_logic;
SIGNAL \u_door|cnt[3]~41_combout\ : std_logic;
SIGNAL \u_door|cnt[3]~42\ : std_logic;
SIGNAL \u_door|cnt[4]~43_combout\ : std_logic;
SIGNAL \u_door|cnt[4]~44\ : std_logic;
SIGNAL \u_door|cnt[5]~45_combout\ : std_logic;
SIGNAL \u_door|cnt[5]~46\ : std_logic;
SIGNAL \u_door|cnt[6]~47_combout\ : std_logic;
SIGNAL \u_door|cnt[6]~48\ : std_logic;
SIGNAL \u_door|cnt[7]~49_combout\ : std_logic;
SIGNAL \u_door|cnt[7]~50\ : std_logic;
SIGNAL \u_door|cnt[8]~51_combout\ : std_logic;
SIGNAL \u_door|cnt[8]~52\ : std_logic;
SIGNAL \u_door|cnt[9]~53_combout\ : std_logic;
SIGNAL \u_door|cnt[9]~54\ : std_logic;
SIGNAL \u_door|cnt[10]~55_combout\ : std_logic;
SIGNAL \u_door|cnt[10]~56\ : std_logic;
SIGNAL \u_door|cnt[11]~57_combout\ : std_logic;
SIGNAL \u_door|cnt[11]~58\ : std_logic;
SIGNAL \u_door|cnt[12]~59_combout\ : std_logic;
SIGNAL \u_door|cnt[12]~60\ : std_logic;
SIGNAL \u_door|cnt[13]~61_combout\ : std_logic;
SIGNAL \u_door|cnt[13]~62\ : std_logic;
SIGNAL \u_door|cnt[14]~63_combout\ : std_logic;
SIGNAL \u_door|cnt[14]~64\ : std_logic;
SIGNAL \u_door|cnt[15]~65_combout\ : std_logic;
SIGNAL \u_door|cnt[15]~66\ : std_logic;
SIGNAL \u_door|cnt[16]~67_combout\ : std_logic;
SIGNAL \u_door|cnt[16]~68\ : std_logic;
SIGNAL \u_door|cnt[17]~69_combout\ : std_logic;
SIGNAL \u_door|cnt[17]~70\ : std_logic;
SIGNAL \u_door|cnt[18]~71_combout\ : std_logic;
SIGNAL \u_door|cnt[18]~72\ : std_logic;
SIGNAL \u_door|cnt[19]~73_combout\ : std_logic;
SIGNAL \u_door|cnt[19]~74\ : std_logic;
SIGNAL \u_door|cnt[20]~75_combout\ : std_logic;
SIGNAL \u_door|cnt[20]~76\ : std_logic;
SIGNAL \u_door|cnt[21]~77_combout\ : std_logic;
SIGNAL \u_door|cnt[21]~78\ : std_logic;
SIGNAL \u_door|cnt[22]~79_combout\ : std_logic;
SIGNAL \u_door|cnt[22]~80\ : std_logic;
SIGNAL \u_door|cnt[23]~81_combout\ : std_logic;
SIGNAL \u_door|cnt[23]~82\ : std_logic;
SIGNAL \u_door|cnt[24]~83_combout\ : std_logic;
SIGNAL \u_door|cnt[24]~84\ : std_logic;
SIGNAL \u_door|cnt[25]~85_combout\ : std_logic;
SIGNAL \u_door|cnt[25]~86\ : std_logic;
SIGNAL \u_door|cnt[26]~87_combout\ : std_logic;
SIGNAL \u_door|cnt[26]~88\ : std_logic;
SIGNAL \u_door|cnt[27]~89_combout\ : std_logic;
SIGNAL \u_door|Equal1~8_combout\ : std_logic;
SIGNAL \u_door|cnt[27]~90\ : std_logic;
SIGNAL \u_door|cnt[28]~91_combout\ : std_logic;
SIGNAL \u_door|cnt[28]~92\ : std_logic;
SIGNAL \u_door|cnt[29]~93_combout\ : std_logic;
SIGNAL \u_door|cnt[29]~94\ : std_logic;
SIGNAL \u_door|cnt[30]~95_combout\ : std_logic;
SIGNAL \u_door|cnt[30]~96\ : std_logic;
SIGNAL \u_door|cnt[31]~97_combout\ : std_logic;
SIGNAL \u_door|Equal1~9_combout\ : std_logic;
SIGNAL \u_door|Equal1~5_combout\ : std_logic;
SIGNAL \u_door|Equal1~6_combout\ : std_logic;
SIGNAL \u_door|Equal1~7_combout\ : std_logic;
SIGNAL \u_door|Equal1~2_combout\ : std_logic;
SIGNAL \u_door|Equal1~0_combout\ : std_logic;
SIGNAL \u_door|Equal1~3_combout\ : std_logic;
SIGNAL \u_door|Equal1~1_combout\ : std_logic;
SIGNAL \u_door|Equal1~4_combout\ : std_logic;
SIGNAL \u_door|Equal1~10_combout\ : std_logic;
SIGNAL \u_door|done~0_combout\ : std_logic;
SIGNAL \u_door|done~q\ : std_logic;
SIGNAL \Selector7~1_combout\ : std_logic;
SIGNAL \s.DOOR_CLOSE~q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \Selector4~1_combout\ : std_logic;
SIGNAL \s.READY_SELECT~q\ : std_logic;
SIGNAL \v_next_target_floor[1]~2_combout\ : std_logic;
SIGNAL \v_next_target_floor[1]~3_combout\ : std_logic;
SIGNAL \Selector25~0_combout\ : std_logic;
SIGNAL \Selector25~1_combout\ : std_logic;
SIGNAL \v_next_s~9_combout\ : std_logic;
SIGNAL \Add4~0_combout\ : std_logic;
SIGNAL \u_trav|Equal0~1_combout\ : std_logic;
SIGNAL \u_trav|cnt[0]~32_combout\ : std_logic;
SIGNAL \u_trav|cnt[8]~42_combout\ : std_logic;
SIGNAL \Selector14~1_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Selector14~0_combout\ : std_logic;
SIGNAL \Selector12~4_combout\ : std_logic;
SIGNAL \Selector12~5_combout\ : std_logic;
SIGNAL \Selector11~1_combout\ : std_logic;
SIGNAL \Selector11~0_combout\ : std_logic;
SIGNAL \Selector19~0_combout\ : std_logic;
SIGNAL \Selector19~1_combout\ : std_logic;
SIGNAL \Selector20~1_combout\ : std_logic;
SIGNAL \Selector20~0_combout\ : std_logic;
SIGNAL \u_trav|Add0~1\ : std_logic;
SIGNAL \u_trav|Add0~3\ : std_logic;
SIGNAL \u_trav|Add0~5\ : std_logic;
SIGNAL \u_trav|Add0~7\ : std_logic;
SIGNAL \u_trav|Add0~9\ : std_logic;
SIGNAL \u_trav|Add0~11\ : std_logic;
SIGNAL \u_trav|Add0~12_combout\ : std_logic;
SIGNAL \u_trav|Add0~13\ : std_logic;
SIGNAL \u_trav|Add0~14_combout\ : std_logic;
SIGNAL \u_trav|Equal1~3_combout\ : std_logic;
SIGNAL \u_trav|Add0~0_combout\ : std_logic;
SIGNAL \u_trav|Add0~2_combout\ : std_logic;
SIGNAL \u_trav|Equal1~0_combout\ : std_logic;
SIGNAL \u_trav|Add0~10_combout\ : std_logic;
SIGNAL \u_trav|Add0~8_combout\ : std_logic;
SIGNAL \u_trav|Equal1~2_combout\ : std_logic;
SIGNAL \u_trav|Add0~4_combout\ : std_logic;
SIGNAL \u_trav|Add0~6_combout\ : std_logic;
SIGNAL \u_trav|Equal1~1_combout\ : std_logic;
SIGNAL \u_trav|Equal1~4_combout\ : std_logic;
SIGNAL \Selector10~5_combout\ : std_logic;
SIGNAL \Selector10~4_combout\ : std_logic;
SIGNAL \u_trav|Add0~15\ : std_logic;
SIGNAL \u_trav|Add0~17\ : std_logic;
SIGNAL \u_trav|Add0~19\ : std_logic;
SIGNAL \u_trav|Add0~21\ : std_logic;
SIGNAL \u_trav|Add0~23\ : std_logic;
SIGNAL \u_trav|Add0~25\ : std_logic;
SIGNAL \u_trav|Add0~26_combout\ : std_logic;
SIGNAL \u_trav|cnt[14]~65\ : std_logic;
SIGNAL \u_trav|cnt[15]~66_combout\ : std_logic;
SIGNAL \u_trav|cnt[15]~67\ : std_logic;
SIGNAL \u_trav|cnt[16]~68_combout\ : std_logic;
SIGNAL \u_trav|cnt[16]~69\ : std_logic;
SIGNAL \u_trav|cnt[17]~70_combout\ : std_logic;
SIGNAL \u_trav|cnt[17]~71\ : std_logic;
SIGNAL \u_trav|cnt[18]~72_combout\ : std_logic;
SIGNAL \u_trav|cnt[18]~73\ : std_logic;
SIGNAL \u_trav|cnt[19]~74_combout\ : std_logic;
SIGNAL \u_trav|cnt[19]~75\ : std_logic;
SIGNAL \u_trav|cnt[20]~76_combout\ : std_logic;
SIGNAL \u_trav|cnt[20]~77\ : std_logic;
SIGNAL \u_trav|cnt[21]~78_combout\ : std_logic;
SIGNAL \u_trav|cnt[21]~79\ : std_logic;
SIGNAL \u_trav|cnt[22]~80_combout\ : std_logic;
SIGNAL \u_trav|cnt[22]~81\ : std_logic;
SIGNAL \u_trav|cnt[23]~82_combout\ : std_logic;
SIGNAL \u_trav|cnt[23]~83\ : std_logic;
SIGNAL \u_trav|cnt[24]~84_combout\ : std_logic;
SIGNAL \u_trav|cnt[24]~85\ : std_logic;
SIGNAL \u_trav|cnt[25]~86_combout\ : std_logic;
SIGNAL \u_trav|cnt[25]~87\ : std_logic;
SIGNAL \u_trav|cnt[26]~88_combout\ : std_logic;
SIGNAL \u_trav|cnt[26]~89\ : std_logic;
SIGNAL \u_trav|cnt[27]~90_combout\ : std_logic;
SIGNAL \u_trav|cnt[27]~91\ : std_logic;
SIGNAL \u_trav|cnt[28]~92_combout\ : std_logic;
SIGNAL \u_trav|cnt[28]~93\ : std_logic;
SIGNAL \u_trav|cnt[29]~94_combout\ : std_logic;
SIGNAL \u_trav|cnt[29]~95\ : std_logic;
SIGNAL \u_trav|cnt[30]~96_combout\ : std_logic;
SIGNAL \u_trav|Equal1~15_combout\ : std_logic;
SIGNAL \u_trav|cnt[30]~97\ : std_logic;
SIGNAL \u_trav|cnt[31]~98_combout\ : std_logic;
SIGNAL \u_trav|Equal1~11_combout\ : std_logic;
SIGNAL \u_trav|Equal1~12_combout\ : std_logic;
SIGNAL \u_trav|Equal1~13_combout\ : std_logic;
SIGNAL \u_trav|Equal1~14_combout\ : std_logic;
SIGNAL \u_trav|Equal1~16_combout\ : std_logic;
SIGNAL \u_trav|Equal1~10_combout\ : std_logic;
SIGNAL \u_trav|cnt[8]~43_combout\ : std_logic;
SIGNAL \u_trav|cnt[8]~44_combout\ : std_logic;
SIGNAL \u_trav|cnt[8]~45_combout\ : std_logic;
SIGNAL \u_trav|cnt[0]~33\ : std_logic;
SIGNAL \u_trav|cnt[1]~34_combout\ : std_logic;
SIGNAL \u_trav|cnt[1]~35\ : std_logic;
SIGNAL \u_trav|cnt[2]~36_combout\ : std_logic;
SIGNAL \u_trav|cnt[2]~37\ : std_logic;
SIGNAL \u_trav|cnt[3]~38_combout\ : std_logic;
SIGNAL \u_trav|cnt[3]~39\ : std_logic;
SIGNAL \u_trav|cnt[4]~40_combout\ : std_logic;
SIGNAL \u_trav|cnt[4]~41\ : std_logic;
SIGNAL \u_trav|cnt[5]~46_combout\ : std_logic;
SIGNAL \u_trav|cnt[5]~47\ : std_logic;
SIGNAL \u_trav|cnt[6]~48_combout\ : std_logic;
SIGNAL \u_trav|cnt[6]~49\ : std_logic;
SIGNAL \u_trav|cnt[7]~50_combout\ : std_logic;
SIGNAL \u_trav|cnt[7]~51\ : std_logic;
SIGNAL \u_trav|cnt[8]~52_combout\ : std_logic;
SIGNAL \u_trav|cnt[8]~53\ : std_logic;
SIGNAL \u_trav|cnt[9]~54_combout\ : std_logic;
SIGNAL \u_trav|cnt[9]~55\ : std_logic;
SIGNAL \u_trav|cnt[10]~56_combout\ : std_logic;
SIGNAL \u_trav|cnt[10]~57\ : std_logic;
SIGNAL \u_trav|cnt[11]~58_combout\ : std_logic;
SIGNAL \u_trav|cnt[11]~59\ : std_logic;
SIGNAL \u_trav|cnt[12]~60_combout\ : std_logic;
SIGNAL \u_trav|cnt[12]~61\ : std_logic;
SIGNAL \u_trav|cnt[13]~62_combout\ : std_logic;
SIGNAL \u_trav|cnt[13]~63\ : std_logic;
SIGNAL \u_trav|cnt[14]~64_combout\ : std_logic;
SIGNAL \u_trav|Add0~22_combout\ : std_logic;
SIGNAL \u_trav|Add0~20_combout\ : std_logic;
SIGNAL \u_trav|Equal1~6_combout\ : std_logic;
SIGNAL \u_trav|Add0~16_combout\ : std_logic;
SIGNAL \u_trav|Add0~18_combout\ : std_logic;
SIGNAL \u_trav|Equal1~5_combout\ : std_logic;
SIGNAL \u_trav|Add0~24_combout\ : std_logic;
SIGNAL \u_trav|Equal1~7_combout\ : std_logic;
SIGNAL \u_trav|Equal1~8_combout\ : std_logic;
SIGNAL \u_trav|Equal1~9_combout\ : std_logic;
SIGNAL \u_trav|Equal1~17_combout\ : std_logic;
SIGNAL \u_trav|Equal0~0_combout\ : std_logic;
SIGNAL \u_trav|run~1_combout\ : std_logic;
SIGNAL \u_trav|run~2_combout\ : std_logic;
SIGNAL \u_trav|run~q\ : std_logic;
SIGNAL \u_trav|run~0_combout\ : std_logic;
SIGNAL \u_trav|done~0_combout\ : std_logic;
SIGNAL \u_trav|done~1_combout\ : std_logic;
SIGNAL \u_trav|done~q\ : std_logic;
SIGNAL \Selector1~2_combout\ : std_logic;
SIGNAL \Mux17~0_combout\ : std_logic;
SIGNAL \Selector1~3_combout\ : std_logic;
SIGNAL \Selector1~4_combout\ : std_logic;
SIGNAL \s.CALL_MOVING~q\ : std_logic;
SIGNAL \WideOr18~combout\ : std_logic;
SIGNAL \led_green~0_combout\ : std_logic;
SIGNAL \led_yellow~0_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux13~0_combout\ : std_logic;
SIGNAL \Mux12~0_combout\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \Mux10~0_combout\ : std_logic;
SIGNAL \Mux9~0_combout\ : std_logic;
SIGNAL \Mux8~0_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \v_next_show_error~0_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \show_error~q\ : std_logic;
SIGNAL \hex5~0_combout\ : std_logic;
SIGNAL \hex5~1_combout\ : std_logic;
SIGNAL \hex5~2_combout\ : std_logic;
SIGNAL \hex5~3_combout\ : std_logic;
SIGNAL \hex5~4_combout\ : std_logic;
SIGNAL \hex5~5_combout\ : std_logic;
SIGNAL \Mux17~1_combout\ : std_logic;
SIGNAL \Mux17~2_combout\ : std_logic;
SIGNAL \WideOr24~combout\ : std_logic;
SIGNAL \WideOr23~0_combout\ : std_logic;
SIGNAL target_floor : std_logic_vector(1 DOWNTO 0);
SIGNAL current_floor : std_logic_vector(1 DOWNTO 0);
SIGNAL \u_trav|cnt\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \u_door|cnt\ : std_logic_vector(31 DOWNTO 0);
SIGNAL user_floor : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_WideOr23~0_combout\ : std_logic;
SIGNAL \ALT_INV_WideOr24~combout\ : std_logic;
SIGNAL ALT_INV_current_floor : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_hex5~5_combout\ : std_logic;
SIGNAL \ALT_INV_hex5~1_combout\ : std_logic;
SIGNAL \ALT_INV_Mux7~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_led_yellow~0_combout\ : std_logic;
SIGNAL \ALT_INV_led_green~0_combout\ : std_logic;
SIGNAL \ALT_INV_WideOr18~combout\ : std_logic;
SIGNAL \ALT_INV_s.READY_SELECT~q\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_k0_p <= k0_p;
ww_k1_p <= k1_p;
ww_k2_p <= k2_p;
ww_k3_p <= k3_p;
led_red <= ww_led_red;
led_green <= ww_led_green;
led_yellow <= ww_led_yellow;
hex0 <= ww_hex0;
hex1 <= ww_hex1;
hex5 <= ww_hex5;
hex6 <= ww_hex6;
hex7 <= ww_hex7;
state_dbg <= ww_state_dbg;
ww_tick_1ms <= tick_1ms;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_WideOr23~0_combout\ <= NOT \WideOr23~0_combout\;
\ALT_INV_WideOr24~combout\ <= NOT \WideOr24~combout\;
ALT_INV_current_floor(0) <= NOT current_floor(0);
\ALT_INV_hex5~5_combout\ <= NOT \hex5~5_combout\;
\ALT_INV_hex5~1_combout\ <= NOT \hex5~1_combout\;
\ALT_INV_Mux7~0_combout\ <= NOT \Mux7~0_combout\;
\ALT_INV_Mux0~0_combout\ <= NOT \Mux0~0_combout\;
\ALT_INV_led_yellow~0_combout\ <= NOT \led_yellow~0_combout\;
\ALT_INV_led_green~0_combout\ <= NOT \led_green~0_combout\;
\ALT_INV_WideOr18~combout\ <= NOT \WideOr18~combout\;
ALT_INV_current_floor(1) <= NOT current_floor(1);
\ALT_INV_s.READY_SELECT~q\ <= NOT \s.READY_SELECT~q\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X40_Y73_N2
\led_red~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_WideOr18~combout\,
	devoe => ww_devoe,
	o => \led_red~output_o\);

-- Location: IOOBUF_X58_Y73_N23
\led_green~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_led_green~0_combout\,
	devoe => ww_devoe,
	o => \led_green~output_o\);

-- Location: IOOBUF_X52_Y73_N9
\led_yellow~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_led_yellow~0_combout\,
	devoe => ww_devoe,
	o => \led_yellow~output_o\);

-- Location: IOOBUF_X72_Y73_N9
\hex0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux6~0_combout\,
	devoe => ww_devoe,
	o => \hex0[0]~output_o\);

-- Location: IOOBUF_X69_Y73_N23
\hex0[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux5~0_combout\,
	devoe => ww_devoe,
	o => \hex0[1]~output_o\);

-- Location: IOOBUF_X65_Y73_N9
\hex0[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux4~0_combout\,
	devoe => ww_devoe,
	o => \hex0[2]~output_o\);

-- Location: IOOBUF_X67_Y73_N16
\hex0[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux3~0_combout\,
	devoe => ww_devoe,
	o => \hex0[3]~output_o\);

-- Location: IOOBUF_X69_Y73_N2
\hex0[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux2~0_combout\,
	devoe => ww_devoe,
	o => \hex0[4]~output_o\);

-- Location: IOOBUF_X67_Y73_N23
\hex0[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux1~0_combout\,
	devoe => ww_devoe,
	o => \hex0[5]~output_o\);

-- Location: IOOBUF_X72_Y73_N2
\hex0[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => \hex0[6]~output_o\);

-- Location: IOOBUF_X67_Y73_N2
\hex1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux13~0_combout\,
	devoe => ww_devoe,
	o => \hex1[0]~output_o\);

-- Location: IOOBUF_X65_Y73_N23
\hex1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux12~0_combout\,
	devoe => ww_devoe,
	o => \hex1[1]~output_o\);

-- Location: IOOBUF_X72_Y73_N23
\hex1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux11~0_combout\,
	devoe => ww_devoe,
	o => \hex1[2]~output_o\);

-- Location: IOOBUF_X65_Y73_N16
\hex1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux10~0_combout\,
	devoe => ww_devoe,
	o => \hex1[3]~output_o\);

-- Location: IOOBUF_X69_Y73_N16
\hex1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux9~0_combout\,
	devoe => ww_devoe,
	o => \hex1[4]~output_o\);

-- Location: IOOBUF_X62_Y73_N23
\hex1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux8~0_combout\,
	devoe => ww_devoe,
	o => \hex1[5]~output_o\);

-- Location: IOOBUF_X72_Y73_N16
\hex1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux7~0_combout\,
	devoe => ww_devoe,
	o => \hex1[6]~output_o\);

-- Location: IOOBUF_X42_Y73_N2
\hex5[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \hex5~0_combout\,
	devoe => ww_devoe,
	o => \hex5[0]~output_o\);

-- Location: IOOBUF_X45_Y73_N2
\hex5[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_hex5~1_combout\,
	devoe => ww_devoe,
	o => \hex5[1]~output_o\);

-- Location: IOOBUF_X58_Y73_N9
\hex5[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \hex5~2_combout\,
	devoe => ww_devoe,
	o => \hex5[2]~output_o\);

-- Location: IOOBUF_X45_Y73_N9
\hex5[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \hex5~0_combout\,
	devoe => ww_devoe,
	o => \hex5[3]~output_o\);

-- Location: IOOBUF_X60_Y73_N9
\hex5[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \hex5~3_combout\,
	devoe => ww_devoe,
	o => \hex5[4]~output_o\);

-- Location: IOOBUF_X58_Y73_N16
\hex5[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \hex5~4_combout\,
	devoe => ww_devoe,
	o => \hex5[5]~output_o\);

-- Location: IOOBUF_X79_Y73_N2
\hex5[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_hex5~5_combout\,
	devoe => ww_devoe,
	o => \hex5[6]~output_o\);

-- Location: IOOBUF_X49_Y73_N16
\hex6[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux17~0_combout\,
	devoe => ww_devoe,
	o => \hex6[0]~output_o\);

-- Location: IOOBUF_X115_Y52_N2
\hex6[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \hex6[1]~output_o\);

-- Location: IOOBUF_X54_Y73_N9
\hex6[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux17~1_combout\,
	devoe => ww_devoe,
	o => \hex6[2]~output_o\);

-- Location: IOOBUF_X49_Y73_N23
\hex6[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux17~0_combout\,
	devoe => ww_devoe,
	o => \hex6[3]~output_o\);

-- Location: IOOBUF_X60_Y73_N16
\hex6[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_current_floor(0),
	devoe => ww_devoe,
	o => \hex6[4]~output_o\);

-- Location: IOOBUF_X58_Y73_N2
\hex6[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux17~2_combout\,
	devoe => ww_devoe,
	o => \hex6[5]~output_o\);

-- Location: IOOBUF_X60_Y73_N23
\hex6[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_current_floor(1),
	devoe => ww_devoe,
	o => \hex6[6]~output_o\);

-- Location: IOOBUF_X38_Y73_N2
\hex7[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \s.IDLE_LOCKED~q\,
	devoe => ww_devoe,
	o => \hex7[0]~output_o\);

-- Location: IOOBUF_X49_Y0_N23
\hex7[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \hex7[1]~output_o\);

-- Location: IOOBUF_X0_Y19_N2
\hex7[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \hex7[2]~output_o\);

-- Location: IOOBUF_X38_Y73_N16
\hex7[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \s.IDLE_LOCKED~q\,
	devoe => ww_devoe,
	o => \hex7[3]~output_o\);

-- Location: IOOBUF_X40_Y73_N9
\hex7[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \s.IDLE_LOCKED~q\,
	devoe => ww_devoe,
	o => \hex7[4]~output_o\);

-- Location: IOOBUF_X42_Y73_N9
\hex7[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \s.IDLE_LOCKED~q\,
	devoe => ww_devoe,
	o => \hex7[5]~output_o\);

-- Location: IOOBUF_X81_Y73_N23
\hex7[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex7[6]~output_o\);

-- Location: IOOBUF_X52_Y73_N2
\state_dbg[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_WideOr24~combout\,
	devoe => ww_devoe,
	o => \state_dbg[0]~output_o\);

-- Location: IOOBUF_X38_Y73_N9
\state_dbg[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_WideOr18~combout\,
	devoe => ww_devoe,
	o => \state_dbg[1]~output_o\);

-- Location: IOOBUF_X54_Y73_N2
\state_dbg[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_WideOr23~0_combout\,
	devoe => ww_devoe,
	o => \state_dbg[2]~output_o\);

-- Location: IOIBUF_X0_Y36_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X52_Y73_N15
\tick_1ms~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tick_1ms,
	o => \tick_1ms~input_o\);

-- Location: IOIBUF_X62_Y73_N15
\k1_p~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k1_p,
	o => \k1_p~input_o\);

-- Location: LCCOMB_X49_Y71_N0
\u_door|cnt[0]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[0]~32_combout\ = \u_door|cnt\(0) $ (VCC)
-- \u_door|cnt[0]~33\ = CARRY(\u_door|cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_door|cnt\(0),
	datad => VCC,
	combout => \u_door|cnt[0]~32_combout\,
	cout => \u_door|cnt[0]~33\);

-- Location: IOIBUF_X52_Y73_N22
\rst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: LCCOMB_X53_Y69_N26
\u_door|run~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|run~1_combout\ = (\u_door|run~0_combout\) # ((\u_door|run~q\ & ((!\u_door|Equal1~10_combout\) # (!\tick_1ms~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|run~0_combout\,
	datab => \tick_1ms~input_o\,
	datac => \u_door|run~q\,
	datad => \u_door|Equal1~10_combout\,
	combout => \u_door|run~1_combout\);

-- Location: FF_X53_Y69_N27
\u_door|run\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|run~1_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|run~q\);

-- Location: IOIBUF_X60_Y73_N1
\k2_p~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k2_p,
	o => \k2_p~input_o\);

-- Location: IOIBUF_X67_Y73_N8
\k0_p~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k0_p,
	o => \k0_p~input_o\);

-- Location: LCCOMB_X58_Y69_N8
\v_next_pin_digits~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \v_next_pin_digits~0_combout\ = (\k2_p~input_o\ & (!\k1_p~input_o\ & !\k0_p~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k2_p~input_o\,
	datab => \k1_p~input_o\,
	datac => \k0_p~input_o\,
	combout => \v_next_pin_digits~0_combout\);

-- Location: LCCOMB_X57_Y69_N22
\Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\u_door|done~q\ & ((\s.DOOR_OPEN_ENTRY~q\) # ((\s.PIN_ENTRY~q\ & !\v_next_pin_digits~0_combout\)))) # (!\u_door|done~q\ & (((\s.PIN_ENTRY~q\ & !\v_next_pin_digits~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|done~q\,
	datab => \s.DOOR_OPEN_ENTRY~q\,
	datac => \s.PIN_ENTRY~q\,
	datad => \v_next_pin_digits~0_combout\,
	combout => \Selector3~0_combout\);

-- Location: FF_X57_Y69_N23
\s.PIN_ENTRY\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector3~0_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s.PIN_ENTRY~q\);

-- Location: LCCOMB_X57_Y69_N8
\Selector6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = (!\u_door|done~q\ & \s.DOOR_OPEN_EXIT~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \u_door|done~q\,
	datad => \s.DOOR_OPEN_EXIT~q\,
	combout => \Selector6~0_combout\);

-- Location: LCCOMB_X58_Y70_N20
\target_floor~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \target_floor~0_combout\ = (!\rst~input_o\ & ((\s.READY_SELECT~q\ & (!\v_next_target_floor~1_combout\)) # (!\s.READY_SELECT~q\ & ((target_floor(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \v_next_target_floor~1_combout\,
	datab => \rst~input_o\,
	datac => target_floor(0),
	datad => \s.READY_SELECT~q\,
	combout => \target_floor~0_combout\);

-- Location: FF_X58_Y70_N21
\target_floor[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \target_floor~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => target_floor(0));

-- Location: LCCOMB_X58_Y70_N30
\v_next_target_floor~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \v_next_target_floor~1_combout\ = (\k0_p~input_o\) # ((!\k1_p~input_o\ & ((\k2_p~input_o\) # (!target_floor(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k1_p~input_o\,
	datab => target_floor(0),
	datac => \k2_p~input_o\,
	datad => \k0_p~input_o\,
	combout => \v_next_target_floor~1_combout\);

-- Location: LCCOMB_X58_Y70_N28
\v_next_target_floor~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \v_next_target_floor~0_combout\ = (!\k0_p~input_o\ & ((\k1_p~input_o\) # ((target_floor(1)) # (\k2_p~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k1_p~input_o\,
	datab => target_floor(1),
	datac => \k2_p~input_o\,
	datad => \k0_p~input_o\,
	combout => \v_next_target_floor~0_combout\);

-- Location: LCCOMB_X58_Y69_N2
\user_floor~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \user_floor~0_combout\ = (\k2_p~input_o\ & !\k1_p~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k2_p~input_o\,
	datac => \k1_p~input_o\,
	combout => \user_floor~0_combout\);

-- Location: LCCOMB_X59_Y70_N22
\user_floor~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \user_floor~1_combout\ = (\rst~input_o\) # ((!user_floor(0) & ((\s.IDLE_LOCKED~q\) # (!\k1_p~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s.IDLE_LOCKED~q\,
	datab => \rst~input_o\,
	datac => user_floor(0),
	datad => \k1_p~input_o\,
	combout => \user_floor~1_combout\);

-- Location: LCCOMB_X59_Y70_N2
\user_floor~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \user_floor~2_combout\ = (!\user_floor~1_combout\ & ((\s.IDLE_LOCKED~q\) # ((!\user_floor~0_combout\ & !\k0_p~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s.IDLE_LOCKED~q\,
	datab => \user_floor~0_combout\,
	datac => \user_floor~1_combout\,
	datad => \k0_p~input_o\,
	combout => \user_floor~2_combout\);

-- Location: FF_X59_Y70_N3
\user_floor[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \user_floor~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => user_floor(0));

-- Location: LCCOMB_X58_Y69_N22
\current_floor~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_floor~0_combout\ = (\s.MOVING~q\ & (!target_floor(0))) # (!\s.MOVING~q\ & ((!user_floor(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100011101000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => target_floor(0),
	datab => \s.MOVING~q\,
	datac => user_floor(0),
	combout => \current_floor~0_combout\);

-- Location: LCCOMB_X59_Y69_N18
\Add5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~0_combout\ = (current_floor(1) & ((target_floor(1)) # ((!target_floor(0) & current_floor(0))))) # (!current_floor(1) & (((target_floor(0) & !current_floor(0))) # (!target_floor(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101111011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => current_floor(1),
	datab => target_floor(1),
	datac => target_floor(0),
	datad => current_floor(0),
	combout => \Add5~0_combout\);

-- Location: LCCOMB_X59_Y69_N26
\Selector5~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~4_combout\ = (\s.MOVING~q\ & ((current_floor(0) $ (target_floor(0))) # (!\Add5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => current_floor(0),
	datab => \s.MOVING~q\,
	datac => target_floor(0),
	datad => \Add5~0_combout\,
	combout => \Selector5~4_combout\);

-- Location: LCCOMB_X59_Y70_N0
\Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = (user_floor(1) & ((current_floor(1)) # ((!current_floor(0) & user_floor(0))))) # (!user_floor(1) & (((current_floor(0) & !user_floor(0))) # (!current_floor(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011111100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => user_floor(1),
	datab => current_floor(0),
	datac => current_floor(1),
	datad => user_floor(0),
	combout => \Add1~0_combout\);

-- Location: LCCOMB_X59_Y70_N24
\Selector1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~5_combout\ = (\s.CALL_MOVING~q\ & ((user_floor(0) $ (current_floor(0))) # (!\Add1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s.CALL_MOVING~q\,
	datab => user_floor(0),
	datac => current_floor(0),
	datad => \Add1~0_combout\,
	combout => \Selector1~5_combout\);

-- Location: LCCOMB_X59_Y69_N28
\Selector26~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector26~0_combout\ = (\u_trav|done~q\ & ((\Selector5~4_combout\) # ((\Selector1~5_combout\ & !\s.MOVING~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector5~4_combout\,
	datab => \u_trav|done~q\,
	datac => \Selector1~5_combout\,
	datad => \s.MOVING~q\,
	combout => \Selector26~0_combout\);

-- Location: LCCOMB_X59_Y69_N6
\current_floor~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \current_floor~1_combout\ = (!\rst~input_o\ & ((\Selector26~0_combout\ & (!\current_floor~0_combout\)) # (!\Selector26~0_combout\ & ((current_floor(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~input_o\,
	datab => \current_floor~0_combout\,
	datac => current_floor(0),
	datad => \Selector26~0_combout\,
	combout => \current_floor~1_combout\);

-- Location: FF_X59_Y69_N7
\current_floor[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \current_floor~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_floor(0));

-- Location: LCCOMB_X58_Y70_N8
\Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (\v_next_target_floor~1_combout\ & (!current_floor(0) & (\v_next_target_floor~0_combout\ $ (!current_floor(1))))) # (!\v_next_target_floor~1_combout\ & (current_floor(0) & (\v_next_target_floor~0_combout\ $ (!current_floor(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \v_next_target_floor~1_combout\,
	datab => \v_next_target_floor~0_combout\,
	datac => current_floor(0),
	datad => current_floor(1),
	combout => \Selector4~0_combout\);

-- Location: IOIBUF_X47_Y73_N15
\k3_p~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k3_p,
	o => \k3_p~input_o\);

-- Location: LCCOMB_X58_Y69_N12
\Selector38~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector38~0_combout\ = (\s.READY_SELECT~q\ & (\v_next_s~7_combout\ & ((!\k3_p~input_o\) # (!\Selector4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s.READY_SELECT~q\,
	datab => \v_next_s~7_combout\,
	datac => \Selector4~0_combout\,
	datad => \k3_p~input_o\,
	combout => \Selector38~0_combout\);

-- Location: LCCOMB_X57_Y69_N2
\Selector38~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector38~1_combout\ = (\Selector38~0_combout\) # ((!\s.DOOR_OPEN_EXIT~q\ & (\target_valid~q\ & !\s.READY_SELECT~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s.DOOR_OPEN_EXIT~q\,
	datab => \Selector38~0_combout\,
	datac => \target_valid~q\,
	datad => \s.READY_SELECT~q\,
	combout => \Selector38~1_combout\);

-- Location: FF_X57_Y69_N3
target_valid : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector38~1_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \target_valid~q\);

-- Location: LCCOMB_X58_Y69_N18
\v_next_s~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \v_next_s~7_combout\ = (\target_valid~q\) # ((\k1_p~input_o\) # ((\k0_p~input_o\) # (\k2_p~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \target_valid~q\,
	datab => \k1_p~input_o\,
	datac => \k0_p~input_o\,
	datad => \k2_p~input_o\,
	combout => \v_next_s~7_combout\);

-- Location: LCCOMB_X58_Y69_N4
\Selector5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~2_combout\ = (!\Selector4~0_combout\ & (\v_next_s~7_combout\ & \k3_p~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector4~0_combout\,
	datab => \v_next_s~7_combout\,
	datad => \k3_p~input_o\,
	combout => \Selector5~2_combout\);

-- Location: LCCOMB_X59_Y69_N24
\Selector5~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~3_combout\ = (\Selector5~2_combout\ & ((\s.READY_SELECT~q\) # ((!\u_trav|done~q\ & \Selector5~4_combout\)))) # (!\Selector5~2_combout\ & (!\u_trav|done~q\ & (\Selector5~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector5~2_combout\,
	datab => \u_trav|done~q\,
	datac => \Selector5~4_combout\,
	datad => \s.READY_SELECT~q\,
	combout => \Selector5~3_combout\);

-- Location: FF_X59_Y69_N25
\s.MOVING\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector5~3_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s.MOVING~q\);

-- Location: LCCOMB_X59_Y69_N12
\Selector6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector6~1_combout\ = (\Selector6~0_combout\) # ((\s.MOVING~q\ & ((\u_trav|done~q\) # (!\v_next_s~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \v_next_s~9_combout\,
	datab => \u_trav|done~q\,
	datac => \Selector6~0_combout\,
	datad => \s.MOVING~q\,
	combout => \Selector6~1_combout\);

-- Location: FF_X59_Y69_N13
\s.DOOR_OPEN_EXIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector6~1_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s.DOOR_OPEN_EXIT~q\);

-- Location: LCCOMB_X57_Y69_N18
\Selector37~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector37~0_combout\ = ((\s.PIN_ENTRY~q\) # ((!\s.DOOR_CLOSE~q\ & !\s.DOOR_OPEN_EXIT~q\))) # (!\u_door|done~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s.DOOR_CLOSE~q\,
	datab => \u_door|done~q\,
	datac => \s.PIN_ENTRY~q\,
	datad => \s.DOOR_OPEN_EXIT~q\,
	combout => \Selector37~0_combout\);

-- Location: LCCOMB_X62_Y69_N14
\pin_digits[1][1]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \pin_digits[1][1]~4_combout\ = (\k0_p~input_o\ & (!\rst~input_o\ & \s.PIN_ENTRY~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k0_p~input_o\,
	datab => \rst~input_o\,
	datad => \s.PIN_ENTRY~q\,
	combout => \pin_digits[1][1]~4_combout\);

-- Location: LCCOMB_X62_Y69_N2
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\ = !\pin_digits[0][0]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \pin_digits[0][0]~q\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\);

-- Location: LCCOMB_X62_Y69_N12
\pin_digits~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \pin_digits~14_combout\ = (\pin_digits[1][1]~4_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & (!\pin_digits[0][0]~q\)) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & 
-- ((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[1][1]~4_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	datac => \pin_digits[0][0]~q\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\,
	combout => \pin_digits~14_combout\);

-- Location: LCCOMB_X57_Y69_N20
\Selector36~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector36~0_combout\ = (\s.DOOR_OPEN_ENTRY~q\ & (((\u_door|done~q\)))) # (!\s.DOOR_OPEN_ENTRY~q\ & ((\s.PIN_ENTRY~q\) # ((\s.DOOR_OPEN_EXIT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s.PIN_ENTRY~q\,
	datab => \s.DOOR_OPEN_ENTRY~q\,
	datac => \u_door|done~q\,
	datad => \s.DOOR_OPEN_EXIT~q\,
	combout => \Selector36~0_combout\);

-- Location: LCCOMB_X62_Y69_N18
\Selector36~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector36~1_combout\ = (\k1_p~input_o\ & ((\k0_p~input_o\))) # (!\k1_p~input_o\ & (\k2_p~input_o\ & !\k0_p~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \k1_p~input_o\,
	datac => \k2_p~input_o\,
	datad => \k0_p~input_o\,
	combout => \Selector36~1_combout\);

-- Location: LCCOMB_X62_Y69_N28
\Selector36~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector36~2_combout\ = (\k1_p~input_o\ & (((!\Selector36~1_combout\)))) # (!\k1_p~input_o\ & (!\process_1~3_combout\ & (\pin_index~q\ & \Selector36~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_1~3_combout\,
	datab => \pin_index~q\,
	datac => \k1_p~input_o\,
	datad => \Selector36~1_combout\,
	combout => \Selector36~2_combout\);

-- Location: LCCOMB_X62_Y69_N24
\Selector36~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector36~3_combout\ = (\pin_index~q\ & (((\s.PIN_ENTRY~q\ & !\Selector36~2_combout\)) # (!\Selector36~0_combout\))) # (!\pin_index~q\ & (((\s.PIN_ENTRY~q\ & \Selector36~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector36~0_combout\,
	datab => \s.PIN_ENTRY~q\,
	datac => \pin_index~q\,
	datad => \Selector36~2_combout\,
	combout => \Selector36~3_combout\);

-- Location: FF_X62_Y69_N25
pin_index : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector36~3_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pin_index~q\);

-- Location: LCCOMB_X62_Y69_N20
\pin_digits[0][2]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \pin_digits[0][2]~15_combout\ = (\k0_p~input_o\ & (((\pin_index~q\)))) # (!\k0_p~input_o\ & ((\process_1~3_combout\) # ((!\user_floor~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_1~3_combout\,
	datab => \pin_index~q\,
	datac => \user_floor~0_combout\,
	datad => \k0_p~input_o\,
	combout => \pin_digits[0][2]~15_combout\);

-- Location: LCCOMB_X62_Y69_N22
\pin_digits[0][2]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \pin_digits[0][2]~16_combout\ = (\rst~input_o\) # ((\Selector36~0_combout\ & ((!\pin_digits[0][2]~15_combout\) # (!\s.PIN_ENTRY~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector36~0_combout\,
	datab => \s.PIN_ENTRY~q\,
	datac => \rst~input_o\,
	datad => \pin_digits[0][2]~15_combout\,
	combout => \pin_digits[0][2]~16_combout\);

-- Location: FF_X62_Y69_N13
\pin_digits[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pin_digits~14_combout\,
	ena => \pin_digits[0][2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pin_digits[0][0]~q\);

-- Location: LCCOMB_X65_Y69_N8
\Add2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~1_combout\ = (\pin_digits[0][1]~q\ & \pin_digits[0][0]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pin_digits[0][1]~q\,
	datad => \pin_digits[0][0]~q\,
	combout => \Add2~1_combout\);

-- Location: LCCOMB_X65_Y69_N24
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \pin_digits[0][2]~q\ $ (\Add2~1_combout\ $ (VCC))
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(\pin_digits[0][2]~q\ $ (\Add2~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[0][2]~q\,
	datab => \Add2~1_combout\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X65_Y69_N6
\Mod0|auto_generated|divider|divider|StageOut[16]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\);

-- Location: LCCOMB_X63_Y69_N20
\Mod0|auto_generated|divider|divider|StageOut[16]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[16]~9_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\pin_digits[0][2]~q\ $ (((\pin_digits[0][0]~q\ & \pin_digits[0][1]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[0][0]~q\,
	datab => \pin_digits[0][1]~q\,
	datac => \pin_digits[0][2]~q\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[16]~9_combout\);

-- Location: LCCOMB_X63_Y69_N10
\Mod0|auto_generated|divider|divider|StageOut[15]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[15]~7_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\pin_digits[0][0]~q\ $ (\pin_digits[0][1]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[0][0]~q\,
	datab => \pin_digits[0][1]~q\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[15]~7_combout\);

-- Location: LCCOMB_X63_Y69_N26
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ = \pin_digits[0][1]~q\ $ (\pin_digits[0][0]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pin_digits[0][1]~q\,
	datad => \pin_digits[0][0]~q\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\);

-- Location: LCCOMB_X63_Y69_N28
\Mod0|auto_generated|divider|divider|StageOut[15]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[15]~8_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[15]~8_combout\);

-- Location: LCCOMB_X63_Y69_N0
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\ = (((\Mod0|auto_generated|divider|divider|StageOut[15]~7_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[15]~8_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\ = CARRY((\Mod0|auto_generated|divider|divider|StageOut[15]~7_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[15]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[15]~7_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[15]~8_combout\,
	datad => VCC,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\);

-- Location: LCCOMB_X63_Y69_N2
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\ & (((\Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[16]~9_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\ & (!\Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\ & 
-- (!\Mod0|auto_generated|divider|divider|StageOut[16]~9_combout\)))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[16]~9_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[16]~9_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\);

-- Location: LCCOMB_X63_Y69_N24
\pin_digits~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \pin_digits~19_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\) # ((\Mod0|auto_generated|divider|divider|StageOut[16]~9_combout\)))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & (((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[16]~6_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[16]~9_combout\,
	combout => \pin_digits~19_combout\);

-- Location: LCCOMB_X62_Y69_N16
\pin_digits~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \pin_digits~21_combout\ = (\k0_p~input_o\ & (\s.PIN_ENTRY~q\ & (!\rst~input_o\ & \pin_digits~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k0_p~input_o\,
	datab => \s.PIN_ENTRY~q\,
	datac => \rst~input_o\,
	datad => \pin_digits~19_combout\,
	combout => \pin_digits~21_combout\);

-- Location: FF_X62_Y69_N17
\pin_digits[0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pin_digits~21_combout\,
	ena => \pin_digits[0][2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pin_digits[0][2]~q\);

-- Location: LCCOMB_X65_Y69_N26
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & ((\pin_digits[0][3]~q\ $ (\Add2~0_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ 
-- & (\pin_digits[0][3]~q\ $ ((!\Add2~0_combout\))))
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & (\pin_digits[0][3]~q\ $ (!\Add2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100001001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[0][3]~q\,
	datab => \Add2~0_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X65_Y69_N28
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & (\pin_digits[0][3]~q\ & (\Add2~0_combout\ & VCC))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & ((((\pin_digits[0][3]~q\ & \Add2~0_combout\)))))
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\pin_digits[0][3]~q\ & (\Add2~0_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011100001000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[0][3]~q\,
	datab => \Add2~0_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X65_Y69_N30
\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X63_Y69_N30
\Mod0|auto_generated|divider|divider|StageOut[18]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[18]~2_combout\ = (\Add2~0_combout\ & (\pin_digits[0][3]~q\ & \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~0_combout\,
	datac => \pin_digits[0][3]~q\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[18]~2_combout\);

-- Location: LCCOMB_X65_Y69_N10
\Mod0|auto_generated|divider|divider|StageOut[18]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[18]~3_combout\ = (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[18]~3_combout\);

-- Location: LCCOMB_X63_Y69_N16
\Mod0|auto_generated|divider|divider|StageOut[17]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\Add2~0_combout\ $ (\pin_digits[0][3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add2~0_combout\,
	datac => \pin_digits[0][3]~q\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\);

-- Location: LCCOMB_X63_Y69_N4
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\ & (((\Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\ & ((((\Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\)))))
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\ = CARRY((!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\ & ((\Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[2]~5\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\);

-- Location: LCCOMB_X63_Y69_N6
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~9_cout\ = CARRY((!\Mod0|auto_generated|divider|divider|StageOut[18]~2_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[18]~3_combout\ & 
-- !\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[18]~2_combout\,
	datab => \Mod0|auto_generated|divider|divider|StageOut[18]~3_combout\,
	datad => VCC,
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~7\,
	cout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~9_cout\);

-- Location: LCCOMB_X63_Y69_N8
\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ = \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[4]~9_cout\,
	combout => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\);

-- Location: LCCOMB_X63_Y69_N22
\pin_digits~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \pin_digits~17_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\pin_digits[0][0]~q\ $ ((\pin_digits[0][1]~q\)))) # (!\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (((\Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[0][0]~q\,
	datab => \pin_digits[0][1]~q\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\,
	datad => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \pin_digits~17_combout\);

-- Location: LCCOMB_X62_Y69_N30
\pin_digits~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \pin_digits~18_combout\ = (\pin_digits[1][1]~4_combout\ & ((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & ((\pin_digits~17_combout\))) # (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & 
-- (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[1][1]~4_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\,
	datad => \pin_digits~17_combout\,
	combout => \pin_digits~18_combout\);

-- Location: FF_X62_Y69_N31
\pin_digits[0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pin_digits~18_combout\,
	ena => \pin_digits[0][2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pin_digits[0][1]~q\);

-- Location: LCCOMB_X63_Y69_N12
\Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~0_combout\ = (\pin_digits[0][1]~q\ & (\pin_digits[0][2]~q\ & \pin_digits[0][0]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pin_digits[0][1]~q\,
	datac => \pin_digits[0][2]~q\,
	datad => \pin_digits[0][0]~q\,
	combout => \Add2~0_combout\);

-- Location: LCCOMB_X65_Y69_N4
\Mod0|auto_generated|divider|divider|StageOut[17]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\);

-- Location: LCCOMB_X63_Y69_N18
\pin_digits~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \pin_digits~20_combout\ = (\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\) # ((\Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\)))) # 
-- (!\Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & (((\Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|StageOut[17]~5_combout\,
	datab => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\,
	datac => \Mod0|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	datad => \Mod0|auto_generated|divider|divider|StageOut[17]~4_combout\,
	combout => \pin_digits~20_combout\);

-- Location: LCCOMB_X62_Y69_N26
\pin_digits~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \pin_digits~22_combout\ = (\k0_p~input_o\ & (\s.PIN_ENTRY~q\ & (!\rst~input_o\ & \pin_digits~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k0_p~input_o\,
	datab => \s.PIN_ENTRY~q\,
	datac => \rst~input_o\,
	datad => \pin_digits~20_combout\,
	combout => \pin_digits~22_combout\);

-- Location: FF_X62_Y69_N27
\pin_digits[0][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pin_digits~22_combout\,
	ena => \pin_digits[0][2]~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pin_digits[0][3]~q\);

-- Location: LCCOMB_X66_Y68_N24
\Mod1|auto_generated|divider|divider|add_sub_4_result_int[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\ = !\pin_digits[1][0]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \pin_digits[1][0]~q\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\);

-- Location: LCCOMB_X66_Y72_N0
\Mod1|auto_generated|divider|divider|add_sub_3_result_int[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ = \pin_digits[1][0]~q\ $ (\pin_digits[1][1]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pin_digits[1][0]~q\,
	datac => \pin_digits[1][1]~q\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\);

-- Location: LCCOMB_X66_Y70_N26
\Mod1|auto_generated|divider|divider|StageOut[15]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[15]~8_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[15]~8_combout\);

-- Location: LCCOMB_X66_Y70_N8
\Mod1|auto_generated|divider|divider|StageOut[15]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[15]~7_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\pin_digits[1][1]~q\ $ (\pin_digits[1][0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pin_digits[1][1]~q\,
	datac => \pin_digits[1][0]~q\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[15]~7_combout\);

-- Location: LCCOMB_X66_Y70_N10
\Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\ = (((\Mod1|auto_generated|divider|divider|StageOut[15]~8_combout\) # (\Mod1|auto_generated|divider|divider|StageOut[15]~7_combout\)))
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~3\ = CARRY((\Mod1|auto_generated|divider|divider|StageOut[15]~8_combout\) # (\Mod1|auto_generated|divider|divider|StageOut[15]~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[15]~8_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[15]~7_combout\,
	datad => VCC,
	combout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~3\);

-- Location: LCCOMB_X66_Y70_N28
\pin_digits~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \pin_digits~8_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\pin_digits[1][1]~q\ $ (\pin_digits[1][0]~q\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[0]~8_combout\,
	datab => \pin_digits[1][1]~q\,
	datac => \pin_digits[1][0]~q\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \pin_digits~8_combout\);

-- Location: LCCOMB_X66_Y70_N2
\pin_digits~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \pin_digits~9_combout\ = (\pin_digits[1][1]~4_combout\ & ((\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & ((\pin_digits~8_combout\))) # (!\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & 
-- (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[1][1]~4_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	datac => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~2_combout\,
	datad => \pin_digits~8_combout\,
	combout => \pin_digits~9_combout\);

-- Location: LCCOMB_X62_Y69_N8
\pin_digits[1][1]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \pin_digits[1][1]~6_combout\ = (\process_1~3_combout\ & (\pin_index~q\ & ((\k0_p~input_o\)))) # (!\process_1~3_combout\ & ((\v_next_pin_digits~0_combout\) # ((\pin_index~q\ & \k0_p~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_1~3_combout\,
	datab => \pin_index~q\,
	datac => \v_next_pin_digits~0_combout\,
	datad => \k0_p~input_o\,
	combout => \pin_digits[1][1]~6_combout\);

-- Location: LCCOMB_X62_Y69_N10
\pin_digits[1][1]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \pin_digits[1][1]~7_combout\ = (\rst~input_o\) # ((\Selector36~0_combout\ & ((\pin_digits[1][1]~6_combout\) # (!\s.PIN_ENTRY~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector36~0_combout\,
	datab => \rst~input_o\,
	datac => \pin_digits[1][1]~6_combout\,
	datad => \s.PIN_ENTRY~q\,
	combout => \pin_digits[1][1]~7_combout\);

-- Location: FF_X66_Y70_N3
\pin_digits[1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pin_digits~9_combout\,
	ena => \pin_digits[1][1]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pin_digits[1][1]~q\);

-- Location: LCCOMB_X66_Y72_N10
\process_1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_1~1_combout\ = (\pin_digits[1][0]~q\ & \pin_digits[1][1]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pin_digits[1][0]~q\,
	datac => \pin_digits[1][1]~q\,
	combout => \process_1~1_combout\);

-- Location: LCCOMB_X66_Y70_N30
\Mod1|auto_generated|divider|divider|StageOut[16]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[16]~9_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\pin_digits[1][2]~q\ $ (((\pin_digits[1][0]~q\ & \pin_digits[1][1]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[1][0]~q\,
	datab => \pin_digits[1][1]~q\,
	datac => \pin_digits[1][2]~q\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[16]~9_combout\);

-- Location: LCCOMB_X66_Y72_N12
\Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \process_1~1_combout\ $ (\pin_digits[1][2]~q\ $ (VCC))
-- \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(\process_1~1_combout\ $ (\pin_digits[1][2]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_1~1_combout\,
	datab => \pin_digits[1][2]~q\,
	datad => VCC,
	combout => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X66_Y71_N26
\Mod1|auto_generated|divider|divider|StageOut[16]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[16]~6_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[16]~6_combout\);

-- Location: LCCOMB_X66_Y70_N12
\Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~3\ & (((\Mod1|auto_generated|divider|divider|StageOut[16]~9_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[16]~6_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~3\ & (!\Mod1|auto_generated|divider|divider|StageOut[16]~9_combout\ & 
-- (!\Mod1|auto_generated|divider|divider|StageOut[16]~6_combout\)))
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~5\ = CARRY((!\Mod1|auto_generated|divider|divider|StageOut[16]~9_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[16]~6_combout\ & 
-- !\Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[16]~9_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[16]~6_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~3\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~5\);

-- Location: LCCOMB_X66_Y72_N4
\pin_digits~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \pin_digits~10_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\process_1~1_combout\ $ (((\pin_digits[1][2]~q\))))) # (!\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (((\Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_1~1_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \pin_digits[1][2]~q\,
	combout => \pin_digits~10_combout\);

-- Location: LCCOMB_X66_Y70_N4
\pin_digits~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \pin_digits~11_combout\ = (\pin_digits[1][1]~4_combout\ & ((\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & ((\pin_digits~10_combout\))) # (!\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & 
-- (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[1][1]~4_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	datac => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~4_combout\,
	datad => \pin_digits~10_combout\,
	combout => \pin_digits~11_combout\);

-- Location: FF_X66_Y70_N5
\pin_digits[1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pin_digits~11_combout\,
	ena => \pin_digits[1][1]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pin_digits[1][2]~q\);

-- Location: LCCOMB_X66_Y72_N14
\Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & ((\pin_digits[1][3]~q\ $ (\process_1~0_combout\)))) # 
-- (!\Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & (\pin_digits[1][3]~q\ $ ((!\process_1~0_combout\))))
-- \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & (\pin_digits[1][3]~q\ $ (!\process_1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100001001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[1][3]~q\,
	datab => \process_1~0_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X66_Y72_N16
\Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & (\pin_digits[1][3]~q\ & (\process_1~0_combout\ & VCC))) # 
-- (!\Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & ((((\pin_digits[1][3]~q\ & \process_1~0_combout\)))))
-- \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\pin_digits[1][3]~q\ & (\process_1~0_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011100001000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[1][3]~q\,
	datab => \process_1~0_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X66_Y72_N18
\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X66_Y70_N22
\Mod1|auto_generated|divider|divider|StageOut[17]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[17]~5_combout\ = (!\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[17]~5_combout\);

-- Location: LCCOMB_X66_Y70_N20
\Mod1|auto_generated|divider|divider|StageOut[17]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[17]~4_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\pin_digits[1][3]~q\ $ (\process_1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[1][3]~q\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \process_1~0_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[17]~4_combout\);

-- Location: LCCOMB_X66_Y70_N14
\Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~5\ & (((\Mod1|auto_generated|divider|divider|StageOut[17]~5_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[17]~4_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~5\ & ((((\Mod1|auto_generated|divider|divider|StageOut[17]~5_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[17]~4_combout\)))))
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~7\ = CARRY((!\Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~5\ & ((\Mod1|auto_generated|divider|divider|StageOut[17]~5_combout\) # 
-- (\Mod1|auto_generated|divider|divider|StageOut[17]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[17]~5_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[17]~4_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~5\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~7\);

-- Location: LCCOMB_X66_Y72_N22
\pin_digits~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \pin_digits~12_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\pin_digits[1][3]~q\ $ ((\process_1~0_combout\)))) # (!\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (((\Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[1][3]~q\,
	datab => \process_1~0_combout\,
	datac => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \pin_digits~12_combout\);

-- Location: LCCOMB_X66_Y70_N6
\pin_digits~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \pin_digits~13_combout\ = (\pin_digits[1][1]~4_combout\ & ((\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & ((\pin_digits~12_combout\))) # (!\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & 
-- (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[1][1]~4_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	datac => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~6_combout\,
	datad => \pin_digits~12_combout\,
	combout => \pin_digits~13_combout\);

-- Location: FF_X66_Y70_N7
\pin_digits[1][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pin_digits~13_combout\,
	ena => \pin_digits[1][1]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pin_digits[1][3]~q\);

-- Location: LCCOMB_X66_Y71_N8
\Mod1|auto_generated|divider|divider|StageOut[18]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[18]~3_combout\ = (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ & !\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[18]~3_combout\);

-- Location: LCCOMB_X66_Y70_N24
\Mod1|auto_generated|divider|divider|StageOut[18]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|StageOut[18]~2_combout\ = (\pin_digits[1][3]~q\ & (\Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \process_1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[1][3]~q\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \process_1~0_combout\,
	combout => \Mod1|auto_generated|divider|divider|StageOut[18]~2_combout\);

-- Location: LCCOMB_X66_Y70_N16
\Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~9_cout\ = CARRY((!\Mod1|auto_generated|divider|divider|StageOut[18]~3_combout\ & (!\Mod1|auto_generated|divider|divider|StageOut[18]~2_combout\ & 
-- !\Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Mod1|auto_generated|divider|divider|StageOut[18]~3_combout\,
	datab => \Mod1|auto_generated|divider|divider|StageOut[18]~2_combout\,
	datad => VCC,
	cin => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~7\,
	cout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~9_cout\);

-- Location: LCCOMB_X66_Y70_N18
\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ = \Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~9_cout\,
	combout => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\);

-- Location: LCCOMB_X66_Y70_N0
\pin_digits~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \pin_digits~5_combout\ = (\pin_digits[1][1]~4_combout\ & ((\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & ((!\pin_digits[1][0]~q\))) # (!\Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\ & 
-- (\Mod1|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[1][1]~4_combout\,
	datab => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[0]~0_combout\,
	datac => \pin_digits[1][0]~q\,
	datad => \Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~10_combout\,
	combout => \pin_digits~5_combout\);

-- Location: FF_X66_Y70_N1
\pin_digits[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \pin_digits~5_combout\,
	ena => \pin_digits[1][1]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pin_digits[1][0]~q\);

-- Location: LCCOMB_X66_Y72_N8
\process_1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_1~0_combout\ = (\pin_digits[1][0]~q\ & (\pin_digits[1][1]~q\ & \pin_digits[1][2]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pin_digits[1][0]~q\,
	datac => \pin_digits[1][1]~q\,
	datad => \pin_digits[1][2]~q\,
	combout => \process_1~0_combout\);

-- Location: LCCOMB_X65_Y69_N12
\process_1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_1~2_combout\ = (!\pin_digits[0][0]~q\ & (!\pin_digits[0][1]~q\ & (!\pin_digits[0][2]~q\ & !\pin_digits[1][3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[0][0]~q\,
	datab => \pin_digits[0][1]~q\,
	datac => \pin_digits[0][2]~q\,
	datad => \pin_digits[1][3]~q\,
	combout => \process_1~2_combout\);

-- Location: LCCOMB_X65_Y69_N22
\process_1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_1~3_combout\ = (!\pin_digits[0][3]~q\ & (\process_1~0_combout\ & \process_1~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pin_digits[0][3]~q\,
	datac => \process_1~0_combout\,
	datad => \process_1~2_combout\,
	combout => \process_1~3_combout\);

-- Location: LCCOMB_X58_Y69_N28
\Selector7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (\v_next_pin_digits~0_combout\ & (\s.PIN_ENTRY~q\ & \process_1~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \v_next_pin_digits~0_combout\,
	datac => \s.PIN_ENTRY~q\,
	datad => \process_1~3_combout\,
	combout => \Selector7~0_combout\);

-- Location: LCCOMB_X57_Y69_N24
\Selector37~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector37~1_combout\ = (\Selector7~0_combout\) # ((\Selector37~0_combout\ & \close_to_ready~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector37~0_combout\,
	datac => \close_to_ready~q\,
	datad => \Selector7~0_combout\,
	combout => \Selector37~1_combout\);

-- Location: FF_X57_Y69_N25
close_to_ready : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector37~1_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \close_to_ready~q\);

-- Location: LCCOMB_X58_Y69_N6
\Selector0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~1_combout\ = (!\k2_p~input_o\ & (!\k1_p~input_o\ & (!\k0_p~input_o\ & !\s.IDLE_LOCKED~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k2_p~input_o\,
	datab => \k1_p~input_o\,
	datac => \k0_p~input_o\,
	datad => \s.IDLE_LOCKED~q\,
	combout => \Selector0~1_combout\);

-- Location: LCCOMB_X57_Y69_N4
\s~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \s~10_combout\ = (!\rst~input_o\ & (!\Selector0~1_combout\ & ((\close_to_ready~q\) # (!\Selector0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector0~0_combout\,
	datab => \close_to_ready~q\,
	datac => \rst~input_o\,
	datad => \Selector0~1_combout\,
	combout => \s~10_combout\);

-- Location: FF_X57_Y69_N5
\s.IDLE_LOCKED\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \s~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s.IDLE_LOCKED~q\);

-- Location: LCCOMB_X59_Y70_N16
\user_floor[1]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \user_floor[1]~3_combout\ = (user_floor(1)) # ((!\s.IDLE_LOCKED~q\ & ((\k2_p~input_o\) # (\k1_p~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s.IDLE_LOCKED~q\,
	datab => user_floor(1),
	datac => \k2_p~input_o\,
	datad => \k1_p~input_o\,
	combout => \user_floor[1]~3_combout\);

-- Location: LCCOMB_X59_Y70_N6
\user_floor[1]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \user_floor[1]~4_combout\ = (\user_floor[1]~3_combout\ & (!\rst~input_o\ & ((\s.IDLE_LOCKED~q\) # (!\k0_p~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s.IDLE_LOCKED~q\,
	datab => \user_floor[1]~3_combout\,
	datac => \rst~input_o\,
	datad => \k0_p~input_o\,
	combout => \user_floor[1]~4_combout\);

-- Location: FF_X59_Y70_N7
\user_floor[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \user_floor[1]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => user_floor(1));

-- Location: LCCOMB_X59_Y70_N26
\v_next_s~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \v_next_s~8_combout\ = (user_floor(1) & ((current_floor(0) $ (user_floor(0))) # (!current_floor(1)))) # (!user_floor(1) & ((current_floor(1)) # (current_floor(0) $ (user_floor(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101111011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => user_floor(1),
	datab => current_floor(0),
	datac => current_floor(1),
	datad => user_floor(0),
	combout => \v_next_s~8_combout\);

-- Location: LCCOMB_X59_Y70_N4
\Selector2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~2_combout\ = (\s.CALL_MOVING~q\ & ((\u_trav|done~q\) # (!\v_next_s~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|done~q\,
	datac => \v_next_s~8_combout\,
	datad => \s.CALL_MOVING~q\,
	combout => \Selector2~2_combout\);

-- Location: LCCOMB_X58_Y69_N10
\Selector2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~3_combout\ = (current_floor(0) & (\k1_p~input_o\ & (!\k0_p~input_o\ & current_floor(1)))) # (!current_floor(0) & (((\k0_p~input_o\ & !current_floor(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => current_floor(0),
	datab => \k1_p~input_o\,
	datac => \k0_p~input_o\,
	datad => current_floor(1),
	combout => \Selector2~3_combout\);

-- Location: LCCOMB_X57_Y69_N30
\Selector2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~4_combout\ = (\u_door|done~q\ & (\Selector2~3_combout\ & (!\s.IDLE_LOCKED~q\))) # (!\u_door|done~q\ & ((\s.DOOR_OPEN_ENTRY~q\) # ((\Selector2~3_combout\ & !\s.IDLE_LOCKED~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|done~q\,
	datab => \Selector2~3_combout\,
	datac => \s.IDLE_LOCKED~q\,
	datad => \s.DOOR_OPEN_ENTRY~q\,
	combout => \Selector2~4_combout\);

-- Location: LCCOMB_X57_Y68_N0
\Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (current_floor(1) & (!\s.IDLE_LOCKED~q\ & !current_floor(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => current_floor(1),
	datab => \s.IDLE_LOCKED~q\,
	datad => current_floor(0),
	combout => \Selector2~0_combout\);

-- Location: LCCOMB_X62_Y69_N0
\Selector2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~1_combout\ = (\v_next_pin_digits~0_combout\ & ((\Selector2~0_combout\) # ((\s.PIN_ENTRY~q\ & !\process_1~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \v_next_pin_digits~0_combout\,
	datab => \s.PIN_ENTRY~q\,
	datac => \process_1~3_combout\,
	datad => \Selector2~0_combout\,
	combout => \Selector2~1_combout\);

-- Location: LCCOMB_X57_Y69_N28
\Selector2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~5_combout\ = (\Selector2~2_combout\) # ((\Selector2~4_combout\) # (\Selector2~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector2~2_combout\,
	datac => \Selector2~4_combout\,
	datad => \Selector2~1_combout\,
	combout => \Selector2~5_combout\);

-- Location: FF_X57_Y69_N29
\s.DOOR_OPEN_ENTRY\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector2~5_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s.DOOR_OPEN_ENTRY~q\);

-- Location: LCCOMB_X57_Y69_N12
\WideOr19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr19~0_combout\ = (!\s.DOOR_OPEN_ENTRY~q\ & !\s.DOOR_OPEN_EXIT~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \s.DOOR_OPEN_ENTRY~q\,
	datad => \s.DOOR_OPEN_EXIT~q\,
	combout => \WideOr19~0_combout\);

-- Location: LCCOMB_X57_Y69_N6
\u_door|run~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|run~0_combout\ = (!\u_door|run~q\ & (!\u_door|done~q\ & ((\s.DOOR_CLOSE~q\) # (!\WideOr19~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s.DOOR_CLOSE~q\,
	datab => \u_door|run~q\,
	datac => \u_door|done~q\,
	datad => \WideOr19~0_combout\,
	combout => \u_door|run~0_combout\);

-- Location: LCCOMB_X53_Y69_N4
\u_door|cnt[0]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[0]~34_combout\ = (\rst~input_o\) # (\u_door|run~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rst~input_o\,
	datad => \u_door|run~0_combout\,
	combout => \u_door|cnt[0]~34_combout\);

-- Location: LCCOMB_X53_Y69_N6
\u_door|cnt[0]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[0]~35_combout\ = (\u_door|Equal1~10_combout\) # (!\tick_1ms~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_door|Equal1~10_combout\,
	datac => \tick_1ms~input_o\,
	combout => \u_door|cnt[0]~35_combout\);

-- Location: LCCOMB_X53_Y69_N0
\u_door|cnt[0]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[0]~36_combout\ = (\rst~input_o\) # ((\u_door|run~q\ & (!\u_door|cnt[0]~35_combout\)) # (!\u_door|run~q\ & ((\u_door|run~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|cnt[0]~35_combout\,
	datab => \u_door|run~q\,
	datac => \rst~input_o\,
	datad => \u_door|run~0_combout\,
	combout => \u_door|cnt[0]~36_combout\);

-- Location: FF_X49_Y71_N1
\u_door|cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[0]~32_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(0));

-- Location: LCCOMB_X49_Y71_N2
\u_door|cnt[1]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[1]~37_combout\ = (\u_door|cnt\(1) & (!\u_door|cnt[0]~33\)) # (!\u_door|cnt\(1) & ((\u_door|cnt[0]~33\) # (GND)))
-- \u_door|cnt[1]~38\ = CARRY((!\u_door|cnt[0]~33\) # (!\u_door|cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_door|cnt\(1),
	datad => VCC,
	cin => \u_door|cnt[0]~33\,
	combout => \u_door|cnt[1]~37_combout\,
	cout => \u_door|cnt[1]~38\);

-- Location: FF_X49_Y71_N3
\u_door|cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[1]~37_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(1));

-- Location: LCCOMB_X49_Y71_N4
\u_door|cnt[2]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[2]~39_combout\ = (\u_door|cnt\(2) & (\u_door|cnt[1]~38\ $ (GND))) # (!\u_door|cnt\(2) & (!\u_door|cnt[1]~38\ & VCC))
-- \u_door|cnt[2]~40\ = CARRY((\u_door|cnt\(2) & !\u_door|cnt[1]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_door|cnt\(2),
	datad => VCC,
	cin => \u_door|cnt[1]~38\,
	combout => \u_door|cnt[2]~39_combout\,
	cout => \u_door|cnt[2]~40\);

-- Location: FF_X49_Y71_N5
\u_door|cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[2]~39_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(2));

-- Location: LCCOMB_X49_Y71_N6
\u_door|cnt[3]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[3]~41_combout\ = (\u_door|cnt\(3) & (!\u_door|cnt[2]~40\)) # (!\u_door|cnt\(3) & ((\u_door|cnt[2]~40\) # (GND)))
-- \u_door|cnt[3]~42\ = CARRY((!\u_door|cnt[2]~40\) # (!\u_door|cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|cnt\(3),
	datad => VCC,
	cin => \u_door|cnt[2]~40\,
	combout => \u_door|cnt[3]~41_combout\,
	cout => \u_door|cnt[3]~42\);

-- Location: FF_X49_Y71_N7
\u_door|cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[3]~41_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(3));

-- Location: LCCOMB_X49_Y71_N8
\u_door|cnt[4]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[4]~43_combout\ = (\u_door|cnt\(4) & (\u_door|cnt[3]~42\ $ (GND))) # (!\u_door|cnt\(4) & (!\u_door|cnt[3]~42\ & VCC))
-- \u_door|cnt[4]~44\ = CARRY((\u_door|cnt\(4) & !\u_door|cnt[3]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_door|cnt\(4),
	datad => VCC,
	cin => \u_door|cnt[3]~42\,
	combout => \u_door|cnt[4]~43_combout\,
	cout => \u_door|cnt[4]~44\);

-- Location: FF_X49_Y71_N9
\u_door|cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[4]~43_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(4));

-- Location: LCCOMB_X49_Y71_N10
\u_door|cnt[5]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[5]~45_combout\ = (\u_door|cnt\(5) & (!\u_door|cnt[4]~44\)) # (!\u_door|cnt\(5) & ((\u_door|cnt[4]~44\) # (GND)))
-- \u_door|cnt[5]~46\ = CARRY((!\u_door|cnt[4]~44\) # (!\u_door|cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|cnt\(5),
	datad => VCC,
	cin => \u_door|cnt[4]~44\,
	combout => \u_door|cnt[5]~45_combout\,
	cout => \u_door|cnt[5]~46\);

-- Location: FF_X49_Y71_N11
\u_door|cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[5]~45_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(5));

-- Location: LCCOMB_X49_Y71_N12
\u_door|cnt[6]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[6]~47_combout\ = (\u_door|cnt\(6) & (\u_door|cnt[5]~46\ $ (GND))) # (!\u_door|cnt\(6) & (!\u_door|cnt[5]~46\ & VCC))
-- \u_door|cnt[6]~48\ = CARRY((\u_door|cnt\(6) & !\u_door|cnt[5]~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|cnt\(6),
	datad => VCC,
	cin => \u_door|cnt[5]~46\,
	combout => \u_door|cnt[6]~47_combout\,
	cout => \u_door|cnt[6]~48\);

-- Location: FF_X49_Y71_N13
\u_door|cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[6]~47_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(6));

-- Location: LCCOMB_X49_Y71_N14
\u_door|cnt[7]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[7]~49_combout\ = (\u_door|cnt\(7) & (!\u_door|cnt[6]~48\)) # (!\u_door|cnt\(7) & ((\u_door|cnt[6]~48\) # (GND)))
-- \u_door|cnt[7]~50\ = CARRY((!\u_door|cnt[6]~48\) # (!\u_door|cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_door|cnt\(7),
	datad => VCC,
	cin => \u_door|cnt[6]~48\,
	combout => \u_door|cnt[7]~49_combout\,
	cout => \u_door|cnt[7]~50\);

-- Location: FF_X49_Y71_N15
\u_door|cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[7]~49_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(7));

-- Location: LCCOMB_X49_Y71_N16
\u_door|cnt[8]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[8]~51_combout\ = (\u_door|cnt\(8) & (\u_door|cnt[7]~50\ $ (GND))) # (!\u_door|cnt\(8) & (!\u_door|cnt[7]~50\ & VCC))
-- \u_door|cnt[8]~52\ = CARRY((\u_door|cnt\(8) & !\u_door|cnt[7]~50\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_door|cnt\(8),
	datad => VCC,
	cin => \u_door|cnt[7]~50\,
	combout => \u_door|cnt[8]~51_combout\,
	cout => \u_door|cnt[8]~52\);

-- Location: FF_X49_Y71_N17
\u_door|cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[8]~51_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(8));

-- Location: LCCOMB_X49_Y71_N18
\u_door|cnt[9]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[9]~53_combout\ = (\u_door|cnt\(9) & (!\u_door|cnt[8]~52\)) # (!\u_door|cnt\(9) & ((\u_door|cnt[8]~52\) # (GND)))
-- \u_door|cnt[9]~54\ = CARRY((!\u_door|cnt[8]~52\) # (!\u_door|cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_door|cnt\(9),
	datad => VCC,
	cin => \u_door|cnt[8]~52\,
	combout => \u_door|cnt[9]~53_combout\,
	cout => \u_door|cnt[9]~54\);

-- Location: FF_X49_Y71_N19
\u_door|cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[9]~53_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(9));

-- Location: LCCOMB_X49_Y71_N20
\u_door|cnt[10]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[10]~55_combout\ = (\u_door|cnt\(10) & (\u_door|cnt[9]~54\ $ (GND))) # (!\u_door|cnt\(10) & (!\u_door|cnt[9]~54\ & VCC))
-- \u_door|cnt[10]~56\ = CARRY((\u_door|cnt\(10) & !\u_door|cnt[9]~54\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_door|cnt\(10),
	datad => VCC,
	cin => \u_door|cnt[9]~54\,
	combout => \u_door|cnt[10]~55_combout\,
	cout => \u_door|cnt[10]~56\);

-- Location: FF_X49_Y71_N21
\u_door|cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[10]~55_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(10));

-- Location: LCCOMB_X49_Y71_N22
\u_door|cnt[11]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[11]~57_combout\ = (\u_door|cnt\(11) & (!\u_door|cnt[10]~56\)) # (!\u_door|cnt\(11) & ((\u_door|cnt[10]~56\) # (GND)))
-- \u_door|cnt[11]~58\ = CARRY((!\u_door|cnt[10]~56\) # (!\u_door|cnt\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|cnt\(11),
	datad => VCC,
	cin => \u_door|cnt[10]~56\,
	combout => \u_door|cnt[11]~57_combout\,
	cout => \u_door|cnt[11]~58\);

-- Location: FF_X49_Y71_N23
\u_door|cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[11]~57_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(11));

-- Location: LCCOMB_X49_Y71_N24
\u_door|cnt[12]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[12]~59_combout\ = (\u_door|cnt\(12) & (\u_door|cnt[11]~58\ $ (GND))) # (!\u_door|cnt\(12) & (!\u_door|cnt[11]~58\ & VCC))
-- \u_door|cnt[12]~60\ = CARRY((\u_door|cnt\(12) & !\u_door|cnt[11]~58\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_door|cnt\(12),
	datad => VCC,
	cin => \u_door|cnt[11]~58\,
	combout => \u_door|cnt[12]~59_combout\,
	cout => \u_door|cnt[12]~60\);

-- Location: FF_X49_Y71_N25
\u_door|cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[12]~59_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(12));

-- Location: LCCOMB_X49_Y71_N26
\u_door|cnt[13]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[13]~61_combout\ = (\u_door|cnt\(13) & (!\u_door|cnt[12]~60\)) # (!\u_door|cnt\(13) & ((\u_door|cnt[12]~60\) # (GND)))
-- \u_door|cnt[13]~62\ = CARRY((!\u_door|cnt[12]~60\) # (!\u_door|cnt\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|cnt\(13),
	datad => VCC,
	cin => \u_door|cnt[12]~60\,
	combout => \u_door|cnt[13]~61_combout\,
	cout => \u_door|cnt[13]~62\);

-- Location: FF_X49_Y71_N27
\u_door|cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[13]~61_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(13));

-- Location: LCCOMB_X49_Y71_N28
\u_door|cnt[14]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[14]~63_combout\ = (\u_door|cnt\(14) & (\u_door|cnt[13]~62\ $ (GND))) # (!\u_door|cnt\(14) & (!\u_door|cnt[13]~62\ & VCC))
-- \u_door|cnt[14]~64\ = CARRY((\u_door|cnt\(14) & !\u_door|cnt[13]~62\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_door|cnt\(14),
	datad => VCC,
	cin => \u_door|cnt[13]~62\,
	combout => \u_door|cnt[14]~63_combout\,
	cout => \u_door|cnt[14]~64\);

-- Location: FF_X49_Y71_N29
\u_door|cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[14]~63_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(14));

-- Location: LCCOMB_X49_Y71_N30
\u_door|cnt[15]~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[15]~65_combout\ = (\u_door|cnt\(15) & (!\u_door|cnt[14]~64\)) # (!\u_door|cnt\(15) & ((\u_door|cnt[14]~64\) # (GND)))
-- \u_door|cnt[15]~66\ = CARRY((!\u_door|cnt[14]~64\) # (!\u_door|cnt\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|cnt\(15),
	datad => VCC,
	cin => \u_door|cnt[14]~64\,
	combout => \u_door|cnt[15]~65_combout\,
	cout => \u_door|cnt[15]~66\);

-- Location: FF_X49_Y71_N31
\u_door|cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[15]~65_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(15));

-- Location: LCCOMB_X49_Y70_N0
\u_door|cnt[16]~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[16]~67_combout\ = (\u_door|cnt\(16) & (\u_door|cnt[15]~66\ $ (GND))) # (!\u_door|cnt\(16) & (!\u_door|cnt[15]~66\ & VCC))
-- \u_door|cnt[16]~68\ = CARRY((\u_door|cnt\(16) & !\u_door|cnt[15]~66\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_door|cnt\(16),
	datad => VCC,
	cin => \u_door|cnt[15]~66\,
	combout => \u_door|cnt[16]~67_combout\,
	cout => \u_door|cnt[16]~68\);

-- Location: FF_X49_Y70_N1
\u_door|cnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[16]~67_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(16));

-- Location: LCCOMB_X49_Y70_N2
\u_door|cnt[17]~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[17]~69_combout\ = (\u_door|cnt\(17) & (!\u_door|cnt[16]~68\)) # (!\u_door|cnt\(17) & ((\u_door|cnt[16]~68\) # (GND)))
-- \u_door|cnt[17]~70\ = CARRY((!\u_door|cnt[16]~68\) # (!\u_door|cnt\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_door|cnt\(17),
	datad => VCC,
	cin => \u_door|cnt[16]~68\,
	combout => \u_door|cnt[17]~69_combout\,
	cout => \u_door|cnt[17]~70\);

-- Location: FF_X49_Y70_N3
\u_door|cnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[17]~69_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(17));

-- Location: LCCOMB_X49_Y70_N4
\u_door|cnt[18]~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[18]~71_combout\ = (\u_door|cnt\(18) & (\u_door|cnt[17]~70\ $ (GND))) # (!\u_door|cnt\(18) & (!\u_door|cnt[17]~70\ & VCC))
-- \u_door|cnt[18]~72\ = CARRY((\u_door|cnt\(18) & !\u_door|cnt[17]~70\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_door|cnt\(18),
	datad => VCC,
	cin => \u_door|cnt[17]~70\,
	combout => \u_door|cnt[18]~71_combout\,
	cout => \u_door|cnt[18]~72\);

-- Location: FF_X49_Y70_N5
\u_door|cnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[18]~71_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(18));

-- Location: LCCOMB_X49_Y70_N6
\u_door|cnt[19]~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[19]~73_combout\ = (\u_door|cnt\(19) & (!\u_door|cnt[18]~72\)) # (!\u_door|cnt\(19) & ((\u_door|cnt[18]~72\) # (GND)))
-- \u_door|cnt[19]~74\ = CARRY((!\u_door|cnt[18]~72\) # (!\u_door|cnt\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|cnt\(19),
	datad => VCC,
	cin => \u_door|cnt[18]~72\,
	combout => \u_door|cnt[19]~73_combout\,
	cout => \u_door|cnt[19]~74\);

-- Location: FF_X49_Y70_N7
\u_door|cnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[19]~73_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(19));

-- Location: LCCOMB_X49_Y70_N8
\u_door|cnt[20]~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[20]~75_combout\ = (\u_door|cnt\(20) & (\u_door|cnt[19]~74\ $ (GND))) # (!\u_door|cnt\(20) & (!\u_door|cnt[19]~74\ & VCC))
-- \u_door|cnt[20]~76\ = CARRY((\u_door|cnt\(20) & !\u_door|cnt[19]~74\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_door|cnt\(20),
	datad => VCC,
	cin => \u_door|cnt[19]~74\,
	combout => \u_door|cnt[20]~75_combout\,
	cout => \u_door|cnt[20]~76\);

-- Location: FF_X49_Y70_N9
\u_door|cnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[20]~75_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(20));

-- Location: LCCOMB_X49_Y70_N10
\u_door|cnt[21]~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[21]~77_combout\ = (\u_door|cnt\(21) & (!\u_door|cnt[20]~76\)) # (!\u_door|cnt\(21) & ((\u_door|cnt[20]~76\) # (GND)))
-- \u_door|cnt[21]~78\ = CARRY((!\u_door|cnt[20]~76\) # (!\u_door|cnt\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|cnt\(21),
	datad => VCC,
	cin => \u_door|cnt[20]~76\,
	combout => \u_door|cnt[21]~77_combout\,
	cout => \u_door|cnt[21]~78\);

-- Location: FF_X49_Y70_N11
\u_door|cnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[21]~77_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(21));

-- Location: LCCOMB_X49_Y70_N12
\u_door|cnt[22]~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[22]~79_combout\ = (\u_door|cnt\(22) & (\u_door|cnt[21]~78\ $ (GND))) # (!\u_door|cnt\(22) & (!\u_door|cnt[21]~78\ & VCC))
-- \u_door|cnt[22]~80\ = CARRY((\u_door|cnt\(22) & !\u_door|cnt[21]~78\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|cnt\(22),
	datad => VCC,
	cin => \u_door|cnt[21]~78\,
	combout => \u_door|cnt[22]~79_combout\,
	cout => \u_door|cnt[22]~80\);

-- Location: FF_X49_Y70_N13
\u_door|cnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[22]~79_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(22));

-- Location: LCCOMB_X49_Y70_N14
\u_door|cnt[23]~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[23]~81_combout\ = (\u_door|cnt\(23) & (!\u_door|cnt[22]~80\)) # (!\u_door|cnt\(23) & ((\u_door|cnt[22]~80\) # (GND)))
-- \u_door|cnt[23]~82\ = CARRY((!\u_door|cnt[22]~80\) # (!\u_door|cnt\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_door|cnt\(23),
	datad => VCC,
	cin => \u_door|cnt[22]~80\,
	combout => \u_door|cnt[23]~81_combout\,
	cout => \u_door|cnt[23]~82\);

-- Location: FF_X49_Y70_N15
\u_door|cnt[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[23]~81_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(23));

-- Location: LCCOMB_X49_Y70_N16
\u_door|cnt[24]~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[24]~83_combout\ = (\u_door|cnt\(24) & (\u_door|cnt[23]~82\ $ (GND))) # (!\u_door|cnt\(24) & (!\u_door|cnt[23]~82\ & VCC))
-- \u_door|cnt[24]~84\ = CARRY((\u_door|cnt\(24) & !\u_door|cnt[23]~82\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_door|cnt\(24),
	datad => VCC,
	cin => \u_door|cnt[23]~82\,
	combout => \u_door|cnt[24]~83_combout\,
	cout => \u_door|cnt[24]~84\);

-- Location: FF_X49_Y70_N17
\u_door|cnt[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[24]~83_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(24));

-- Location: LCCOMB_X49_Y70_N18
\u_door|cnt[25]~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[25]~85_combout\ = (\u_door|cnt\(25) & (!\u_door|cnt[24]~84\)) # (!\u_door|cnt\(25) & ((\u_door|cnt[24]~84\) # (GND)))
-- \u_door|cnt[25]~86\ = CARRY((!\u_door|cnt[24]~84\) # (!\u_door|cnt\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_door|cnt\(25),
	datad => VCC,
	cin => \u_door|cnt[24]~84\,
	combout => \u_door|cnt[25]~85_combout\,
	cout => \u_door|cnt[25]~86\);

-- Location: FF_X49_Y70_N19
\u_door|cnt[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[25]~85_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(25));

-- Location: LCCOMB_X49_Y70_N20
\u_door|cnt[26]~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[26]~87_combout\ = (\u_door|cnt\(26) & (\u_door|cnt[25]~86\ $ (GND))) # (!\u_door|cnt\(26) & (!\u_door|cnt[25]~86\ & VCC))
-- \u_door|cnt[26]~88\ = CARRY((\u_door|cnt\(26) & !\u_door|cnt[25]~86\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_door|cnt\(26),
	datad => VCC,
	cin => \u_door|cnt[25]~86\,
	combout => \u_door|cnt[26]~87_combout\,
	cout => \u_door|cnt[26]~88\);

-- Location: FF_X49_Y70_N21
\u_door|cnt[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[26]~87_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(26));

-- Location: LCCOMB_X49_Y70_N22
\u_door|cnt[27]~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[27]~89_combout\ = (\u_door|cnt\(27) & (!\u_door|cnt[26]~88\)) # (!\u_door|cnt\(27) & ((\u_door|cnt[26]~88\) # (GND)))
-- \u_door|cnt[27]~90\ = CARRY((!\u_door|cnt[26]~88\) # (!\u_door|cnt\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|cnt\(27),
	datad => VCC,
	cin => \u_door|cnt[26]~88\,
	combout => \u_door|cnt[27]~89_combout\,
	cout => \u_door|cnt[27]~90\);

-- Location: FF_X49_Y70_N23
\u_door|cnt[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[27]~89_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(27));

-- Location: LCCOMB_X48_Y70_N4
\u_door|Equal1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|Equal1~8_combout\ = (!\u_door|cnt\(24) & (!\u_door|cnt\(27) & (!\u_door|cnt\(26) & !\u_door|cnt\(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|cnt\(24),
	datab => \u_door|cnt\(27),
	datac => \u_door|cnt\(26),
	datad => \u_door|cnt\(25),
	combout => \u_door|Equal1~8_combout\);

-- Location: LCCOMB_X49_Y70_N24
\u_door|cnt[28]~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[28]~91_combout\ = (\u_door|cnt\(28) & (\u_door|cnt[27]~90\ $ (GND))) # (!\u_door|cnt\(28) & (!\u_door|cnt[27]~90\ & VCC))
-- \u_door|cnt[28]~92\ = CARRY((\u_door|cnt\(28) & !\u_door|cnt[27]~90\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_door|cnt\(28),
	datad => VCC,
	cin => \u_door|cnt[27]~90\,
	combout => \u_door|cnt[28]~91_combout\,
	cout => \u_door|cnt[28]~92\);

-- Location: FF_X49_Y70_N25
\u_door|cnt[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[28]~91_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(28));

-- Location: LCCOMB_X49_Y70_N26
\u_door|cnt[29]~93\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[29]~93_combout\ = (\u_door|cnt\(29) & (!\u_door|cnt[28]~92\)) # (!\u_door|cnt\(29) & ((\u_door|cnt[28]~92\) # (GND)))
-- \u_door|cnt[29]~94\ = CARRY((!\u_door|cnt[28]~92\) # (!\u_door|cnt\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|cnt\(29),
	datad => VCC,
	cin => \u_door|cnt[28]~92\,
	combout => \u_door|cnt[29]~93_combout\,
	cout => \u_door|cnt[29]~94\);

-- Location: FF_X49_Y70_N27
\u_door|cnt[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[29]~93_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(29));

-- Location: LCCOMB_X49_Y70_N28
\u_door|cnt[30]~95\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[30]~95_combout\ = (\u_door|cnt\(30) & (\u_door|cnt[29]~94\ $ (GND))) # (!\u_door|cnt\(30) & (!\u_door|cnt[29]~94\ & VCC))
-- \u_door|cnt[30]~96\ = CARRY((\u_door|cnt\(30) & !\u_door|cnt[29]~94\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_door|cnt\(30),
	datad => VCC,
	cin => \u_door|cnt[29]~94\,
	combout => \u_door|cnt[30]~95_combout\,
	cout => \u_door|cnt[30]~96\);

-- Location: FF_X49_Y70_N29
\u_door|cnt[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[30]~95_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(30));

-- Location: LCCOMB_X49_Y70_N30
\u_door|cnt[31]~97\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|cnt[31]~97_combout\ = \u_door|cnt\(31) $ (\u_door|cnt[30]~96\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|cnt\(31),
	cin => \u_door|cnt[30]~96\,
	combout => \u_door|cnt[31]~97_combout\);

-- Location: FF_X49_Y70_N31
\u_door|cnt[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|cnt[31]~97_combout\,
	sclr => \u_door|cnt[0]~34_combout\,
	ena => \u_door|cnt[0]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|cnt\(31));

-- Location: LCCOMB_X48_Y70_N22
\u_door|Equal1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|Equal1~9_combout\ = (!\u_door|cnt\(28) & (!\u_door|cnt\(29) & (!\u_door|cnt\(31) & !\u_door|cnt\(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|cnt\(28),
	datab => \u_door|cnt\(29),
	datac => \u_door|cnt\(31),
	datad => \u_door|cnt\(30),
	combout => \u_door|Equal1~9_combout\);

-- Location: LCCOMB_X48_Y70_N0
\u_door|Equal1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|Equal1~5_combout\ = (!\u_door|cnt\(18) & !\u_door|cnt\(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|cnt\(18),
	datad => \u_door|cnt\(19),
	combout => \u_door|Equal1~5_combout\);

-- Location: LCCOMB_X48_Y70_N2
\u_door|Equal1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|Equal1~6_combout\ = (!\u_door|cnt\(20) & (!\u_door|cnt\(23) & (!\u_door|cnt\(21) & !\u_door|cnt\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|cnt\(20),
	datab => \u_door|cnt\(23),
	datac => \u_door|cnt\(21),
	datad => \u_door|cnt\(22),
	combout => \u_door|Equal1~6_combout\);

-- Location: LCCOMB_X48_Y71_N26
\u_door|Equal1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|Equal1~7_combout\ = (!\u_door|cnt\(17) & (\u_door|Equal1~5_combout\ & (\u_door|Equal1~6_combout\ & !\u_door|cnt\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|cnt\(17),
	datab => \u_door|Equal1~5_combout\,
	datac => \u_door|Equal1~6_combout\,
	datad => \u_door|cnt\(16),
	combout => \u_door|Equal1~7_combout\);

-- Location: LCCOMB_X48_Y71_N12
\u_door|Equal1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|Equal1~2_combout\ = (\u_door|cnt\(11) & (\u_door|cnt\(8) & (!\u_door|cnt\(10) & \u_door|cnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|cnt\(11),
	datab => \u_door|cnt\(8),
	datac => \u_door|cnt\(10),
	datad => \u_door|cnt\(9),
	combout => \u_door|Equal1~2_combout\);

-- Location: LCCOMB_X48_Y71_N16
\u_door|Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|Equal1~0_combout\ = (\u_door|cnt\(2) & (!\u_door|cnt\(3) & (\u_door|cnt\(0) & \u_door|cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|cnt\(2),
	datab => \u_door|cnt\(3),
	datac => \u_door|cnt\(0),
	datad => \u_door|cnt\(1),
	combout => \u_door|Equal1~0_combout\);

-- Location: LCCOMB_X48_Y71_N22
\u_door|Equal1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|Equal1~3_combout\ = (!\u_door|cnt\(12) & (!\u_door|cnt\(14) & (!\u_door|cnt\(15) & !\u_door|cnt\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|cnt\(12),
	datab => \u_door|cnt\(14),
	datac => \u_door|cnt\(15),
	datad => \u_door|cnt\(13),
	combout => \u_door|Equal1~3_combout\);

-- Location: LCCOMB_X48_Y71_N10
\u_door|Equal1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|Equal1~1_combout\ = (\u_door|cnt\(7) & (!\u_door|cnt\(6) & (\u_door|cnt\(4) & \u_door|cnt\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|cnt\(7),
	datab => \u_door|cnt\(6),
	datac => \u_door|cnt\(4),
	datad => \u_door|cnt\(5),
	combout => \u_door|Equal1~1_combout\);

-- Location: LCCOMB_X48_Y71_N24
\u_door|Equal1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|Equal1~4_combout\ = (\u_door|Equal1~2_combout\ & (\u_door|Equal1~0_combout\ & (\u_door|Equal1~3_combout\ & \u_door|Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|Equal1~2_combout\,
	datab => \u_door|Equal1~0_combout\,
	datac => \u_door|Equal1~3_combout\,
	datad => \u_door|Equal1~1_combout\,
	combout => \u_door|Equal1~4_combout\);

-- Location: LCCOMB_X48_Y71_N28
\u_door|Equal1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|Equal1~10_combout\ = (\u_door|Equal1~8_combout\ & (\u_door|Equal1~9_combout\ & (\u_door|Equal1~7_combout\ & \u_door|Equal1~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|Equal1~8_combout\,
	datab => \u_door|Equal1~9_combout\,
	datac => \u_door|Equal1~7_combout\,
	datad => \u_door|Equal1~4_combout\,
	combout => \u_door|Equal1~10_combout\);

-- Location: LCCOMB_X53_Y69_N24
\u_door|done~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_door|done~0_combout\ = (\u_door|Equal1~10_combout\ & (\tick_1ms~input_o\ & \u_door|run~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_door|Equal1~10_combout\,
	datac => \tick_1ms~input_o\,
	datad => \u_door|run~q\,
	combout => \u_door|done~0_combout\);

-- Location: FF_X53_Y69_N25
\u_door|done\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_door|done~0_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_door|done~q\);

-- Location: LCCOMB_X57_Y69_N26
\Selector7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~1_combout\ = (\Selector7~0_combout\) # ((\u_door|done~q\ & ((\s.DOOR_OPEN_EXIT~q\))) # (!\u_door|done~q\ & (\s.DOOR_CLOSE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_door|done~q\,
	datab => \Selector7~0_combout\,
	datac => \s.DOOR_CLOSE~q\,
	datad => \s.DOOR_OPEN_EXIT~q\,
	combout => \Selector7~1_combout\);

-- Location: FF_X57_Y69_N27
\s.DOOR_CLOSE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector7~1_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s.DOOR_CLOSE~q\);

-- Location: LCCOMB_X57_Y69_N10
\Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\s.DOOR_CLOSE~q\ & \u_door|done~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s.DOOR_CLOSE~q\,
	datac => \u_door|done~q\,
	combout => \Selector0~0_combout\);

-- Location: LCCOMB_X57_Y69_N0
\Selector4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector4~1_combout\ = (\Selector0~0_combout\ & ((\close_to_ready~q\) # ((!\Selector5~2_combout\ & \s.READY_SELECT~q\)))) # (!\Selector0~0_combout\ & (!\Selector5~2_combout\ & (\s.READY_SELECT~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector0~0_combout\,
	datab => \Selector5~2_combout\,
	datac => \s.READY_SELECT~q\,
	datad => \close_to_ready~q\,
	combout => \Selector4~1_combout\);

-- Location: FF_X57_Y69_N1
\s.READY_SELECT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector4~1_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s.READY_SELECT~q\);

-- Location: LCCOMB_X58_Y70_N14
\v_next_target_floor[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \v_next_target_floor[1]~2_combout\ = (\s.READY_SELECT~q\ & ((\k1_p~input_o\) # ((\k2_p~input_o\) # (\k0_p~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k1_p~input_o\,
	datab => \s.READY_SELECT~q\,
	datac => \k2_p~input_o\,
	datad => \k0_p~input_o\,
	combout => \v_next_target_floor[1]~2_combout\);

-- Location: LCCOMB_X58_Y70_N0
\v_next_target_floor[1]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \v_next_target_floor[1]~3_combout\ = (\v_next_target_floor[1]~2_combout\ & ((!\k0_p~input_o\))) # (!\v_next_target_floor[1]~2_combout\ & (target_floor(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \v_next_target_floor[1]~2_combout\,
	datac => target_floor(1),
	datad => \k0_p~input_o\,
	combout => \v_next_target_floor[1]~3_combout\);

-- Location: FF_X58_Y70_N1
\target_floor[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \v_next_target_floor[1]~3_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => target_floor(1));

-- Location: LCCOMB_X58_Y69_N24
\Selector25~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector25~0_combout\ = (\s.MOVING~q\ & (target_floor(1))) # (!\s.MOVING~q\ & ((user_floor(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => target_floor(1),
	datac => user_floor(1),
	datad => \s.MOVING~q\,
	combout => \Selector25~0_combout\);

-- Location: LCCOMB_X59_Y69_N10
\Selector25~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector25~1_combout\ = (\Selector26~0_combout\ & (\Selector25~0_combout\)) # (!\Selector26~0_combout\ & ((current_floor(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector25~0_combout\,
	datac => current_floor(1),
	datad => \Selector26~0_combout\,
	combout => \Selector25~1_combout\);

-- Location: FF_X59_Y69_N11
\current_floor[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector25~1_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => current_floor(1));

-- Location: LCCOMB_X59_Y69_N22
\v_next_s~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \v_next_s~9_combout\ = (current_floor(1) & ((target_floor(0) $ (current_floor(0))) # (!target_floor(1)))) # (!current_floor(1) & ((target_floor(1)) # (target_floor(0) $ (current_floor(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110111111110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => current_floor(1),
	datab => target_floor(1),
	datac => target_floor(0),
	datad => current_floor(0),
	combout => \v_next_s~9_combout\);

-- Location: LCCOMB_X59_Y69_N8
\Add4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~0_combout\ = target_floor(0) $ (current_floor(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => target_floor(0),
	datad => current_floor(0),
	combout => \Add4~0_combout\);

-- Location: LCCOMB_X59_Y69_N16
\u_trav|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Equal0~1_combout\ = ((!\Add4~0_combout\ & ((\Add5~0_combout\) # (!\v_next_s~9_combout\)))) # (!\s.MOVING~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \v_next_s~9_combout\,
	datab => \s.MOVING~q\,
	datac => \Add4~0_combout\,
	datad => \Add5~0_combout\,
	combout => \u_trav|Equal0~1_combout\);

-- Location: LCCOMB_X58_Y67_N0
\u_trav|cnt[0]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[0]~32_combout\ = \u_trav|cnt\(0) $ (VCC)
-- \u_trav|cnt[0]~33\ = CARRY(\u_trav|cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|cnt\(0),
	datad => VCC,
	combout => \u_trav|cnt[0]~32_combout\,
	cout => \u_trav|cnt[0]~33\);

-- Location: LCCOMB_X58_Y68_N0
\u_trav|cnt[8]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[8]~42_combout\ = (\u_trav|run~0_combout\) # (\rst~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|run~0_combout\,
	datac => \rst~input_o\,
	combout => \u_trav|cnt[8]~42_combout\);

-- Location: LCCOMB_X59_Y69_N4
\Selector14~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector14~1_combout\ = (\v_next_s~9_combout\ & (\s.MOVING~q\ & ((\Add4~0_combout\) # (!\Add5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \v_next_s~9_combout\,
	datab => \s.MOVING~q\,
	datac => \Add4~0_combout\,
	datad => \Add5~0_combout\,
	combout => \Selector14~1_combout\);

-- Location: LCCOMB_X59_Y70_N12
\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = current_floor(0) $ (user_floor(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => current_floor(0),
	datad => user_floor(0),
	combout => \Add0~0_combout\);

-- Location: LCCOMB_X60_Y70_N0
\Selector14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector14~0_combout\ = (\v_next_s~8_combout\ & (\s.CALL_MOVING~q\ & ((\Add0~0_combout\) # (!\Add1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \v_next_s~8_combout\,
	datab => \Add0~0_combout\,
	datac => \Add1~0_combout\,
	datad => \s.CALL_MOVING~q\,
	combout => \Selector14~0_combout\);

-- Location: LCCOMB_X59_Y70_N10
\Selector12~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector12~4_combout\ = (\s.CALL_MOVING~q\ & (\Add1~0_combout\ & (user_floor(0) $ (current_floor(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s.CALL_MOVING~q\,
	datab => user_floor(0),
	datac => current_floor(0),
	datad => \Add1~0_combout\,
	combout => \Selector12~4_combout\);

-- Location: LCCOMB_X59_Y69_N20
\Selector12~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector12~5_combout\ = (\s.MOVING~q\ & (\Add5~0_combout\ & (current_floor(0) $ (target_floor(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => current_floor(0),
	datab => \s.MOVING~q\,
	datac => target_floor(0),
	datad => \Add5~0_combout\,
	combout => \Selector12~5_combout\);

-- Location: LCCOMB_X59_Y69_N30
\Selector11~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector11~1_combout\ = (\v_next_s~9_combout\ & (\s.MOVING~q\ & (!\Add4~0_combout\ & !\Add5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \v_next_s~9_combout\,
	datab => \s.MOVING~q\,
	datac => \Add4~0_combout\,
	datad => \Add5~0_combout\,
	combout => \Selector11~1_combout\);

-- Location: LCCOMB_X59_Y70_N20
\Selector11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector11~0_combout\ = (!\Add0~0_combout\ & (!\Add1~0_combout\ & (\v_next_s~8_combout\ & \s.CALL_MOVING~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => \Add1~0_combout\,
	datac => \v_next_s~8_combout\,
	datad => \s.CALL_MOVING~q\,
	combout => \Selector11~0_combout\);

-- Location: LCCOMB_X59_Y70_N18
\Selector19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector19~0_combout\ = (\v_next_s~8_combout\ & (\s.CALL_MOVING~q\ & (\Add0~0_combout\ $ (!\Add1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => \Add1~0_combout\,
	datac => \v_next_s~8_combout\,
	datad => \s.CALL_MOVING~q\,
	combout => \Selector19~0_combout\);

-- Location: LCCOMB_X59_Y69_N2
\Selector19~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector19~1_combout\ = (\v_next_s~9_combout\ & (\s.MOVING~q\ & (\Add4~0_combout\ $ (!\Add5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \v_next_s~9_combout\,
	datab => \s.MOVING~q\,
	datac => \Add4~0_combout\,
	datad => \Add5~0_combout\,
	combout => \Selector19~1_combout\);

-- Location: LCCOMB_X59_Y69_N0
\Selector20~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector20~1_combout\ = (\s.MOVING~q\ & (target_floor(0) $ (current_floor(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \s.MOVING~q\,
	datac => target_floor(0),
	datad => current_floor(0),
	combout => \Selector20~1_combout\);

-- Location: LCCOMB_X59_Y68_N0
\Selector20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector20~0_combout\ = (\s.CALL_MOVING~q\ & (user_floor(0) $ (current_floor(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => user_floor(0),
	datac => current_floor(0),
	datad => \s.CALL_MOVING~q\,
	combout => \Selector20~0_combout\);

-- Location: LCCOMB_X59_Y68_N4
\u_trav|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Add0~0_combout\ = (((\Selector20~1_combout\) # (\Selector20~0_combout\)))
-- \u_trav|Add0~1\ = CARRY((\Selector20~1_combout\) # (\Selector20~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector20~1_combout\,
	datab => \Selector20~0_combout\,
	datad => VCC,
	combout => \u_trav|Add0~0_combout\,
	cout => \u_trav|Add0~1\);

-- Location: LCCOMB_X59_Y68_N6
\u_trav|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Add0~2_combout\ = (\u_trav|Add0~1\ & (((\Selector19~0_combout\) # (\Selector19~1_combout\)))) # (!\u_trav|Add0~1\ & (!\Selector19~0_combout\ & (!\Selector19~1_combout\)))
-- \u_trav|Add0~3\ = CARRY((!\Selector19~0_combout\ & (!\Selector19~1_combout\ & !\u_trav|Add0~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Selector19~0_combout\,
	datab => \Selector19~1_combout\,
	datad => VCC,
	cin => \u_trav|Add0~1\,
	combout => \u_trav|Add0~2_combout\,
	cout => \u_trav|Add0~3\);

-- Location: LCCOMB_X59_Y68_N8
\u_trav|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Add0~4_combout\ = (\u_trav|Add0~3\ & ((((\Selector14~1_combout\) # (\Selector14~0_combout\))))) # (!\u_trav|Add0~3\ & ((\Selector14~1_combout\) # ((\Selector14~0_combout\) # (GND))))
-- \u_trav|Add0~5\ = CARRY((\Selector14~1_combout\) # ((\Selector14~0_combout\) # (!\u_trav|Add0~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Selector14~1_combout\,
	datab => \Selector14~0_combout\,
	datad => VCC,
	cin => \u_trav|Add0~3\,
	combout => \u_trav|Add0~4_combout\,
	cout => \u_trav|Add0~5\);

-- Location: LCCOMB_X59_Y68_N10
\u_trav|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Add0~6_combout\ = (\u_trav|Add0~5\ & (((\Selector11~1_combout\) # (\Selector11~0_combout\)))) # (!\u_trav|Add0~5\ & (!\Selector11~1_combout\ & (!\Selector11~0_combout\)))
-- \u_trav|Add0~7\ = CARRY((!\Selector11~1_combout\ & (!\Selector11~0_combout\ & !\u_trav|Add0~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Selector11~1_combout\,
	datab => \Selector11~0_combout\,
	datad => VCC,
	cin => \u_trav|Add0~5\,
	combout => \u_trav|Add0~6_combout\,
	cout => \u_trav|Add0~7\);

-- Location: LCCOMB_X59_Y68_N12
\u_trav|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Add0~8_combout\ = (\u_trav|Add0~7\ & ((((\Selector12~4_combout\) # (\Selector12~5_combout\))))) # (!\u_trav|Add0~7\ & ((\Selector12~4_combout\) # ((\Selector12~5_combout\) # (GND))))
-- \u_trav|Add0~9\ = CARRY((\Selector12~4_combout\) # ((\Selector12~5_combout\) # (!\u_trav|Add0~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Selector12~4_combout\,
	datab => \Selector12~5_combout\,
	datad => VCC,
	cin => \u_trav|Add0~7\,
	combout => \u_trav|Add0~8_combout\,
	cout => \u_trav|Add0~9\);

-- Location: LCCOMB_X59_Y68_N14
\u_trav|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Add0~10_combout\ = (\u_trav|Add0~9\ & (((\Selector14~1_combout\) # (\Selector14~0_combout\)))) # (!\u_trav|Add0~9\ & (!\Selector14~1_combout\ & (!\Selector14~0_combout\)))
-- \u_trav|Add0~11\ = CARRY((!\Selector14~1_combout\ & (!\Selector14~0_combout\ & !\u_trav|Add0~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Selector14~1_combout\,
	datab => \Selector14~0_combout\,
	datad => VCC,
	cin => \u_trav|Add0~9\,
	combout => \u_trav|Add0~10_combout\,
	cout => \u_trav|Add0~11\);

-- Location: LCCOMB_X59_Y68_N16
\u_trav|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Add0~12_combout\ = (\u_trav|Add0~11\ & ((((\Selector14~1_combout\) # (\Selector14~0_combout\))))) # (!\u_trav|Add0~11\ & ((\Selector14~1_combout\) # ((\Selector14~0_combout\) # (GND))))
-- \u_trav|Add0~13\ = CARRY((\Selector14~1_combout\) # ((\Selector14~0_combout\) # (!\u_trav|Add0~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Selector14~1_combout\,
	datab => \Selector14~0_combout\,
	datad => VCC,
	cin => \u_trav|Add0~11\,
	combout => \u_trav|Add0~12_combout\,
	cout => \u_trav|Add0~13\);

-- Location: LCCOMB_X59_Y68_N18
\u_trav|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Add0~14_combout\ = (\u_trav|Add0~13\ & (((\Selector11~1_combout\) # (\Selector11~0_combout\)))) # (!\u_trav|Add0~13\ & (!\Selector11~1_combout\ & (!\Selector11~0_combout\)))
-- \u_trav|Add0~15\ = CARRY((!\Selector11~1_combout\ & (!\Selector11~0_combout\ & !\u_trav|Add0~13\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Selector11~1_combout\,
	datab => \Selector11~0_combout\,
	datad => VCC,
	cin => \u_trav|Add0~13\,
	combout => \u_trav|Add0~14_combout\,
	cout => \u_trav|Add0~15\);

-- Location: LCCOMB_X59_Y67_N10
\u_trav|Equal1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Equal1~3_combout\ = (\u_trav|Add0~12_combout\ & (\u_trav|cnt\(9) & (\u_trav|Add0~14_combout\ $ (!\u_trav|cnt\(10))))) # (!\u_trav|Add0~12_combout\ & (!\u_trav|cnt\(9) & (\u_trav|Add0~14_combout\ $ (!\u_trav|cnt\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|Add0~12_combout\,
	datab => \u_trav|cnt\(9),
	datac => \u_trav|Add0~14_combout\,
	datad => \u_trav|cnt\(10),
	combout => \u_trav|Equal1~3_combout\);

-- Location: LCCOMB_X58_Y68_N20
\u_trav|Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Equal1~0_combout\ = (\u_trav|cnt\(3) & (\u_trav|Add0~0_combout\ & (\u_trav|cnt\(4) $ (!\u_trav|Add0~2_combout\)))) # (!\u_trav|cnt\(3) & (!\u_trav|Add0~0_combout\ & (\u_trav|cnt\(4) $ (!\u_trav|Add0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(3),
	datab => \u_trav|Add0~0_combout\,
	datac => \u_trav|cnt\(4),
	datad => \u_trav|Add0~2_combout\,
	combout => \u_trav|Equal1~0_combout\);

-- Location: LCCOMB_X58_Y68_N22
\u_trav|Equal1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Equal1~2_combout\ = (\u_trav|cnt\(7) & (\u_trav|Add0~8_combout\ & (\u_trav|Add0~10_combout\ $ (!\u_trav|cnt\(8))))) # (!\u_trav|cnt\(7) & (!\u_trav|Add0~8_combout\ & (\u_trav|Add0~10_combout\ $ (!\u_trav|cnt\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(7),
	datab => \u_trav|Add0~10_combout\,
	datac => \u_trav|Add0~8_combout\,
	datad => \u_trav|cnt\(8),
	combout => \u_trav|Equal1~2_combout\);

-- Location: LCCOMB_X59_Y67_N0
\u_trav|Equal1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Equal1~1_combout\ = (\u_trav|cnt\(6) & (\u_trav|Add0~6_combout\ & (\u_trav|Add0~4_combout\ $ (!\u_trav|cnt\(5))))) # (!\u_trav|cnt\(6) & (!\u_trav|Add0~6_combout\ & (\u_trav|Add0~4_combout\ $ (!\u_trav|cnt\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(6),
	datab => \u_trav|Add0~4_combout\,
	datac => \u_trav|Add0~6_combout\,
	datad => \u_trav|cnt\(5),
	combout => \u_trav|Equal1~1_combout\);

-- Location: LCCOMB_X58_Y68_N24
\u_trav|Equal1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Equal1~4_combout\ = (\u_trav|Equal1~3_combout\ & (\u_trav|Equal1~0_combout\ & (\u_trav|Equal1~2_combout\ & \u_trav|Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|Equal1~3_combout\,
	datab => \u_trav|Equal1~0_combout\,
	datac => \u_trav|Equal1~2_combout\,
	datad => \u_trav|Equal1~1_combout\,
	combout => \u_trav|Equal1~4_combout\);

-- Location: LCCOMB_X59_Y69_N14
\Selector10~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector10~5_combout\ = (\s.MOVING~q\ & (!\Add5~0_combout\ & (current_floor(0) $ (target_floor(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => current_floor(0),
	datab => \s.MOVING~q\,
	datac => target_floor(0),
	datad => \Add5~0_combout\,
	combout => \Selector10~5_combout\);

-- Location: LCCOMB_X59_Y70_N28
\Selector10~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector10~4_combout\ = (\s.CALL_MOVING~q\ & (!\Add1~0_combout\ & (user_floor(0) $ (current_floor(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s.CALL_MOVING~q\,
	datab => user_floor(0),
	datac => current_floor(0),
	datad => \Add1~0_combout\,
	combout => \Selector10~4_combout\);

-- Location: LCCOMB_X59_Y68_N20
\u_trav|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Add0~16_combout\ = (\u_trav|Add0~15\ & ((((\Selector12~4_combout\) # (\Selector12~5_combout\))))) # (!\u_trav|Add0~15\ & ((\Selector12~4_combout\) # ((\Selector12~5_combout\) # (GND))))
-- \u_trav|Add0~17\ = CARRY((\Selector12~4_combout\) # ((\Selector12~5_combout\) # (!\u_trav|Add0~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Selector12~4_combout\,
	datab => \Selector12~5_combout\,
	datad => VCC,
	cin => \u_trav|Add0~15\,
	combout => \u_trav|Add0~16_combout\,
	cout => \u_trav|Add0~17\);

-- Location: LCCOMB_X59_Y68_N22
\u_trav|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Add0~18_combout\ = (\u_trav|Add0~17\ & (((\Selector11~1_combout\) # (\Selector11~0_combout\)))) # (!\u_trav|Add0~17\ & (!\Selector11~1_combout\ & (!\Selector11~0_combout\)))
-- \u_trav|Add0~19\ = CARRY((!\Selector11~1_combout\ & (!\Selector11~0_combout\ & !\u_trav|Add0~17\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Selector11~1_combout\,
	datab => \Selector11~0_combout\,
	datad => VCC,
	cin => \u_trav|Add0~17\,
	combout => \u_trav|Add0~18_combout\,
	cout => \u_trav|Add0~19\);

-- Location: LCCOMB_X59_Y68_N24
\u_trav|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Add0~20_combout\ = (\u_trav|Add0~19\ & ((((\Selector10~5_combout\) # (\Selector10~4_combout\))))) # (!\u_trav|Add0~19\ & ((\Selector10~5_combout\) # ((\Selector10~4_combout\) # (GND))))
-- \u_trav|Add0~21\ = CARRY((\Selector10~5_combout\) # ((\Selector10~4_combout\) # (!\u_trav|Add0~19\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Selector10~5_combout\,
	datab => \Selector10~4_combout\,
	datad => VCC,
	cin => \u_trav|Add0~19\,
	combout => \u_trav|Add0~20_combout\,
	cout => \u_trav|Add0~21\);

-- Location: LCCOMB_X59_Y68_N26
\u_trav|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Add0~22_combout\ = !\u_trav|Add0~21\
-- \u_trav|Add0~23\ = CARRY(!\u_trav|Add0~21\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \u_trav|Add0~21\,
	combout => \u_trav|Add0~22_combout\,
	cout => \u_trav|Add0~23\);

-- Location: LCCOMB_X59_Y68_N28
\u_trav|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Add0~24_combout\ = \u_trav|Add0~23\ $ (GND)
-- \u_trav|Add0~25\ = CARRY(!\u_trav|Add0~23\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => VCC,
	cin => \u_trav|Add0~23\,
	combout => \u_trav|Add0~24_combout\,
	cout => \u_trav|Add0~25\);

-- Location: LCCOMB_X59_Y68_N30
\u_trav|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Add0~26_combout\ = !\u_trav|Add0~25\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \u_trav|Add0~25\,
	combout => \u_trav|Add0~26_combout\);

-- Location: LCCOMB_X58_Y67_N28
\u_trav|cnt[14]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[14]~64_combout\ = (\u_trav|cnt\(14) & (\u_trav|cnt[13]~63\ $ (GND))) # (!\u_trav|cnt\(14) & (!\u_trav|cnt[13]~63\ & VCC))
-- \u_trav|cnt[14]~65\ = CARRY((\u_trav|cnt\(14) & !\u_trav|cnt[13]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|cnt\(14),
	datad => VCC,
	cin => \u_trav|cnt[13]~63\,
	combout => \u_trav|cnt[14]~64_combout\,
	cout => \u_trav|cnt[14]~65\);

-- Location: LCCOMB_X58_Y67_N30
\u_trav|cnt[15]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[15]~66_combout\ = (\u_trav|cnt\(15) & (!\u_trav|cnt[14]~65\)) # (!\u_trav|cnt\(15) & ((\u_trav|cnt[14]~65\) # (GND)))
-- \u_trav|cnt[15]~67\ = CARRY((!\u_trav|cnt[14]~65\) # (!\u_trav|cnt\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(15),
	datad => VCC,
	cin => \u_trav|cnt[14]~65\,
	combout => \u_trav|cnt[15]~66_combout\,
	cout => \u_trav|cnt[15]~67\);

-- Location: FF_X58_Y67_N31
\u_trav|cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[15]~66_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(15));

-- Location: LCCOMB_X58_Y66_N0
\u_trav|cnt[16]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[16]~68_combout\ = (\u_trav|cnt\(16) & (\u_trav|cnt[15]~67\ $ (GND))) # (!\u_trav|cnt\(16) & (!\u_trav|cnt[15]~67\ & VCC))
-- \u_trav|cnt[16]~69\ = CARRY((\u_trav|cnt\(16) & !\u_trav|cnt[15]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|cnt\(16),
	datad => VCC,
	cin => \u_trav|cnt[15]~67\,
	combout => \u_trav|cnt[16]~68_combout\,
	cout => \u_trav|cnt[16]~69\);

-- Location: FF_X58_Y66_N1
\u_trav|cnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[16]~68_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(16));

-- Location: LCCOMB_X58_Y66_N2
\u_trav|cnt[17]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[17]~70_combout\ = (\u_trav|cnt\(17) & (!\u_trav|cnt[16]~69\)) # (!\u_trav|cnt\(17) & ((\u_trav|cnt[16]~69\) # (GND)))
-- \u_trav|cnt[17]~71\ = CARRY((!\u_trav|cnt[16]~69\) # (!\u_trav|cnt\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|cnt\(17),
	datad => VCC,
	cin => \u_trav|cnt[16]~69\,
	combout => \u_trav|cnt[17]~70_combout\,
	cout => \u_trav|cnt[17]~71\);

-- Location: FF_X58_Y66_N3
\u_trav|cnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[17]~70_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(17));

-- Location: LCCOMB_X58_Y66_N4
\u_trav|cnt[18]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[18]~72_combout\ = (\u_trav|cnt\(18) & (\u_trav|cnt[17]~71\ $ (GND))) # (!\u_trav|cnt\(18) & (!\u_trav|cnt[17]~71\ & VCC))
-- \u_trav|cnt[18]~73\ = CARRY((\u_trav|cnt\(18) & !\u_trav|cnt[17]~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|cnt\(18),
	datad => VCC,
	cin => \u_trav|cnt[17]~71\,
	combout => \u_trav|cnt[18]~72_combout\,
	cout => \u_trav|cnt[18]~73\);

-- Location: FF_X58_Y66_N5
\u_trav|cnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[18]~72_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(18));

-- Location: LCCOMB_X58_Y66_N6
\u_trav|cnt[19]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[19]~74_combout\ = (\u_trav|cnt\(19) & (!\u_trav|cnt[18]~73\)) # (!\u_trav|cnt\(19) & ((\u_trav|cnt[18]~73\) # (GND)))
-- \u_trav|cnt[19]~75\ = CARRY((!\u_trav|cnt[18]~73\) # (!\u_trav|cnt\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(19),
	datad => VCC,
	cin => \u_trav|cnt[18]~73\,
	combout => \u_trav|cnt[19]~74_combout\,
	cout => \u_trav|cnt[19]~75\);

-- Location: FF_X58_Y66_N7
\u_trav|cnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[19]~74_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(19));

-- Location: LCCOMB_X58_Y66_N8
\u_trav|cnt[20]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[20]~76_combout\ = (\u_trav|cnt\(20) & (\u_trav|cnt[19]~75\ $ (GND))) # (!\u_trav|cnt\(20) & (!\u_trav|cnt[19]~75\ & VCC))
-- \u_trav|cnt[20]~77\ = CARRY((\u_trav|cnt\(20) & !\u_trav|cnt[19]~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|cnt\(20),
	datad => VCC,
	cin => \u_trav|cnt[19]~75\,
	combout => \u_trav|cnt[20]~76_combout\,
	cout => \u_trav|cnt[20]~77\);

-- Location: FF_X58_Y66_N9
\u_trav|cnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[20]~76_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(20));

-- Location: LCCOMB_X58_Y66_N10
\u_trav|cnt[21]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[21]~78_combout\ = (\u_trav|cnt\(21) & (!\u_trav|cnt[20]~77\)) # (!\u_trav|cnt\(21) & ((\u_trav|cnt[20]~77\) # (GND)))
-- \u_trav|cnt[21]~79\ = CARRY((!\u_trav|cnt[20]~77\) # (!\u_trav|cnt\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(21),
	datad => VCC,
	cin => \u_trav|cnt[20]~77\,
	combout => \u_trav|cnt[21]~78_combout\,
	cout => \u_trav|cnt[21]~79\);

-- Location: FF_X58_Y66_N11
\u_trav|cnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[21]~78_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(21));

-- Location: LCCOMB_X58_Y66_N12
\u_trav|cnt[22]~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[22]~80_combout\ = (\u_trav|cnt\(22) & (\u_trav|cnt[21]~79\ $ (GND))) # (!\u_trav|cnt\(22) & (!\u_trav|cnt[21]~79\ & VCC))
-- \u_trav|cnt[22]~81\ = CARRY((\u_trav|cnt\(22) & !\u_trav|cnt[21]~79\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(22),
	datad => VCC,
	cin => \u_trav|cnt[21]~79\,
	combout => \u_trav|cnt[22]~80_combout\,
	cout => \u_trav|cnt[22]~81\);

-- Location: FF_X58_Y66_N13
\u_trav|cnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[22]~80_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(22));

-- Location: LCCOMB_X58_Y66_N14
\u_trav|cnt[23]~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[23]~82_combout\ = (\u_trav|cnt\(23) & (!\u_trav|cnt[22]~81\)) # (!\u_trav|cnt\(23) & ((\u_trav|cnt[22]~81\) # (GND)))
-- \u_trav|cnt[23]~83\ = CARRY((!\u_trav|cnt[22]~81\) # (!\u_trav|cnt\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|cnt\(23),
	datad => VCC,
	cin => \u_trav|cnt[22]~81\,
	combout => \u_trav|cnt[23]~82_combout\,
	cout => \u_trav|cnt[23]~83\);

-- Location: FF_X58_Y66_N15
\u_trav|cnt[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[23]~82_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(23));

-- Location: LCCOMB_X58_Y66_N16
\u_trav|cnt[24]~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[24]~84_combout\ = (\u_trav|cnt\(24) & (\u_trav|cnt[23]~83\ $ (GND))) # (!\u_trav|cnt\(24) & (!\u_trav|cnt[23]~83\ & VCC))
-- \u_trav|cnt[24]~85\ = CARRY((\u_trav|cnt\(24) & !\u_trav|cnt[23]~83\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|cnt\(24),
	datad => VCC,
	cin => \u_trav|cnt[23]~83\,
	combout => \u_trav|cnt[24]~84_combout\,
	cout => \u_trav|cnt[24]~85\);

-- Location: FF_X58_Y66_N17
\u_trav|cnt[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[24]~84_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(24));

-- Location: LCCOMB_X58_Y66_N18
\u_trav|cnt[25]~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[25]~86_combout\ = (\u_trav|cnt\(25) & (!\u_trav|cnt[24]~85\)) # (!\u_trav|cnt\(25) & ((\u_trav|cnt[24]~85\) # (GND)))
-- \u_trav|cnt[25]~87\ = CARRY((!\u_trav|cnt[24]~85\) # (!\u_trav|cnt\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|cnt\(25),
	datad => VCC,
	cin => \u_trav|cnt[24]~85\,
	combout => \u_trav|cnt[25]~86_combout\,
	cout => \u_trav|cnt[25]~87\);

-- Location: FF_X58_Y66_N19
\u_trav|cnt[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[25]~86_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(25));

-- Location: LCCOMB_X58_Y66_N20
\u_trav|cnt[26]~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[26]~88_combout\ = (\u_trav|cnt\(26) & (\u_trav|cnt[25]~87\ $ (GND))) # (!\u_trav|cnt\(26) & (!\u_trav|cnt[25]~87\ & VCC))
-- \u_trav|cnt[26]~89\ = CARRY((\u_trav|cnt\(26) & !\u_trav|cnt[25]~87\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|cnt\(26),
	datad => VCC,
	cin => \u_trav|cnt[25]~87\,
	combout => \u_trav|cnt[26]~88_combout\,
	cout => \u_trav|cnt[26]~89\);

-- Location: FF_X58_Y66_N21
\u_trav|cnt[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[26]~88_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(26));

-- Location: LCCOMB_X58_Y66_N22
\u_trav|cnt[27]~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[27]~90_combout\ = (\u_trav|cnt\(27) & (!\u_trav|cnt[26]~89\)) # (!\u_trav|cnt\(27) & ((\u_trav|cnt[26]~89\) # (GND)))
-- \u_trav|cnt[27]~91\ = CARRY((!\u_trav|cnt[26]~89\) # (!\u_trav|cnt\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(27),
	datad => VCC,
	cin => \u_trav|cnt[26]~89\,
	combout => \u_trav|cnt[27]~90_combout\,
	cout => \u_trav|cnt[27]~91\);

-- Location: FF_X58_Y66_N23
\u_trav|cnt[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[27]~90_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(27));

-- Location: LCCOMB_X58_Y66_N24
\u_trav|cnt[28]~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[28]~92_combout\ = (\u_trav|cnt\(28) & (\u_trav|cnt[27]~91\ $ (GND))) # (!\u_trav|cnt\(28) & (!\u_trav|cnt[27]~91\ & VCC))
-- \u_trav|cnt[28]~93\ = CARRY((\u_trav|cnt\(28) & !\u_trav|cnt[27]~91\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|cnt\(28),
	datad => VCC,
	cin => \u_trav|cnt[27]~91\,
	combout => \u_trav|cnt[28]~92_combout\,
	cout => \u_trav|cnt[28]~93\);

-- Location: FF_X58_Y66_N25
\u_trav|cnt[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[28]~92_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(28));

-- Location: LCCOMB_X58_Y66_N26
\u_trav|cnt[29]~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[29]~94_combout\ = (\u_trav|cnt\(29) & (!\u_trav|cnt[28]~93\)) # (!\u_trav|cnt\(29) & ((\u_trav|cnt[28]~93\) # (GND)))
-- \u_trav|cnt[29]~95\ = CARRY((!\u_trav|cnt[28]~93\) # (!\u_trav|cnt\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(29),
	datad => VCC,
	cin => \u_trav|cnt[28]~93\,
	combout => \u_trav|cnt[29]~94_combout\,
	cout => \u_trav|cnt[29]~95\);

-- Location: FF_X58_Y66_N27
\u_trav|cnt[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[29]~94_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(29));

-- Location: LCCOMB_X58_Y66_N28
\u_trav|cnt[30]~96\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[30]~96_combout\ = (\u_trav|cnt\(30) & (\u_trav|cnt[29]~95\ $ (GND))) # (!\u_trav|cnt\(30) & (!\u_trav|cnt[29]~95\ & VCC))
-- \u_trav|cnt[30]~97\ = CARRY((\u_trav|cnt\(30) & !\u_trav|cnt[29]~95\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|cnt\(30),
	datad => VCC,
	cin => \u_trav|cnt[29]~95\,
	combout => \u_trav|cnt[30]~96_combout\,
	cout => \u_trav|cnt[30]~97\);

-- Location: FF_X58_Y66_N29
\u_trav|cnt[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[30]~96_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(30));

-- Location: LCCOMB_X59_Y66_N26
\u_trav|Equal1~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Equal1~15_combout\ = (\u_trav|cnt\(28) & (\u_trav|cnt\(29) & \u_trav|cnt\(30))) # (!\u_trav|cnt\(28) & (!\u_trav|cnt\(29) & !\u_trav|cnt\(30)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|cnt\(28),
	datac => \u_trav|cnt\(29),
	datad => \u_trav|cnt\(30),
	combout => \u_trav|Equal1~15_combout\);

-- Location: LCCOMB_X58_Y66_N30
\u_trav|cnt[31]~98\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[31]~98_combout\ = \u_trav|cnt\(31) $ (\u_trav|cnt[30]~97\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(31),
	cin => \u_trav|cnt[30]~97\,
	combout => \u_trav|cnt[31]~98_combout\);

-- Location: FF_X58_Y66_N31
\u_trav|cnt[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[31]~98_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(31));

-- Location: LCCOMB_X59_Y66_N10
\u_trav|Equal1~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Equal1~11_combout\ = (\u_trav|cnt\(25) & (\u_trav|cnt\(28) & (\u_trav|cnt\(27) & \u_trav|cnt\(26)))) # (!\u_trav|cnt\(25) & (!\u_trav|cnt\(28) & (!\u_trav|cnt\(27) & !\u_trav|cnt\(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(25),
	datab => \u_trav|cnt\(28),
	datac => \u_trav|cnt\(27),
	datad => \u_trav|cnt\(26),
	combout => \u_trav|Equal1~11_combout\);

-- Location: LCCOMB_X59_Y66_N12
\u_trav|Equal1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Equal1~12_combout\ = (\u_trav|Equal1~11_combout\ & ((\u_trav|cnt\(23) & (\u_trav|cnt\(28) & \u_trav|cnt\(24))) # (!\u_trav|cnt\(23) & (!\u_trav|cnt\(28) & !\u_trav|cnt\(24)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(23),
	datab => \u_trav|cnt\(28),
	datac => \u_trav|cnt\(24),
	datad => \u_trav|Equal1~11_combout\,
	combout => \u_trav|Equal1~12_combout\);

-- Location: LCCOMB_X59_Y66_N6
\u_trav|Equal1~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Equal1~13_combout\ = (\u_trav|Equal1~12_combout\ & ((\u_trav|cnt\(21) & (\u_trav|cnt\(28) & \u_trav|cnt\(22))) # (!\u_trav|cnt\(21) & (!\u_trav|cnt\(28) & !\u_trav|cnt\(22)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(21),
	datab => \u_trav|cnt\(28),
	datac => \u_trav|cnt\(22),
	datad => \u_trav|Equal1~12_combout\,
	combout => \u_trav|Equal1~13_combout\);

-- Location: LCCOMB_X59_Y66_N24
\u_trav|Equal1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Equal1~14_combout\ = (\u_trav|Equal1~13_combout\ & ((\u_trav|cnt\(20) & (\u_trav|cnt\(28) & \u_trav|cnt\(31))) # (!\u_trav|cnt\(20) & (!\u_trav|cnt\(28) & !\u_trav|cnt\(31)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(20),
	datab => \u_trav|cnt\(28),
	datac => \u_trav|cnt\(31),
	datad => \u_trav|Equal1~13_combout\,
	combout => \u_trav|Equal1~14_combout\);

-- Location: LCCOMB_X59_Y66_N28
\u_trav|Equal1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Equal1~16_combout\ = (\u_trav|Equal1~15_combout\ & (\u_trav|Equal1~14_combout\ & (\u_trav|Add0~26_combout\ $ (!\u_trav|cnt\(28)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|Add0~26_combout\,
	datab => \u_trav|cnt\(28),
	datac => \u_trav|Equal1~15_combout\,
	datad => \u_trav|Equal1~14_combout\,
	combout => \u_trav|Equal1~16_combout\);

-- Location: LCCOMB_X59_Y67_N12
\u_trav|Equal1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Equal1~10_combout\ = (\u_trav|cnt\(0) & (\u_trav|cnt\(2) & \u_trav|cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(0),
	datac => \u_trav|cnt\(2),
	datad => \u_trav|cnt\(1),
	combout => \u_trav|Equal1~10_combout\);

-- Location: LCCOMB_X58_Y68_N10
\u_trav|cnt[8]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[8]~43_combout\ = (\u_trav|Equal1~16_combout\ & (\u_trav|Equal1~10_combout\ & \u_trav|Equal1~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|Equal1~16_combout\,
	datac => \u_trav|Equal1~10_combout\,
	datad => \u_trav|Equal1~9_combout\,
	combout => \u_trav|cnt[8]~43_combout\);

-- Location: LCCOMB_X58_Y68_N12
\u_trav|cnt[8]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[8]~44_combout\ = (\tick_1ms~input_o\ & ((!\u_trav|cnt[8]~43_combout\) # (!\u_trav|Equal1~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|Equal1~4_combout\,
	datac => \tick_1ms~input_o\,
	datad => \u_trav|cnt[8]~43_combout\,
	combout => \u_trav|cnt[8]~44_combout\);

-- Location: LCCOMB_X58_Y68_N30
\u_trav|cnt[8]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[8]~45_combout\ = (\rst~input_o\) # ((\u_trav|run~q\ & ((\u_trav|cnt[8]~44_combout\))) # (!\u_trav|run~q\ & (\u_trav|run~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|run~0_combout\,
	datab => \u_trav|run~q\,
	datac => \rst~input_o\,
	datad => \u_trav|cnt[8]~44_combout\,
	combout => \u_trav|cnt[8]~45_combout\);

-- Location: FF_X58_Y67_N1
\u_trav|cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[0]~32_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(0));

-- Location: LCCOMB_X58_Y67_N2
\u_trav|cnt[1]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[1]~34_combout\ = (\u_trav|cnt\(1) & (!\u_trav|cnt[0]~33\)) # (!\u_trav|cnt\(1) & ((\u_trav|cnt[0]~33\) # (GND)))
-- \u_trav|cnt[1]~35\ = CARRY((!\u_trav|cnt[0]~33\) # (!\u_trav|cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|cnt\(1),
	datad => VCC,
	cin => \u_trav|cnt[0]~33\,
	combout => \u_trav|cnt[1]~34_combout\,
	cout => \u_trav|cnt[1]~35\);

-- Location: FF_X58_Y67_N3
\u_trav|cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[1]~34_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(1));

-- Location: LCCOMB_X58_Y67_N4
\u_trav|cnt[2]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[2]~36_combout\ = (\u_trav|cnt\(2) & (\u_trav|cnt[1]~35\ $ (GND))) # (!\u_trav|cnt\(2) & (!\u_trav|cnt[1]~35\ & VCC))
-- \u_trav|cnt[2]~37\ = CARRY((\u_trav|cnt\(2) & !\u_trav|cnt[1]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|cnt\(2),
	datad => VCC,
	cin => \u_trav|cnt[1]~35\,
	combout => \u_trav|cnt[2]~36_combout\,
	cout => \u_trav|cnt[2]~37\);

-- Location: FF_X58_Y67_N5
\u_trav|cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[2]~36_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(2));

-- Location: LCCOMB_X58_Y67_N6
\u_trav|cnt[3]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[3]~38_combout\ = (\u_trav|cnt\(3) & (!\u_trav|cnt[2]~37\)) # (!\u_trav|cnt\(3) & ((\u_trav|cnt[2]~37\) # (GND)))
-- \u_trav|cnt[3]~39\ = CARRY((!\u_trav|cnt[2]~37\) # (!\u_trav|cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(3),
	datad => VCC,
	cin => \u_trav|cnt[2]~37\,
	combout => \u_trav|cnt[3]~38_combout\,
	cout => \u_trav|cnt[3]~39\);

-- Location: FF_X58_Y67_N7
\u_trav|cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[3]~38_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(3));

-- Location: LCCOMB_X58_Y67_N8
\u_trav|cnt[4]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[4]~40_combout\ = (\u_trav|cnt\(4) & (\u_trav|cnt[3]~39\ $ (GND))) # (!\u_trav|cnt\(4) & (!\u_trav|cnt[3]~39\ & VCC))
-- \u_trav|cnt[4]~41\ = CARRY((\u_trav|cnt\(4) & !\u_trav|cnt[3]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|cnt\(4),
	datad => VCC,
	cin => \u_trav|cnt[3]~39\,
	combout => \u_trav|cnt[4]~40_combout\,
	cout => \u_trav|cnt[4]~41\);

-- Location: FF_X58_Y67_N9
\u_trav|cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[4]~40_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(4));

-- Location: LCCOMB_X58_Y67_N10
\u_trav|cnt[5]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[5]~46_combout\ = (\u_trav|cnt\(5) & (!\u_trav|cnt[4]~41\)) # (!\u_trav|cnt\(5) & ((\u_trav|cnt[4]~41\) # (GND)))
-- \u_trav|cnt[5]~47\ = CARRY((!\u_trav|cnt[4]~41\) # (!\u_trav|cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(5),
	datad => VCC,
	cin => \u_trav|cnt[4]~41\,
	combout => \u_trav|cnt[5]~46_combout\,
	cout => \u_trav|cnt[5]~47\);

-- Location: FF_X58_Y67_N11
\u_trav|cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[5]~46_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(5));

-- Location: LCCOMB_X58_Y67_N12
\u_trav|cnt[6]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[6]~48_combout\ = (\u_trav|cnt\(6) & (\u_trav|cnt[5]~47\ $ (GND))) # (!\u_trav|cnt\(6) & (!\u_trav|cnt[5]~47\ & VCC))
-- \u_trav|cnt[6]~49\ = CARRY((\u_trav|cnt\(6) & !\u_trav|cnt[5]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(6),
	datad => VCC,
	cin => \u_trav|cnt[5]~47\,
	combout => \u_trav|cnt[6]~48_combout\,
	cout => \u_trav|cnt[6]~49\);

-- Location: FF_X58_Y67_N13
\u_trav|cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[6]~48_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(6));

-- Location: LCCOMB_X58_Y67_N14
\u_trav|cnt[7]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[7]~50_combout\ = (\u_trav|cnt\(7) & (!\u_trav|cnt[6]~49\)) # (!\u_trav|cnt\(7) & ((\u_trav|cnt[6]~49\) # (GND)))
-- \u_trav|cnt[7]~51\ = CARRY((!\u_trav|cnt[6]~49\) # (!\u_trav|cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|cnt\(7),
	datad => VCC,
	cin => \u_trav|cnt[6]~49\,
	combout => \u_trav|cnt[7]~50_combout\,
	cout => \u_trav|cnt[7]~51\);

-- Location: FF_X58_Y67_N15
\u_trav|cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[7]~50_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(7));

-- Location: LCCOMB_X58_Y67_N16
\u_trav|cnt[8]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[8]~52_combout\ = (\u_trav|cnt\(8) & (\u_trav|cnt[7]~51\ $ (GND))) # (!\u_trav|cnt\(8) & (!\u_trav|cnt[7]~51\ & VCC))
-- \u_trav|cnt[8]~53\ = CARRY((\u_trav|cnt\(8) & !\u_trav|cnt[7]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|cnt\(8),
	datad => VCC,
	cin => \u_trav|cnt[7]~51\,
	combout => \u_trav|cnt[8]~52_combout\,
	cout => \u_trav|cnt[8]~53\);

-- Location: FF_X58_Y67_N17
\u_trav|cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[8]~52_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(8));

-- Location: LCCOMB_X58_Y67_N18
\u_trav|cnt[9]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[9]~54_combout\ = (\u_trav|cnt\(9) & (!\u_trav|cnt[8]~53\)) # (!\u_trav|cnt\(9) & ((\u_trav|cnt[8]~53\) # (GND)))
-- \u_trav|cnt[9]~55\ = CARRY((!\u_trav|cnt[8]~53\) # (!\u_trav|cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|cnt\(9),
	datad => VCC,
	cin => \u_trav|cnt[8]~53\,
	combout => \u_trav|cnt[9]~54_combout\,
	cout => \u_trav|cnt[9]~55\);

-- Location: FF_X58_Y67_N19
\u_trav|cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[9]~54_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(9));

-- Location: LCCOMB_X58_Y67_N20
\u_trav|cnt[10]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[10]~56_combout\ = (\u_trav|cnt\(10) & (\u_trav|cnt[9]~55\ $ (GND))) # (!\u_trav|cnt\(10) & (!\u_trav|cnt[9]~55\ & VCC))
-- \u_trav|cnt[10]~57\ = CARRY((\u_trav|cnt\(10) & !\u_trav|cnt[9]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|cnt\(10),
	datad => VCC,
	cin => \u_trav|cnt[9]~55\,
	combout => \u_trav|cnt[10]~56_combout\,
	cout => \u_trav|cnt[10]~57\);

-- Location: FF_X58_Y67_N21
\u_trav|cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[10]~56_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(10));

-- Location: LCCOMB_X58_Y67_N22
\u_trav|cnt[11]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[11]~58_combout\ = (\u_trav|cnt\(11) & (!\u_trav|cnt[10]~57\)) # (!\u_trav|cnt\(11) & ((\u_trav|cnt[10]~57\) # (GND)))
-- \u_trav|cnt[11]~59\ = CARRY((!\u_trav|cnt[10]~57\) # (!\u_trav|cnt\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(11),
	datad => VCC,
	cin => \u_trav|cnt[10]~57\,
	combout => \u_trav|cnt[11]~58_combout\,
	cout => \u_trav|cnt[11]~59\);

-- Location: FF_X58_Y67_N23
\u_trav|cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[11]~58_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(11));

-- Location: LCCOMB_X58_Y67_N24
\u_trav|cnt[12]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[12]~60_combout\ = (\u_trav|cnt\(12) & (\u_trav|cnt[11]~59\ $ (GND))) # (!\u_trav|cnt\(12) & (!\u_trav|cnt[11]~59\ & VCC))
-- \u_trav|cnt[12]~61\ = CARRY((\u_trav|cnt\(12) & !\u_trav|cnt[11]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \u_trav|cnt\(12),
	datad => VCC,
	cin => \u_trav|cnt[11]~59\,
	combout => \u_trav|cnt[12]~60_combout\,
	cout => \u_trav|cnt[12]~61\);

-- Location: FF_X58_Y67_N25
\u_trav|cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[12]~60_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(12));

-- Location: LCCOMB_X58_Y67_N26
\u_trav|cnt[13]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|cnt[13]~62_combout\ = (\u_trav|cnt\(13) & (!\u_trav|cnt[12]~61\)) # (!\u_trav|cnt\(13) & ((\u_trav|cnt[12]~61\) # (GND)))
-- \u_trav|cnt[13]~63\ = CARRY((!\u_trav|cnt[12]~61\) # (!\u_trav|cnt\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(13),
	datad => VCC,
	cin => \u_trav|cnt[12]~61\,
	combout => \u_trav|cnt[13]~62_combout\,
	cout => \u_trav|cnt[13]~63\);

-- Location: FF_X58_Y67_N27
\u_trav|cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[13]~62_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(13));

-- Location: FF_X58_Y67_N29
\u_trav|cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|cnt[14]~64_combout\,
	sclr => \u_trav|cnt[8]~42_combout\,
	ena => \u_trav|cnt[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|cnt\(14));

-- Location: LCCOMB_X59_Y68_N2
\u_trav|Equal1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Equal1~6_combout\ = (\u_trav|cnt\(14) & (\u_trav|Add0~22_combout\ & (\u_trav|cnt\(13) $ (!\u_trav|Add0~20_combout\)))) # (!\u_trav|cnt\(14) & (!\u_trav|Add0~22_combout\ & (\u_trav|cnt\(13) $ (!\u_trav|Add0~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(14),
	datab => \u_trav|cnt\(13),
	datac => \u_trav|Add0~22_combout\,
	datad => \u_trav|Add0~20_combout\,
	combout => \u_trav|Equal1~6_combout\);

-- Location: LCCOMB_X58_Y68_N2
\u_trav|Equal1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Equal1~5_combout\ = (\u_trav|cnt\(11) & (\u_trav|Add0~16_combout\ & (\u_trav|cnt\(12) $ (!\u_trav|Add0~18_combout\)))) # (!\u_trav|cnt\(11) & (!\u_trav|Add0~16_combout\ & (\u_trav|cnt\(12) $ (!\u_trav|Add0~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(11),
	datab => \u_trav|cnt\(12),
	datac => \u_trav|Add0~16_combout\,
	datad => \u_trav|Add0~18_combout\,
	combout => \u_trav|Equal1~5_combout\);

-- Location: LCCOMB_X58_Y68_N4
\u_trav|Equal1~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Equal1~7_combout\ = (\u_trav|cnt\(15) & (\u_trav|Add0~24_combout\ & (\u_trav|cnt\(16) $ (!\u_trav|Add0~26_combout\)))) # (!\u_trav|cnt\(15) & (!\u_trav|Add0~24_combout\ & (\u_trav|cnt\(16) $ (!\u_trav|Add0~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(15),
	datab => \u_trav|cnt\(16),
	datac => \u_trav|Add0~26_combout\,
	datad => \u_trav|Add0~24_combout\,
	combout => \u_trav|Equal1~7_combout\);

-- Location: LCCOMB_X59_Y66_N0
\u_trav|Equal1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Equal1~8_combout\ = (\u_trav|cnt\(17) & (\u_trav|cnt\(19) & (\u_trav|cnt\(18) & \u_trav|Add0~26_combout\))) # (!\u_trav|cnt\(17) & (!\u_trav|cnt\(19) & (!\u_trav|cnt\(18) & !\u_trav|Add0~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|cnt\(17),
	datab => \u_trav|cnt\(19),
	datac => \u_trav|cnt\(18),
	datad => \u_trav|Add0~26_combout\,
	combout => \u_trav|Equal1~8_combout\);

-- Location: LCCOMB_X58_Y68_N14
\u_trav|Equal1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Equal1~9_combout\ = (\u_trav|Equal1~6_combout\ & (\u_trav|Equal1~5_combout\ & (\u_trav|Equal1~7_combout\ & \u_trav|Equal1~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|Equal1~6_combout\,
	datab => \u_trav|Equal1~5_combout\,
	datac => \u_trav|Equal1~7_combout\,
	datad => \u_trav|Equal1~8_combout\,
	combout => \u_trav|Equal1~9_combout\);

-- Location: LCCOMB_X58_Y68_N8
\u_trav|Equal1~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Equal1~17_combout\ = (\u_trav|Equal1~9_combout\ & (\u_trav|Equal1~10_combout\ & (\u_trav|Equal1~16_combout\ & \u_trav|Equal1~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|Equal1~9_combout\,
	datab => \u_trav|Equal1~10_combout\,
	datac => \u_trav|Equal1~16_combout\,
	datad => \u_trav|Equal1~4_combout\,
	combout => \u_trav|Equal1~17_combout\);

-- Location: LCCOMB_X59_Y70_N14
\u_trav|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|Equal0~0_combout\ = ((!\Add0~0_combout\ & ((\Add1~0_combout\) # (!\v_next_s~8_combout\)))) # (!\s.CALL_MOVING~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => \Add1~0_combout\,
	datac => \v_next_s~8_combout\,
	datad => \s.CALL_MOVING~q\,
	combout => \u_trav|Equal0~0_combout\);

-- Location: LCCOMB_X58_Y68_N6
\u_trav|run~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|run~1_combout\ = (!\u_trav|run~q\ & (\u_trav|run~0_combout\ & ((!\u_trav|Equal0~0_combout\) # (!\u_trav|Equal0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|Equal0~1_combout\,
	datab => \u_trav|run~q\,
	datac => \u_trav|run~0_combout\,
	datad => \u_trav|Equal0~0_combout\,
	combout => \u_trav|run~1_combout\);

-- Location: LCCOMB_X58_Y68_N18
\u_trav|run~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|run~2_combout\ = (\u_trav|run~1_combout\) # ((\u_trav|run~q\ & ((!\u_trav|Equal1~17_combout\) # (!\tick_1ms~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tick_1ms~input_o\,
	datab => \u_trav|Equal1~17_combout\,
	datac => \u_trav|run~q\,
	datad => \u_trav|run~1_combout\,
	combout => \u_trav|run~2_combout\);

-- Location: FF_X58_Y68_N19
\u_trav|run\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|run~2_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|run~q\);

-- Location: LCCOMB_X58_Y68_N26
\u_trav|run~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|run~0_combout\ = (!\u_trav|done~q\ & (!\u_trav|run~q\ & ((\Selector1~5_combout\) # (\Selector5~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector1~5_combout\,
	datab => \u_trav|done~q\,
	datac => \Selector5~4_combout\,
	datad => \u_trav|run~q\,
	combout => \u_trav|run~0_combout\);

-- Location: LCCOMB_X58_Y68_N28
\u_trav|done~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|done~0_combout\ = (\u_trav|Equal0~1_combout\ & (\u_trav|run~0_combout\ & \u_trav|Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|Equal0~1_combout\,
	datac => \u_trav|run~0_combout\,
	datad => \u_trav|Equal0~0_combout\,
	combout => \u_trav|done~0_combout\);

-- Location: LCCOMB_X58_Y68_N16
\u_trav|done~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \u_trav|done~1_combout\ = (\u_trav|done~0_combout\) # ((\tick_1ms~input_o\ & (\u_trav|Equal1~17_combout\ & \u_trav|run~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tick_1ms~input_o\,
	datab => \u_trav|done~0_combout\,
	datac => \u_trav|Equal1~17_combout\,
	datad => \u_trav|run~q\,
	combout => \u_trav|done~1_combout\);

-- Location: FF_X58_Y68_N17
\u_trav|done\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \u_trav|done~1_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \u_trav|done~q\);

-- Location: LCCOMB_X58_Y70_N18
\Selector1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~2_combout\ = (\k1_p~input_o\ & (((!current_floor(0))) # (!current_floor(1)))) # (!\k1_p~input_o\ & (\k2_p~input_o\ & ((current_floor(0)) # (!current_floor(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011111010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => current_floor(1),
	datab => current_floor(0),
	datac => \k2_p~input_o\,
	datad => \k1_p~input_o\,
	combout => \Selector1~2_combout\);

-- Location: LCCOMB_X58_Y70_N22
\Mux17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux17~0_combout\ = (!current_floor(1) & !current_floor(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => current_floor(1),
	datac => current_floor(0),
	combout => \Mux17~0_combout\);

-- Location: LCCOMB_X58_Y70_N12
\Selector1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~3_combout\ = (!\s.IDLE_LOCKED~q\ & ((\k0_p~input_o\ & ((!\Mux17~0_combout\))) # (!\k0_p~input_o\ & (\Selector1~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s.IDLE_LOCKED~q\,
	datab => \Selector1~2_combout\,
	datac => \Mux17~0_combout\,
	datad => \k0_p~input_o\,
	combout => \Selector1~3_combout\);

-- Location: LCCOMB_X59_Y70_N8
\Selector1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~4_combout\ = (\Selector1~3_combout\) # ((!\u_trav|done~q\ & \Selector1~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \u_trav|done~q\,
	datab => \Selector1~5_combout\,
	datad => \Selector1~3_combout\,
	combout => \Selector1~4_combout\);

-- Location: FF_X59_Y70_N9
\s.CALL_MOVING\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector1~4_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s.CALL_MOVING~q\);

-- Location: LCCOMB_X58_Y69_N26
WideOr18 : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr18~combout\ = (\s.CALL_MOVING~q\) # (((\s.READY_SELECT~q\) # (\s.MOVING~q\)) # (!\s.IDLE_LOCKED~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s.CALL_MOVING~q\,
	datab => \s.IDLE_LOCKED~q\,
	datac => \s.READY_SELECT~q\,
	datad => \s.MOVING~q\,
	combout => \WideOr18~combout\);

-- Location: LCCOMB_X58_Y70_N2
\led_green~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \led_green~0_combout\ = (!\s.READY_SELECT~q\ & \s.IDLE_LOCKED~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \s.READY_SELECT~q\,
	datad => \s.IDLE_LOCKED~q\,
	combout => \led_green~0_combout\);

-- Location: LCCOMB_X58_Y69_N20
\led_yellow~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \led_yellow~0_combout\ = (!\s.MOVING~q\ & !\s.CALL_MOVING~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \s.MOVING~q\,
	datac => \s.CALL_MOVING~q\,
	combout => \led_yellow~0_combout\);

-- Location: LCCOMB_X66_Y72_N2
\Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = (\pin_digits[1][1]~q\ & (\pin_digits[1][3]~q\)) # (!\pin_digits[1][1]~q\ & (\pin_digits[1][2]~q\ $ (((!\pin_digits[1][3]~q\ & \pin_digits[1][0]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[1][3]~q\,
	datab => \pin_digits[1][0]~q\,
	datac => \pin_digits[1][1]~q\,
	datad => \pin_digits[1][2]~q\,
	combout => \Mux6~0_combout\);

-- Location: LCCOMB_X66_Y72_N28
\Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (\pin_digits[1][3]~q\ & (((\pin_digits[1][1]~q\) # (\pin_digits[1][2]~q\)))) # (!\pin_digits[1][3]~q\ & (\pin_digits[1][2]~q\ & (\pin_digits[1][0]~q\ $ (\pin_digits[1][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[1][3]~q\,
	datab => \pin_digits[1][0]~q\,
	datac => \pin_digits[1][1]~q\,
	datad => \pin_digits[1][2]~q\,
	combout => \Mux5~0_combout\);

-- Location: LCCOMB_X66_Y72_N6
\Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = (\pin_digits[1][2]~q\ & (\pin_digits[1][3]~q\)) # (!\pin_digits[1][2]~q\ & (\pin_digits[1][1]~q\ & ((\pin_digits[1][3]~q\) # (!\pin_digits[1][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[1][3]~q\,
	datab => \pin_digits[1][0]~q\,
	datac => \pin_digits[1][1]~q\,
	datad => \pin_digits[1][2]~q\,
	combout => \Mux4~0_combout\);

-- Location: LCCOMB_X66_Y72_N24
\Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = (\pin_digits[1][1]~q\ & ((\pin_digits[1][3]~q\) # ((\pin_digits[1][0]~q\ & \pin_digits[1][2]~q\)))) # (!\pin_digits[1][1]~q\ & (\pin_digits[1][2]~q\ $ (((!\pin_digits[1][3]~q\ & \pin_digits[1][0]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101110100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[1][3]~q\,
	datab => \pin_digits[1][0]~q\,
	datac => \pin_digits[1][1]~q\,
	datad => \pin_digits[1][2]~q\,
	combout => \Mux3~0_combout\);

-- Location: LCCOMB_X66_Y72_N26
\Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (\pin_digits[1][0]~q\) # ((\pin_digits[1][1]~q\ & (\pin_digits[1][3]~q\)) # (!\pin_digits[1][1]~q\ & ((\pin_digits[1][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[1][3]~q\,
	datab => \pin_digits[1][0]~q\,
	datac => \pin_digits[1][1]~q\,
	datad => \pin_digits[1][2]~q\,
	combout => \Mux2~0_combout\);

-- Location: LCCOMB_X66_Y72_N20
\Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (\pin_digits[1][0]~q\ & ((\pin_digits[1][1]~q\) # (\pin_digits[1][3]~q\ $ (!\pin_digits[1][2]~q\)))) # (!\pin_digits[1][0]~q\ & ((\pin_digits[1][2]~q\ & (\pin_digits[1][3]~q\)) # (!\pin_digits[1][2]~q\ & ((\pin_digits[1][1]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[1][3]~q\,
	datab => \pin_digits[1][0]~q\,
	datac => \pin_digits[1][1]~q\,
	datad => \pin_digits[1][2]~q\,
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X66_Y72_N30
\Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\pin_digits[1][1]~q\ & (!\pin_digits[1][3]~q\ & ((!\pin_digits[1][2]~q\) # (!\pin_digits[1][0]~q\)))) # (!\pin_digits[1][1]~q\ & (\pin_digits[1][3]~q\ $ (((\pin_digits[1][2]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[1][3]~q\,
	datab => \pin_digits[1][0]~q\,
	datac => \pin_digits[1][1]~q\,
	datad => \pin_digits[1][2]~q\,
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X65_Y69_N0
\Mux13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux13~0_combout\ = (\pin_digits[0][1]~q\ & (((\pin_digits[0][3]~q\)))) # (!\pin_digits[0][1]~q\ & (\pin_digits[0][2]~q\ $ (((\pin_digits[0][0]~q\ & !\pin_digits[0][3]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[0][0]~q\,
	datab => \pin_digits[0][3]~q\,
	datac => \pin_digits[0][2]~q\,
	datad => \pin_digits[0][1]~q\,
	combout => \Mux13~0_combout\);

-- Location: LCCOMB_X65_Y69_N2
\Mux12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux12~0_combout\ = (\pin_digits[0][3]~q\ & (((\pin_digits[0][2]~q\) # (\pin_digits[0][1]~q\)))) # (!\pin_digits[0][3]~q\ & (\pin_digits[0][2]~q\ & (\pin_digits[0][0]~q\ $ (\pin_digits[0][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[0][0]~q\,
	datab => \pin_digits[0][3]~q\,
	datac => \pin_digits[0][2]~q\,
	datad => \pin_digits[0][1]~q\,
	combout => \Mux12~0_combout\);

-- Location: LCCOMB_X65_Y69_N20
\Mux11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = (\pin_digits[0][2]~q\ & (((\pin_digits[0][3]~q\)))) # (!\pin_digits[0][2]~q\ & (\pin_digits[0][1]~q\ & ((\pin_digits[0][3]~q\) # (!\pin_digits[0][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[0][0]~q\,
	datab => \pin_digits[0][3]~q\,
	datac => \pin_digits[0][2]~q\,
	datad => \pin_digits[0][1]~q\,
	combout => \Mux11~0_combout\);

-- Location: LCCOMB_X65_Y69_N14
\Mux10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux10~0_combout\ = (\pin_digits[0][1]~q\ & ((\pin_digits[0][3]~q\) # ((\pin_digits[0][0]~q\ & \pin_digits[0][2]~q\)))) # (!\pin_digits[0][1]~q\ & (\pin_digits[0][2]~q\ $ (((\pin_digits[0][0]~q\ & !\pin_digits[0][3]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[0][0]~q\,
	datab => \pin_digits[0][3]~q\,
	datac => \pin_digits[0][2]~q\,
	datad => \pin_digits[0][1]~q\,
	combout => \Mux10~0_combout\);

-- Location: LCCOMB_X65_Y69_N16
\Mux9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux9~0_combout\ = (\pin_digits[0][0]~q\) # ((\pin_digits[0][1]~q\ & (\pin_digits[0][3]~q\)) # (!\pin_digits[0][1]~q\ & ((\pin_digits[0][2]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[0][0]~q\,
	datab => \pin_digits[0][3]~q\,
	datac => \pin_digits[0][2]~q\,
	datad => \pin_digits[0][1]~q\,
	combout => \Mux9~0_combout\);

-- Location: LCCOMB_X62_Y69_N4
\Mux8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux8~0_combout\ = (\pin_digits[0][2]~q\ & ((\pin_digits[0][3]~q\) # ((\pin_digits[0][1]~q\ & \pin_digits[0][0]~q\)))) # (!\pin_digits[0][2]~q\ & ((\pin_digits[0][1]~q\) # ((!\pin_digits[0][3]~q\ & \pin_digits[0][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101111100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[0][1]~q\,
	datab => \pin_digits[0][2]~q\,
	datac => \pin_digits[0][3]~q\,
	datad => \pin_digits[0][0]~q\,
	combout => \Mux8~0_combout\);

-- Location: LCCOMB_X65_Y69_N18
\Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = (\pin_digits[0][2]~q\ & (!\pin_digits[0][3]~q\ & ((!\pin_digits[0][1]~q\) # (!\pin_digits[0][0]~q\)))) # (!\pin_digits[0][2]~q\ & ((\pin_digits[0][3]~q\ $ (\pin_digits[0][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pin_digits[0][0]~q\,
	datab => \pin_digits[0][3]~q\,
	datac => \pin_digits[0][2]~q\,
	datad => \pin_digits[0][1]~q\,
	combout => \Mux7~0_combout\);

-- Location: LCCOMB_X58_Y69_N0
\v_next_show_error~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \v_next_show_error~0_combout\ = (\Selector4~0_combout\ & (\v_next_s~7_combout\ & \k3_p~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector4~0_combout\,
	datab => \v_next_s~7_combout\,
	datad => \k3_p~input_o\,
	combout => \v_next_show_error~0_combout\);

-- Location: LCCOMB_X58_Y69_N30
\~GND\ : cycloneive_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: FF_X58_Y69_N1
show_error : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \v_next_show_error~0_combout\,
	asdata => \~GND~combout\,
	sclr => \rst~input_o\,
	sload => \ALT_INV_s.READY_SELECT~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \show_error~q\);

-- Location: LCCOMB_X58_Y70_N6
\hex5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \hex5~0_combout\ = (!\show_error~q\ & (((!target_floor(1) & !target_floor(0))) # (!\target_valid~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \show_error~q\,
	datab => target_floor(1),
	datac => \target_valid~q\,
	datad => target_floor(0),
	combout => \hex5~0_combout\);

-- Location: LCCOMB_X58_Y70_N24
\hex5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \hex5~1_combout\ = (\target_valid~q\ & !\show_error~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \target_valid~q\,
	datad => \show_error~q\,
	combout => \hex5~1_combout\);

-- Location: LCCOMB_X58_Y69_N14
\hex5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \hex5~2_combout\ = ((\show_error~q\) # ((target_floor(1) & target_floor(0)))) # (!\target_valid~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \target_valid~q\,
	datab => target_floor(1),
	datac => \show_error~q\,
	datad => target_floor(0),
	combout => \hex5~2_combout\);

-- Location: LCCOMB_X58_Y70_N10
\hex5~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \hex5~3_combout\ = (!\show_error~q\ & ((!target_floor(0)) # (!\target_valid~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \show_error~q\,
	datac => \target_valid~q\,
	datad => target_floor(0),
	combout => \hex5~3_combout\);

-- Location: LCCOMB_X58_Y70_N4
\hex5~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \hex5~4_combout\ = (!\show_error~q\ & ((target_floor(1)) # ((!target_floor(0)) # (!\target_valid~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \show_error~q\,
	datab => target_floor(1),
	datac => \target_valid~q\,
	datad => target_floor(0),
	combout => \hex5~4_combout\);

-- Location: LCCOMB_X58_Y69_N16
\hex5~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \hex5~5_combout\ = ((\show_error~q\) # (target_floor(1))) # (!\target_valid~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \target_valid~q\,
	datab => \show_error~q\,
	datad => target_floor(1),
	combout => \hex5~5_combout\);

-- Location: LCCOMB_X58_Y70_N16
\Mux17~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux17~1_combout\ = (current_floor(1) & current_floor(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => current_floor(1),
	datac => current_floor(0),
	combout => \Mux17~1_combout\);

-- Location: LCCOMB_X58_Y70_N26
\Mux17~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux17~2_combout\ = (current_floor(1)) # (!current_floor(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => current_floor(1),
	datac => current_floor(0),
	combout => \Mux17~2_combout\);

-- Location: LCCOMB_X57_Y69_N14
WideOr24 : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr24~combout\ = (\s.DOOR_OPEN_EXIT~q\) # ((\s.READY_SELECT~q\) # ((\s.DOOR_OPEN_ENTRY~q\) # (!\s.IDLE_LOCKED~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s.DOOR_OPEN_EXIT~q\,
	datab => \s.READY_SELECT~q\,
	datac => \s.IDLE_LOCKED~q\,
	datad => \s.DOOR_OPEN_ENTRY~q\,
	combout => \WideOr24~combout\);

-- Location: LCCOMB_X57_Y69_N16
\WideOr23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \WideOr23~0_combout\ = (\s.PIN_ENTRY~q\) # ((\s.DOOR_OPEN_ENTRY~q\) # ((\s.CALL_MOVING~q\) # (!\s.IDLE_LOCKED~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s.PIN_ENTRY~q\,
	datab => \s.DOOR_OPEN_ENTRY~q\,
	datac => \s.IDLE_LOCKED~q\,
	datad => \s.CALL_MOVING~q\,
	combout => \WideOr23~0_combout\);

ww_led_red <= \led_red~output_o\;

ww_led_green <= \led_green~output_o\;

ww_led_yellow <= \led_yellow~output_o\;

ww_hex0(0) <= \hex0[0]~output_o\;

ww_hex0(1) <= \hex0[1]~output_o\;

ww_hex0(2) <= \hex0[2]~output_o\;

ww_hex0(3) <= \hex0[3]~output_o\;

ww_hex0(4) <= \hex0[4]~output_o\;

ww_hex0(5) <= \hex0[5]~output_o\;

ww_hex0(6) <= \hex0[6]~output_o\;

ww_hex1(0) <= \hex1[0]~output_o\;

ww_hex1(1) <= \hex1[1]~output_o\;

ww_hex1(2) <= \hex1[2]~output_o\;

ww_hex1(3) <= \hex1[3]~output_o\;

ww_hex1(4) <= \hex1[4]~output_o\;

ww_hex1(5) <= \hex1[5]~output_o\;

ww_hex1(6) <= \hex1[6]~output_o\;

ww_hex5(0) <= \hex5[0]~output_o\;

ww_hex5(1) <= \hex5[1]~output_o\;

ww_hex5(2) <= \hex5[2]~output_o\;

ww_hex5(3) <= \hex5[3]~output_o\;

ww_hex5(4) <= \hex5[4]~output_o\;

ww_hex5(5) <= \hex5[5]~output_o\;

ww_hex5(6) <= \hex5[6]~output_o\;

ww_hex6(0) <= \hex6[0]~output_o\;

ww_hex6(1) <= \hex6[1]~output_o\;

ww_hex6(2) <= \hex6[2]~output_o\;

ww_hex6(3) <= \hex6[3]~output_o\;

ww_hex6(4) <= \hex6[4]~output_o\;

ww_hex6(5) <= \hex6[5]~output_o\;

ww_hex6(6) <= \hex6[6]~output_o\;

ww_hex7(0) <= \hex7[0]~output_o\;

ww_hex7(1) <= \hex7[1]~output_o\;

ww_hex7(2) <= \hex7[2]~output_o\;

ww_hex7(3) <= \hex7[3]~output_o\;

ww_hex7(4) <= \hex7[4]~output_o\;

ww_hex7(5) <= \hex7[5]~output_o\;

ww_hex7(6) <= \hex7[6]~output_o\;

ww_state_dbg(0) <= \state_dbg[0]~output_o\;

ww_state_dbg(1) <= \state_dbg[1]~output_o\;

ww_state_dbg(2) <= \state_dbg[2]~output_o\;
END structure;


