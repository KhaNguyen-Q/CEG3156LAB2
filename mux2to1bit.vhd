library ieee;
use ieee.std_logic_1164.all;

entity mux2to1bit is
	port 
		(
			input0, input1 : IN STD_LOGIC;
			sel : in std_logic;
			mux_out : out std_logic
		);
end mux2to1bit;


architecture struct of mux2to1bit is 
signal sig_muxOut : STD_LOGIC;
begin 

	sig_muxOut <= (not(sel) and input0) or (sel and input1);
	
	mux_out <= sig_muxOut;
	
end struct;