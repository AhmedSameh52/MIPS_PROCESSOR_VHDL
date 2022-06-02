library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity MUX5BITS_2_to_1 is
          port( I1 : in  STD_LOGIC_VECTOR (4 downto 0);
           I2 : in  STD_LOGIC_VECTOR (4 downto 0);
           O : out  STD_LOGIC_VECTOR (4 downto 0);
           S : in STD_LOGIC);
end MUX5BITS_2_to_1;

architecture Behavioral of MUX5BITS_2_to_1 is

begin

O<=I1 WHEN S='0' ELSE
I2 WHEN S='1';

end Behavioral;
