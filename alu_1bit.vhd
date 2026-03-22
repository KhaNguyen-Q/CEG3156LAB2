library ieee;
use ieee.std_logic_1164.all;

entity alu_1bit is
    port (
        i_a, i_b   : in  std_logic;
        i_carryIn  : in  std_logic;
        i_less     : in  std_logic; 
        i_control  : in  std_logic_vector(2 downto 0); 
        o_result   : out std_logic;
        o_carryOut : out std_logic;
        o_set      : out std_logic  
    );
end alu_1bit;

architecture structural of alu_1bit is
    signal s_and, s_or, s_add, s_b_inv : std_logic;
begin
    -- Logic operations always use the RAW input bits
    s_and <= i_a and i_b;
    s_or  <= i_a or i_b;
    
    -- SUBTRACTION LOGIC: 
    -- If i_control(2) is '1' (for 110 or 111), we invert i_b
    s_b_inv <= i_b xor i_control(2);

    -- Full Adder Logic: A + (B or NOT B) + CarryIn
    s_add      <= i_a xor s_b_inv xor i_carryIn;
    o_carryOut <= (i_a and s_b_inv) or (i_carryIn and (i_a xor s_b_inv));
    
    -- o_set is the result of the addition/subtraction, used by Bit 7 for SLT
    o_set <= s_add; 

    -- Output selection based on your lecture truth table
    with i_control select
        o_result <= s_and  when "000", -- AND
                    s_or   when "001", -- OR
                    s_add  when "010", -- ADD
                    s_add  when "110", -- SUB (s_add now contains A-B)
                    i_less when "111", -- SLT
                    '0'    when others;
end structural;