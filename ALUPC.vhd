LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ALUPC IS
	PORT(
	i_a : in std_logic_vector(7 downto 0); --PC input
	i_b : in std_logic_vector(7 downto 0); -- hardwire 4
	o_s : out std_logic_vector(7 downto 0) --result is PC + 4
	);
END ALUPC;

ARCHITECTURE STRUCTURAL OF ALUPC IS

	COMPONENT eightBitAdder
        PORT(
            i_Ai, i_Bi : IN  STD_LOGIC_VECTOR(7 downto 0);
            carryIn    : IN  STD_LOGIC;
            carryOut   : OUT STD_LOGIC;
            o_Sum      : OUT STD_LOGIC_VECTOR(7 downto 0)
        );
    END COMPONENT;

BEGIN

    -- Instantiate the adder
    -- Hardwire carryIn to '0' because we are doing simple addition
    PC_ADD_BLOCK: eightBitAdder 
        PORT MAP (
            i_Ai     => i_a,
            i_Bi     => i_b,
            carryIn  => '0',
            o_Sum    => o_s,
            carryOut => open -- 'open' means we don't need the carry bit for the PC
        );

END STRUCTURAL;
	