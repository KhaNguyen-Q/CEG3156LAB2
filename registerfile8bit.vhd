library ieee;
use ieee.std_logic_1164.all; 

entity registerfile8bit is 
	
	port (
		i_clk : IN STD_LOGIC;
		i_resetBar : IN STD_LOGIC; 
		i_load : IN STD_LOGIC;
		
		i_readReg1, i_readReg2 : IN STD_LOGIC_VECTOR(2 downto 0);
		
		i_writeRegAddr : IN STD_LOGIC_VECTOR(2 downto 0);
		i_writeData : IN STD_LOGIC_VECTOR(7 downto 0);
	
		o_readData1, o_readData2 : OUT STD_LOGIC_VECTOR(7 downto 0));
	
end registerfile8bit; 

architecture rtl of registerfile8bit is 
	
	component register8bit 
	
		PORT(
			i_resetBar, i_load	: IN	STD_LOGIC;
			i_clock			: IN	STD_LOGIC;
			i_Value			: IN	STD_LOGIC_VECTOR(7 downto 0);
			o_Value			: OUT	STD_LOGIC_VECTOR(7 downto 0));
	
	end component;

	component mux8to1_8bit
		port (
		data_in0   : in  std_logic_vector(7 downto 0);
		data_in1   : in  std_logic_vector(7 downto 0);
		data_in2   : in  std_logic_vector(7 downto 0);
		data_in3   : in  std_logic_vector(7 downto 0);
		data_in4   : in  std_logic_vector(7 downto 0);
		data_in5   : in  std_logic_vector(7 downto 0);
		data_in6   : in  std_logic_vector(7 downto 0);
		data_in7   : in  std_logic_vector(7 downto 0);
		
		select_in  : in  std_logic_vector(2 downto 0);
		
		mux_out    : out std_logic_vector(7 downto 0));
	end component;

	component decoder3to8 
		 port(
			  A : in STD_LOGIC_VECTOR(2 downto 0);
			  Y : out STD_LOGIC_VECTOR(7 downto 0)
		 );
	end component;

	signal sig_regWrite : STD_LOGIC_VECTOR(7 downto 0);
	signal sig_decodeOut : STD_LOGIC_VECTOR(7 downto 0);
	signal sig_regOut0, sig_regOut1, sig_regOut2, sig_regOut3, sig_regOut4, sig_regOut5, sig_regOut6, sig_regOut7 : STD_LOGIC_VECTOR(7 downto 0);  
	signal sig_muxOut1, sig_muxOut2 : STD_LOGIC_VECTOR(7 downto 0);
	
	begin 
	
	--concurrent signal assignment
	sig_regWrite(7) <= sig_decodeOut(7) and i_load;
	sig_regWrite(6) <= sig_decodeOut(6) and i_load;
	sig_regWrite(5) <= sig_decodeOut(5) and i_load;
	sig_regWrite(4) <= sig_decodeOut(4) and i_load;
	sig_regWrite(3) <= sig_decodeOut(3) and i_load;
	sig_regWrite(2) <= sig_decodeOut(2) and i_load;
	sig_regWrite(1) <= sig_decodeOut(1) and i_load;
	sig_regWrite(0) <= sig_decodeOut(0) and i_load;
			
	decoder: decoder3to8 
		port map (
			A => i_writeRegAddr,
			Y => sig_decodeOut);
	
	mux_readData1: mux8to1_8bit
		port map (
			data_in0 => sig_regOut0,
			data_in1 => sig_regOut1,
			data_in2 => sig_regOut2,
			data_in3 => sig_regOut3,
			data_in4 => sig_regOut4,
			data_in5 => sig_regOut5,
			data_in6 => sig_regOut6,
			data_in7 => sig_regOut7,
			
			select_in => i_readReg1,
			
			mux_out => sig_muxOut1);
	
	mux_readData2: mux8to1_8bit
		port map (
			data_in0 => sig_regOut0,
			data_in1 => sig_regOut1,
			data_in2 => sig_regOut2,
			data_in3 => sig_regOut3,
			data_in4 => sig_regOut4,
			data_in5 => sig_regOut5,
			data_in6 => sig_regOut6,
			data_in7 => sig_regOut7,
			
			select_in => i_readReg2,
			
			mux_out => sig_muxOut2);
	
	
	row7: register8bit
		port map (
			i_resetBar => i_resetBar,
			i_load => sig_regWrite(7), 
			i_clock => i_clk, 
			i_Value => i_writeData, 
			o_Value => sig_regOut7);
	
	row6: register8bit
		port map (
			i_resetBar => i_resetBar,
			i_load => sig_regWrite(6), 
			i_clock => i_clk, 
			i_Value => i_writeData, 
			o_Value => sig_regOut6);
	
	row5: register8bit
		port map (
			i_resetBar => i_resetBar,
			i_load => sig_regWrite(5), 
			i_clock => i_clk, 
			i_Value => i_writeData, 
			o_Value => sig_regOut5);

	row4: register8bit  
		port map (
			i_resetBar => i_resetBar,
			i_load => sig_regWrite(4), 
			i_clock => i_clk, 
			i_Value => i_writeData, 
			o_Value => sig_regOut4);
			
	row3: register8bit 
		port map (
			i_resetBar => i_resetBar,
			i_load => sig_regWrite(3), 
			i_clock => i_clk, 
			i_Value => i_writeData, 
			o_Value => sig_regOut3);

	row2: register8bit  
		port map (
			i_resetBar => i_resetBar,
			i_load => sig_regWrite(2), 
			i_clock => i_clk, 
			i_Value => i_writeData, 
			o_Value => sig_regOut2);
	
	row1: register8bit 
		port map (
			i_resetBar => i_resetBar,
			i_load => sig_regWrite(1), 
			i_clock => i_clk, 
			i_Value => i_writeData, 
			o_Value => sig_regOut1);	
	
	row0: register8bit 
		port map (
			i_resetBar => i_resetBar,
			i_load => sig_regWrite(0), 
			i_clock => i_clk, 
			i_Value => i_writeData, 
			o_Value => sig_regOut0);	

	--output driver
	o_readData1 <= sig_muxOut1; 
	o_readData2 <= sig_muxOut2;
			
end rtl;