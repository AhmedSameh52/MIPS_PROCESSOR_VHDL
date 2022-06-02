LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ALU_TestBench IS
END ALU_TestBench;
 
ARCHITECTURE behavior OF ALU_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         data1 : IN  std_logic_vector(31 downto 0);
         data2 : IN  std_logic_vector(31 downto 0);
         aluop : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         dataout : OUT  std_logic_vector(31 downto 0);
         cflag : OUT  std_logic;
         zflag : OUT  std_logic;
         oflag : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal data1 : std_logic_vector(31 downto 0) := (others => '0');
   signal data2 : std_logic_vector(31 downto 0) := (others => '0');
   signal aluop : std_logic_vector(3 downto 0) := (others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal dataout : std_logic_vector(31 downto 0);
   signal cflag : std_logic;
   signal zflag : std_logic;
   signal oflag : std_logic;
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          data1 => data1,
          data2 => data2,
          aluop => aluop,
          cin => cin,
          dataout => dataout,
          cflag => cflag,
          zflag => zflag,
          oflag => oflag
        );


   -- Stimulus process
   stim_proc: process
   begin		
     -- x stands for hexadecimal
		-- ADDITION
		data1 <= x"00008009";
		data2 <= x"0002000A";
		aluop <= "0010";
		wait for 100 ns;
		
		--SUBTRACTION
		data1 <= x"00000C0C";
		data2 <= x"0000001A";
		aluop <= "0110";
		wait for 100 ns;
		
		-- ADDITION
		data1 <= x"09009009";
		data2 <= x"0010000A";
		aluop <= "0010";
		wait for 100 ns;
		
		-- NEGATIVE ADDITION
		data1 <= x"FFFFFFF1";
		data2 <= x"FFFFFFFB";
		aluop <= "0010";
		wait for 100 ns;
		
		-- NEGATIVE SUBTRACTION
		data1 <= x"FFFFFAF9";
		data2 <= x"FFFFFFBA";
		aluop <= "0110";
		wait for 100 ns;
		
		--CHECK ZFLAG
		data1 <= x"00000AB1";
		data2 <= x"00000AB1";
		aluop <= "0110";
		wait for 100 ns;
		
		--CHECK OFLAG
		data1 <= x"BFFF12FF";
		data2 <= x"BFFF34FF";
		aluop <= "0010";
		wait for 100 ns;
		
		--CHECK AND
		data1 <= x"AFBCDE12";     -- ANSWER: ACB00202
		data2 <= x"ACF1234A";
		aluop <= "0000";
		wait for 100 ns;
		
		--CHECK OR
		data1 <= x"AFBCDE12";		-- ANSWER: AFFDFF5A
		data2 <= x"ACF1234A";
		aluop <= "0001";
		wait for 100 ns;
		
		--CHECK NOR
		data1 <= x"AFBCDE12";		-- ANSWER: 500200A5
		data2 <= x"ACF1234A";
		aluop <= "1100";
		wait for 100 ns;
   end process;

END;
