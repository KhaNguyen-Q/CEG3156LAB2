LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sign_extender IS
    PORT (
        i_immediate : IN  STD_LOGIC_VECTOR(15 DOWNTO 0); -- Instruction bits [15..0]
        o_extended  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)   -- To 8-bit ALU
    );
END sign_extender;

ARCHITECTURE structural OF sign_extender IS
BEGIN
    -- We map the lower 8 bits of the MIPS immediate directly to our 8-bit bus.
    -- This preserves the two's complement value for any number between -128 and +127.
    o_extended(0) <= i_immediate(0);
    o_extended(1) <= i_immediate(1);
    o_extended(2) <= i_immediate(2);
    o_extended(3) <= i_immediate(3);
    o_extended(4) <= i_immediate(4);
    o_extended(5) <= i_immediate(5);
    o_extended(6) <= i_immediate(6);
    o_extended(7) <= i_immediate(7); -- This is now our functional sign bit.

END structural;