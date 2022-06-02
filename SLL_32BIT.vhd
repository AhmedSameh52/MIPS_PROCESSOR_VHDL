library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SLL_32BIT is
		Port ( Input : in  STD_LOGIC_VECTOR (31 downto 0);
				 Output : out  STD_LOGIC_VECTOR (31 downto 0));
end SLL_32BIT;

architecture Behavioral of SLL_32BIT is

begin

	Output <= Input(29 downto 0) & "00";
	
end Behavioral;

