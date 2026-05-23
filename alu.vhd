library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    Port (
        A      : in  STD_LOGIC_VECTOR (7 downto 0); -- Operand A
        B      : in  STD_LOGIC_VECTOR (7 downto 0); -- Operand B
        Opcode : in  STD_LOGIC_VECTOR (3 downto 0); -- Operation selector
        Result : out STD_LOGIC_VECTOR (7 downto 0); -- ALU Result
        Z      : out STD_LOGIC;                     -- Zero Flag
        C      : out STD_LOGIC;                     -- Carry Flag
        O      : out STD_LOGIC                      -- Overflow Flag
    );
end alu;