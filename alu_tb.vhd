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

    -- Connect ALU pins to testbench lines
    UUT: alu Port Map (
        A      => A_tb,
        B      => B_tb,
        Opcode => Opcode_tb,
        Result => Result_tb,
        Z      => Z_tb,
        C      => C_tb
    );

    -- Create stimulus process
    stim_proc: process
    begin

    	-- --------------- ADD TESTS ---------------

        -- Test 1: Result = 44, C = 0, Z = 0
        Opcode_tb <= "0000";

        A_tb <= std_logic_vector(to_unsigned(35, 8)); -- A = 35
        B_tb <= std_logic_vector(to_unsigned(9, 8));  -- B = 9
 
        wait for 10 ns;

	-- 10 ns
        -- Test 1.1: Result = 0, C = 1, Z = 1 
        Opcode_tb <= "0000";

        A_tb <= std_logic_vector(to_unsigned(200, 8)); -- A = 200
        B_tb <= std_logic_vector(to_unsigned(56, 8));  -- B = 56

        wait for 10 ns;

	-- 20 ns
        -- Test 1.2: Result = 0, C = 0, Z = 1 
        Opcode_tb <= "0000";

        A_tb <= std_logic_vector(to_unsigned(0, 8)); -- A = 0
        B_tb <= std_logic_vector(to_unsigned(0, 8));  -- B = 0

        wait for 10 ns;

	-- 30 ns
        -- Test 1.3: Result = 4, C = 1, Z = 0 
        Opcode_tb <= "0000";

        A_tb <= std_logic_vector(to_unsigned(250, 8)); -- A = 250
        B_tb <= std_logic_vector(to_unsigned(10, 8));  -- B = 10

        wait for 10 ns;

        -- --------------- SUB TESTS --------------- 
        
        -- 40 ns
        -- Test 2: Result = 7, C = 0, Z = 0 
        Opcode_tb <= "0001";

        A_tb <= std_logic_vector(to_unsigned(12, 8)); -- A = 12
        B_tb <= std_logic_vector(to_unsigned(5, 8)); -- B = 5
 
        wait for 10 ns;

	-- 50 ns
        -- Test 2.1: Result = 0, C = 0, Z = 1 
        Opcode_tb <= "0001";

        A_tb <= std_logic_vector(to_unsigned(24, 8)); -- A = 24
        B_tb <= std_logic_vector(to_unsigned(24, 8)); -- B = 24
 
        wait for 10 ns;

	-- 60 ns
        -- Test 2.2: Result = 1, C = 1, Z = 0 
        Opcode_tb <= "0001";

        A_tb <= std_logic_vector(to_unsigned(0, 8));   -- A = 0
        B_tb <= std_logic_vector(to_unsigned(255, 8)); -- B = 255
 
        wait for 10 ns;

	-- 70 ns
        -- Test 2.3: Result = 255, C = 1, Z = 0 
        Opcode_tb <= "0001";

        A_tb <= std_logic_vector(to_unsigned(254, 8)); -- A = 254
        B_tb <= std_logic_vector(to_unsigned(255, 8)); -- B = 255
 
        wait for 10 ns;

        -- --------------- AND TESTS ---------------

	-- 80 ns
        -- Test 3: Result = 32, C = 0, Z = 0  
        Opcode_tb <= "0010";

        A_tb <= "00101010"; -- A = 42
        B_tb <= "10110000"; -- B = 176

        wait for 10 ns;

	-- 90 ns
        -- Test 3.1: Result = 0, C = 0, Z = 1  
        Opcode_tb <= "0010";

        A_tb <= "10101010"; -- A = 170
        B_tb <= "01010101"; -- B = 85

        wait for 10 ns;

	-- 100 ns
        -- Test 3.2: Result = 0, C = 0, Z = 1  
        Opcode_tb <= "0010";

        A_tb <= "00000000"; -- A = 0
        B_tb <= "00000000"; -- B = 0

        wait for 10 ns;

	-- 110 ns
        -- Masking (Identity) Test
        -- Test 3.3:  Result = 62, C = 0, Z = 0  
        Opcode_tb <= "0010";

        A_tb <= "11111111"; -- A = 255
        B_tb <= "00111110"; -- B = 62

        wait for 10 ns;

        -- --------------- OR TESTS ---------------

	-- 120 ns
        -- Test 4: Result = 255, C = 0, Z = 0 
        Opcode_tb <= "0011"; 

        A_tb <= "10101010"; -- A = 170
        B_tb <= "01010101"; -- B = 85

        wait for 10 ns;

	-- 130 ns
        -- Test 4.1: Result = 0, C = 0, Z = 1 
        Opcode_tb <= "0011"; 

        A_tb <= "00000000"; -- A = 0
        B_tb <= "00000000"; -- B = 0

        wait for 10 ns;

	-- 140 ns
        -- Test 4.2: Result = 214, C = 0, Z = 0 
        Opcode_tb <= "0011"; 

        A_tb <= "10010110"; -- A = 150
        B_tb <= "11000100"; -- B = 196

        wait for 10 ns;

	-- 150 ns
        -- Masking (Identity) Test
        -- Test 4.3: Result = 40, C = 0, Z = 0 
        Opcode_tb <= "0011";

        A_tb <= "00000000"; -- A = 0
        B_tb <= "00101000"; -- B = 40

        wait for 10 ns;

	-- 160 ns
        -- Masking (Force to 1) Test
        -- Test 4.4: Result = 255, C = 0, Z = 0 
        Opcode_tb <= "0011";

        A_tb <= "11111111"; -- A = 255
        B_tb <= "00111100"; -- B = 60

        wait for 10 ns;

	-- --------------- XOR TESTS ---------------

	-- 170 ns
        -- Test 5: Result = 255, C = 0, Z = 0 
        Opcode_tb <= "0100"; 

        A_tb <= "11110000"; -- A = 240
        B_tb <= "00001111"; -- B = 15

        wait for 10 ns;

	-- 180 ns
        -- Zero Output Test
        -- Test 5.1: Result = 0, C = 0, Z = 1 
        Opcode_tb <= "0100"; 

        A_tb <= "11001100"; -- A = 204
        B_tb <= "11001100"; -- B = 204

        wait for 10 ns;

	-- 190 ns
        -- Identity Test
        -- Test 5.2: Result = 170, C = 0, Z = 0 
        Opcode_tb <= "0100"; 

        A_tb <= "10101010"; -- A = 170
        B_tb <= "00000000"; -- B = 0

        wait for 10 ns;

	-- 200 ns
        -- Inversion Test
        -- Test 5.3: Result = 85, C = 0, Z = 0 
        Opcode_tb <= "0100"; 

        A_tb <= "10101010"; -- A = 170
        B_tb <= "11111111"; -- B = 255

        wait for 10 ns;

        -- --------------- NOT TESTS ---------------

	-- 210 ns
        -- Test 6: Result = 85, C = 0, Z = 0 
        Opcode_tb <= "0101"; 

        A_tb <= "10101010"; -- A = 170

        wait for 10 ns;

	-- 220 ns
        -- Test 6.1: Result = 0, C = 0, Z = 1 
        Opcode_tb <= "0101"; 

        A_tb <= "11111111"; -- A = 255

        wait for 10 ns;

	-- 230 ns
        -- Test 6.2: Result = 255, C = 0, Z = 0 
        Opcode_tb <= "0101"; 

        A_tb <= "00000000"; -- A = 0

        wait for 10 ns;

        -- --------------- INC TESTS (A+1) ---------------

	-- 240 ns
        -- Test 7: Result = 6, C = 0, Z = 0 
        Opcode_tb <= "0110"; 

        A_tb <= std_logic_vector(to_unsigned(5, 8)); -- A = 5
        
	wait for 10 ns;

	-- 250 ns
	-- Overflow
        -- Test 7.1: Result = 0, C = 1, Z = 1 
        Opcode_tb <= "0110"; 

        A_tb <= std_logic_vector(to_unsigned(255, 8)); -- A = 255
        
        wait for 10 ns;

	-- 260 ns
        -- Test 7.2: Result = 1, C = 0, Z = 0 
        Opcode_tb <= "0110"; 

        A_tb <= std_logic_vector(to_unsigned(0, 8)); -- A = 0

        wait for 10 ns;

        -- --------------- DEC TESTS (A-1) ---------------

	-- 270 ns
        -- Test 8: Result = 4, C = 0, Z = 0 
        Opcode_tb <= "0111"; 

        A_tb <= std_logic_vector(to_unsigned(5, 8)); -- A = 5

        wait for 10 ns;

	-- 280 ns
        -- Test 8.1: Result = 0, C = 0, Z = 1 
        Opcode_tb <= "0111"; 

        A_tb <= std_logic_vector(to_unsigned(1, 8)); -- A = 1

        wait for 10 ns;
	
	-- 290 ns
        -- Underflow
        -- Test 8.2: Result = 255, C = 1, Z = 0 
        Opcode_tb <= "0111"; 

        A_tb <= std_logic_vector(to_unsigned(0, 8)); -- A = 0
        
        wait for 10 ns;

	-- 300 ns
        -- Halt the simulation
        wait;
    end process;

end Behavioral;
