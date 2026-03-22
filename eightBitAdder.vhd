LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY eightBitAdder IS
PORT(
i_Ai, i_Bi : IN STD_LOGIC_VECTOR(7 downto 0);
carryOut : OUT STD_LOGIC;
carryIn: in std_logic;
o_Sum : OUT STD_LOGIC_VECTOR(7 downto 0));
END eightBitAdder;

ARCHITECTURE struct8bitAdd OF eightBitAdder IS
SIGNAL int_CarryOut : STD_LOGIC_VECTOR(6 downto 0);
SIGNAL gnd : STD_LOGIC;

COMPONENT oneBitAdder
PORT(
i_CarryIn : IN STD_LOGIC;
i_Ai, i_Bi : IN STD_LOGIC;
o_Sum, o_CarryOut : OUT STD_LOGIC);
END COMPONENT;

BEGIN


--msb to lsb
bit0: oneBitAdder
PORT MAP (i_CarryIn => carryIn,
 i_Ai => i_Ai(0),
 i_Bi => i_Bi(0),
 o_Sum => o_Sum(0),
 o_CarryOut => int_CarryOut(0));

bit1: oneBitAdder
PORT MAP (i_CarryIn => int_CarryOut(0),
 i_Ai => i_Ai(1),
 i_Bi => i_Bi(1),
 o_Sum => o_Sum(1),
 o_CarryOut => int_CarryOut(1));

bit2: oneBitAdder
PORT MAP (i_CarryIn => int_CarryOut(1),
 i_Ai => i_Ai(2),
 i_Bi => i_Bi(2),
 o_Sum => o_Sum(2),
 o_CarryOut => int_CarryOut(2));
 
bit3: oneBitAdder
PORT MAP (i_CarryIn => int_CarryOut(2),
 i_Ai => i_Ai(3),
 i_Bi => i_Bi(3),
 o_Sum => o_Sum(3),
 o_CarryOut => int_CarryOut(3));
 
bit4: oneBitAdder
PORT MAP (i_CarryIn => int_CarryOut(3),
 i_Ai => i_Ai(4),
 i_Bi => i_Bi(4),
 o_Sum => o_Sum(4),
 o_CarryOut => int_CarryOut(4));

bit5: oneBitAdder
PORT MAP (i_CarryIn => int_CarryOut(4),
 i_Ai => i_Ai(5),
 i_Bi => i_Bi(5),
 o_Sum => o_Sum(5),
 o_CarryOut => int_CarryOut(5));

bit6: oneBitAdder
PORT MAP (i_CarryIn => int_CarryOut(5),
 i_Ai => i_Ai(6),
 i_Bi => i_Bi(6),
 o_Sum => o_Sum(6),
 o_CarryOut => int_CarryOut(6));
 
bit7: oneBitAdder
PORT MAP (i_CarryIn => int_CarryOut(6),
 i_Ai => i_Ai(7),
 i_Bi => i_Bi(7),
 o_Sum => o_Sum(7),
 o_CarryOut => carryOut);
 
 END struct8bitAdd;
