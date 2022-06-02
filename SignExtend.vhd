library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SignExtend is

		port( 
        Input : in std_logic_vector(15 downto 0);
		  Output : out std_logic_vector(31 downto 0)
		  );
		  
end SignExtend;

architecture Behavioral of SignExtend is
		
begin
		
		Output <= "0000000000000000" & Input when (Input(15) = '0') else		
					 "1111111111111111" & Input when (Input(15) = '1') else
					 "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
		
end Behavioral;

