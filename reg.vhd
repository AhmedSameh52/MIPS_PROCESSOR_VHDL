library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity reg is
    Port ( I : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
              load : in  STD_LOGIC;
           O : out  STD_LOGIC_VECTOR (31 downto 0));
end reg;

architecture Behavioral of reg is
SIGNAL temp: STD_LOGIC_VECTOR (31 downto 0);
begin

process (clk) 
    begin
        if (clk'event and clk = '1' and load = '1') then
            temp <= I;
        end if;
    end process;
O <= temp;
end Behavioral;