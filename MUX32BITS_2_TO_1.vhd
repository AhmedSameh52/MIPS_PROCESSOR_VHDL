library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity MUX32BITS_2_TO_1 is
          port( I1 : in  STD_LOGIC_VECTOR (31 downto 0);
           I2 : in  STD_LOGIC_VECTOR (31 downto 0);
           O : out  STD_LOGIC_VECTOR (31 downto 0);
           S : in STD_LOGIC);
end MUX32BITS_2_TO_1;

architecture Behavioral of MUX32BITS_2_TO_1 is

begin

O<=I1 WHEN S='0' ELSE
I2 WHEN S='1';

end Behavioral;

