LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity PC_REG is
	port (
		g_clock : in std_logic;
		g_reset : in std_logic;
		pc_in : in std_logic_vector(7 downto 0);
		pc_out : out std_logic_vector(7 downto 0)
	);
	
end PC_REG;

architecture structural of PC_REG is

	signal s_resetBar : STD_LOGIC;

	component register8bit
		port(
		i_resetBar : IN STD_LOGIC;
		i_enable : IN STD_LOGIC;
		i_d      : IN STD_LOGIC_VECTOR(7 downto 0);
		i_clock : IN STD_LOGIC;
		q_out : OUT STD_LOGIC_VECTOR(7 downto 0)
		);
		
		end component;
	begin
	
	s_resetBar <= NOT g_reset;
    

    -- Map the 8-bit register
    PC_INST : register8bit port map(
        i_clock    => g_clock,
        i_resetBar => s_resetBar,
        i_d        => pc_in,    -- Map the 8-bit vector
        q_out      => pc_out,   -- Map the 8-bit vector
        i_enable   => '1'      
    );

end structural;
