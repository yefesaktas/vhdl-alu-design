library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    Port (
        A      : in  STD_LOGIC_VECTOR (7 downto 0); -- Operand A
        B      : in  STD_LOGIC_VECTOR (7 downto 0); -- Operand B
        Opcode : in  STD_LOGIC_VECTOR (3 downto 0); -- Operation selector
        Result : out STD_LOGIC_VECTOR (7 downto 0); -- ALU result
        Z      : out STD_LOGIC;                     -- Zero flag
        C      : out STD_LOGIC;                     -- Carry flag
    );
end alu;

architecture Behavioral of alu is
    -- 9 bit temporary signal to hold the result and carry
    signal temp_result : STD_LOGIC_VECTOR(8 downto 0);
begin

    -- Combinational logic
    process(A, B, Opcode)
    begin
        case Opcode is
            when "0000" => -- ADD operation: A + B
                temp_result <= std_logic_vector(unsigned("0" & A) + unsigned("0" & B));
                
            when "0001" => -- SUB operation: A - B
                temp_result <= std_logic_vector(unsigned("0" & A) - unsigned("0" & B));
                
            when "0010" => -- AND operation: A AND B 
                temp_result <= "0" & (A and B);
                
            when "0011" => -- OR operation: A OR B
                temp_result <= "0" & (A or B);
                
            when "0100" => -- XOR operation: A XOR B
                temp_result <= "0" & (A xor B);
                
            when "0101" => -- NOT operation: NOT A
                temp_result <= "0" & (not A);

            when "0110" => -- INC operation: A + 1
                temp_result <= std_logic_vector(unsigned("0" & A) + 1);
                
            when "0111" => -- DEC operation: A - 1
                temp_result <= std_logic_vector(unsigned("0" & A) - 1);
            
            when others =>
                temp_result <= (others => '0');
        end case;
    end process;

    -- Connect the 8 LSBs to the Result pins
    Result <= temp_result(7 downto 0);

    -- Connect the MSB to the Carry (C) flag
    C <= temp_result(8);

    -- Zero (Z) flag: Z = 1 if all 0, otherwise Z = 0
    Z <= '1' when temp_result(7 downto 0) = "00000000" else '0';

end Behavioral;