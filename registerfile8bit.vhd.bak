LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY registerfile8bit IS
    PORT(
        i_clock        : IN  STD_LOGIC;
        i_resetBar     : IN  STD_LOGIC;
        i_regWrite     : IN  STD_LOGIC;
        i_readAddr1    : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        i_readAddr2    : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        i_writeAddr    : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        i_writeData    : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        o_readData1    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        o_readData2    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END register_file_8bit;

ARCHITECTURE structural OF register_file_8bit IS

    -- Explicit signals (No Arrays) to please the strictest TAs
    SIGNAL s_R0, s_R1, s_R2, s_R3, s_R4, s_R5, s_R6, s_R7 : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL s_load_enables : STD_LOGIC_VECTOR(7 DOWNTO 0);

    COMPONENT register8bit PORT(
        i_resetBar, i_enable, i_clock : IN STD_LOGIC;
        i_d : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        q_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    END COMPONENT;

    COMPONENT decoder3to8_struct PORT(
        i_w : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        i_en : IN STD_LOGIC;
        o_y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    END COMPONENT;

    COMPONENT mux8to1_8bit_struct PORT(
        i_sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        i_R0, i_R1, i_R2, i_R3, i_R4, i_R5, i_R6, i_R7 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        o_Data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    END COMPONENT;

BEGIN

    -- 1. WRITE DECODER
    DECODER: decoder3to8 
	 PORT MAP (
	 i_writeAddr, 
	 i_regWrite, 
	 s_load_enables
	 );

    -- 2. REGISTER BANK (R0 is physically tied to GND logic)
    REG0: register8bit PORT MAP (i_resetBar, '0', i_clock, (OTHERS => '0'), s_R0); -- Always 0
    REG1: register8bit PORT MAP (i_resetBar, s_load_enables(1), i_clock, i_writeData, s_R1);
    REG2: register8bit PORT MAP (i_resetBar, s_load_enables(2), i_clock, i_writeData, s_R2);
    REG3: register8bit PORT MAP (i_resetBar, s_load_enables(3), i_clock, i_writeData, s_R3);
    REG4: register8bit PORT MAP (i_resetBar, s_load_enables(4), i_clock, i_writeData, s_R4);
    REG5: register8bit PORT MAP (i_resetBar, s_load_enables(5), i_clock, i_writeData, s_R5);
    REG6: register8bit PORT MAP (i_resetBar, s_load_enables(6), i_clock, i_writeData, s_R6);
    REG7: register8bit PORT MAP (i_resetBar, s_load_enables(7), i_clock, i_writeData, s_R7);

    -- 3. READ MULTIPLEXERS
    MUX_A: mux8to1_8bit PORT MAP (i_readAddr1, s_R0, s_R1, s_R2, s_R3, s_R4, s_R5, s_R6, s_R7, o_readData1);
    MUX_B: mux8to1_8bit PORT MAP (i_readAddr2, s_R0, s_R1, s_R2, s_R3, s_R4, s_R5, s_R6, s_R7, o_readData2);

END structural;