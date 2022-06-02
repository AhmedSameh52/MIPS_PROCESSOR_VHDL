library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity SLL2_26BIT is
    Port ( Input : in  STD_LOGIC_VECTOR (25 downto 0);
           Output : out  STD_LOGIC_VECTOR (27 downto 0));
end SLL2_26BIT;

architecture Behavioral of SLL2_26BIT is

begin
	
	Output <= Input & "00";
	

end Behavioral;

