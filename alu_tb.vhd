library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu_tb is
	-- Testbench is not connected to outside
end alu_tb;

architecture Behavioral of alu_tb is
	-- Specify Unit Under Test (UUT) which is ALU
	component alu
		Port (
			A      : in  STD_LOGIC_VECTOR (7 downto 0);
			B      : in  STD_LOGIC_VECTOR (7 downto 0);
			Opcode : in  STD_LOGIC_VECTOR (3 downto 0);
			Result : out STD_LOGIC_VECTOR (7 downto 0);
			Z      : out STD_LOGIC;
			C      : out STD_LOGIC 
		);
 
	end component;

	-- Define virtual lines that will be connected to the UUT as test signals
	signal A_tb      : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	signal B_tb      : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	signal Opcode_tb : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	signal Result_tb : STD_LOGIC_VECTOR(7 downto 0);
	signal Z_tb      : STD_LOGIC;
	signal C_tb      : STD_LOGIC;

begin

end Behavioral;