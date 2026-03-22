library ieee;
use ieee.std_logic_1164.all;

entity mux2to1_8bit is
	port 
		(
			input0, input1 : IN STD_LOGIC_VECTOR(7 downto 0);
			sel : in std_logic;
			mux_out : out std_logic_vector(7 downto 0));
end mux2to1_8bit;

architecture struct of mux2to1_8bit is 
signal sig_muxOut : STD_LOGIC_VECTOR(7 downto 0);

	component mux2to1bit 
		port 
			(
				input0, input1 : IN STD_LOGIC;
				sel : in std_logic;
				mux_out : out std_logic);
	end component;

begin 

	mux0: mux2to1bit 
		port map(
			input0 => input0(0),
			input1 => input1(0),
			sel => sel,
			mux_out => sig_muxOut(0));	

	mux1: mux2to1bit
		port map(
			input0 => input0(1),
			input1 => input1(1),
			sel => sel,
			mux_out => sig_muxOut(1));	
			
	mux2: mux2to1bit 
		port map(
			input0 => input0(2),
			input1 => input1(2),
			sel => sel,
			mux_out => sig_muxOut(2));	

	mux3: mux2to1bit 
		port map(
			input0 => input0(3),
			input1 => input1(3),
			sel => sel,
			mux_out => sig_muxOut(3));	
		
	mux4: mux2to1bit 
		port map(
			input0 => input0(4),
			input1 => input1(4),
			sel => sel,
			mux_out => sig_muxOut(4));	
		
	mux5: mux2to1bit 
		port map(
			input0 => input0(5),
			input1 => input1(5),
			sel => sel,
			mux_out => sig_muxOut(5));	


	mux6: mux2to1bit 
		port map(
			input0 => input0(6),
			input1 => input1(6),
			sel => sel,
			mux_out => sig_muxOut(6));	

	mux7: mux2to1bit 
		port map(
			input0 => input0(7),
			input1 => input1(7),
			sel => sel,
			mux_out => sig_muxOut(7));	

	mux_out <= sig_muxOut;
			
end struct;